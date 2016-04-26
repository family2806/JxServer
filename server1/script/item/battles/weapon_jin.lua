IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add479()
		level = random(10,20);
		AddSkillState(479, level, 0, 1080 )	--增加玩家内普伤害
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的内功系普攻伤害：增加"..(level*10).."<#>点")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 0, 1080 )	--增加玩家外普伤害百分比
		Msg2Player("<#>你获得了<color=0xB5FDD7>1分钟的外功系普攻伤害：增加"..(level*10).."<#>％")	
end

Tab={add479,add487}

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

