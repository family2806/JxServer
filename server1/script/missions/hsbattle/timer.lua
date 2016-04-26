Include("\\script\\missions\\hsbattle\\hshead.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);

	if (V == GO_TIME) then
		RunMission(MISSIONID)
		return
	end

	--�����׶�
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --��ս��
		ReportBattle(V);
	elseif (timestate == 3) then  --ս��������
		Msg2MSAll(MISSIONID, "ս������");
		StopMissionTimer(MISSIONID, 14);
		StopMissionTimer(MISSIONID, 15);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	if (V == GO_TIME) then
		Msg2MSAll(MSSIONID, "���������ѹ���������ʽ��ʼ");
		RunMission(MISSIONID);
		return
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "��������ʱ�� <#> ����"..RestMin.."<#> ���ӣ���ս����������������."
		str1 = "��ս��<#> �����ڽ�������״̬��˫����ƽ���������˫������"..GetMSPlayerCount(MISSIONID, 1).."<#>:"..GetMSPlayerCount(MISSIONID, 2).."<#>. ���붷��ʱ�仹ʣ: "..RestMin.."<#> ����"..RestSec.."<#> gi�y ";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨ�������������
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. ��������,"..GetMissionS(2).."<#> �������ʤ��!");
		WinBonus(2)
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. ��������,"..GetMissionS(1).."<#> �������ʤ��!");
		WinBonus(1)
		CloseMission(MISSIONID);
		return
	end;
		
	s_value = GetMissionV(MS_TONG1VALUE);
	j_value = GetMissionV(MS_TONG2VALUE);
	
	gametime = (floor(GetMSRestTime(MISSIONID,15)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> ս���׶Σ�Ŀǰ����Ϊ����:"..s_value.."<#>, �Ϸ�"..j_value.."<#>. ��ʣʱ��"..RestMin.."<#> ����"..RestSec.."<#> ��";
	Msg2MSAll(MISSIONID, str1);
end;
