
function add482()
		level = random(10,20);
		AddSkillState(482, level, 0, 1080 )	--��������ڻ��˺�
		Msg2Player("<#> �����<color=0xB5FDD7> 1�����ڻ�ɱ�ڹ�����:"..(level*10).."<#>��")	
end

function add498()
		level = random(10,30);
		AddSkillState(498, level, 0, 1080 )	--�����������˺�
		Msg2Player("<#> �����<color=0xB5FDD7> 1�����ڻ�ɱ�⹦����:"..(level*10).."<#>��")	
end

Tab={add482}

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


