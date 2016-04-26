IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add480()
		level = random(1,5);
		AddSkillState(480, level, 0, 1080 )	--增加玩家内毒伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的内功系毒攻伤害：增加"..(level*10).."<#>点")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 0, 1080 )	--增加玩家外毒伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的外功系毒攻伤害：增加"..(level*10).."<#>点")	
end

Tab={add480,add485}

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

