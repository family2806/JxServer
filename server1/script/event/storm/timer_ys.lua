Include("\\script\\event\\storm\\head.lua")

function OnTimer()
	if (storm_valid_game(4)) then
		local restcount = TM_GetRestCount(44)
		if (restcount == 0) then
			storm_end(4)
		else
			Msg2Player(storm_gamename(4).."��ս�籩ʣ��ʱ��:"..storm_point2str(STORM_TIMER_YS*restcount).."��")
		end
	else
		TM_StopTimer(STORM_TIMERID_YS)
	end
end
