IncludeLib("RELAYLADDER")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 80;
CS_RevData = 36;

--会场外的位置
BW_COMPETEMAP = {209, 210, 211};

--加入双方阵营时的位置
CS_CampPos = {	{209, 1620, 3202},	--紫色
				{209, 1612, 3187}, 	--绿色
				{209, 1598, 3216}   --观战者的位置白色
			 }; 
CS_CamperPos = {
				{1599, 3202, "张三"},
				{1608, 3211, "李四"},
}
FRAME2TIME = 18;
--游戏的最大人数
MAX_MEMBER_COUNT = 100;
--存储玩家的位置的任务变量
BW_SIGNPOSWORLD = 300;
BW_SIGNPOSX = 301;
BW_SIGNPOSY = 302;
MS_STATE = 1;
MS_MAXMEMBERCOUNT = 2;
CITYID = 6; --城市ID
BW_KEY = 7; -- 0-100000000的随机数
MS_NEWSVALUE = 9; --任务中存放新闻变量的地方
MS_TEAMKEY = {10, 11};

MSS_CAPTAIN = {1, 2};
BW_SMALLTIME_ID = 10; --定时触发器
BW_TOTALTIME_ID = 11;
TIMER_1 = 20 * FRAME2TIME; -- 20秒公布一下战况
TIMER_2 = 12 * 3 * TIMER_1 ; --交战总时间为10+2分钟

GO_TIME = 6; -- 报名时间为2分钟
BW_MISSIONID = 4;

function BW_SetRev()
	if (GetTask(BW_SIGNPOSWORLD) == 80) then
		SetRevPos(CS_RevId, CS_RevData)
	elseif (GetTask(BW_SIGNPOSWORLD) == 78) then 
		SetRevPos(29);--xy
	else
		SetRevPos(6);--cd
	end;
end;

--玩家要求离开游戏
function LeaveGame()
	camp = GetCamp();--恢复原始阵营
	SetFightState(0)
	if (GetCurCamp() == 2) then
		LeaveChannel(PlayerIndex, "甲方多人擂台");
	elseif (GetCurCamp() == 3) then
		LeaveChannel(PlayerIndex, "乙方多人擂台");
	end;
	SetTaskTemp(200,0);
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	RestoreOwnFeature()
	--打开交易摆摊
	DisabledStall(0);	--摆摊
	ForbitTrade(0);	--交易
	SetCurCamp(GetCamp());
	DisabledUseTownP(0)
	ForbidEnmity(0);
	DelMSPlayer(BW_MISSIONID, PlayerIndex);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空

end;

function GameOver()
	PTab = {};
	idx = 0;
	local i;
	local j = 1;
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(BW_MISSIONID, idx, 0);
		
		if (pidx > 0) then
			PTab[j] = pidx;
			j = j + 1;
		end;
		if (idx == 0 ) then 
			break
		end
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i];
		NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
	end;
	PlayerIndex = OldPlayer;
	
end;

function JoinCamp(Camp)
	--在第二Mission内加当前玩家
	LeaveTeam()
	local Camp1;
	if (Camp == 3) then
		Camp1 = 0;
	else
		Camp1 = Camp + 1;
	end
	AddMSPlayer(BW_MISSIONID, Camp);
	SetCurCamp(Camp1)
	bw_state_joined_in(Camp1);

	if (Camp == 1) then
		NewWorld(CS_CampPos[1][1], CS_CampPos[1][2], CS_CampPos[1][3])
		EnterChannel(PlayerIndex, "甲方多人擂台");
	elseif (Camp == 2) then
		NewWorld(CS_CampPos[2][1], CS_CampPos[2][2], CS_CampPos[2][3])
		EnterChannel(PlayerIndex, "乙方多人擂台");
	else 
		NewWorld(CS_CampPos[3][1], CS_CampPos[3][2], CS_CampPos[3][3])
	end;

	str = GetName().."<#> 已进入比赛场."
	Msg2MSAll(BW_MISSIONID, str);
end;

function bw_state_joined_in(Camp)
--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);

	--设置战斗状态
	SetFightState(0);

	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);

	--无死亡惩罚
	SetPunish(0);
	
	ForbidEnmity(1);
	
	--禁止交易摆摊
	DisabledStall(1);	--摆摊
	ForbitTrade(1);	--交易
	
	--关闭组队功能
	SetCreateTeam(0);
	
	--打开PK开关
	if (Camp == 0) then
		SetPKFlag(0)
		ChangeOwnFeature(0, 0, -1, -1, -1, -1, -1)
		Msg2Player("系统: 你处于隐身状态.");
	else
		SetPKFlag(1)
	end;
	ForbidChangePK(1);
	DisabledUseTownP(1)
	
	--设置重生点，一般是选择进入该区的城市
	BW_SetRev()
	
	--设置当前玩家的死亡脚本
	SetDeathScript("\\script\\missions\\bw\\bwdeath.lua");
	
	--设置下次死亡的重生点

	x = GetTask(BW_SIGNPOSWORLD);
	y = GetTask(BW_SIGNPOSX);
	z = GetTask(BW_SIGNPOSY);
	SetTempRevPos(x, y * 32, z * 32);
end;

--得到两个队长的名字
function bw_getcaptains()
	local OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(209);
	local szCaptainName = {};
	if (idx == -1) then
		return szCaptainName;
	end;
	SubWorld = idx;
	szCaptainName[1] = GetMissionS(MSS_CAPTAIN[1]);
	szCaptainName[2] = GetMissionS(MSS_CAPTAIN[2]);
	SubWorld = OldSubWorld;
	return szCaptainName;
end;

function OnShowKey()
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(209);
	if (SubWorld < 0) then
		return
	end;
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();
	if (GetMissionV(MS_MAXMEMBERCOUNT) <= 1) then
		Say("你登记的擂台比赛是单打，不用知道上场比赛的号数，你可以直接去比赛.",0);
		SubWorld = OldSubWorld;
		return
	end
	local key = 0
	if (GetName() == szCaptainName[1]) then
		key = GetMissionV(MS_TEAMKEY[1]);
	end
	
	if (GetName() == szCaptainName[2]) then 
		key = GetMissionV(MS_TEAMKEY[2]);
	end
	if (key == 0) then
		Say("不好意思，你不在这次比赛考号中，我不能说上场比赛的顺序号.",0)
	else
		Say("你的序号是<color=yellow> ["..key.."]<color><#>, 赶快告诉参加比赛的成员，队员只有输入正确的序号才可以进入比赛。谢谢!", 0);
	end
	SubWorld = OldSubWorld;
end

function bw_branchtask_win(nGroupID)	--给胜的一方作上标记
	nOldPlayer = PlayerIndex;
	--胜利的一队；
	local idx = 0;
	local pidx;
	for i = 1, 10 do
		idx , pidx = GetNextPlayer(BW_MISSIONID, idx, nGroupID);
		if (pidx > 0) then
		   	PlayerIndex = pidx;
			branchTask_GainBW1()	--保持让每一个玩家胜利时进行登记；
		end;
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = nOldPlayer;
end;
