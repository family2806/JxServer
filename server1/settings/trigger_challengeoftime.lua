-- description	: ���ػ����������RelayÿСʱ����
-- author		: wangbin
-- datetime		: 2005-07-14

Include("\\settings\\trigger_include.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")

function OnTrigger()
	-- DEBUG
	print("trigger_challengeoftime start...");
	-- TODO: �޸��������
	-- ����missions
	close_missions(map_map, MISSION_MATCH, VARV_STATE);
	start_missions(map_map, MISSION_MATCH);
end

OnTrigger();