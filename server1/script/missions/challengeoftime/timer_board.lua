-- description	: ͨ�涨ʱ����ÿ���Ӵ���һ��
-- author		: wangbin
-- datetime		: 2005-06-07

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnTimer()
	if (GetMSPlayerCount(MISSION_MATCH) ~= 0) then
		local time = GetMissionV(VARV_BOARD_TIMER) + INTERVAL_BOARD * 60;
		local batch = GetMissionV(VARV_NPC_BATCH);
		local count = GetMissionV(VARV_NPC_COUNT);
		SetMissionV(VARV_BOARD_TIMER, time);
		
		local msg = "<#> '��սʱ��'�����ȥ��" .. floor(time / 60) 
			.. "����, ������"
			.. batch
			.. "��, ����"
			.. count
			.. "С��.";
		Msg2MSAll(MISSION_MATCH, msg);
	end
end

