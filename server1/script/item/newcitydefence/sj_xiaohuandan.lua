
function add463()
		level = random(2,10);
		AddSkillState(463, level, 0, 12 )	--�����������
		Msg2Player("<#> �����<color=0xB5FDD7> �ڰ����ڻָ�����"..(level*500).."<#> ��")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 0, 540 )	--����������������ظ�
		Msg2Player("<#> ����� <color=0xB5FDD7> 30��ָ�������ÿ����ָ�"..(level*100).."<#> ��")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 0, 540 )	--���������������
		Msg2Player("<#> �����<color=0xB5FDD7> 30 ����������:"..(level*100).."<#> ��")	
end

Tab={add463,add465,add489}

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

