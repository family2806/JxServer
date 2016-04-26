MONEY_CREATECHATROOM = 50000

function Checkup()
	if (GetCash() < MONEY_CREATECHATROOM) then
		Msg2Player("<#>背包中金额不足 <color=yellow>" .. MONEY_CREATECHATROOM.." 两！<color>")
		return 0
	end
	return 1
end

function Consume()
	return Pay(MONEY_CREATECHATROOM)
end
