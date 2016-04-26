------------------------------------------------------------------------------
--梦境山洞洞中的玩家阵营临时变为红名，可以自由PK，在此处PK没有死亡惩罚。
--但山洞只能容纳最多20人，洞中达到20人以上时不能再传送其他人进入（只出不进）。
--玩家认为自己洗点结果满意时，通过与梦境内的叛僧对话离开梦境。
--离开时还原重生点设置以及其它相关状态。洗点完成，回到桃花源。			
--1、组队进入
-------------------------------------------------------------------------------
Include("\\script\\missions\\clearskill\\head.lua")

function TeamEnterHole(nTrapId)
	
	if (IsCaptain() == 0) then
		Say("想要进入这个试炼区你得组队！只有组长才可以带领自己的队伍进入!", 0);
		return 0
	end;

	--队长进洞前进行合法性检测
	-- 非法状态
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("非法进入洗髓洞. ");
		Say("GM: <color=red>你不能进入洗髓洞,已被系统记录，请找服务人员整理一下! <color> ", 0);
		return 0
	end

	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT or Size < 2) then
		Say("队伍中应有2到8人!" , 0);
		return 0
	end;
	
	--找空闲的地图
	--N个地图，每个地图开启一个Mission
	--队伍进入地图后，Mission自动开启，并且SetMissionV(1,1)	
	--判断地图是否空闲就是看这个MissionV(1)是否为0
	--Mission结束时，关闭Mission 设MissionV(1)为0，并清空在内的所有玩家
	--Mission开启时要添加一个对话Npc用于玩家手动设置临时阵营
	
	W,X,Y = GetWorldPos()
	nCityIndex = CSP_GetCityIndexByClearMap(W);
	if (nCityIndex <= 0 ) then
		return 0
	end;
	
	nFreeMap = CSP_GetFreeTestMapID(nCityIndex);
	if (nFreeMap <= 0 ) then 
		Say("不好意思，山洞已满!", 0)
		return 0
	end;
	OldSubWorld = SubWorld;
	OldPlayer = PlayerIndex;
	
	nIdx = SubWorldID2Idx(nFreeMap);
	SubWorld = nIdx;
	OpenMission(MISSIONID)
	RunMission(MISSIONID)
	
	TeamMember = {};
	nCount = 1;
	for i = 1, Size do 
		PIdx = GetTeamMember(i);
		if (PIdx > 0) then 
			TeamMember[nCount] = PIdx;
			nCount = nCount + 1;
		end
	end;
	
	for i = 1, nCount - 1 do 
		PlayerIndex = TeamMember[i];
		tW,tX,tY = GetWorldPos();
		
		--进洞前进行合法性检测
		--检测方法：
		-- 1.此人的状态合法(非法，则可能是用外挂)
		-- 2.此人所对应的CityIndex与队长的一致才可进洞
		if (CSP_CheckValid() == 1 and CSP_GetCityIndexByClearMap(tW) == nCityIndex) then
			JoinHole(nFreeMap, nTrapId)
		end
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
	return 1

end;

function JoinHole(TestMap,nTrapId)
	LeaveTeam()
	
	EnterPosX = CSP_TestHoleTab[nTrapId][1];
	EnterPosY = CSP_TestHoleTab[nTrapId][2];
	NewWorld(TestMap, EnterPosX, EnterPosY)
	
	AddMSPlayer(MISSIONID, 1);
	SetTaskTemp(JOINSTATE, 1);
	
	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	SetTaskTemp(200,1);
	
	--设置战斗状态
	SetFightState(1);
	
	--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
	SetLogoutRV(1);
	
	--无死亡惩罚
	SetDeathScript("\\script\\missions\\clearskill\\playerdeath.lua");--设置死亡脚本为空
	SetPunish(0);
	SetTempRevPos(TestMap, CSP_CAMPMANX, CSP_CAMPMANY);
	ForbidChangePK(0);
	SetPKFlag(1) --打开PK开关
	return 1
end;

--玩家要求离开游戏
function LeaveGame(nTrapId)
	camp = GetCamp();--恢复原始阵营
	SetFightState(1)
	SetPunish(0)--设置PK惩罚
	SetTaskTemp(JOINSTATE, 0);
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(1);
	SetCurCamp(camp);
	SetLogoutRV(1);--设置重生点
	SetDeathScript("");--设置死亡脚本为空
	W,X,Y = GetWorldPos();
	LeaveTeam()

	local CityId = CSP_GetCityIndexByTestMap(W);
	ClearPosX = CSP_ClearHoleTab[nTrapId][1]
	ClearPosY = CSP_ClearHoleTab[nTrapId][2]
	W = CSP_GetClearMapID(CityId);
	SetRevPos(W, CSP_RevieSWID);	
	NewWorld(W, ClearPosX, ClearPosY);
end;
