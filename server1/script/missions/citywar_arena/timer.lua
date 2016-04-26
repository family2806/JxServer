Include("\\script\\missions\\citywar_arena\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V + 1);

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
		StopMissionTimer(MISSIONID, 16);
		StopMissionTimer(MISSIONID, 17);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	if (V == GO_TIME) then
		Msg2MSAll(MSSIONID, "�����ѹ���������ʽ��ʼ");
		msgstr = format("��� %s ��%s �ѿ�ʼ����: ����˫�������ǣ� %d - %d.", GetMissionS(1), GetMissionS(2), GetMSPlayerCount(MISSIONID, 1), GetMSPlayerCount(MISSIONID, 2));
		WriteLog(msgstr)
		RunMission(MISSIONID);
		return
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "��������ʱ��<#> ���� "..RestMin.."<#> ��, ��ս���������볡."
		str1 = "��ս����<#> �����볡�׶Σ�˫���Ͽ��볡��˫������ "..GetMSPlayerCount(MISSIONID, 1).."<#>:"..GetMSPlayerCount(MISSIONID, 2).."<#>. �볡ʱ�仹��: "..RestMin.."<#> ��"..RestSec.."<#>��";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨ�������������
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>.��������"..GetMissionS(2).."<#> ȡ������ʤ��!");
		WinBonus(2)
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>.��������"..GetMissionS(1).."<#> ȡ������ʤ��!");
		WinBonus(1)
		CloseMission(MISSIONID);
		return
	end;

	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "�����׶�<#>:����˫���������Ʒ�"..GetMSPlayerCount(MISSIONID, 1).."<#>,�Ϸ�"..GetMSPlayerCount(MISSIONID, 2).."<#>. ʣ��ʱ��"..RestMin.."<#>��"..RestSec.."<#>�� ";
	Msg2MSAll(MISSIONID, str1);
end;
