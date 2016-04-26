Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelScale = {}
aLevelStoneValue = {}
aLevelLingPaiPrice	=	{};		--Boss召唤符等级帮会资金需求
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\bingjia_level_data.txt", "bingjiaLevelData")
	if b1~=1 then
		print("加载兵甲作坊配置文件失败！")
		return
	end
	local nRowCount = TabFile_GetRowCount("bingjiaLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "OUTPUT_COEF"))
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "SCALE"))
		aLevelStoneValue[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "STONE_VALUE"))	
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LINGPAI_PRICE"))
	end
	--TabFile_UnLoad("bingjiaLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
	if MODEL_GAMESERVER == 1 then	--GAMESERVER 才有的
		Include("\\script\\item\\techan_zijingao.lua");
	end;

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "兵甲坊总管") ~= 1 then
		return 0
	end
	local aryszContent = {
		"获取镇帮之石/#use_g_1".."("..nTongID..","..nWorkshopID..")",
		"打造装备/#use_g_2".."("..nTongID..","..nWorkshopID..")",
	}
	
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "领取紫金镐/#use_zijingao("..nTongID..","..nWor);
	elseif(GetProductRegion() == "vn") then
		tinsert(aryszContent, "领取令牌召唤Boss/#use_g_4_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "不需要/cancel");
	
	Say("<#>兵甲坊总管: 想制造神秘利器 , 除了需要必须的材料，还需要镇派之石。镇派之石为可以吸收天地灵气，日月精华的物品，可以提高成功的概率。!", 
		getn(aryszContent), 
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------
--//////////////////
--紫金镐
--每次购买8小时(8*60)，时间记到TaskID1739
--当角色在桃花岛时，有程序给与挖出的物品，并扣除时间，同普通矿镐


function use_zijingao(nTongID, nWorkshopID)
	Say("<#>兵甲坊总管：“兵甲出品，必属佳品！”这句话你听过么？该紫金镐能让你在桃花岛上挖矿，它比桃花隐士兜售的普通矿镐更坚固与更锋利，它能让你挖得更深更快更省力，更有可能挖到6级以上的玄晶与神秘矿石等普通矿镐所挖不到的矿石。每一个紫金镐均可使用8小时，现在一个紫金镐只要花费<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color>点贡献度，你想要一个吗？", 4,
	"<#>购买一个紫金镐/#bj_sure2zijingao("..nTongID..","..nWorkshopID..")",
	"<#>查询紫金镐的剩余时间/bj_checktime_zijin",
	"<#>关于紫金镐/bj_help_zijigao",
	"<#>离开/cancel")
end

function bj_help_zijigao()
	Say("<#>兵甲坊总管：你可以使用紫金镐在桃花岛上挖矿，紫金镐所能挖到的矿石等级比普通矿镐要高，但要注意的是紫金镐与普通的矿镐不能一起使用，当你同时拥有两者时，会先消耗完紫金镐的时间，之后才消耗普通矿镐的时间。", 0)
end

function bj_sure2zijingao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>兵甲坊总管：对不起，您所在帮会的兵甲坊目前处于暂停状态。必须帮会将战备基金的数目增加到周维护战备基金以上，才能在当日晚24：00重新开启作坊。", 0)
		Msg2Player("<#>作坊暂停，功能无法使用。")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>兵甲坊总管：你连帮会都没入，来这干吗？", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--获得使用等级
	if (nUseLevel < 7) then
		Say("<#>兵甲坊总管：对不起，您所在帮会兵甲坊的使用等级没有达到7级，无法获得该帮会特产。", 0)
		Msg2Player("<#>作坊使用等级没有达到7级，功能无法使用。")
		return
	end
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_ZIJIGAO_CONTRIBUTION )) then
		Say("<#>兵甲坊总管：今天的紫金镐已分发完毕，请明天再来吧！", 0)
		return
	end
	
	if (GetContribution() < VALUE_ZIJIGAO_CONTRIBUTION or AddContribution(-VALUE_ZIJIGAO_CONTRIBUTION) ~= 1)then
		Say("<#>兵甲坊总管：对不起，您的个人贡献度不足<color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color>点，无法购买该特产，请努力挣取个人贡献度。", 0)
		Msg2Player("<#>个人贡献度不足，功能无法使用。")
		return 0
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_ZIJIGAO_CONTRIBUTION ))
	nRestH, nRestM = addzijingao_main();
	Msg2Player("<#>您成功购买了一个紫金镐，你目前可挖矿时间为"..nRestH.."小时"..nRestM.."分。")
	Say("<#>兵甲坊总管：您成功购买了一个紫金镐，你目前可挖矿时间为"..nRestH.."小时"..nRestM.."分。", 0)
end

function bj_checktime_zijin()
	local lasttime = GetTask(TASKID_TECHAN_ZIJINGAO)
	if (lasttime < 10) then
		Say("<#>兵甲坊总管：对不起，您的紫金镐已经破烂不堪了，您还是买一些新的吧！", 0)
	else
		local nRestH, nRestM = GetMinAndSec(lasttime)
		if (nRestH == 0) then
			Say("<#>兵甲坊总管：您的紫金镐还能使用<color=yellow>"..nRestM.."<color>分钟。", 0)
		else
			Say("<#>兵甲坊总管：您的紫金镐还能使用<color=yellow>"..nRestH.."<color>小时<color=yellow>"..nRestM.."<color>分钟。", 0)
		end
	end
end

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;



--------
----------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --初始化可领取石头总价值量
	return 1
end

function USE_R(nTongID, nWorkshopID, nUse)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (nUse ~= 4) then
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
			return 0
		end	
	else
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
			return 0
		end
		if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
			return 0
		end
		if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) ~= 1) then
			return 0
		end

		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
	end;
	return 1	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end


function use_g_1(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
			if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>兵甲坊总管：今天的镇帮之石已分发完毕，请明天再来吧！", 0)
				return 0;
			end
			local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
			TWS_ApplyUse(nTongID, nWorkshopID, 1)
	else
			Talk(1,"","领取物品时间为每日12H30到22h !")
			return
	end

end

function use_g_2(nTongID, nWorkshopID)
	Say("<#>兵甲坊总管：你可以在我这里镶嵌紫色装备和打造黄金装备，放入镇帮之石可以提高打造成功的机率和提高紫色装备的属性！", 2, "开始打造/#compound("..nTongID..","..
		nWorkshopID..",".."2)", "还是算了/cancel")
end		

function use_g_3(nTongID, nWorkshopID)
	Say("<#>兵甲坊总管：使用会心打造，你可以镶嵌出极品的紫色装备，但得花不小的代价！", 2, "开始打造/#compound("..nTongID..","..
		nWorkshopID..",".."3)", "还是算了/cancel")
end

function use_g_4_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>兵甲坊总管: 帮派建设等级达到<color=red>2<color> 才能制造召唤Boss令牌!", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>兵甲坊总管: 无权管理作坊，不能领取领取召唤Boss令牌!", 0)
		return
	end
	_dbgMsg("领取次数还剩 * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>兵甲坊总管: 今天已发完召唤boss令牌了，明天再来吧!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>兵甲坊总管: 需要使用<color=water>"..aLevelLingPaiPrice[nLevel].."<color> 万帮会建设预算获得一个召唤boss令牌，你同意吗?", 2,
		"接受/#use_g_4_ok2".."("..nTongID..","..nWorkshopID..")", "放弃/cancel")
end

function use_g_4_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>兵甲坊总管: 只是遗憾，帮会建设预算不够，不能领取!", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 4)
end


function compound(nTongID, nWorkshopID, nSel)
	TWS_ApplyUse(nTongID, nWorkshopID, nSel)
end

function _makefun(nTongID, nWorkshopID, nLevelStone)
	return nLevelStone.."级/#stone("..nTongID..","..nWorkshopID..","..nLevelStone..")"
end

function USE_G_2(nTongID, nWorkshopID, nChose)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nChose == 1)then --镇帮之石
		Sale(166, CURRENCYTYPE_CONTRIBUTION, aLevelScale[nLevel], "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
	elseif(nChose == 2)then --普通打造
		FoundryItem(4)
	elseif(nChose == 3)then	--会心打造
		FoundryItem(2)
	elseif(nChose == 4) then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." 消耗 "..aLevelLingPaiPrice[nLevel].." 万帮会建设预算来换取一个召唤boss令牌"..nLevel.."!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	end	
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("剩余输出价值量"..nValue)
	local nLevel = GetItemLevel(nItemIdx)
	local nOutputValue = aLevelStoneValue[nLevel]
	if (nValue < nOutputValue)then
		CloseShop()
		Say("<#>兵甲坊总管：对不起，今天的镇帮之石已经卖光了，请明天再来吧！", 0)
		return 0
	end	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nOutputValue)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelStoneValue[nLevel]/10000)
	return 1
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
	local nScale  --当前换取镇帮之石折扣
	local dStoneCount	--当前每日换取镇帮之石总量提高
	local nPrice  --当前换取boss召唤符的建设基金
	local dTokenCount	--当前每日boss召唤符产出总量提高
	local nDoubleOdds  --当前召唤出2个黄金Boss的几率
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dStoneCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
		else
			nScale = "--"
			dStoneCount = "--"
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextStoneCount, nNextPrice, dNextTokenCount,nNextDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"	
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --下级换取镇帮之石折扣
		dNextStoneCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --下级每日换取镇帮之石总量提高
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --下级换取boss召唤符的建设基金
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --下级每日boss召唤符产出总量提高
		nNextDoubleOdds = 160 - nCurLevel * 10 --下级召唤出2个黄金Boss的几率
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextStoneCount = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>暂停" elseif bOpen == 1 then state="<color=green>开启" else state="<color=red>关闭" end
		local szMsg = "作坊状态："..state.."<color>\n"..
			"作坊等级：<color=gold>"..nCurLevel.."<color>级\n"..
			"当前使用等级：<color=gold>"..nUseLevel.."<color>级\n"..
			"每日换取镇帮之石总量提高：<color=gold>"..dStoneCount.."<color>倍\n"..		
			"换取镇帮之石优惠度：<color=gold>"..nScale.."<color>折\n"..
			"Boss召唤符日产量上限提高: <color=gold>"..dTokenCount.."<color>倍\n"..	
			"召唤符召出第2个Boss的几率: <color=gold>1/"..nDoubleOdds.."<color>\n"..		
			"换取Boss召唤符所需建设基金: <color=gold>"..nPrice.."万<color>\n"..
			"每日维护消耗战备基金：<color=gold>"..nMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=gold>"..nOpenFund.."万<color>\n"..
			"升级所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一使用等级<color>\n"..
			"<color=water>每日换取镇帮之石总量提高：<color=Violet>"..dNextStoneCount.."<color>倍\n"..	
			"换取镇帮之石优惠度：<color=Violet>"..nNextScale.."<color>折\n"..
			"下个等级召唤出2个黄金boss的几率: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			"下个等级换取boss召唤符的建设基金: <color=Violet>"..nNextPrice.."万<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	else
		local szMsg = "作坊状态：<color=water>未建立<color>\n"..
			"建立所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一等级<color>\n"..
			"<color=water>每日换取镇帮之石总量提高：<color=Violet>"..dNextStoneCount.."<color>倍\n"..	
			"换取镇帮之石优惠度：<color=Violet>"..nNextScale.."<color>折\n"..
			"召唤符召出第2个Boss的几率: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			"换取Boss召唤符所需建设基金: <color=Violet>"..nNextPrice.."万<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	end
end
------------------------------
end