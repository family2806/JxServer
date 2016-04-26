Include("\\script\\lib\\awardtemplet.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if (GetNpcParam(nNpcIndex, 4) == 0 ) then
		GiveItem(nNpcIndex)
	end;
end

function GiveItem(nNpcIndex)
	
	local tbItemList = 
	{
		{szName="一把生锈的刀",tbProp={6, 1, 2592, 1, 0, 0}, nExpiredTime = 30},
		{szName="一把旧枪",tbProp={6, 1, 2593, 1, 0, 0}, nExpiredTime = 30},
		{szName="一把古剑",tbProp={6, 1, 2594, 1, 0, 0}, nExpiredTime = 30},
	}
	
	local nId = random(1, getn(tbItemList))
	tbAwardTemplet:GiveAwardByList(tbItemList[nId] , "从道具箱获得");
	HideNpc(nNpcIndex, 180)
end