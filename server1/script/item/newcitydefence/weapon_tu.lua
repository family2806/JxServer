
function add483()
		level = random(10,20);
		AddSkillState(483, level, 0, 1080 )	--������������˺�
		Msg2Player("<#> �����<color=0xB5FDD7> ��ɱ�ڹ�һ����������:"..(level*10).."<#> ��")	
end

function add499()
		level = random(10,30);
		AddSkillState(499, level, 0, 1080 )	--������������˺�
		Msg2Player("<#> ����� <color=0xB5FDD7> ��ɱ�⹦һ����������:"..(level*10).."<#> ��")	
end

Tab={add483}

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

