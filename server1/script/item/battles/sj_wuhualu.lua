IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add471()
		level = random(2,10);
		AddSkillState(471, level, 0, 12 )	--�������Ѫ��������
		Msg2Player("<#>������<color=0xB5FDD7>���������Ѫ���ظ�"..(level*500).."<#>��ͳ�������������ظ�"..(level*500).."<#>��")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 0, 540 )	--�������Ѫ�������������ָ�
		Msg2Player("<#>������<color=0xB5FDD7>����30���Ѫ���ظ���ÿ����ظ�"..(level*100).."<#>��ͳ���30��������ظ���ÿ����ظ�"..(level*100).."<#>��")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level, 0, 540 )	--�������Ѫ������������
		Msg2Player("<#>������<color=0xB5FDD7>����30���Ѫ���������ӣ�"..(level*100).."<#>��ͳ���30��������������ӣ�"..(level*100).."<#>��")	
end

Tab={add471,add472,add490}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- ɾ����Ʒ
	end
end

