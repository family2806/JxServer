--cs竞技场模式
--有人数限制，然后进入后，双方选择队伍阵营。开打，如果未选为白名，旁观者
--记录积分。比赛过程中可以变换阵营。
--不能组队
--比赛无时间限制，这个记录会记录在玩家数据中
--到时间，自动被踢远处。
--如果人数不超过人数上限，则可以在比赛过程中允许其它玩家加入。
--玩家死亡会在其中某个地方重生。
--玩家如果断线则，重生点在外

--保存当前激活的任务属于哪一种任务的MissionV变量index ，因为演武场场地目前用于普通演武场和高校挑战赛中，
--同一时段只能有一个用处。所以用这个变量来区分。
--0表示没有任务任务激活，1表示普通演武场，2表示高校挑战赛

ACTIVEMISSION = 40;	

FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 60 * 60  * FRAME2TIME; -- 交战时间为1小时

MS_STATE = 1; --任务中记录任务状态的变量ID
--该变量指向的状态值0表示战役为打开，1表示战役报名中，2表示战役战斗进行中，3表示战役刚刚结束了

MS_STORETASKID = 240;
MS_S_DEATHCOUNT = 3; --任务中记录1玩家伤亡数量的变量ID
MS_J_DEATHCOUNT = 4; --任务中记录2玩家伤亡数量的变量ID

MS_S_SIGHCOUNT  = 5;--任务中宋方共报名的人数
MS_J_SIGHCOUNT  = 6;--任务中金方共报名的人数

MS_NEWSVALUE = 10; --任务中存放新闻变量的地方
PLAYER_KILLCOUNT = 240; --临时变量,temptask
PLAYER_DEATHCOUNT = 241;
JOINSTATE = 242;

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
	
	if (leavetype == 0) then 
		SetCurCamp(0)
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
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(2,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	PlayerIndex = pidx;
	 	LeaveGame(1);
	end;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	--在第二Mission内加当前玩家
	LeaveTeam()
	if (GetMSPlayerCount(2,Camp) >= MAX_MEMBER_COUNT) then
		Say("这方现已满员, 不能加入!",0)
		return
	end;
	AddMSPlayer(2, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);
	
	--设置战斗状态
	SetFightState(1);
	
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
	SetDeathScript("\\script\\missions\\cs竞技场\\csbattledeath.lua");
	
	--设置下次死亡的重生点
	if (Camp == 1) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> 加入黄方, 现在人数是"..GetMSPlayerCount(2,1);
		SetPos(CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> 加入紫方, 现在人数是"..GetMSPlayerCount(2,2);
		SetPos(CS_CampPos2[2], CS_CampPos2[3])
	elseif (Camp == 4) then
		SetTempRevPos(GetTaskTemp(300), GetTaskTemp(301) * 32, GetTaskTemp(302)* 32);
		str = GetName().."<#> 加入战斗, 现在人数是"..GetMSPlayerCount(2,4);
		SetPos(CS_CampPos4[2], CS_CampPos4[3])
		SetDeathScript("\\script\\missions\\hsbattle\\hsbattledeath.lua");
	end;
	
	--向第2个Mission(也就是演武场)的所有人发信息
	Msg2MSAll(2, str);
	
end;

-------------------------------------------------------------------------
-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
