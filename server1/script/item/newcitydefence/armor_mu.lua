
function add477()
		level = random(1,7);
		AddSkillState(477, level, 0, 1080 )	--��������׷�
		Msg2Player("<#> �����<color=0xB5FDD7> ��һ�����������׷�"..(level*10).."<#> %")	
end

Tab={add477}

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