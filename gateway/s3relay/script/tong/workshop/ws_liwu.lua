Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelHongBaoCoef = {}
aLevelHongBaoPrice = {}
aLevelPriceBag = {}		--激活子母袋的花费贡献度
--aLevelPartnerLevel = {} --激活子母袋的同伴等级需求
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\liwu_level_data.txt", "liwuLevelData")
	if b1~=1 then
		print("加载礼物作坊配置文件失败！")
		return
	end
	local nRowCount = TabFile_GetRowCount("liwuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("liwuLevelData", y, "LEVEL"))
		aLevelHongBaoCoef[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "OUTPUT_COEF"))
		aLevelHongBaoPrice[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE"))
		aLevelPriceBag[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE_BAG"))
		--aLevelPartnerLevel[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PARTNER_LEVEL"))
	end
	--TabFile_UnLoad("liwuLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
if MODEL_GAMESERVER == 1 then
IncludeLib("PARTNER")
end

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "礼物坊总管") ~= 1 then
		return 0
	end
	Say("<#>礼物坊总管：天天送大礼，日日有惊喜。今年过节不收礼，要收就收大红包！", 2, 
	"领取红包/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")", "激活子母袋/#partner_bag".."("..nTongID..
	","..nWorkshopID..")", "不用了/cancel");
	return 1;
end

function partner_bag(nTongID, nWorkshopID)
	local nBagLevel = GetPartnerBagLevel()
	if (nBagLevel >=10 )then
		Say("<#>礼物坊总管：你的子母袋已经是最大了，再大就背不动咯", 1, "知道了/cancel")
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nBagLevel >= nLevel)then
		Say("礼物坊总管：现在你的子母袋为"..nBagLevel.."级，目前咱礼物坊的使用等级还不能够升级你的子母袋。", 
			1, "看来只好日后再来/cancel")
			return
	end
	Say("礼物坊总管：现在你的子母袋为"..nBagLevel.."级，花费<color=yellow>"..aLevelPriceBag[nBagLevel+1].."<color>点贡献度我就可以把这子母袋扩大一些，需不需要呢？",2,
		"太好了，多多益善嘛/#YaoBag("..nTongID..","..nWorkshopID..")", "先不用了/cancel")
end

function YaoBag(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nToLevel = GetPartnerBagLevel()+1
	if (nToLevel > nLevel)then
		Say("礼物坊总管：目前咱礼物坊的使用等级还不能够升级你的子母袋。", 
			1, "看来只好日后再来/cancel")
			return
	end
	if (GetContribution() < aLevelPriceBag[nToLevel])then
		Say("<#>礼物坊总管：你的贡献度不够呢，再多为帮会做些事情吧", 1, "竟然不够啊/cancel")
		return
	end
	AddContribution(-aLevelPriceBag[nToLevel])
	SetPartnerBagLevel(nToLevel)
	Say("<#>礼物坊总管：相信我的手艺吧，立等可取。呦，你看，你的"..nToLevel.."级子母袋已经加工好了，以后可以来领更多红包啦", 1, 
		"果然名不虚传呐/cancel")
	Msg2Player("你的子母袋升到"..nToLevel.."级，空间得到了扩大")
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelHongBaoCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --初始化可领取红包数
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nHongbaoLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nHongbaoLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelHongBaoPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
			local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	_dbgMsg("剩余输出数*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
			if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>礼物坊总管：对不起，今天的礼品已经发放完毕，请明天再来吧！", 0)
				return 0;
			end
	Say("<#>礼物坊总管：你需要花费<color=yellow>"..aLevelHongBaoPrice[nLevel].."<color>点贡献度换取一个红包", 2, 
		"好吧/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "不了/cancel");
	else
		Talk(1,"","系统出错 !")
			return
	end
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		Say("<#>礼物坊总管：对不起，你的贡献度不足，怎能领取红包呢！", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>礼物坊总管：您要的东西还没到货，请稍等片刻！", 0)
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "装备需要两个空位.");
		return 
	end
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		return
	end
	AddContribution(-aLevelHongBaoPrice[nLevel]);
	Msg2Player("你消耗了"..aLevelHongBaoPrice[nLevel].."点贡献度，获得了帮会神秘红包一个！");
	AddItem(6, 1, 1021, 1, 0, 0, 0);
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
	local nPrice  --当前换取神秘红包的贡献度
	local dHongBaoCount	--当前每日神秘红包日产出数量上限
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelHongBaoPrice[nUseLevel]
			dHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel] / aLevelHongBaoCoef[1])	
		else
			nPrice = "--"
			dHongBaoCount = "--"
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextHongBaoCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		nNextPrice = aLevelHongBaoPrice[nUseLevel + 1] --下级换取神秘红包的贡献度
		dNextHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel + 1] / aLevelHongBaoCoef[1]) --下级每日神秘红包日产出数量上限
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextHongBaoCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>暂停" elseif bOpen == 1 then state="<color=green>开启" else state="<color=red>关闭" end
		local szMsg = "作坊状态："..state.."<color>\n"..
			"作坊等级：<color=gold>"..nCurLevel.."<color>级\n"..
			"当前使用等级：<color=gold>"..nUseLevel.."<color>级\n"..
			"神秘红包日产出量上限提高：<color=gold>"..dHongBaoCount.."<color>倍\n"..		
			"换取神秘红包所需贡献度：<color=gold>"..nPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=gold>"..nMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=gold>"..nOpenFund.."万<color>\n"..
			"升级所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一使用等级<color>\n"..
			"<color=water>神秘红包日产出量上限提高：<color=Violet>"..dNextHongBaoCount.."<color>倍\n"..	
			"换取神秘红包所需贡献度：<color=Violet>"..nNextPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	else
		local szMsg = "作坊状态：<color=water>未建立<color>\n"..
			"建立所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一等级<color>\n"..
			"<color=water>神秘红包日产出量上限提高：<color=Violet>"..dNextHongBaoCount.."<color>倍\n"..	
			"换取神秘红包所需贡献度：<color=Violet>"..nNextPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	end
end

end