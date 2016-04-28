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
	
	336,	--·çÁê¶É®é
	341,	--Ä®±±²ÝÔ­
	337,	--ÂëÍ· 1
	338,	--ÂëÍ· 2
	339,	--ÂëÍ· 3
	319,	--ÁÖÓÎ¹Ø
	333,	--»ªÉ½ÅÉ
	37,	--ãê¾©
	44,	--ËÎ½ðÕ½³¡
}

function ForbidMap()
	nSubWorldID = SubWorldIdx2ID();
	W,X,Y = GetWorldPos();

	local nMapId = W;
	
	for i = 1, getn(tbBATTLEMAP) do --map ËÎ½ð
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end	
	
	for i = 1, getn(tbForbidMap) do 
		if (nSubWorldID == tbForbidMap[i]) then
			Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dông vËt phÈm!");
			return 1
		end
	end
	
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then --map ËÎ½ð
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dông vËt phÈm!");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then --·çÁê¶É
		Msg2Player("Xin lçi! B¹n hiÖn ë khu vùc ®Æc biÖt, kh«ng thÓ sö dông vËt phÈm!");
		return 1
	end
	
	return 0
	
end