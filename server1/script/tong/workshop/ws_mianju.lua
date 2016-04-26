Include("\\script\\tong\\workshop\\workshop_head.lua")
--铜钱价值量=200W
aLevelOutputCoef = {}
aLevelScale = {}
aLevelContributionCoef = {}
aLevelCoinShop = {}
aLevelContributionShop = {}
WEIZHUANG_LEVEL = 5	--伪装面具等级要求
TEAMMASK_LEVEL = 3	--队伍面具制作等级要求
TONGMASK_LEVEL = 7	--帮会面具制作等级要求
aPriceTeamMask = {}	--队伍面具样子对应的价格
aPriceTongMask = {} --帮会面具样子对应的价格
PRICEMASK_WEIZHUANG = 1000
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\mianju_level_data.txt", "mianjuLevelData")
	if b1~=1 then
		print("加载面具作坊配置文件失败！")
		return
	end
	local nRowCount = TabFile_GetRowCount("mianjuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("mianjuLevelData", y, "LEVEL"))
		aLevelCoinShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "COIN_SHOP"))
		aLevelContributionShop[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_SHOP"))		
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "SCALE"))
		aLevelOutputCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "OUTPUT_COEF"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("mianjuLevelData", y, "CONTRIBUTION_COEF"))
	end
	--TabFile_UnLoad("mianjuLevelData")
	--非Relay端加载Feature配置文件
	if MODEL_RELAY ~= 1 then
		b1 = TabFile_Load("\\settings\\item\\feature_data.txt", "FeatureData")
		if b1~=1 then
			print("加载feature_data配置文件失败！")
			return
		end
		nRowCount = TabFile_GetRowCount("FeatureData")
		for y = 2, nRowCount do
			local nFeature = tonumber(TabFile_GetCell("FeatureData", y, "FEATURE"))
			aPriceTeamMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TEAM_MASK_PRICE"))		
			aPriceTongMask[nFeature] = tonumber(TabFile_GetCell("FeatureData", y, "TONG_MASK_PRICE"))		
		end
	end
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "面具坊总管") ~= 1 then
		return 0
	end
	Say("<#>面具坊总管：看我七十二变！只有想不到，没有变不了。\n各式面具，应有尽有，来看看罗！", 3, "看看有什么货/#use_g_1_ok("..nTongID..","..nWorkshopID..")", 
		"特殊面具/#SpecialMask("..nTongID..","..nWorkshopID..")", "不用了/cancel");
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>面具坊总管：对不起，今天的面具已经卖光了，请明天再来吧！", 0)
		return 0;
	end
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function SpecialMask(nTongID, nWorkshopID)
	Say("<#>面具坊总管：你要制作什么面具？", 4, "伪装面具/#Mask_WeiZhuang("..nTongID..","..nWorkshopID..")",
		"队伍面具/#Mask_Team("..nTongID..","..nWorkshopID..")", "帮会面具/#Mask_Tong("..nTongID..","..nWorkshopID..")",
		"不用了/cancel")
end

function Mask_WeiZhuang(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < WEIZHUANG_LEVEL)then
		Say("面具坊总管：装备伪装面具可以获得伪装技能，对戴有面具的玩家使用此技能可以伪装成他的样子。不过要使用等级达到<color=red>"..WEIZHUANG_LEVEL.."<color>级的面具坊才有制作伪装面具的工艺，现在尚未达到",
			1, "看来只好日后再来/cancel")
		return
	end
	Say("面具坊总管：装备伪装面具可以获得伪装技能，对戴有面具的玩家使用此技能可以伪装成他的样子。制作伪装面具得花费<color=yellow>"..PRICEMASK_WEIZHUANG.."<color>贡献度，你需要吗？",
			2, "是的，劳烦总管了/#GetMask1("..nTongID..","..nWorkshopID..")", "我只是随便问问/cancel")
end

function GetMask1(nTongID, nWorkshopID)
	if (GetContribution() < PRICEMASK_WEIZHUANG)then
		Say("面具坊总管：你的贡献度不够呢，再多为帮会做些事情吧",1,"竟然不够啊/cancel")
		return
	end	
	AddContribution(-PRICEMASK_WEIZHUANG)
	Say("面具坊总管：伪装面具的限时时间为24个小时，可以使用10次伪装技能。嗯，说做就做好了，工艺很纯熟吧",1,
			"多谢啦，我这就试试去/cancel")
	AddItem(0,11,366,1,0,0)		
	Msg2Player("你获得了一个伪装面具")
end

function Mask_Team(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TEAMMASK_LEVEL)then
		Say("面具坊总管：队伍面具可以由队长和队员右键点击使用，使用后队伍成员都变成同一模样一段时间。不过要使用等级达到<color=red>"..TEAMMASK_LEVEL.."<color>级的面具坊才有制作队伍面具的工艺，现在尚未达到",
			1, "看来只好日后再来/cancel")
		return
	end
	Say("面具坊总管：队伍面具可以由队长和队员右键点击使用，使用后队伍成员都变成同一模样一段时间。制作队伍面具得花费一定的贡献度，还得放入一个面具坊产出的面具做模具，作出的队伍面具就是放入面具的样子，你需要吗？",
			2, "是的，劳烦总管了/#GetMask2("..nTongID..","..nWorkshopID..")", "我只是随便问问/cancel")
end

function Mask_Tong(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < TONGMASK_LEVEL)then
		Say("面具坊总管：帮会面具可以由帮主和长老右键点击使用，使用后帮会成员都变成同一模样一段时间。不过要使用等级达到<color=red>"..TONGMASK_LEVEL.."<color>级的面具坊才有制作帮会面具的工艺，现在尚未达到。",
			1, "看来只好日后再来/cancel")
		return
	end
	local nFigure = TONGM_GetFigure(nTongID, GetName())
	if (nFigure ~= TONG_MASTER and nFigure ~= TONG_ELDER)then
		Say("面具坊总管：帮里的规矩是只有帮主和长老们才能来让我制作帮会面具，你的身份还不够呢。", 1, 
			"哼，我也会有那一天的/cancel")
		return
	end
	Say("面具坊总管：帮会面具可以由帮主和长老右键点击使用，使用后帮会成员都变成同一模样一段时间。制作帮会面具得花费一定的贡献度，还得放入一个面具坊产出的面具做模具，作出的帮会面具就是放入面具的样子，你需要吗？",
			2, "是的，劳烦总管了/#GetMask3("..nTongID..","..nWorkshopID..")", "我只是随便问问/cancel")
end

--队伍面具
function GetMask2(nTongID, nWorkshopID)
	GiveItemUI("队伍面具制作","面具坊总管：请放入一个普通面具作为模具，制作成功模具会消耗掉", "MakeMask2", "onCancel" );
end

--帮会面具
function GetMask3(nTongID, nWorkshopID)
	GiveItemUI("帮会面具制作","面具坊总管：请放入一个普通面具作为模具，制作成功模具会消耗掉", "MakeMask3", "onCancel" );
end

--队伍面具
function MakeMask2(nCount)		
	if(nCount <= 0) then
		Say("<#>面具坊总管：啥都不给俺，你想干啥呀？", 1, "呵呵，我忘给你了/cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>面具坊总管：你只要放一个面具作模具就行了，放这么多东西干啥？", 1, "呵呵，知道了/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Say("<#>面具坊总管：你...你给我的是面具吗，我没有眼花吧？",1,"哦，给错东西了，那你还给我吧/cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("面具坊总管：对不起，你放入的面具不符合要求", 1, "哦，那我换一个吧/cancel")
		return
	end
	local nPrice = aPriceTeamMask[nFeature]
	if (not nPrice)then
		Say("面具坊总管：对不起，不能以此模具制作队伍面具", 1, "哦，那我换一个吧/cancel")
		return
	end	
	Say("面具坊总管：以此模具制作的队伍面具要消耗贡献度<color=yellow>"..nPrice.."<color>点，如果你确实需要，我可就要一展手艺了",
		2, "有劳总管了/#TeamMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "有些贵呢，我再想想吧/cancel")
end

--帮会面具
function MakeMask3(nCount)		
	if(nCount <= 0) then
		Say("<#>面具坊总管：啥都不给俺，你想干啥呀？",1, "呵呵，我忘给你了/cancel")
		return
	end	
	if(nCount > 1) then
		Say("<#>面具坊总管：你只要放一个面具作模具就行了，放这么多东西干啥？",1, "呵呵，知道了/cancel")
		return
	end		
	local itemIdx = GetGiveItemUnit( 1 )
	local g,d,_ = GetItemProp(itemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Say("<#>面具坊总管：你...你给我的是面具吗，我没有眼花吧？",1,"哦，给错东西了，那你还给我吧/cancel")
		return nil
	end
	local nFeature = GetMaskFeature(itemIdx)
	if (not nFeature) then
		Say("面具坊总管：对不起，你放入的面具不符合要求", 1, "哦，那我换一个吧/cancel")
		return
	end
	local nPrice = aPriceTongMask[nFeature]
	if (not nPrice)then
		Say("面具坊总管：对不起，不能以此模具制作帮会面具", 1, "哦，那我换一个吧/cancel")
		return
	end	
	Say("面具坊总管：以此模具制作的帮会面具需要消耗帮会建设基金<color=yellow>"..nPrice.."<color>点，如果你确实需要，我可就要一展手艺了",
		2, "有劳总管了/#TongMaskMake("..nFeature..","..nPrice..","..itemIdx..")", "有些贵呢，我再想想吧/cancel")
end

function TeamMaskMake(nFeature, nPrice, nItemIdx)
	if (GetContribution() < nPrice)then
		Say("面具坊总管：以这种面具为模具制作队伍面具需要<color=yellow>"..nPrice.."<color>点贡献度。你的贡献度还不够呢，再多为帮会做些事情吧",
			1,"竟然不够啊/cancel")
		return
	end
	--再次检查item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Msg2Player("咦？你的模具呢？:W")
		return
	end
	--删除原料
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("咦？你的模具呢？:W")
		return
	end	
	Say("面具坊总管：队伍面具可以把队伍全体成员变成同一模样2个小时。嗯，说做就做好了，工艺很纯熟吧",
		1, "多谢啦，我这就试试去/cancel")		
	local nIdx = AddItem(6,1,1108,1,0,0)
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	AddContribution(-nPrice)
	Msg2Player("你获得了一个队伍面具")
end

function TongMaskMake(nFeature, nPrice, nItemIdx)
	local _,nTongID = GetTongName()
	if (nTongID == 0)then
		return
	end
	if (TONG_GetBuildFund(nTongID) < nPrice)then
		Say("面具坊总管：以这种面具为模具制作帮会面具需要<color=yellow>"..nPrice.."<color>点帮会建设基金。贵帮的建设基金不足！",
			1,"竟然不够啊/cancel")
		return
	end
	--再次检查item
	local g,d,_ = GetItemProp(nItemIdx)
	if(g ~= 0 or d ~= 11) then --错误道具
		Msg2Player("咦？你的模具呢？:W")
		return
	end
	--删除原料
	if (RemoveItemByIndex(nItemIdx) ~= 1)then
		Msg2Player("咦？你的模具呢？:W")
		return
	end		
	Say("面具坊总管：帮会面具可以把帮会全体在线成员变成同一模样3个小时。嗯，说做就做好了，工艺很纯熟吧",
		1, "多谢啦，我这就试试去/cancel")
	local nIdx = AddItem(6,1,1109,1,0,0)
	if (nIdx <= 0) then return end
	SetSpecItemParam(nIdx, 1, nFeature)
	SyncItem(nIdx)
	TONG_ApplyAddBuildFund(nTongID, -nPrice)
	local szMsg = GetName().." 花费了"..nPrice.."万帮会建设基金，制作了一个帮会面具"
	Msg2Tong(nTongID, szMsg)
	TONG_ApplyAddEventRecord(nTongID, szMsg)
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelOutputCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal)
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
		return 0
	end
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_buy_1(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>面具坊总管：对不起，今天的面具已经卖光了，请明天再来吧！", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelScale[nLevel]	
	Sale(aLevelCoinShop[nLevel], CURRENCYTYPE_COIN, nScale, "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function use_buy_2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>面具坊总管：对不起，今天的面具已经卖光了，请明天再来吧！", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nScale = aLevelContributionCoef[nLevel] --直接用贡献度等级系数作打折系数
	Sale(aLevelContributionShop[nLevel], CURRENCYTYPE_CONTRIBUTION, nScale, "BuyCallBack2(%d,%d,"..nTongID..","..nWorkshopID..")")
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("剩余输出数*100: "..nValue)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>面具坊总管：对不起，今天的面具已经卖光了，请明天再来吧！", 0)
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	--铜钱打折花费贡献度=面具原价*(1-打折系数)*1铜钱的价值量/10000*贡献度等级系数
	local nContribution = (nPrice - floor(aLevelScale[nLevel]/100*nPrice))*200*aLevelContributionCoef[nLevel]/100
	if (GetContribution() < nContribution)then
		CloseShop()
		Msg2Player(format("贡献度不足，需要%d点贡献度！", nContribution))
		return 0
	end
	AddContribution(-nContribution)
	Msg2Player(format("你由于打折消费消耗了%d点贡献度！", nContribution))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nContribution)
	return 1
end

function BuyCallBack2(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (nValue <= 0)then
		CloseShop()
		Say("<#>面具坊总管：对不起，今天的面具已经卖光了，请明天再来吧！", 0)
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, nPrice)
	return 1
end

function USE_G_2(nTongID, nWorkshopID)
	Say("<#>面具坊总管：一般的面具是咱们帮会自制的，用贡献度就可以换取；制作精美的面具是仿制易容术士手法的，要用铜钱购买，不过会有折扣哦！", 2, 
		--"铜钱购买/#use_buy_1("..nTongID..","..nWorkshopID..")", 
		"贡献度购买/#use_buy_2("..nTongID..","..nWorkshopID..")", 
		"不买了/cancel");
end

function cancel()
end

else
-----------------如果是客户端---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>没有帮会"
	end
	local bOpen	--是否开启
	local bPause --是否暂停
	local nCurLevel --当前等级
	local nUseLevel --当前使用等级
	local nOpenFund --当前开启消耗
	local nMaintainFund --当前维护消耗
	local szCoinMask = {"--","普通面具","杀手Boss面具","部分大Boss面具","部分大Boss面具","成年同伴面具","青年同伴面具","少年同伴面具","英雄面具","部分节日面具","部分节日面具"} --当前铜钱能买的面具种类
	local nContriMask --当前贡献度能买得面具种类
	local nScale  --当前购买面具优惠度
	local dMaskCount	--当前每日面具产出总量提高
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen) 
		if(nUseLevel > 0)then
			nContriMask = nUseLevel * 7
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel] / aLevelOutputCoef[1])	
		else
			nContriMask ="--"
			nScale = "--"
			dMaskCount = "--"			
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextMaskCount,szNextCoinMask,nNextContriMask
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		szNextCoinMask = szCoinMask[nUseLevel + 2]	--下级铜钱能买的面具种类
		nNextContriMask = (nUseLevel + 1) * 7	--下级贡献度能买得面具种类
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --下级购买面具优惠度
		dNextMaskCount = format("%.2f", aLevelOutputCoef[nUseLevel + 1] / aLevelOutputCoef[1]) --下级每日面具产出总量提高
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		szNextCoinMask = "--"
		nNextContriMask = "--"
		nNextScale = "--"
		dNextMaskCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>暂停" elseif bOpen == 1 then state="<color=green>开启" else state="<color=red>关闭" end
		local szMsg = "作坊状态："..state.."<color>\n"..
			"作坊等级：<color=gold>"..nCurLevel.."<color>级\n"..
			"当前使用等级：<color=gold>"..nUseLevel.."<color>级\n"..
			"面具日产量上限提高：<color=gold>"..dMaskCount.."<color>倍\n"..		
			"购买面具优惠度：<color=gold>"..nScale.."<color>折\n"..
			"铜钱购买面具增加：<color=gold>"..szCoinMask[nUseLevel + 1].."<color>\n"..
			"贡献度购买面具种类：<color=gold>"..nContriMask.."<color>种\n"..
			"每日维护消耗战备基金：<color=gold>"..nMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=gold>"..nOpenFund.."万<color>\n"..
			"升级所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一使用等级<color>\n"..
			"<color=water>面具日产量上限提高：<color=Violet>"..dNextMaskCount.."<color>倍\n"..		
			"购买面具优惠度：<color=Violet>"..nNextScale.."<color>折\n"..
			"铜钱购买面具增加：<color=Violet>"..szNextCoinMask.."<color>\n"..
			"贡献度购买面具种类：<color=Violet>"..nNextContriMask.."<color>种\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	else
		local szMsg = "作坊状态：<color=water>未建立<color>\n"..
			"建立所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一等级<color>\n"..
			"<color=water>面具日产量上限提高：<color=Violet>"..dNextMaskCount.."<color>倍\n"..		
			"购买面具优惠度：<color=Violet>"..nNextScale.."<color>折\n"..
			"铜钱购买面具增加：<color=Violet>"..szNextCoinMask.."<color>\n"..
			"贡献度购买面具种类：<color=Violet>"..nNextContriMask.."<color>种\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	end
end

end