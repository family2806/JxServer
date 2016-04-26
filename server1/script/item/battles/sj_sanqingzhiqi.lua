IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add505()
		CastSkill(505, 1 )	--全体眩晕
		Msg2Player("<#>你使用了一个<color=0xB5FDD7>三清之气，使你周围的敌人全体眩晕。")	
end

function add506()
		CastSkill(506, 1 )	--全体冰冻
		Msg2Player("<#>你使用了一个<color=0xB5FDD7>三清之气，使你周围的敌人全体冰冻。")	
end

function add507()
		CastSkill(507, 1 )	--全体中毒
		Msg2Player("<#>你使用了一个<color=0xB5FDD7>三清之气，使你周围的敌人全体中毒。")	
end

function add508()
		CastSkill(508, 1 )	--全体减速
		Msg2Player("<#>你使用了一个<color=0xB5FDD7>三清之气，使你周围的敌人全体减速。")	
end

Tab={add505,add506,add507,add508}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- 删除物品
	end
end

