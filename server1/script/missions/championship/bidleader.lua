Include("\\script\\missions\\championship\\head.lua")
LINAN = 176
function CallBidLeader()
	if (SubWorldID2Idx(LINAN) < 0) then
		return
	end
	local deadline = tonumber(date("%y%m%d%H"))
	if (deadline >= CP_END_BID_DATE) then
		OnCreateBidLeader()
	end
end
function OnCreateBidLeader()
	biwu_loadfile(BID_LEADER)
	leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name ~= "" ) then
		return
	end
	
	RoleName, Data = Ladder_GetLadderInfo(10130, 1);
	if(Data > 0) then
		biwu_setdata(BID_LEADER, "Leader_Name", "Name", RoleName);
		biwu_save(BID_LEADER);
		WriteLog(date("%Y-%m-%d-%H:%M")..", ��� ["..RoleName.."]�ɹ���ȡ��Ϊ����������쵼.")
		AddGlobalCountNews("ף�����"..RoleName.."�ɹ���ȡ��Ϊ����������쵼", 3)
	end
end