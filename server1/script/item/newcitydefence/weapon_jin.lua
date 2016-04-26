
function add479()
		level = random(10,20);
		AddSkillState(479, level, 0, 1080 )	--增加玩家内普伤害
		Msg2Player("<#> 您获得<color=0xB5FDD7> 1分钟内物理杀伤内功:"..(level*10).."<#> 点")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 0, 1080 )	--增加玩家外普伤害百分比
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 物理杀伤外功一分钟内增加"..(level*10).."<#> %")	
end

Tab={add479,add487}

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

