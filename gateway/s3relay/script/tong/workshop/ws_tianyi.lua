Include("\\script\\tong\\workshop\\workshop_head.lua");

if (MODEL_GAMESERVER == 1) then --如果是GameServer
-- 读入随机任务头文件
Include("\\script\\task\\system\\task_main.lua");
Include([[\script\tong\workshop\tongcolltask.lua]]);
end

aLevelCoef = {}

aLevelRenWuPrice = {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\tianyi_level_data.txt", "tianyiLevelData")
	if b1~=1 then
		print("加载天意作坊配置文件失败！")
		return
	end
	local nRowCount = TabFile_GetRowCount("tianyiLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("tianyiLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("tianyiLevelData", y, "OUTPUT_COEF"))
		aLevelRenWuPrice[nLevel] = tonumber(TabFile_GetCell("tianyiLevelData", y, "PRICE"))
	end
	--TabFile_UnLoad("tianyiLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------如果非客户端---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "天意坊总管") ~= 1 then
		return 0
	end
	Say("<#>天意坊总管：际遇由天意，命途自把握，切记切记！", 3, 
		"领取随机任务/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"特殊任务令牌/#use_g_1_ok22".."("..nTongID..","..nWorkshopID..")",
		"不用了/cancel");
	return 1;
end

----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --日常活动
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --初始化可领取任务数
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
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelRenWuPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if (nTime >= 1230 and nTime <= 2200) then
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	_dbgMsg("剩余领取次数*100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>天意坊总管：今天的随机任务已分发完毕，请明天再来吧！", 0)
		return 0;
			end
			Say("<#>S? d鬾g <color=yellow>"..aLevelRenWuPrice[nLevel].."<color> 贡献度兑换一个偶然令牌，你同意吗?", 2,
			"我想换/#use_g_1_ok21".."("..nTongID..","..nWorkshopID..")",
			"放弃 /cancel")
	else
		Talk(1,"","领取物品时间为每日12h30到22h!")
			return
	end
	Say("<#>你需要花费<color=yellow>"..aLevelRenWuPrice[nLevel].."<color>点贡献度获得一个随机任务令牌，确定吗？", 2,
		"我要换取/#use_g_1_ok21".."("..nTongID..","..nWorkshopID..")",
		"取消/cancel")
end

function use_g_1_ok22(nTongID, nWorkshopID)--领取特殊任务令牌
	nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	if (nLevel < 4) then
		Say("天意坊总管：天意坊等级达到<color=yellow>4<color>级时才能产出特殊任务令牌。你要做些什么？", 2, "了解特殊任务令牌/tong_tylp_aobut", "离开/cancel");
		return
	end;
	Say("天意坊总管：最近我这里有些特别的任务，不但可以让你增加经验，而且可以让你消除一定的PK值，要试试看吗？", 7, 
	"关于特殊任务令牌/tong_tylp_aobut", 
	"购买特殊任务令牌/#tong_tylp_tobuy("..nLevel..")",
	"了解我令牌任务进度/tong_tylp_knowabout",
	"我要换一个任务/tong_tylp_turn",
	"我已经得到足够的荐书/tong_tylp_award",
	"取消任务/tong_tylp_giveup",
	"我要离开/cancel");
end;

function tong_tylp_turn()
	local nLPLvl = get_lp_lvl();
	if (0 == nLPLvl) then
		Say("你目前没有特殊令牌任务。", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nContri, nConLimit, nMax;
	nContri = GetContribution();
	nConLimit = tab_buyLingPai_gxd[nLPLvl] / 10;
	if (nContri < nConLimit) then
		Say("转换一个<color=yellow>"..nLPLvl.."级<color>任务令牌需要<color=yellow>"..nConLimit.."点<color>贡献度（原令牌价格的十分之一），你的贡献度不够。", 0);
		return
	end;
	rwlp_cleartask()	--清除任务变量；
	for i = 1, 10 do
		nLevel = 1;
		nWorkshopIdx = random(1, 7); -- 随机一个作坊
		
		if (nLPLvl == 1) then
			nLevel = random(1, 3);
		elseif (nLPLvl == 2) then
			nLevel = random(4, 6);
		elseif (nLPLvl == 3) then
			nLevel = random(7, 8);
		end;
		
		nCount = random(1, 9);
		nMax = get_workshop_count(nWorkshopIdx, nLevel);
		if (nCount > nMax) then
			nCount = nMax;
		end;
		if (nCount > 0) then
			break
		end;
	end;
	AddContribution(-1 * nConLimit);
	Msg2Player("你消耗了<color=yellow>"..nConLimit.."点<color>贡献度来获得一个新的<color=yellow>"..nLPLvl.."级任务令牌任务。");
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	nt_SetTask(TASK_LP_COUNT, nCount);
	Say("你消耗了<color=yellow>"..nConLimit.."点<color>贡献度来获得一个新的<color=yellow>"..nLPLvl.."级<color>任务令牌任务。本帮的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>最近心绪不佳，原本打算上京赶考，求取一个功名。没成想京官要求，出仕举子需要有当地名士的荐书。越是名望满京师之人，考取功名的机会就越大。麻烦你为他去找<color=yellow>"..nCount.."位 "..nLevel.."<color>级以上不同帮会的<color=yellow>"..tab_Workshop[nWorkshopIdx].."坊总管<color>，获得他们的荐书。", 1, "好，我一定尽力而为/cancel")
end;

function get_lp_lvl()
	if (GetTask(TASK_LP_COUNT) == 0) then	--如果没有帮会特殊令牌任务
		return 0;
	end;
	local nLPLvl = ceil(GetTask(TASK_LP_ZONGGUANLEVEL) / 3);
	if (nLPLvl > 3) then
		nLPLvl = 3;
	elseif (nLPLvl < 1) then
		nLPLvl = 1;
	end;
	return nLPLvl;
end;

function tong_tylp_giveup()	--取消任务
	if (GetTask(TASK_LP_COUNT) == 0) then
		Say("天意坊总管：呵呵，你根本没有特殊任务在身。又谈何取消呢？", 0)
		return
	end;
	nt_SetTask(TASK_LP_COUNT, 0);
	rwlp_cleartask()	--清除任务变量；
	Msg2Player("天意坊总管：你已经取消了<color=yellow>特殊任务令牌<color>任务。")
end;

function tong_tylp_tobuy(nLevel)--购买任务令牌
	if (1 == TONG_GetPauseState(nTongID, nWorkshopID)) then
		Say("天意坊总管：对不起，您所在帮会的作坊目前处于暂停状态。必须帮会将战备基金的数目增加到周维护战备基金以上，才能在当日晚24：00重新开启作坊。", 0);
		Msg2Player("作坊暂停，无法获得特产。");
		return
	end;
	
	local tab_selete = {};
	--调整任务 pk - Modified by DinhHQ - 20110810
--	tinsert(tab_selete, "兑换一级令牌/#tong_tylp_buy( 1 )");
--	if (nLevel >= 7) then
--		tinsert(tab_selete, "兑换2级令牌/#tong_tylp_buy( 2 )")
--	end
	if (nLevel >= 9) then
		tinsert(tab_selete, "购买3级令牌/#tong_tylp_buy( 3 )")
	end
	
	tinsert(tab_selete, "我要离开/cancel");
	Say("天意坊总管：令牌由难度从低到高分为1～3级令牌，1级令牌需要100点贡献度完成后可以获得30万经验值以及消除2点PK值，2级令牌需要150点贡献度完成后可以获得40万经验值以及消除5点PK值，3级令牌需要200点贡献度完成后可以获得60万经验值以及消除10点PK值，你要购买哪一种？", getn(tab_selete), tab_selete);
end;

function tong_tylp_knowabout()
	if (GetTask(TASK_LP_COUNT) == 0) then	--如果没有帮会特殊令牌任务
		Say("你目前没有特殊令牌任务。", 0);
		return
	end;
	local nNeedCount = GetTask(TASK_LP_COUNT);
	local nGetCount = rwlp_getjuanshucount();
	if (nGetCount >= nNeedCount and nGetCount > 0) then
		Say("你已经收集了足够多的荐书，赶紧回去见天意坊总管吧。", 0);
	end;
	Say("你总共需要在不同的<color=yellow>"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."坊<color>总管处收集<color=yellow>"..nNeedCount.."封<color>荐书，你只了<color=yellow>"..nGetCount.."封<color>荐书。好好努力哦！", 0);
end;

tab_buyLingPai_gxd = {100, 150, 200};
function tong_tylp_buy(nLPLvl1)--购买令牌实体
	local nLPLvl = tonumber(nLPLvl1);
	local nAttr = GetContribution();
	if (nAttr < tab_buyLingPai_gxd[nLPLvl]) then
		Say("天意坊总管：对不起，您的个人贡献度不足<color=yellow>"..tab_buyLingPai_gxd[nLPLvl].."<color>，无法购买该特产，请努力挣取个人贡献度。", 0);
		Msg2Player("个人贡献度不足，无法获得特产。");
		return
	end;
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "装备需要2个空位.");
		return 
	end
	
	AddContribution(-tab_buyLingPai_gxd[nLPLvl]);
	
	_, nTongID = GetTongName();
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, 5);
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(tab_buyLingPai_gxd[nLPLvl]));
	
	nGoodIdx = 1101 + nLPLvl;
	--AddItem();
	local nRandomItemIndex = AddItem(6, 1, nGoodIdx, 0, 1, 0, 0);	--物品的id待定
	SetSpecItemParam(nRandomItemIndex, 1, nLPLvl);	--将令牌等级记录
	SyncItem(nRandomItemIndex); -- 同步物品魔法属性
	
	Msg2Player("你消耗了"..tostring(tab_buyLingPai_gxd[nLPLvl]).."点贡献度！");
	Msg2Player("<color=green>你得到了一个"..nLPLvl.."级特殊任务令牌！<color>");
end;

tab_LPAward = {[1] = {300000, 2}, [2] = {400000, 5}, [3] = {600000, 10}}
function tong_tylp_award()
	if (GetTask(TASK_LP_COUNT) == 0) then	--如果没有帮会特殊令牌任务
		Say("你目前没有特殊令牌任务。", 0);
		return
	end;
	
	local nGetCount = rwlp_getjuanshucount();
	local nGoalCount = GetTask(TASK_LP_COUNT);
	local nLPLvl = get_lp_lvl();
	local nPK = GetPK();
	local nDate = GetLocalDate("%m%d");
	local nday, nmon = mod(nDate, 100), floor(nDate / 100);
	local nTsk_Times = GetTask(TASK_LP_TIMESLIMIT);
	local ncurday, ncurmon, ncuttimes = GetByte(nTsk_Times, 2), GetByte(nTsk_Times, 3), GetByte(nTsk_Times, 1);
	
	if (nPK == 0) then
		Say("目前你没有PK，不能完成该任务.", 0);
		return 0;
	end
	
	if (nday ~= ncurday or nmon ~= ncurmon) then
		ncurday = nday;
		ncurmon = nmon;
		ncuttimes = 0;
		nTsk_Times = SetByte(nTsk_Times, 2, ncurday);
		nTsk_Times = SetByte(nTsk_Times, 3, ncurmon);
		nTsk_Times = SetByte(nTsk_Times, 1, ncuttimes);
		SetTask(TASK_LP_TIMESLIMIT, nTsk_Times);
	end
	
	if (ncuttimes >= DAILY_MAX_TIMES) then
		Say(format("今天你执行该任务%d次了，明天再来吧 .", DAILY_MAX_TIMES), 0);
		return 0;
	end
	
	if (nGetCount >= nGoalCount and nGetCount > 0) then
		ncuttimes = ncuttimes + 1;
		nTsk_Times = SetByte(nTsk_Times, 1, ncuttimes);
		SetTask(TASK_LP_TIMESLIMIT, nTsk_Times);
		
		Say("天意坊总管：老夫看你年轻有为啊～，看看你的PK值有没有减少，呵呵～", 0);
		--清空任务变量
		AddOwnExp(tab_LPAward[nLPLvl][1]);
		Msg2Player("你获得了<color=yellow>"..tab_LPAward[nLPLvl][1].."<color>点经验的奖励。");
--		local nDecCount = tab_LPAward[nLPLvl][2];
		local nDecCount = PER_ASSIGNMENT_PK  
		if (nDecCount > nPK) then
			nDecCount = nPK;
		end;
		if (nDecCount > 0) then
			--调整任务pk - Modified by DinhHQ - 20110810
			if (ncuttimes < 3) then
				SetPK(nPK - nDecCount);
			Msg2Player("你的PK值减少了<color=yellow>"..nDecCount.."<color>点。");
			end			
		else
			Msg2Player("你的PK值变为<color=yellow>0点<color>了。");
		end;
		rwlp_cleartask()	--清除任务变量；
	else
		Say("天意坊总管：你要找到<color=yellow>"..nGoalCount.."<color>个荐书才行,现在你已经找到了<color=yellow>"..nGetCount.."<color>个", 0);
	end;
end;

function tong_tylp_aobut()--关于特殊令牌
	Say("天意坊总管：这个特殊任务需要接受任务者根据任务要求寻找到一定数量的帮会，这些帮会的共同点是拥有任务要求的某种作坊，而且作坊等级同时达标。此时与该作坊总管对话，他就会赠送给你一封荐书，每个符合要求的帮会，其作坊总管只能赠送给你一封荐书。只要收集满任务要求数量的荐书，回自己帮会与我对话交接任务便可。", 0);
end;

function use_g_1_ok21(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelRenWuPrice[nLevel]) then
		Say("<#>天意坊总管：对不起，你的贡献度不足！", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>天意坊总管：您要的东西还没到货，请稍等片刻！", 0)
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "装备需要2个空位.");
		return 
	end
	
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	if (GetContribution() < aLevelRenWuPrice[nLevel]) then
		return
	end
	
	local nRandomTaskID = createRandomTask();
	local nRandomItemIndex = 0;
	
	if nRandomTaskID~=nil and nRandomTaskID~=0 then
		
		AddContribution(-aLevelRenWuPrice[nLevel]);
		
		Msg2Player("你消耗了"..tostring(aLevelRenWuPrice[nLevel]).."点贡献度！");
		
		nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
		SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
		
		-- 同步物品魔法属性
		SyncItem(nRandomItemIndex);		
				
		Msg2Player("<color=green>你得到了一个随机任务令牌！<color>");
	end;
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
	local nPrice  --当前换取任务令牌的贡献度
	local dTokenCount	--当前每日任务令牌产出总量提高
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelRenWuPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
		else
			nPrice = "--"
			dTokenCount = "--"	
		end
	else	--作坊未建立时只显示下一级信息
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--下级信息
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextTokenCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --升级消耗
	else
		nUpgradeCostFund = "--"
	end	
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --下级维护消耗
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--下级开启消耗
		nNextPrice = aLevelRenWuPrice[nUseLevel + 1] --下级换取任务令牌的贡献度
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --下级每日任务令牌产出总量提高
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
	end
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>暂停" elseif bOpen == 1 then state="<color=green>开启" else state="<color=red>关闭" end
		local szMsg = "作坊状态："..state.."<color>\n"..
			"作坊等级：<color=gold>"..nCurLevel.."<color>级\n"..
			"当前使用等级：<color=gold>"..nUseLevel.."<color>级\n"..
			"任务令牌日产出量上限提高：<color=gold>"..dTokenCount.."<color>倍\n"..		
			"换取任务令牌所需贡献度：<color=gold>"..nPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=gold>"..nMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=gold>"..nOpenFund.."万<color>\n"..
			"升级所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一使用等级<color>\n"..
			"<color=water>任务令牌日产出量上限提高：<color=Violet>"..dNextTokenCount.."<color>倍\n"..	
			"换取任务令牌所需贡献度：<color=Violet>"..nNextPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	else
		local szMsg = "作坊状态：<color=water>未建立<color>\n"..
			"建立所需建设基金：<color=gold>"..nUpgradeCostFund.."万<color>\n"..
			"<color=green>下一等级<color>\n"..
			"<color=water>任务令牌日产出量上限提高：<color=Violet>"..dNextTokenCount.."<color>倍\n"..	
			"换取任务令牌所需贡献度：<color=Violet>"..nNextPrice.."<color>\n"..
			"每日维护消耗战备基金：<color=Violet>"..nNextMaintainFund.."万<color>\n"..
			"开启所需建设基金：<color=Violet>"..nNextOpenFund.."万<color>\n"
		return szMsg
	end
end

end