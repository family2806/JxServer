Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function OnTimer()
	local nNewsValue = GetMissionV(MS_SF_PREPARENEWSVALUE) + 1;
	SetMissionV(MS_SF_PREPARENEWSVALUE, nNewsValue);
	
	local nRemain = 5 - floor(nNewsValue / 2);
	if (10 == nNewsValue) then --5分钟，让玩家进场
		local OldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2]);
		OpenMission(SF_MISSIONID)
		SetGlbValue(GLB_SF_PHASE, 2); --禁止再进来报名
		gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
		if (players_entrance() == 0) then
			SubWorld = SubWorldID2Idx(SF_MAPID[2]);
			CloseMission(SF_MISSIONID);
		end;
		SubWorld = SubWorldID2Idx(SF_MAPID[1]);
		CloseMission(SF_PREPAREMISSIONID);
		SubWorld = OldSubWorld;
		return
	elseif (0 == mod(nNewsValue, 2)) then
		if (nRemain > 0) then
			Msg2MSAll(SF_PREPAREMISSIONID, format("活动将开始，在%d 分钟后!",nRemain));
		end;
	elseif (9 == nNewsValue) then
        Msg2MSAll(SF_PREPAREMISSIONID, "只有30秒活动将开始!");
	end;
end;

--一下函数只在这个文件用到所以，不写到head里
function players_entrance() -- 随机让玩家进入到场地；
	local tabPlayerIdx = {};
	local pidx = 0;
	local idx = 0;
	local i;
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SF_MAPID[1]);

	for i = 1, 500 do
		idx, pidx = GetNextPlayer(SF_PREPAREMISSIONID, idx, 0);
		if (pidx > 0) then
			tinsert(tabPlayerIdx, pidx);
		end;
		
		if (idx == 0) then
			break;
		end;
	end;
	SubWorld = OldSubWorld;
	if (getn(tabPlayerIdx) < 5) then
		cancelgame(SF_MAPID[1], SF_PREPAREMISSIONID);
		return 0;
	end;
	--进行混乱
	local tabSubTeam = chaos(tabPlayerIdx, SF_MAXPLAYERCOUNT);
	local nBeginMap = random(1, SF_SMALLMAPCOUNT);
	SetMissionV(MS_BEGINGMAPID, nBeginMap);
	SetMissionV(MS_SF_GAMECOUNT, getn(tabSubTeam));
	
--tabParam = {准备场ID, {需要的贡献度, 坐标文件}, {设置为零的任务变量...}, {group值, 开始地图map, MissionID, 活动所在map}}
	local tabParam = {};
	for i = 1, getn(tabSubTeam) do
		local nGroup = i;
		local nMap = nBeginMap + i - 1;
		nMap = mod(nMap, SF_SMALLMAPCOUNT) + 1;
		tabParam = {SF_MAPID[1], {TONGGXD[2][1], [[\settings\maps\springfestival2006\player.txt]]}, {SF_COUNT_ONETIME, SF_TK_RANK, TK_ATTACKED_TIMES, TK_ATTACKED_INTERVER}, {nGroup, nMap, SF_MISSIONID, SF_MAPID[2]}};
		gogamemap(tabSubTeam[i], tabParam);
	end;
	return 1;
end;
