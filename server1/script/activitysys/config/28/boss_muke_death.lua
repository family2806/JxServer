Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	local tbAward = {
		{szName = "�����������", tbProp = {6, 1, 1781 , 1, 0 ,0}, nRate = 100, tbParam = {60}},
	}
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "2011ֲ����, ������֮ľ", 1)
end
