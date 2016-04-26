
function add462()
		level = random(2,10);
		AddSkillState(462, level, 0, 12 )	--增加玩家血量
		Msg2Player("<#> 您获得<color=0xB5FDD7>在半秒内恢复血量"..(level*500).."<#> 点")	
end

function add464()
		level = random(1,10);
		AddSkillState(464, level, 0, 540 )	--增加玩家血量持续恢复
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 30秒恢复血量，每半秒恢复"..(level*100).."<#> 点")	
end

function add488()
		level = random(10,20);
		AddSkillState(488, level, 0, 540 )	--增加玩家血量上限
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 30 秒血量增加:"..(level*100).."<#> 点")	
end

Tab={add462,add464,add488}

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

