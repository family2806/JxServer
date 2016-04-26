Include("\\script\\missions\\freshman_match\\head.lua")
--�᳡����
RUN_A_TIME = 5
UP_A_TIME = 20
function main()
	local mm = RUN_A_TIME - GetMissionV( 5 )
	if ( mm < 0 ) then
		local mm = UP_A_TIME - GetMissionV( 5 )
		Say("<#> �᳡���������ֱ�����ʣ"..mm.."<#> ���ӣ��㻹��ʲô����?", 3,"����������������/help_freshmanmatch","�����뿪��!/out_trap","����Ҫ!/OnCancel")
		return
	end
	Say("<#> �᳡���������ֱ�����ʣ"..mm.."<#> ���Ӻ�ʼ������ʲô����?", 3,"����������������/help_freshmanmatch","�����뿪��!/out_trap","����Ҫ!/OnCancel")
end

function out_trap()
	local mm = RUN_A_TIME - GetMissionV(5)
	if(mm < 0) then
		Say("<#> �᳡����: �����뿪��Ҫ�ȵ��� ��ȷ�����뿪��? ", 2, "�����뿪!/sure_trap", "����Ҫ!/OnCancel")
		return
	end
	Say("�᳡����: ����������ʼ, ��ȷ�����뿪��?", 2, "�����뿪!/sure_trap", "����Ҫ!/OnCancel")
end;

function sure_trap()
	if ( nt_gettask( CP_TASKID_ENEMY ) > 0 ) then
		return
	end
	WL_clear_pl_state()
	tryout_mapid = SubWorldIdx2ID( SubWorld )
	Msg2Player( "�����뿪����������������!" )
	DelMSPlayer( MISSIONID_OUTER, PlayerIndex, 1 )
	SetLogoutRV(0);
	NewWorld( tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2] )
end
