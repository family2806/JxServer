--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 20
CS_RevData = 10;

--加入双方阵营时的位置
CampPos1 = {1536 , 3223 }; 	--黄色
CampPos2 = {1563 , 3195 }; 	--紫色
CampPos0 = {1633 , 3292 }; --进入赛场时的坐标

FRAME2TIME = 18;
--游戏的最大人数
MAX_MEMBER_COUNT = 16;
MS_STATE = 1;
MS_TONG1ID = 10;--两个帮会的帮会ID
MS_TONG2ID = 11;

WIN_TONGEXP = 1200;
LOSE_TONGEXP = 1400;

MS_TOTALPK = 250;--记录玩家打死其它玩家的总次数
MS_TOTALKO = 251;--记录玩家在PK战役中被打死的总次数

MS_TONG1VALUE = 13; --记录帮会1的比赛当前的积分
MS_TONG2VALUE = 14;
MS_ARENAID = 15;

PKWINBONUS = 3;
LOSEBONUS = 1;

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 25 * 60  * FRAME2TIME; -- 交战总时间为1Hour
GO_TIME =  480 * FRAME2TIME  / TIMER_1; -- 报名时间为10

MS_NEWSVALUE = 9; --任务中存放新闻变量的地方
JOINSTATE = 242;
MISSIONID = 5;
WORLDIDXBEGIN = 213;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

-------------------------------------------------------------------------
--玩家要求离开游戏
function LeaveGame()
	camp = GetCamp();--恢复原始阵营
	SetRevPos(CS_RevId, CS_RevData)
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetFightState(0);
	
	SetCurCamp(camp);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	NewWorld(GetLeavePos())
end;

function GameOver()
	PTab = {};
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		LeaveGame()
	end;
	PlayerIndex = OldPlayer;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	SetFightState(0)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, Camp) >= MAX_MEMBER_COUNT) then
		Say("这方现在人数已满，不能加入!",0)
		return
	end;
	
	AddMSPlayer(MISSIONID, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--设置与帮会有关的变量，不允许在战场中改变某个帮会阵营的操作
	SetTaskTemp(200, 1);
	
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	
	--无死亡惩罚
	SetPunish(0);
	
	--关闭组队功能
	SetCreateTeam(0);
	
	--打开PK开关
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--设置重生点，一般是选择进入该区的城市
	SetRevPos(CS_RevId, CS_RevData);
	
	--设置当前玩家的死亡脚本
	SetDeathScript("\\script\\missions\\citywar_arena\\death.lua");
	W,X,Y = GetWorldPos();
	--设置下次死亡的暂时重生点
	if (Camp == 1) then
		SetTempRevPos(GetLeavePos());
		str = GetName().."<#>已进入"..GetMissionS(1).."<#> 1方，现在成员数是"..GetMSPlayerCount(MISSIONID,1);
		SetPos(CampPos1[1], CampPos1[2])
	elseif (Camp == 2) then
		SetTempRevPos(GetLeavePos());
		str = GetName().."<#>已进入"..GetMissionS(2).."<#> 1方，现在成员数是"..GetMSPlayerCount(MISSIONID,2);
		SetPos(CampPos2[1], CampPos2[2])
	else 
		return
	end;
		
	Msg2MSAll(MISSIONID, str);
end;


-------------------------------------------------------------------------
-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
--胜利方获得1800万金钱，获得12000帮会经验；失败方减少14000帮会经验
function WinBonus(camp)
	if (camp == 1) then
		NotifyArenaResult(GetMissionV(MS_ARENAID), 1); --通知第一方胜利了
		AddTongExp(GetMissionS(1), WIN_TONGEXP )
	--	SubTongExp(GetMissionS(2), LOSE_TONGEXP)
	else
		NotifyArenaResult(GetMissionV(MS_ARENAID), 0); --通知第二方胜利了
		AddTongExp(GetMissionS(2), WIN_TONGEXP )
	--	SubTongExp(GetMissionS(1), LOSE_TONGEXP)
	end;
end;