Include("\\script\\missions\\citywar_city\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);
	if (timestate == 2) then --��ս��
		ReportBattle(V);
	end;
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨʯ�������
	gametime = (floor(GetMSRestTime(MISSIONID,13) / 18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str = format("���� %s ���ڴ��ڼ�������Ľ׶�! ʱ�仹ʣ %d�� %d ��; ���� %d �����Ѿ��ָ�����", GetGameCity(), RestMin, RestSec, MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "���ط�"	;
		else 	
			str = str .. "������";
		end;
	end;

	--2004.11.5�ر���ȫ���͹㲥�Ĺ���
	--if (mod(V, 18) == 0) then 
	--	AddGlobalNews(str)
	--else
		Msg2MSAll(MISSIONID, str)
	--end;
end;
 