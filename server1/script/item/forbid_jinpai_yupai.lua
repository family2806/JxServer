Include("\\script\\battles\\battlehead.lua");

tbForbidMap =
{
	--seven city
	926,
	927,
	928,
	929,
	930,
	931,
	932,
	
	336,	--风陵渡
	341,	--漠北草原
	337,	--码头 1
	338,	--码头 2
	339,	--码头 3
	319,	--林游关
	333,	--华山派
	37,	--汴京
	44,	--宋金战场
}

function ForbidMap()
	nSubWorldID = SubWorldIdx2ID();
	W,X,Y = GetWorldPos();

	local nMapId = W;
	
	for i = 1, getn(tbBATTLEMAP) do --map 宋金
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("您现在不能使用物品");
			return 1;
		end
	end	
	
	for i = 1, getn(tbForbidMap) do 
		if (nSubWorldID == tbForbidMap[i]) then
			Msg2Player("对不起！您现在在特别区域，不能使用物品!");
			return 1
		end
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then --map 宋金
		Msg2Player("对不起！您现在在特别区域，不能使用物品!");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then --风陵渡
		Msg2Player("对不起！您现在在特别区域，不能使用物品!");
		return 1
	end
	
	return 0
	
end