MONEY_CREATECHATROOM = 50000

function Checkup()
	if (GetCash() < MONEY_CREATECHATROOM) then
		Msg2Player("<> trong tói ®eo l­ng sè tiÒn ch­a ®ñ <color=yellow>" .. MONEY_CREATECHATROOM.." hai <color>")
		return 0
	end
	return 1
end

function Consume()
	return Pay(MONEY_CREATECHATROOM)
end
