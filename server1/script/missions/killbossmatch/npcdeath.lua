Include("\\script\\missions\\killbossmatch\\class.lua")

Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	tbKillBossMatch:OnKillNpc(nNpcIndex, 0)
	
	local tbItem = {szName="五花玉露丸", tbProp={1, 2, 0, 5, 0, 0}}
	local tbAward = 
	{
		{szName="大将军面具", tbProp={0, 11, 446, 1, 0, 0}, nRate = 2},
		{szName="海龙珠", tbProp={6, 1, 2115, 1, 0, 0}, nRate = 2},
		{szName="龙血丸", tbProp={6, 1, 2117, 1, 0, 0}, nRate = 3},
	}
	
	tbDropTemplet:GiveAwardByList(nNpcIndex, -1, tbItem, "KillBossMatch,npcdrop", 20)
	
	tbDropTemplet:GiveAwardByList(nNpcIndex, -1, tbAward, "KillBossMatch,npcdrop", 1)
end