Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\battles\\battles_award_head.lua")		--By 小浪多多
Include("\\script\\nationalwar\\head.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")

IncludeLib("SETTING");
MISSIONID = 64
sf_aryItems = {
	{ "加跑丸", {6,0,2,1,0,0}, 5 },
	{ "高中丸", {6,0,5,1,0,0}, 5 },
	{ "高闪丸", {6,0,4,1,0,0}, 5 },
	{ "长命丸", {6,0,1,1,0,0}, 5 },
	{ "飞速丸", {6,0,6,1,0,0}, 5 },
	{ "毒防丸", {6,0,10,1,0,0}, 5 },
	{ "冰防丸", {6,0,7,1,0,0}, 5 },
	{ "火防丸", {6,0,9,1,0,0}, 5 },
	{ "雷防丸", {6,0,8,1,0,0}, 5 },
	{ "大力丸", {6,0,3,1,0,0}, 30 },
	{ "烟花", {6,0,11,1,0,0}, 1 },
	{ "玫瑰花雨", {6,0,20,1,0,0}, 2 },
	{ "心心相印符", {6,1,18,1,0,0}, 5 },
	}


BOSS_TIME = (BAOMING_TIME + 30) * 60 * FRAME2TIME / TIMER_1;--战争开始后30分钟出现元帅
VANISHGAME_TIME = (BAOMING_TIME + FIGHTING_TIME - 20) * 60 * FRAME2TIME/ TIMER_1; --战斗最后20分钟时，必须所有Npc全部产生


MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- 玩家死亡或退出游戏再进入时，必须3分钟之后才能离开后营到大营

--以下是某些值记录在MissionValue中的索引位置，通过GetMissionV(MS_XXX)来获得实际的值
MS_MARSHAL = 2;--记录当前产生的是宋军元帅：1；还是金军元帅：2；还是都产生了：3；

MS_CENTER_X1 = 4;   --区域1：当报名阶段时，禁止玩家离开大营时，将玩家扔回大营的坐标
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--区域2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --区域1：后营内坐标
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --后营外坐标
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--区域2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1 = 17; --记录Timer1执行的次数

MS_MARSHALDEATH = 18	--如果一方大将死亡，则为：1（宋）获2（金）；否则为：0

MS_TOTALPOINT_S = 19		--本次战役结束时请零，记录本次战役宋方总积分
MS_TOTALPOINT_J = 20		--本次战役结束时请零，记录本次战役金方总积分


FILE_HOMETRAP1 = "\\script\\battles\\guozhan\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\guozhan\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\guozhan\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\guozhan\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\guozhan\\homeouttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\guozhan\\npcdeath_1.lua",
	"\\script\\battles\\guozhan\\npcdeath_2.lua",
	"\\script\\battles\\guozhan\\npcdeath_3.lua",
	"\\script\\battles\\guozhan\\npcdeath_4.lua",
	"\\script\\battles\\guozhan\\npcdeath_5.lua",
	"\\script\\battles\\guozhan\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\guozhan\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\guozhan\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\guozhan\\npcdeath.lua"

--Npc的模板号ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_KEY = 7;		--记录当前地图下任务的一个key，即一个随机生成的数定

MS_NEWSVALUE = 10; --任务中存放新闻变量的地方

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------

function sf_winbouns(n_camp)
	local wincamp = n_camp;
	local failcamp = 0
	
	if (wincamp == 0) then
		wincamp = 1;
	end
	
	--如果结束对方阵营没有玩家，则胜方不给奖励
	if (wincamp == 1) then
		failcamp = 2;
	else
		failcamp = 1;
	end
	
	-- 国战宋金
	if BT_GetGameData(GAME_BATTLEID) == 2 then
		nw_clear_task();
		NW_Abdicate();
		NW_SetTask(0, wincamp);
	end
	
--	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
--		WriteLog("由于败方没有玩家，所以胜利方不送奖励")
--		return
--	end
	
	--by zero 2007-8-1 获得所有赢方
	local All_Players_Table = {};
	local Win_Players_Table = {};
	idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, wincamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	
	local Los_Players_Table = {};
	idx = 0;
	for i = 1 , GetMSPlayerCount(MISSIONID, failcamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp)
		if (pidx > 0) then
			Los_Players_Table[getn(Los_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	battle_finish_activity(BT_GetGameData(GAME_LEVEL), All_Players_Table, Win_Players_Table, Los_Players_Table, n_camp)

	
	--end 
	--by zero 2007-7-30 获得宋金军功牌 一天获得2次
	local OldPlayerIndex = PlayerIndex
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
		local player_total_point=BT_GetData(PL_TOTALPOINT) --获得积分
		
		
		
		--领取军功牌
		local jg_ndate=tonumber(GetLocalDate("%y%m%d"))
		jg_ndate=jg_ndate*10+2;
		local JG_T_Value=GetTask(JUNGONGPAI_Task_ID) --军功牌获取任务变量
		
		--print(format("%d %d",player_total_point,JG_T_Value))
		if(player_total_point >= 1000 and JG_T_Value < jg_ndate) then
			local ItemIdx = AddItem(6,1,JUNGONGPAI,1,0,0);
			
			local Tdate=FormatTime2Number(GetCurServerTime()+24*60*60)--领取的第二天
			Tdate=floor(Tdate/10000) --取年,月,日
			nEndYear=floor(Tdate/10000)+2000
			nEndMonthDay=floor(mod(Tdate,10000))
			SetSpecItemParam(ItemIdx, 1,nEndYear);--设置物品年
			SetSpecItemParam(ItemIdx, 2,nEndMonthDay);--设置物品月日
			SyncItem(ItemIdx)
			SetItemBindState(ItemIdx, -2);-- 绑定
			Msg2Player("您收到一个宋金勋功牌")
			WriteLog(format("[宋金战场]\t%s\tName:%s\tAccount:%s\t 1000 积累点以上将收到一个宋金勋功牌",
					GetLocalDate("%y%m%d %X"), GetName(), GetAccount()));
			if(JG_T_Value == (jg_ndate-1)) then --领取了2次	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate);
			elseif(JG_T_Value ~= jg_ndate) then --领取了1次	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate-1);
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	--end
	
	local award_over = floor(BATTLES_LOSEGAME_POINT * bt_getgn_awardtimes())
	bt_camp_getbonus(failcamp, award_over, "此次我方败! 胜败乃兵家常事, 将士不用灰心! 下次将一决雌雄. (收到 <color=yellow>", 50)
	
	bonuscff1 = BATTLES_WINGAME_POINT * bt_getgn_awardtimes()
   	repute = 3 * bt_getgn_awardtimes()
	WriteLog("此次胜利的累计值为:"..bonuscff1)

	sf_itemcount = getn(sf_aryItems)
	
	-- by zero 修改获取赢方人员的方式
	OldPlayerIndex = PlayerIndex	
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
        local game_level = BT_GetGameData(GAME_LEVEL);
        local n_bonuscff1 = 0;
	   		AddRepute(repute);			
	   		Msg2Player("您的名望增加"..repute.."点!")
			mar_addmissionpoint(bonuscff1)
			n_bonuscff1 = bt_addtotalpoint(bonuscff1)
	   		Msg2Player("您收到"..n_bonuscff1.." 积分")
			--Storm 胜方结束挑战，并记录获胜者
			Say("恭喜贵方取得胜利! 您的名望增加 <color=yellow>"..repute.."<color>! 增加 <color=yellow>"..n_bonuscff1.."<color> 积累点", 1, "结束对话/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1
			randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#>恭喜你! 取得奖励"..szItemName);
		end;
	end
	PlayerIndex = OldPlayerIndex
end;

function mar_addmissionpoint(totalpoint)
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
	end
end

function GameOver()
	WriteLog("battle is ending. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local OldPlayerIndex = PlayerIndex
	
	--更新宋金相关的世界排名榜

--	--模式总排行榜

		BT_SortWorldLadder(PL_TOTALPOINT, 10112)
		BT_SortWorldLadder(PL_KILLPLAYER, 10113)
		BT_SortWorldLadder(PL_KILLNPC, 10114)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10115)
		BT_SortWorldLadder(PL_GETITEM, 10116)

	
	local game_level = BT_GetGameData(GAME_LEVEL);
	
	--模式加等级排行榜
		if (game_level == 3) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10097)
			BT_SortWorldLadder(PL_KILLNPC, 10098)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10099)
			BT_SortWorldLadder(PL_GETITEM, 10100)
			BT_SortWorldLadder(PL_TOTALPOINT, 10101)
		  bt_sortbthonour();			--宋金荣誉积分排行
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10102)
			BT_SortWorldLadder(PL_KILLNPC, 10103)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10104)
			BT_SortWorldLadder(PL_GETITEM, 10105)
			BT_SortWorldLadder(PL_TOTALPOINT, 10106)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10107)
			BT_SortWorldLadder(PL_KILLNPC, 10108)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10109)
			BT_SortWorldLadder(PL_GETITEM, 10110)
			BT_SortWorldLadder(PL_TOTALPOINT, 10111)
		end

	
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_KILLNPC, 10088)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	if (game_level == 1) then
		resultstr = "初级区域"
	elseif (game_level == 2) then
		resultstr = "中级区域"
	elseif (game_level == 3) then
		resultstr = "高级区域"
	end
		--edit by zero 根据排名给奖励
	
	battle_rank_award0808(game_level)
	battle_rank_activity(game_level)
	
	--end
	--edit by 小浪多多
	--把3种模式奖励指向一个文件编写
	--所有队员奖励,胜负平皆有
	--sign start
	local Win_Players_Table={}
	local idx = 0;
	local pidx = 0;
	for i=1,500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, 0)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	for i = 1,getn(Win_Players_Table) do
		local noldplayerindex = PlayerIndex
		PlayerIndex = Win_Players_Table[i]
		local player_total_point=BT_GetData(PL_TOTALPOINT) --获得积分
		battles_award_all_singleplayer(PlayerIndex,player_total_point,game_level)
		PlayerIndex = noldplayerindex
	end 
	--sign end	
	
	tb_storm_winner = {}	--Storm	清空获胜者
	

	
	-- 宋金调整 如果战平则根据积分计算胜负
	local nWinCamp = GetMissionV(MS_MARSHALDEATH);
	
	if (nWinCamp == 0) then
		if bonus_s >= bonus_j then
			nWinCamp = 1
		else
			nWinCamp = 2
		end
	end
	
	if (nWinCamp == 1) then
		resultstr = resultstr.."战役结束，宋方取得胜利!"
	else
		resultstr = resultstr.."战役结束，金方取得胜利!"
	end
	
	
	Msg2MSAll(MISSIONID, resultstr)
	AddGlobalCountNews(resultstr, 1)
	WriteLog(resultstr)
	
	SetMissionV(MS_MARSHALDEATH, nWinCamp)
	BT_ReportResult(nWinCamp)
	sf_winbouns(nWinCamp)
	RecordBTCount_Win(nWinCamp)
	
	
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	branchTask_JoinSJend1();
	 	l_curcamp = GetCurCamp();

		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
		--Storm 给获胜者以外的结束挑战
		if (not tb_storm_winner[PlayerIndex]) then
			storm_end(1)
		end
		
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[game_level], 1)
			NewWorld(bt_getsignpos(1))
		else	
			SetRevPos(tbGAME_SIGNMAP[game_level], 2)
			NewWorld(bt_getsignpos(2))
		end;
		
		camp = GetCamp();
		SetCurCamp(camp);
		-- 天子国战，积分超过100获得活跃度奖励
		if game_level == 3 and BT_GetData(PL_TOTALPOINT) >= 100 then
			DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "tianziguozhan")
		end
	end;
	PlayerIndex = OldPlayerIndex;
end;
-------------------------------------------------------------------------
function sf_join(camp)
	
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("我的军力现在已经足够消灭金军，壮士请等下一场!")
			return
		elseif (camp==2) then
			Msg2Player("我的军力现在已经足够消灭宋军，壮士请等下一场!")
			return
		end
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","你等金人, 侵犯我江山, 杀害我同胞!我誓与你等战个你死我活!")
		else
			Talk(1,"","金国谁都骁勇善战. 你等匹夫怎是我们的对手!")
			return
		end
	end

if (result == 0) then
	if (GetCash() >= 3000) then
		Pay(3000)
		BT_LeaveBattle() -- 清除玩家客户端当前的排名数据
		BT_ClearPlayerData()
		SetTask(2435, 0);--本场宋金已经领取的帮会贡献度清零--by 廖志山
		Msg2Player("提醒:可以按键盘左上方看战役信息!");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		tbLog:PlayerActionLog("EventChienThang042011","宋金报名")	-- 报名日志
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nlevel)
	else
		Say("想参加宋金战役，请支持3000两", 0)
		return 
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 107) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
	str = GetName().."加入宋军"
	EnterChannel(PlayerIndex, "宋军"..szGAME_GAMELEVEL[level].."宋金国战")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().."加入金军"
	EnterChannel(PlayerIndex, "金军"..szGAME_GAMELEVEL[level].."宋金国战")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], 1)
else
	SetRevPos(tbGAME_SIGNMAP[level], 2)
end

NewWorld(sf_mapid, posx, posy);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(0);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf()
BT_BroadBattleDesc();
BT_ViewBattleStart()
SetFightState(0)
--Msg2MSAll(MISSIONID,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\guozhan\\playerdeath.lua");
bt_JudgePLAddTitle()
end;
------------------------------------------------------------------

-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

------------------------------------------------------

function RecordBTCount_Win(camp)		--在每个人任务变量里记录它此次宋金战场胜负状况
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: 宋金结束! 信息储存错误!!!")
		return
	end
	local OldPlayerIndex = PlayerIndex
	idx = 0
	if (camp == 1) then
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
	else
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
	end
	 PlayerIndex = OldPlayerIndex
end

-- 设置任务状态
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end