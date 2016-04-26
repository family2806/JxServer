
function add471()
		level = random(2,10);
		AddSkillState(471, level, 0, 12 )	--增加玩家血量和内力
		Msg2Player("<#> 您获得<color=0xB5FDD7> 在半秒内恢复活力"..(level*500).."<#> 点以及半秒内恢复内力"..(level*500).."<#> 点")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 0, 540 )	--增加玩家血量和内力持续恢复
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 30 秒恢复活力，每半秒恢复"..(level*100).."<#> 点以及30秒恢复内力，没半秒恢复"..(level*100).."<#> 点")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level, 0, 540 )	--增加玩家血量和内力上限
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 30秒活力增加:"..(level*100).."<#>点以及30秒内力增加:"..(level*100).."<#> 点")	
end

Tab={add471,add472,add490}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		return 0;	-- 删除物品
	end
end

