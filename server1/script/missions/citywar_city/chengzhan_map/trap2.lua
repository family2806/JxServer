--攻城战 中转地图to城战地图（守城方）
--Trap ID：攻城战

function main()
	if (GetCurCamp() ~= 2) then 
		Msg2Player("去不了，要去的话的要到敌军的伏击处. ");
	else
		SetCurCamp(GetCamp())
		SetFightState(0)
		SetLogoutRV(0)
		NewWorld(223, 1613, 3185)
	end;
end;
