
function add481()
		level = random(10,20);
		AddSkillState(481, level, 0, 1080 )	--��������ڱ��˺�
		Msg2Player("<#> ����� <color=0xB5FDD7> ��ɱ�ڹ�1����������:"..(level*10).."<#> ��")	
end

function add486()
		level = random(1,10);
		AddSkillState(486, level, 0, 1080 )	--�����������˺�
		Msg2Player("<#> ����� <color=0xB5FDD7> ��ɱ�⹦һ����������:"..(level*10).."<#> ��")	
end

Tab={add481,add486}

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

