IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add462()
		level = random(2,10);
		AddSkillState(462, level, 0, 12 )	--增加玩家血量
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续半秒的血量回复"..(level*500).."<#>点")	
end

function add464()
		level = random(1,10);
		AddSkillState(464, level, 0, 540 )	--增加玩家血量持续恢复
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续30秒的血量回复，每半秒回复"..(level*100).."<#>点")	
end

function add488()
		level = random(10,20);
		AddSkillState(488, level, 0, 540 )	--增加玩家血量上限
		Msg2Player("<#>你获得了<color=0xB5FDD7>持续30秒的血量上限增加："..(level*100).."<#>点")	
end

Tab={add462,add464,add488}

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

