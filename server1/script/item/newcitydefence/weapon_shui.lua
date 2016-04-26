
function add481()
		level = random(10,20);
		AddSkillState(481, level, 0, 1080 )	--增加玩家内冰伤害
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 冰杀内功1分钟内增加:"..(level*10).."<#> 点")	
end

function add486()
		level = random(1,10);
		AddSkillState(486, level, 0, 1080 )	--增加玩家外冰伤害
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 冰杀外功一分钟内增加:"..(level*10).."<#> 点")	
end

Tab={add481,add486}

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

