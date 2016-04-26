-- սʤ���ű� by bel at 20090408 10��24

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

local tb_zhanshengbao_award	=
{
	{szName="�װ�",	tbProp={6, 1, 2010, 1, 0, 0},	nRate = 35, nExpiredTime = jf0904_item_expiredtime},
	{szName="����ˮ",	tbProp={6, 1, 2011, 1, 0, 0},	nRate = 50, nExpiredTime = jf0904_item_expiredtime},
	{szName="����",		tbProp={6, 1, 2012, 1, 0, 0},	nRate = 15, nExpiredTime = jf0904_item_expiredtime},
};

function main()
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("װ�������λ����������1����λ",0);
		return 1;
	end
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_item_expiredtime) then
		Msg2Player("����Ʒ�ѹ���.");
		return 0;
	end
	
	tbAwardTemplet:GiveAwardByList(%tb_zhanshengbao_award, "սʤ�ش�");
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
