
function add474()
		level = random(1,7);
		AddSkillState(474, level, 0, 1080 )	--������Ҷ���
		Msg2Player("<#> ����� <color=0xB5FDD7>��1���������Ӷ���"..(level*10).."<#> %")	
end

Tab={add474}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		return 0;	-- ɾ����Ʒ
	end
end

