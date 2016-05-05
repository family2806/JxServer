-- description	: 任务触发器，由Relay触发
-- author		: wangbin
-- datetime		: 2005-06-06

-- 打开地图对应的mission
function start_missions(map, mission)
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			OpenMission(mission);
		end
	end
end

-- 关闭地图对应的mission
function close_missions(map, mission, status)
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			if (GetMissionV(status) ~= 0) then
				CloseMission(mission);
			end
		end
	end
end
