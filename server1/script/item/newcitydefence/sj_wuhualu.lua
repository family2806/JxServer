
function add471()
		level = random(2,10);
		AddSkillState(471, level, 0, 12 )	--�������Ѫ��������
		Msg2Player("<#> �����<color=0xB5FDD7> �ڰ����ڻָ�����"..(level*500).."<#> ���Լ������ڻָ�����"..(level*500).."<#> ��")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 0, 540 )	--�������Ѫ�������������ָ�
		Msg2Player("<#> ����� <color=0xB5FDD7> 30 ��ָ�������ÿ����ָ�"..(level*100).."<#> ���Լ�30��ָ�������û����ָ�"..(level*100).."<#> ��")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level, 0, 540 )	--�������Ѫ������������
		Msg2Player("<#> ����� <color=0xB5FDD7> 30���������:"..(level*100).."<#>���Լ�30����������:"..(level*100).."<#> ��")	
end

Tab={add471,add472,add490}

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

