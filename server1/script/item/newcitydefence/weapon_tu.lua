
function add483()
		level = random(10,20);
		AddSkillState(483, level, 0, 1080 )	--增加玩家内雷伤害
		Msg2Player("<#> 您获得<color=0xB5FDD7> 雷杀内功一分钟内增加:"..(level*10).."<#> 点")	
end

function add499()
		level = random(10,30);
		AddSkillState(499, level, 0, 1080 )	--增加玩家外雷伤害
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 雷杀外功一分钟内增加:"..(level*10).."<#> 点")	
end

Tab={add483}

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

