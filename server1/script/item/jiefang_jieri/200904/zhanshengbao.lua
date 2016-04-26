-- 战胜包脚本 by bel at 20090408 10：24

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

local tb_zhanshengbao_award	=
{
	{szName="米包",	tbProp={6, 1, 2010, 1, 0, 0},	nRate = 35, nExpiredTime = jf0904_item_expiredtime},
	{szName="纯净水",	tbProp={6, 1, 2011, 1, 0, 0},	nRate = 50, nExpiredTime = jf0904_item_expiredtime},
	{szName="酒糟",		tbProp={6, 1, 2012, 1, 0, 0},	nRate = 15, nExpiredTime = jf0904_item_expiredtime},
};

function main()
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("装备不足空位，最少留下1个空位",0);
		return 1;
	end
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_item_expiredtime) then
		Msg2Player("该物品已过期.");
		return 0;
	end
	
	tbAwardTemplet:GiveAwardByList(%tb_zhanshengbao_award, "战胜贺袋");
end

function IsPickable(nItemIndex, nPlayerIndex)
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (ndate >= jf0904_item_expiredtime) then
		return 
	end
	
	ITEM_SetExpiredTime(nItemIndex, jf0904_item_expiredtime);
	SyncItem(nItemIndex);
	return 1;
end
