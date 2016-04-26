Include("\\script\\missions\\championship\\head.lua")
--�᳡����
RUN_A_TIME = 5
UP_A_TIME = 15
function main()
	local mm = RUN_A_TIME - GetMissionV(5)
	if (mm < 0) then
		local mm = UP_A_TIME - GetMissionV(5)
		Say("<#>�᳡����: ��ֱ�������"..mm.."<#>��, �㻹��ʲô������?", 3,"����Ԥѡ������/help_tryout","�����뿪����!/out_trap","����Ҫ!/OnCancel")
		return
	end
	Say("<#>�᳡����: ��ֱ�������"..mm.."<#> �ֽ���ʼ, �㻹��ʲô������?", 3,"����Ԥѡ������/help_tryout","�����뿪����!/out_trap","����Ҫ!/OnCancel")
end

function out_trap()
	local mm = RUN_A_TIME - GetMissionV(5)
	if(mm < 0) then
		Say("<#>�᳡����:�����뿪�Ļ�Ҫ�ȵ���һ������ȷ��Ҫ�뿪��? ", 2, "�����뿪!/sure_trap", "����Ҫ!/OnCancel")
		return
	end
	Say("��ֱ���������ʼ���㻹Ҫ��Ȩ��?", 2,"�����뿪!/sure_trap", "����Ҫ!/OnCancel")
end;

function sure_trap()
	if (nt_gettask(CP_TASKID_ENEMY) > 0) then
		return
	end
	camp = GetCamp();
	SetCurCamp(camp);
	SetLogoutRV(0);
	SetCreateTeam(1);
	SetFightState(0)
	SetPunish(1)
	ForbidChangePK(0);
	SetPKFlag(0)
	tryout_mapid = SubWorldIdx2ID(SubWorld)
	Msg2Player("�����뿪Ԥѡ��")
	DelMSPlayer(18, PlayerIndex, 1)
	NewWorld(tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
end
