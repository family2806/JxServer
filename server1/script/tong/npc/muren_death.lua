EXP_XIULIANMUREN = 1000000
tbMuRenExp = {
[5]=5,
[6]=6.05,
[7]=7.1,
[8]=8.15,
[9]=9.2,
[10]=10.3
}

function OnDeath( nNpcIndex )
	local nKeyNpcH = GetNpcParam(nNpcIndex, 3)
	local nKeyNpcL = GetNpcParam(nNpcIndex, 4)
	local nKeyNpc = nKeyNpcH * 100000 + nKeyNpcL
	if (PlayerIndex <= 0) then
		return
	end
	local nKeyPlayer = String2Id(GetName())
	if (nKeyNpc ~= nKeyPlayer) then
		return
	end
	local nWorkLevel = GetNpcParam(nNpcIndex, 2)
	if (nWorkLevel >= 5 and nWorkLevel <= 10) then
		local nExp = EXP_XIULIANMUREN * tbMuRenExp[nWorkLevel]
		AddOwnExp(nExp)
	end
end