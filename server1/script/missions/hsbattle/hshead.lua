--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 2
CS_RevData = 72;

--加入双方阵营时的位置
CS_CampPos1 = {212,	1819, 2992}; 	--黄色
CS_CampPos2 = {212, 1568, 3079}; 	--紫色
FRAME2TIME = 18;
--游戏的最大人数
MAX_MEMBER_COUNT = 200;
MS_STATE = 1;
MS_TONG1ID = 10;--两个帮会的帮会ID
MS_TONG2ID = 11;

MS_SIGN_MONEY = 5000000; --报名费
MS_WIN_MONEY =  8000000; -- 每次胜利时，获得的收入
WIN_TONGEXP = 12000;
LOSE_TONGEXP = 14000;

MS_TOTALPK = 250;--记录玩家打死其它玩家的总次数
MS_TOTALKO = 251;--记录玩家在PK战役中被打死的总次数

MS_TONG1VALUE = 13; --记录帮会1的比赛当前的积分
MS_TONG2VALUE = 14;

PKWINBONUS = 3;
LOSEBONUS = 1;

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 60 * 60  * FRAME2TIME; -- 交战总时间为1Hour
GO_TIME =  600 * FRAME2TIME  / TIMER_1; -- 报名时间为10小时

MS_NEWSVALUE = 9; --任务中存放新闻变量的地方
JOINSTATE = 242;
MISSIONID = 7;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

-------------------------------------------------------------------------
--玩家要求离开游戏
function LeaveGame()
--leavetype = 0表示，将位置设在地图的场外区域（非战斗区域）
--leavetype = 1表示，将位置设在另一个地图，即彻底离开战场
	camp = GetCamp();--恢复原始阵营
	SetRevPos(CS_RevId, CS_RevData)
	SetFightState(0)
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	
	SetCurCamp(camp);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	NewWorld(GetLeavePos());
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
	--在第二Mission内加当前玩家
	
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID,Camp) >= MAX_MEMBER_COUNT) then
		Say("本轮人数已够，不能加入了!",0)
		return
	end;
	
	AddMSPlayer(MISSIONID, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);
	
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
	SetDeathScript("\\script\\missions\\hsbattle\\hsbattledeath.lua");
	
	--设置下次死亡的重生点
	if (Camp == 1) then
		SetTempRevPos(GetTask(300), GetTask(301) * 32, GetTask(302)* 32);
		str = GetName().."<#> 已进入"..GetMissionS(1).."<#> 1 边，目前成员人数为"..GetMSPlayerCount(MISSIONID,1);
		NewWorld(CS_CampPos1[1], CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(GetTask(300), GetTask(301) * 32, GetTask(302)* 32);
		str = GetName().."<#> 已进入"..GetMissionS(2).."<#> 1 边，目前成员人数为"..GetMSPlayerCount(MISSIONID,2);
		NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3])
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
--		AddTongExp(GetMissionS(1), WIN_TONGEXP )
		AddTongMoney(GetMissionS(1), MS_WIN_MONEY);
--		SubTongExp(GetMissionS(2), LOSE_TONGEXP)
		MoveTongExp(WIN_TONGEXP, GetMissionS(1), GetMissionS(2))
	else
--		AddTongExp(GetMissionS(2), WIN_TONGEXP )
		AddTongMoney(GetMissionS(2), MS_WIN_MONEY);
--		SubTongExp(GetMissionS(1), LOSE_TONGEXP)
		MoveTongExp(WIN_TONGEXP, GetMissionS(2), GetMissionS(1))
	end;
end;