Include("\\script\\missions\\citywar_city\\head.lua");

function OnTimer()
	WriteLog(GetLoop().."��ս��ʱ����. ");
	timestate = GetMissionV(MS_STATE);
	str = format("%s����ʱ�����!!����%d Ū���Ѿ��ָ�����", GetGameCity(), MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "���ط�"	;
		else 	
			str = str .. "������";
		end;
	end;
	
	if (timestate == 2) then --��ս��
		nCount = CheckWin();
		if (nCount > MS_SYMBOLCOUNT / 2) then 
			str = format("���ս����� %s: %s ȡ����ȫʤ��! �õ�ͳ��Ȩ%s?",str,GetGamerName(2),GetGameCity());
			AddGlobalNews(str);
			GameWin(2)
			return
		else
			str = format("���շ��ط� %s: %s ��ȫʤ��! ����ά��ͳ��%s?",str,GetGamerName(2),GetGameCity());
			AddGlobalNews(str);
			GameWin(1)
			return
		end;
	end;

	CloseMission(MISSIONID);
end;
