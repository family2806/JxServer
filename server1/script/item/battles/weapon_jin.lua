IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add479()
		level = random(10,20);
		AddSkillState(479, level, 0, 1080 )	--������������˺�
		Msg2Player("<#>������<color=0xB5FDD7>1���ӵ��ڹ�ϵ�չ��˺�������"..(level*10).."<#>��")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 0, 1080 )	--������������˺��ٷֱ�
		Msg2Player("<#>������<color=0xB5FDD7>1���ӵ��⹦ϵ�չ��˺�������"..(level*10).."<#>��")	
end

Tab={add479,add487}

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

