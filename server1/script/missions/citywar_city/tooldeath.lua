Include("\\script\\missions\\citywar_city\\head.lua");

function OnDeath(DeathIndex)
	WriteLog(GetLoop().."ʲô���߱�����"..DeathIndex)
	for i  = 1, g_nMaxTscPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_TSCBEGIN + i  - 1		)) then
			SetMissionV(MS_TSCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "�����þ߾����������ѱ��سǷ��ƻ�. ");
			WriteLog("�����þ߾����������ѱ��سǷ��ƻ�")
			return
		end;
	end;
	
	for i  = 1, g_nMaxGccPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_GCCBEGIN + i  - 1		)) then
			SetMissionV(MS_GCCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "�����þ߾����������ѱ��سǷ��ƻ�. ");
			WriteLog("�����þ������峵�ѱ��سǷ��ƻ�. ");
			return
		end;
	end;
	
	for i  = 1, g_nMaxToolCount do 
		if (DeathIndex == GetMissionV(MS_TOOLBEGIN + i - 1 )) then
		SetMissionV(MS_TOOLBEGIN + i - 1, 0)
		Msg2MSAll(MISSIONID, "һ������ʿ��Ӣ��������. ");
		WriteLog("һ���س�ʿ��Ӣ��������. ")
		return
		end;
	end;
end;
