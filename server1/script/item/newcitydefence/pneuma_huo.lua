
function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 1分钟减少受伤"..(level*10).."<#> %")	
end

function add468()
		level = random(1,4);
		AddSkillState(468, level, 0, 1080 )
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 1分钟减少变慢时间:"..(level*10).."<#> %")	
end
Tab={add466,add468}

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

