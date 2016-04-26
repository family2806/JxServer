--挑战赛模式

--1、由GM给各个区的高校负责人.帐号加附加点
--2、高校负责人在比赛报名阶段到赛场，与Npc对话获得道具，分别是正、邪、白、三个阵营不同的门牌。
--3、负责人拿到道具后交给比赛双方的队长。
--4、队长得到道具后，组队自已的5人队伍。然后拿票进场。
--5、进场后，作赛前准备。
--6、比赛结束后。负责人记录比赛成绩，向官方通报。


--保存当前激活的任务属于哪一种任务的MissionV变量index ，因为演武场场地目前用于普通演武场和高校挑战赛中，
--同一时段只能有一个用处。所以用这个变量来区分。
--0表示没有任务任务激活，1表示普通演武场，2表示高校挑战赛

ACTIVEMISSION = 40;

FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 20 * 60  * FRAME2TIME; -- 交战总时间为20分钟
GO_TIME =  300 * FRAME2TIME  / TIMER_1; -- 报名时间为半小时

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_STORETASKID = 240;
MS_S_DEATHCOUNT = 3; --任务中记录1玩家伤亡数量的变量ID
MS_J_DEATHCOUNT = 4; --任务中记录2玩家伤亡数量的变量ID

MS_S_SIGHCOUNT  = 5;--任务中宋方共报名的人数
MS_J_SIGHCOUNT  = 6;--任务中金方共报名的人数
MS_S_JOINED = 7;  --任务中宋方已经进入比赛场地变量ID
MS_J_JOINED = 8;  --任务中金方已经进入比赛场地变量ID

MS_NEWSVALUE = 10; --任务中存放新闻变量的地方
PLAYER_KILLCOUNT = 240; --临时变量,temptask
PLAYER_DEATHCOUNT = 241;
JOINSTATE = 242;
MISSIONID = 4;


-------------------------------------------------------------------------
--玩家要求离开游戏
function LeaveGame(leavetype)
--leavetype = 0表示，将位置设在地图的场外区域（非战斗区域）
--leavetype = 1表示，将位置设在另一个地图，即彻底离开战场
	camp = GetCamp();--恢复原始阵营
	SetRevPos(CS_RevId, CS_RevData)
	SetFightState(1)
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetCreateTeam(1);
	if (leavetype == 0) then 
		SetCurCamp(camp)
		SetFightState(0)
		SetPos(CS_OuterPos[2], CS_OuterPos[3]);
	else
		SetCurCamp(camp);
		SetLogoutRV(0);--设置重生点
		SetCreateTeam(1);
		SetDeathScript("");--设置死亡脚本为空
		NewWorld(GetLeavePos());
	end;
end;

function GameOver()
	idx = 0;
	OldPlayer = PlayerIndex;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	PlayerIndex = pidx;
	 	LeaveGame(0);
	end;
	PlayerIndex = OldPlayer;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	--在第二Mission内加当前玩家
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID,Camp) >= MAX_MEMBER_COUNT) then
		Say("这方现在人已满，不能加入!",0)
		return
	end;
	
	AddMSPlayer(MISSIONID, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);

	--设置战斗状态
	SetFightState(0);
	
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
	--玩家死亡后，重生的地方就设在玩家想退出的地点（在本地图上非战斗区域)
	W,X,Y = GetWorldPos();
	
	--设置当前玩家的死亡脚本
	if (Camp == 1) then 
		SetDeathScript("\\script\\missions\\challenge\\challengedeath.lua");
	elseif (Camp == 2) then 
		SetDeathScript("\\script\\missions\\challenge\\challengedeath1.lua");
	end
	
	
	--设置下次死亡的重生点
	if (Camp == 1) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> 加入黄方，现在人数是"..GetMSPlayerCount(MISSIONID,1);
		SetPos(CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> 加入紫方，现在人数是"..GetMSPlayerCount(MISSIONID,2);
		SetPos(CS_CampPos2[2], CS_CampPos2[3])
	elseif (Camp == 6) then
		SetTempRevPos(GetTask(300), GetTask(301) * 32, GetTask(302)* 32);
		str = GetName().."<#>参加军战，现在人数是"..GetMSPlayerCount(MISSIONID,6);
		SetPos(CS_CampPos0[2], CS_CampPos0[3])
	end;
	
	--向所有参于者发信息
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

--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 80;
CS_RevData = 36;

--离开本次游戏后的位置worldid, x, y,一般就是报名点
--CS_LeavePos = {20, 3546, 6226};

--会场外的位置
CS_OuterPos = {209, 1548, 3297};


--加入双方阵营时的位置
CS_CampPos0 = {209, 1631, 3203};   	--白色
CS_CampPos1 = {209, 1608, 3167}; 	--黄色
CS_CampPos2 = {209, 1674, 3246}; 	--红色


--游戏的每一阵营的最大人数
MAX_MEMBER_COUNT = 5;

MS_CAMP1 = 1; --双方的阵营号
MS_CAMP2 = 2;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;
