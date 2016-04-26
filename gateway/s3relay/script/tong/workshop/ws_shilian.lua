Include("\\script\\tong\\workshop\\workshop_head.lua")

IncludeLib("SETTING")

TASKID_GET_TIME = 2347
aLevelTime = {}
aLevelOutputCoef = {}
aLevelCost= {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\shilian_level_data.txt", "shilianLevelData")
	if b1~=1 then
		print("加载试炼作坊配置文件失败！")
		return
	end
	local nRowCount = TabFile_GetRowCount("shilianLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("shilianLevelData", y, "LEVEL"))
		aLevelTime[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "TIME"))
		aLevelOutputCoef[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "OUTPUT_COEF"))	
		aLevelCost[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "COST"))
	end
	--TabFile_UnLoad("shilianLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
	if MODEL_GAMESERVER == 1 then		--只有GAMESERVER 才有的
		Include("\\script\\item\\techan_dahuandan.lua");
	end;

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "试炼坊总管") ~= 1 then
		return 0
	end
	local aryszContent = {
		"我要领取秘制修身丸/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"获取修炼木人/#use_xiulianmuren("..nTongID..","..nWorkshopID..")",
	}
	-- 越南版取消大还丹
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent,"获得大还丹/#use_dahuandan("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent,"下次吧/cancel");
	
	Say("<#>试炼坊总管：想变成一个威震武林的大侠，需要意志坚强，不怕危险，冲锋陷阵，才能达到过人的成绩!", getn(aryszContent), aryszContent)
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (GetTask(TASKID_GET_TIME) == TONG_GetDay(nTongID))then
		Say("<#>试炼坊总管：你今天已经领取过了，请明天再来吧！", 0)
		return 0;		
	end
	_dbgMsg("剩余领取次数*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>试炼坊总管：今天炼制的修身丸已经发完啦，请明天再来吧！", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>礼物坊总管：你需要花费<color=yellow>"..aLevelCost[nLevel].."<color>点贡献度，秘制修身丸能让服用者经验翻倍半小时。", 2, 
		"好吧/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "不了/cancel");
--	if (GetNpcExpRate() > 100) then
--		Say("<#>试炼坊总管：对不起，双倍经验期间不能使用试炼坊。", 0)
--		return
--	end
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelCost[nLevel]) then
		Say("<#>试炼坊总管：对不起，你的贡献度不足！", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>试炼坊总管：您上次要的东西还没到货，请稍等片刻！", 0)
		return
	end
	
	if CalcFreeItemCellCount() < floor(aLevelTime[nLevel] * 2) then
		Talk(1, "", format("为确保财产安全，请留下 %d 空位.", floor(aLevelTime[nLevel] * 2)));
		return 
	end
	
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);	
end

--------------------------------------------------
--/////////////////////////
--修炼木人
--
--/////////////////////////
VALUE_MUREN_CONTRIBUTION = 100
function use_xiulianmuren(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
	Say("<#>试炼坊总管：说到练功最快的方法当然就是实战，但找一个人陪你练功也不是那么容易的，所以我发明了一种木人，能让你随时随地的练功。只要右键点击修炼木人便能召唤出一个木人陪你练功，打败它可获得大量经验，而且修炼坊等级越高所产出修炼木人的经验值就越高。你可以用<color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color>点贡献度来换一个，你要换吗？", 3,
	"购买一个修炼木人/#sl_sure2muren("..nTongID..","..nWorkshopID..")",
	"关于修炼木人/sl_helpmuren",
	"不用了/cancel")
	else
			Talk(1,"","领取物品时间为每日12h30到22h!")
			return
	end
	
end

function sl_helpmuren()
	Say("<#>试炼坊总管：使用修炼木人可以召唤出一个木人NPC，打败它便能获得100万经验。修炼坊等级越高所产出修炼木人的经验值就越高（六级：105万；七级：110万；八级：115万；九级：120万；十级：130万）。要注意的是，这个木人只有自己打败才能获得经验，别人打是不能获得任何经验的。", 0)
end

function sl_sure2muren(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>试炼坊总管：对不起，您所在帮会的试炼坊目前处于暂停状态。必须帮会将战备基金的数目增加到周维护战备基金以上，才能在当日晚24：00重新开启作坊。", 0)
		Msg2Player("作坊暂停，功能无法使用。")
		return
	end
	
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>试炼坊总管：你连帮会都没入，来这干吗？", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--获得使用等级
	if (nUseLevel < 5) then
		Say("<#>试炼坊总管：对不起，您所在帮会试炼坊的使用等级没有达到5级，无法获得该帮会特产。", 0)
		Msg2Player("作坊使用等级没有达到5级，功能无法使用。")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_MUREN_CONTRIBUTION )) then
		Say("<#>试炼坊总管：今天的修炼木人已分发完毕，请明天再来吧！", 0)
		return
	end
	
	if (GetContribution() < VALUE_MUREN_CONTRIBUTION or AddContribution(-VALUE_MUREN_CONTRIBUTION) ~= 1)then
		Say("<#>试炼坊总管：对不起，您的个人贡献度不足<color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color>点，无法购买该特产，请努力挣取个人贡献度。", 0)
		Msg2Player("个人贡献度不足，功能无法使用。")
		return 
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "装备需要两个空位.");
		return 
	end
	
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_MUREN_CONTRIBUTION ))
	
	local nItemIndex = AddItem(6,1,1085,1,1,0)
	SetSpecItemParam(nItemIndex, 1, nTongID)
	SetSpecItemParam(nItemIndex, 2, nUseLevel)
	SyncItem(nItemIndex)
	Msg2Player("您成功购买了一个修炼木人。")
	Say("<#>试炼坊总管：您成功购买了一个修炼木人。", 0)
end

--////////////////////
--大还丹
--
--////////////////////

VALUE_HUANDAN_CONTRIBUTION = 30
tbHUANDAN_ADDEXP = {
[4] = 1.25,
[5] = 1.3,
[6] = 1.35,
[7] = 1.4,
[8] = 1.45,
[9] = 1.5,
[10] = 1.6,
}
TASKID_TECHAN_HUANDAN_EXP = 1741	--大还丹每次给与经验值
TASKID_TECHAN_HUANDAN_TIME = 1742	--大还丹剩余使用时间
function use_dahuandan(nTongID, nWorkshopID)
	local nResttime = GetTask(TASKID_TECHAN_HUANDAN_TIME)
	local nExtpre = GetTask(TASKID_TECHAN_HUANDAN_EXP)
	if (nResttime == 0 and nExtpre ~= 0) then
		SetTask(TASKID_TECHAN_HUANDAN_EXP, 0)
	end
	local szMsg = ""
	if (nResttime ~= 0) then
		local nRestH, nRestM = GetMinAndSec(nResttime)
		szMsg = "您当前的大还丹还能使用<color=yellow>"..nRestH.."<color>小时<color=yellow>"..nRestM.."<color>分。"
	end
	Say("<#>试炼坊总管：这种神奇的丹药可以让你在使用离线托管功能时获得更多的经验，亦可使任何级别同伴获得一定量经验。每颗大还丹需要花费30点个人贡献度，可以使用6小时。"..szMsg, 3,
	"<#>购买一颗大还丹/#sl_sure2dahuandan("..nTongID..","..nWorkshopID..")",
	"<#>关于大还单/sl_helpdahuandan",
	"<#>不用了/cancel")
end

function sl_helpdahuandan()
	Say("试炼坊总管：大还丹可以让你在使用离线托管功能时获得更多的经验值，但它并不能增加你的离线托管时间，而且大还丹的经验加成只是在离线托管的基础经验上进行的；试炼坊的等级越高你所购买的大还丹经验加成越高（四级：1.25倍;五级：1.3倍;六级：1.35倍;七级：1.4倍;八级：1.45倍;九级：1.5倍;十级：1.6倍）。", 0)
end

function sl_sure2dahuandan(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>试炼坊总管：对不起，您所在帮会的试炼坊目前处于暂停状态。必须帮会将战备基金的数目增加到周维护战备基金以上，才能在当日晚24：00重新开启作坊。", 0)
		Msg2Player("作坊暂停，功能无法使用。")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>试炼坊总管：你连帮会都没入，来这干吗？", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--获得使用等级
	if (nUseLevel < 4) then
		Say("<#>试炼坊总管：对不起，您所在帮会试炼坊的使用等级没有达到4级，无法获得该帮会特产。", 0)
		Msg2Player("作坊使用等级没有达到4级，功能无法使用。")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_HUANDAN_CONTRIBUTION )) then
		Say("<#>试炼坊总管：今天的大还丹已分发完毕，请明天再来吧！", 0)
		return
	end
	
	if (GetContribution() < VALUE_HUANDAN_CONTRIBUTION or AddContribution(-VALUE_HUANDAN_CONTRIBUTION) ~= 1)then
		Say("<#>试炼坊总管：对不起，您的个人贡献度不足<color=yellow>"..VALUE_HUANDAN_CONTRIBUTION.."<color>点，无法购买该特产，请努力挣取个人贡献度。", 0)
		Msg2Player("个人贡献度不足，功能无法使用。")
		return 
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_HUANDAN_CONTRIBUTION ))

	local nRestH, nRestM = adddahuandan_main(nUseLevel)
	Msg2Player("<#>你成功购买了一颗大还丹，你目前的大还丹效果时间为"..nRestH.."小时"..nRestM.."分。")
	Say("<#>试炼坊总管：你成功购买了一颗6小时经验加成"..tbHUANDAN_ADDEXP[nUseLevel].."倍的大还丹，你目前的大还丹效果时间为"..nRestH.."小时"..nRestM.."分。", 0)
end


----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelOutputCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal)--初始化可领取双倍
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
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelTime[nLevel] * 50)
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nCost = aLevelCost[nLevel]
	if (GetContribution() < nCost) then
		return
	end
	SetTask(TASKID_GET_TIME, TONG_GetDay(nTongID))
	local nCount = floor(aLevelTime[nLevel] * 2)
	AddContribution(-nCost)
	Msg2Player("你消耗了"..nCost.."点贡献度！")
	for i = 1, nCount do 
		AddItem(6,1,1076,1,0,0)
	end
	--AddSkillState(440, 1, 1, aLevelTime[nLevel] * 3600 * 18)
	Msg2Player("你获得了"..nCount.."个秘制修身丸！")
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
	local nPrice  --当前领取双倍经验的贡献度
	local dDoubleExpCount	--当前每日领取双倍经验人数上限提高
	local nTime	--当前双倍经验时间
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelCost[nUseLevel]
			dDoubleExpCount = format("%.2f", aLevelOutputCoef[nUseLevel] / aLevelOutputCoef[1])
			nTime = aLevelTime[nUseLevel]
		else
			nPrice = "--"
			dDoubleExpCount = "--"
			nTime = "--"
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextDoubleExpCount,nNextTime
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		nNextPrice = aLevelCost[nUseLevel + 1] --下级领取双倍经验的贡献度
		dNextDoubleExpCount = format("%.2f", aLevelOutputCoef[nUseLevel + 1] / aLevelOutputCoef[1]) --下级每日领取双倍经验人数上限提高
		nNextTime = aLevelTime[nUseLevel + 1] --下级双倍经验时间
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextDoubleExpCount = "--"
		nNextTime = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>暂停" elseif bOpen == 1 then state="<color=green>开启" else state="<color=red>关闭" end
		local szMsg = "作坊状态："..state.."<color>\n"..
			"作坊等级：<color=gold>"..nCurLevel.."<color>级\n"..
			"当前使用等级：<color=gold>"..nUseLevel.."<color>级\n"..
			"每日领取双倍经验人数上限提高：<color=gold>"..dDoubleExpCount.."<color>倍\n"..	
			"双倍经验时间：<color=gold>"..nTime.."<color>小时\n"..
			"领取双倍经验所需贡献度：<color=gold>"..nPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=gold>"..nMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=gold>"..nOpenFund.."万<color>\n"..
			"升级所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一使用等级<color>\n"..
			"<color=water>每日领取双倍经验人数上限提高：<color=Violet>"..dNextDoubleExpCount.."<color>倍\n"..
			"双倍经验时间：<color=Violet>"..nNextTime.."<color>小时\n"..
			"领取双倍经验所需贡献度：<color=Violet>"..nNextPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	else
		local szMsg = "作坊状态：<color=water>未建立<color>\n"..
			"建立所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一等级<color>\n"..
			"<color=water>每日领取双倍经验人数上限提高：<color=Violet>"..dNextDoubleExpCount.."<color>倍\n"..	
			"双倍经验时间：<color=Violet>"..nNextTime.."<color>小时\n"..
			"领取双倍经验所需贡献度：<color=Violet>"..nNextPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	end
end

end