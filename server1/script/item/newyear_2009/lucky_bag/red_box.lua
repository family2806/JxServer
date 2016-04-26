Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_redbox_item	=
{
	[1]	= {szName="禄",	tbProp={6, 1, 1913, 1, 0, 0},	nRate = 100, nExpiredTime = newyear0901_item_expiredtime},
};

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_item_expiredtime) then
		Msg2Player("该物品已过期.");
		return 0;
	end
	if (CalcFreeItemCellCount() < 6) then
		Msg2Player("大侠的装备不足空位!");
		return 1;
	end
	tbAwardTemplet:GiveAwardByList(tb_redbox_item, "红宝箱");
end

function IsPickable( nItemIndex, nPlayerIndex )
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_item_expiredtime) then
		return 0;
	end
	if( IsMyItem( nItemIndex ) ) then
		if (ITEM_GetExpiredTime(nItemIndex) == 0) then
			ITEM_SetExpiredTime(nItemIndex,newyear0901_item_expiredtime);
			SyncItem(nItemIndex);
		end
		return 1;
	end
end