Include("\\script\\missions\\citywar_city\\head.lua");

function OnDeath(DeathIndex)
	WriteLog(GetLoop().."什么工具被损坏了"..DeathIndex)
	for i  = 1, g_nMaxTscPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_TSCBEGIN + i  - 1		)) then
			SetMissionV(MS_TSCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "攻城用具精炼宝箱烈已被守城方破坏. ");
			WriteLog("攻城用具精炼宝箱烈已被守城方破坏")
			return
		end;
	end;
	
	for i  = 1, g_nMaxGccPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_GCCBEGIN + i  - 1		)) then
			SetMissionV(MS_GCCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "攻城用具精炼宝箱烈已被守城方破坏. ");
			WriteLog("攻城用具孽龙冲车已被守城方破坏. ");
			return
		end;
	end;
	
	for i  = 1, g_nMaxToolCount do 
		if (DeathIndex == GetMissionV(MS_TOOLBEGIN + i - 1 )) then
		SetMissionV(MS_TOOLBEGIN + i - 1, 0)
		Msg2MSAll(MISSIONID, "一名攻城士兵英勇牺牲了. ");
		WriteLog("一名守城士兵英勇牺牲了. ")
		return
		end;
	end;
end;
