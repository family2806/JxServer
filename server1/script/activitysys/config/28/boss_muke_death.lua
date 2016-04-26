Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	local tbAward = {
		{szName = "回天再造锦囊", tbProp = {6, 1, 1781 , 1, 0 ,0}, nRate = 100, tbParam = {60}},
	}
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "2011植树节, 客扔下之木", 1)
end
