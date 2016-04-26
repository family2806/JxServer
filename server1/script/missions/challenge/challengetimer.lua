Include("\\script\\missions\\challenge\\challengehead.lua");

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
		Msg2MSAll(MISSIONID, "ս�۽���");
		StopMissionTimer(MISSIONID, 10);
		StopMissionTimer(MISSIONID, 11);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	if (V == GO_TIME) then
		if (GetMSPlayerCount(MISSIONID,1) == 0 or GetMSPlayerCount(MISSIONID , 2) == 0) then
			Msg2MSAll(MISSIONID, "�����ѽ���������˫����������������Ҫ��ȡ������");
			CloseMission(MISSIONID)
			return
		else
			Msg2MSAll(MSSIONID, "�����ѽ�����������ʽ��ʼ");
			RunMission(MISSIONID);
			return
		end
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "<#> ��ս���ڱ����׶Σ���ս����Ͽ��볡"..RestMin.."<#> �� ";
		str1 = "<#>��ս���ڱ����׶Σ�����ս���뾡���볡��˫��������:"..GetMSPlayerCount(MISSIONID, 1)..","..GetMSPlayerCount(MISSIONID, 2).."<#>.����ʱ�仹��:"..RestMin.."<#> ��"..RestSec.."<#> ��";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨ�������������
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "ս���������Ϸ�ȡ��������ʤ��");
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "ս���������Ʒ�ȡ��������ʤ��");
		CloseMission(MISSIONID);
		return
	end;
		
	s_death = GetMissionV(MS_S_DEATHCOUNT);
	j_death = GetMissionV(MS_J_DEATHCOUNT);
	gametime = (floor(GetMSRestTime(MISSIONID,11)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> ս���׶�. ���������: �Ʒ�:"..s_death.."<#> ��, �Ϸ�:"..j_death.."<#> ��. ʱ�仹ʣ"..RestMin.."<#> �� "..RestSec.."<#> �� ";
	Msg2MSAll(MISSIONID, str1);
end;
 