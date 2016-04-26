
function add463()
		level = random(2,10);
		AddSkillState(463, level, 0, 12 )	--增加玩家内力
		Msg2Player("<#> 您获得<color=0xB5FDD7> 在半秒内恢复内力"..(level*500).."<#> 点")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 0, 540 )	--增加玩家内力持续回复
		Msg2Player("<#> 您获得 <color=0xB5FDD7> 30秒恢复内力，每半秒恢复"..(level*100).."<#> 点")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 0, 540 )	--增加玩家内力上限
		Msg2Player("<#> 您获得<color=0xB5FDD7> 30 秒内力增加:"..(level*100).."<#> 点")	
end

Tab={add463,add465,add489}

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

