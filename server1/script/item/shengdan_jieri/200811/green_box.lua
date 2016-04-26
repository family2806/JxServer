Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_greenbox_item	=
{
	[1]	= {szName="Ê¥µ®À¯Öò",	tbProp={6, 1, 1843, 1, 0, 0},	nRate = 25, nExpiredTime = 20090105},
	[2]	= {szName="Ê¥µ®ÖÓ",	tbProp={6, 1, 1844, 1, 0, 0},	nRate = 25, nExpiredTime = 20090105},
	[3]	= {szName="Ê¥µ®Íà",		tbProp={6, 1, 1845, 1, 0, 0},	nRate = 25, nExpiredTime = 20090105},
	[4]	= {szName="Ê¥µ®Ìû",		tbProp={6, 1, 1846, 1, 0, 0},	nRate = 25,	nExpiredTime = 20090105},
};

function main()
	if (CalcFreeItemCellCount() < 1) then
		Msg2Player("´óÏÀµÄ×°±¸²»×ã¿ÕÎ»");
		return 1;
	end
	tbAwardTemplet:GiveAwardByList(tb_greenbox_item, "2008Ê¥µ®»î¶¯-ÂÌÀñÎïºÐ");
end


function IsPickable( nItemIndex, nPlayerIndex )
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate >= 20090105) then
		return 1;
	end
	
	if (ITEM_GetExpiredTime(nItemIndex) == 0) then
		ITEM_SetExpiredTime(nItemIndex,20090105);
		SyncItem(nItemIndex);
	end
	return 1;
	
end

function PickUp( nItemIndex, nPlayerIndex )
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate >= 20090105) then
		return 0;
	end
	return 1;
end