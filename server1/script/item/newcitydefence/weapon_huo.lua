
function add482()
		level = random(10,20);
		AddSkillState(482, level, 0, 1080 )	--增加玩家内火伤害
		Msg2Player("<#> 您获得<color=0xB5FDD7> 1分钟内火杀内功增加:"..(level*10).."<#>点")	
end

function add498()
		level = random(10,30);
		AddSkillState(498, level, 0, 1080 )	--增加玩家外火伤害
		Msg2Player("<#> 您获得<color=0xB5FDD7> 1分钟内火杀外功增加:"..(level*10).."<#>点")	
end

Tab={add482}

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


