Include("\\script\\missions\\citywar_city\\head.lua")
Include("\\script\\missions\\citywar_city\\camper.lua");

function InitMission()
	WriteLog(GetLoop()..":比赛开始")
	ClearMapNpc(221);	--清场内npc
	--ClearMapObj(221);--要不要清呢？？
	--ClearMapnpc 就不用DelNPc了吧
	--for i = 1, MS_SYMBOLCOUNT do  DelNpc(StonePos[i].Name);end;
	for i = 1, getn(tb_CW_MEDICINE) do
		SetGlbValue(tb_CW_MEDICINE[i][1], 0);
	end;

	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	
	for i = 1, 5 do 
		SetMissionS(i,"")
	end
	
	
	for i = 1, MS_SYMBOLCOUNT do 
		SetMissionV(MS_SYMBOLBEGIN + i - 1, 1);
	end

	--加载NPC
	NpcId1 = AddNpc(STONENPCID1, STONELEVEL1, SubWorld, StonePos[1].x, StonePos[1].y, 1, GetGamerName(1)..StonePos[1].Name, 1);
	NpcId2 = AddNpc(STONENPCID1, STONELEVEL1, SubWorld, StonePos[2].x, StonePos[2].y, 1, GetGamerName(1)..StonePos[2].Name, 1);
	NpcId3 = AddNpc(STONENPCID1, STONELEVEL1, SubWorld, StonePos[3].x, StonePos[3].y, 1, GetGamerName(1)..StonePos[3].Name, 1);

	WriteLog("增加石柱"..NpcId1);
	WriteLog("增加石柱"..NpcId2);
	WriteLog("增加石柱"..NpcId3);

	SetNpcCurCamp(NpcId1, 1) ;
	SetNpcCurCamp(NpcId2, 1) ;
	SetNpcCurCamp(NpcId3, 1) ;
	
	WriteLog("安装原本故障")
	SetNpcDeathScript(NpcId1, "\\script\\missions\\citywar_city\\symboldeath1.lua");
	SetNpcDeathScript(NpcId2, "\\script\\missions\\citywar_city\\symboldeath2.lua");
	SetNpcDeathScript(NpcId3, "\\script\\missions\\citywar_city\\symboldeath3.lua");
	
	
	DoorId1 = AddNpc(DOORNPCID, DOORLEVEL, SubWorld, DoorPos[1].x, DoorPos[1].y, 1,	DoorPos[1].Name, 1);
	DoorId2 = AddNpc(DOORNPCID, DOORLEVEL, SubWorld, DoorPos[2].x, DoorPos[2].y, 1, DoorPos[2].Name, 1);
	DoorId3 = AddNpc(DOORNPCID, DOORLEVEL, SubWorld, DoorPos[3].x, DoorPos[3].y, 1, DoorPos[3].Name, 1);

	WriteLog("增加城门"..DoorId1);
	WriteLog("增加城门"..DoorId2)
	WriteLog("增加城门"..DoorId3)
	
	SetNpcCurCamp(DoorId1, 1) ;
	SetNpcCurCamp(DoorId2, 1) ;
	SetNpcCurCamp(DoorId3, 1) ;
	
	SetMissionV(MS_DOORBEGIN, DoorId1);
	SetMissionV(MS_DOORBEGIN + 1, DoorId2);
	SetMissionV(MS_DOORBEGIN + 2, DoorId3);
	
	SetNpcDeathScript(DoorId1, "\\script\\missions\\citywar_city\\doordeath.lua");
	SetNpcDeathScript(DoorId2, "\\script\\missions\\citywar_city\\doordeath.lua");
	SetNpcDeathScript(DoorId3, "\\script\\missions\\citywar_city\\doordeath.lua");
	
	--随军药医
	for i = 1, getn(DoctorPos) do
		local nDoctIdx = AddNpc(DOCTORNPCID, 1, SubWorld, DoctorPos[i][1],DoctorPos[i][2], 1, DoctorPos[i][3]);
		SetNpcScript(nDoctIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\yaoshang.lua");
	end;
	--暗道守卫
	local nAndaoIdx = AddNpc(48, 1, SubWorld, 1597 * 32, 3470 * 32, 1, "暗道守卫");
	SetNpcScript(nAndaoIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\andaoshouwei.lua");
	--储物箱
	local nChuwuIdx = AddNpc(625, 1, SubWorld, 1534*32, 3240*32, 1, "储物箱");
	SetNpcScript(nChuwuIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\chuwuxiang.lua");
	nChuwuIdx = AddNpc(625, 1, SubWorld, 1882*32, 3582*32, 1, "储物箱");
	SetNpcScript(nChuwuIdx, "\\script\\missions\\citywar_city\\chengzhan_map\\chuwuxiang.lua");
	--加载NPC
	
	WriteLog("清除障碍");
	for i = 1, getn(ObstaclePos) do 
		CreateObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
	end;

	Tong2,Tong1 = GetCityWarBothSides(GetWarOfCity());
	SetMissionS(1, Tong1);
	SetMissionS(2, Tong2);

	logstr = format("%s: %s城已经打响攻城战! 防守方是： %s %s", date("%m%d-%H:%M"), GetGameCity(), Tong2, Tong1);
	WriteLog(logstr);
	
	--计分牌显示
	bt_setnormaltask2type()		--这个有用
	BT_SetView(PL_TOTALPOINT);--显示与统计总积分
	BT_SetView(PL_KILLPLAYER);--杀玩家数目
	BT_SetView(PL_BEKILLED);--本玩家被杀次数
	BT_SetView(PL_MAXSERIESKILL);--连斩次数
	BT_SetMissionName("攻城战");
	BT_SetGameData(GAME_BATTLEID, MISSIONID);--设置战役的ID，以missionid区别
	ResetBonus()
	--计分牌显示
	
	SetMissionV(MS_KEY, random(100000))
	--打开计时器
	StartMissionTimer(MISSIONID, 12, REPORTTIME);
	StartMissionTimer(MISSIONID, 13, GAMETIME);
	
	SetMissionV(MS_STATE, 1);--允许报名了
end;

function RunMission()
	SetMissionV(MS_STATE, 2)
	str = format("%s 攻城战正式开始!守城方是：%s, 挑战方是：%s. 谁会取得最终胜利?", GetGameCity(), GetGamerName(1), GetGamerName(2));
	AddGlobalNews(str);
end;

function EndMission()

	WriteLog(GetLoop()..date("%m%d-%H:%M")..":CloseMission!");
	for i = 1, MS_SYMBOLCOUNT do  DelNpc(GetMissionS(1) .. StonePos[i].Name);end;
	for i = 1, MS_SYMBOLCOUNT do  DelNpc(GetMissionS(2) .. StonePos[i].Name);end;
	
	
	WriteLog("GameOver")
	GameOver()
	
--	WriteLog("删除所有工具Npc")
--	for i = 1, g_nMaxToolCount do 
--		DelIndex = GetMissionV(MS_TOOLBEGIN + i - 1) ;
--		if (DelIndex > 0) then 
--			DelNpcSafe(DelIndex)
--		end
--	end;
--
--	WriteLog("删除所有GCC")
--	for i = 1, g_nMaxGccPerDoor * g_nDoorCount do 
--		DelIndex = GetMissionV(MS_GCCBEGIN + i - 1) ;
--		if (DelIndex > 0) then  	
--			DelNpcSafe(DelIndex)
--		end;
--	end;
--	
--	WriteLog("删除所有TSC")
--
--	for i = 1, g_nDoorCount * g_nMaxTscPerDoor do 
--		DelIndex = GetMissionV(MS_TSCBEGIN + i - 1)
--		if (DelIndex > 0) then 
--			DelNpcSafe(DelIndex)
--		end;
--	end;
--	
--	WriteLog("删除所有门")
--	for i = 1, g_nDoorCount do 
--		DelIndex = GetMissionV(MS_DOORBEGIN + i - 1)
--		if (DelIndex > 0) then 
--			DelNpcSafe(DelIndex)
--		end;
--	end;

	for i = 1, g_nDoorCount do 
		ClearObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
	end;

	ClearMapNpc(221);
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;

	StopMissionTimer(MISSIONID, 12);
	StopMissionTimer(MISSIONID, 13);
	BT_ClearBattle();
end;


function OnLeave(RoleIndex)
	local oldPlayer = PlayerIndex;
	PlayerIndex = RoleIndex;
	str2 = GetName().."离开战场, ";
	SetFightState(0)
	--SetLogoutRV(0);
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	SetPunish(1)
	DisabledUseTownP(0)
--	Msg2MSAll(MISSIONID, str2);
	SetTaskTemp(200, 0);
	
	--BT_LeaveBattle()
	if (GetCurCamp() == 1) then
		--LeaveChannel(PlayerIndex, GetGameCity().."府守方");
	else
		--LeaveChannel(PlayerIndex, GetGameCity().."府攻方");
	end
	sf_onplayerleave()
	AddSkillState(661,5,0,0) --清除玩家的称号技能数据
	Title_ActiveTitle(0);
	if (GetMissionV(MS_STATE) == 2) then
		BT_UpdateMemberCount();
	end	
	SetCurCamp(GetCamp())
	PlayerIndex = oldPlayer
end;

