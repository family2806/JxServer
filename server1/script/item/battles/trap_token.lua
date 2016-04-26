Include( "\\script\\item\\checkmapid.lua" )
IncludeLib("SETTING")
SJ_TRAPITEM_COUNT = 50
function EatMedicine(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx,1)) + 1
	local s_name = GetItemName(nItemIdx)
	local n_curtime = GetGameTime();		--��
	local n_lasttime = GetTaskTemp(113);
	
	if (ST_IsRideHorse() == 1) then
		Msg2Player("������ʹ�ø���Ʒ!")
		return -1
	end;
	
	if (n_curtime <= n_lasttime) then
		Msg2Player("1�����ܼ���ʹ��!")
		return -1
	end;
	
	if(detail == 393) then --������
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 343,7);	
			Msg2Player("��ʹ����һ��������");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 343,9);	
			Msg2Player("��ʹ����һ��������");
		else
			CastSkill( 343,14);	
			Msg2Player("��ʹ����һ��������");
		end
	end
	
	if(detail == 394) then --������
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 303,5);	
			Msg2Player("��ʹ����һ��������");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 303,8);	
			Msg2Player("��ʹ����һ��������");
		else
			CastSkill( 303,12);	
			Msg2Player("��ʹ����һ��������");
		end
	end	

	if(detail == 395) then --������
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill(345 ,7);	
			Msg2Player("��ʹ����һ��������");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill(345 ,9);	
			Msg2Player("��ʹ����һ��������");
		else
			CastSkill( 345,14);	
			Msg2Player("��ʹ����һ��������");
		end
	end
	
	if(detail == 396) then --�ػ���
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 347,7);	
			Msg2Player("��ʹ����һ���ػ���");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 347,9);	
			Msg2Player("��ʹ����һ���ػ���");
		else
			CastSkill( 347,14);	
			Msg2Player("��ʹ����һ���ػ���");
		end
	end
	
	if(detail == 397) then --�׻���
		if ( GetLevel() >= 40 and GetLevel() <= 79) then
			CastSkill( 349,7);	
			Msg2Player("��ʹ����һ���׻���");
		elseif ( GetLevel() >= 80 and GetLevel() <= 119) then
			CastSkill( 349,9);	
			Msg2Player("��ʹ����һ���׻���");
		else
			CastSkill( 349,14);	
			Msg2Player("��ʹ����һ���׻���");
		end
	end		
	
	SetTaskTemp(113, GetGameTime());	--��������ʹ�õ�ʱ��
	
	if ((n_param) >= SJ_TRAPITEM_COUNT) then
		RemoveItemByIndex(nItemIdx)
		Msg2Player("<#> "..s_name.."<#> ��ʹ��"..SJ_TRAPITEM_COUNT.."<#> �Σ�������ʹ����!")
	else
		SetSpecItemParam(nItemIdx,1,n_param)
		SyncItem(nItemIdx)
		Msg2Player("<#> "..s_name.."<#> ������ʹ��"..(SJ_TRAPITEM_COUNT - n_param).."<#> ��")
	end
	return -1
end

function GetDesc( nItemIdx )
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItemIdx, 1 ))
	szDesc = szDesc..format("\n����ʹ��<color=yellow>%d<color>��", (SJ_TRAPITEM_COUNT - n_param));
	return szDesc;
end

