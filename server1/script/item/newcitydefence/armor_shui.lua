
function add476()
		level = random(1,7);
		AddSkillState(476, level, 0, 1080 )	--增加玩家火防
		Msg2Player("<#> 您获得<color=0xB5FDD7> 在1分钟内增加火防"..(level*10).."<#> %")	
end

Tab={add476}

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

