IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add480()
		level = random(1,5);
		AddSkillState(480, level, 0, 1080 )	--��������ڶ��˺�
		Msg2Player("<#>������<color=0xB5FDD7>1���ӵ��ڹ�ϵ�����˺�������"..(level*10).."<#>��")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 0, 1080 )	--��������ⶾ�˺�
		Msg2Player("<#>������<color=0xB5FDD7>1���ӵ��⹦ϵ�����˺�������"..(level*10).."<#>��")	
end

Tab={add480,add485}

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

