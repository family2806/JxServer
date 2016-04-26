-- װ��ά��

IncludeLib( "ITEM" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

-- ��ʱ�������ID: 101~110
TTID_ItemIndex 	= 101;
TTID_OrgMaxDur 	= 102;
TTID_CurMaxDur 	= 103;
-- TTID_CurDur 	= 104;
TTID_LostDur 	= 105;
TTID_CheapPrice	= 106;
TTID_CostlyPrice= 107;

-- ����Ƕװ��ά�޷��ñ�
ENCHASABLE_EQUIP_PRICE =
{
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��1λ��10��ħ�����Եķ���ֵ
	{ 100, 220, 360, 520, 700, 900, 1120, 1360, 1620, 1900 },		-- ��1λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��2λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��2λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��3λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��3λ��10��ħ�����Եķ���ֵ
}

-- RPGE_RESTORMAX = 25;
function repair_goldequip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- ���ǻƽ�װ�������ڽű��д���(�ɳ�����)
	if (nQuality ~= 1 and nQuality ~= 4) then
		return -1;
	end
	
	szAboutMsg = get_repair_qualityname(nQuality).."װ������˵��.../RePairGE_About";

	if (nQuality == 4 and GetPlatinaLevel(nItemIndex) >= 6) then
		Say("�������ڱ��겻����+6���ϰ׽�װ��", 0);
		return 1
	end
	-- ����ά��
	nFixDur = nCurMaxDur - nCurDur;
	if (nFixDur <= 0) and (nCurMaxDur == nOrgMaxDur) then
		Say("��������"..get_repair_qualityname(nQuality).."װ����ʱ�����������˽��������"..get_repair_qualityname(nQuality).."װ����", 2, szAboutMsg, "�Ѿ�������/RepairGE_Cancel")
		return 1;
	end;
	
	SetTaskTemp(TTID_ItemIndex, nItemIndex);
	SetTaskTemp(TTID_OrgMaxDur, nOrgMaxDur);
	SetTaskTemp(TTID_CurMaxDur, nCurMaxDur);
	-- SetTaskTemp(TTID_CurDur, nCurDur);

	-- ��ά��Ҫ�µ����;ö����޵���(����һ��)
	nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end
	
	--nCheapPrice =  nFixDur * 10000; -- һ��һ���� (nFixDur - nLostDur)
	--nCostlyPrice = nFixDur * 30000; -- -- һ��������
	
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�
	-- Խ�ϰ汾������۸�10��
	nItemLevel = GetItemLevel(nItemIndex);
	nCheapPrice = 10 * nItemLevel * nItemLevel * nFixDur;
	nCostlyPrice = nCheapPrice * 3; -- ���޵�����

	SetTaskTemp(TTID_LostDur, nLostDur);
	SetTaskTemp(TTID_CheapPrice, nCheapPrice);
	SetTaskTemp(TTID_CostlyPrice, nCostlyPrice);

	-- ����������ʾ��λ
	_nCheapW = floor(nCheapPrice / 10000);
	_nCheap = mod(nCheapPrice, 10000);
	_nCostlyW = floor(nCostlyPrice / 10000);
	_nCostly = mod(nCostlyPrice, 10000);
	
	szFixMsg = 
	{
		"���� [".._nCheapW.."��".._nCheap.."�����;ö������½�"..nLostDur.."��]/RePairGE_Cheap", -- 1	
		"���� [".._nCostlyW.."��".._nCostly.."��]/RePairGE_Costly",  -- 2
		"ʹ��ˮ���޸��;ö�����/RepairGE_ReStoreMax", --3
		"ʹ���޸������޸��;ö�����/RepairGE_ReStoreMax_Oil", --4
	}
	szCancelMsg = "��ʱ������/RepairGE_Cancel";
	
	szSayMsg = 
	{
		"������"..get_repair_qualityname(nQuality).."װ������������,������.����������ޣ����Ǿ��ޣ�",	
		"������������"..get_repair_qualityname(nQuality).."װ���;ö������ѱ�����ĥ����Ҫ�޸���",		
	}
	
	--print("�ƽ��װ��ά��(FixDur, CurMaxDur, OrgMaxDur): "..nFixDur..","..nCurMaxDur..","..nOrgMaxDur);
	if (nFixDur > 0) and (nCurMaxDur == nOrgMaxDur) then
		-- ֻ�����;ö�
		--print("ֻ�����;ö�");
		Say(szSayMsg[1], 4, szFixMsg[1], szFixMsg[2], szAboutMsg, szCancelMsg)
	elseif (nFixDur <= 0) and (nCurMaxDur < nOrgMaxDur) then
		-- ֻ�����;ö�����
		--print("ֻ�����;ö�����");
		Say(szSayMsg[2], 4, szFixMsg[3], szFixMsg[4], szAboutMsg, szCancelMsg)
	else
		-- �޾��ޡ����ޡ�����
		--print("�޾��ޡ����ޡ�����");
		Say(szSayMsg[1], 6, szFixMsg[1], szFixMsg[2], szFixMsg[3], szFixMsg[4],szAboutMsg, szCancelMsg)
	end
	
	return 1;
end;

-- ���� - �����;ö�����
function RePairGE_Costly()
	nCostlyPrice = GetTaskTemp(TTID_CostlyPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	if (GetCash() >= nCostlyPrice) then
		Pay(nCostlyPrice)
		-- Msg2Player("�޸�װ����")
		SetCurDurability(nItemIndex, nCurMaxDur);
		WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��("..nCostlyPrice..")�����ӣ�����"..get_repair_qualityname(nQuality).."װ��(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nCurMaxDur..")");
	else
		-- ����������ʾ��λ
		_nCostlyW = floor(nCostlyPrice / 10000);
		_nCostly = mod(nCostlyPrice, 10000);
		Talk(1,"","������������".._nCostlyW.."��".._nCostly.."�����������������������㣡")
	end

end;

-- ���� - ���;ö�����
function RePairGE_Cheap()
	nCheapPrice = GetTaskTemp(TTID_CheapPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	nLostDur = GetTaskTemp(TTID_LostDur);
	
	if (GetCash() >= nCheapPrice) then
		Pay(nCheapPrice)
		-- Msg2Player("�޸�װ����")
		
		-- �޸�����������
		nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIndex, nFixMaxDur);
		SetCurDurability(nItemIndex, nFixMaxDur);
		
		WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��("..nCheapPrice..")�����ӣ�����"..get_repair_qualityname(nQuality).."װ��(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nFixMaxDur..")���;ö������½�"..nLostDur.."��");
		
	else
		-- ����������ʾ��λ
		_nCheapW = floor(nCheapPrice / 10000);
		_nCheap = mod(nCheapPrice, 10000);
		Talk(1,"","���������������[".._nCheapW.."��".._nCheap.."��]�������������������㣡")
	end
end;

-- �޸�����
function RepairGE_ReStoreMax()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."�ƽ�װ���;ö������д�!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "����������װ����ʱ����Ҫ����")
		return 1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)

	-- �ۼ��ܱ�ʯ(ˮ��)
	if (j238 > 0) then
		DelItemEx(238)
	elseif (j239 > 0) then
		DelItemEx(239)
	elseif (j240 > 0) then
		DelItemEx(240)
	else
		Talk(1,"","������������û��ˮ����")
		return -1;
	end

	-- ���;ö�����
	nAddMaxDur = 25; -- һ��ˮ������25������
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��һ��ˮ����"..get_repair_qualityname(nQuality).."װ��(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..")�;ö�����������"..nAddMaxDur.."��");
	Msg2Player("��ʹ����һ��ˮ����װ���;ö�����������"..nAddMaxDur.."��");
end;

function RepairGE_ReStoreMax_Oil()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."�ƽ�װ���;ö������д�!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "����������װ����ʱ����Ҫ����")
		return 1;
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	if (nBindState == 0) then
		Talk(1, "", "������<color=yellow>�޸�����<color>ֻ���޸�<color=red>��<color>״̬��װ����")
		return 1;
	end
	
	local nOilCount = CalcEquiproomItemCount(6, 1, 2565, -1);

	-- �ۼ��ܱ�ʯ(ˮ��)
	if (nOilCount > 0) then
		ConsumeEquiproomItem(1, 6, 1, 2565, -1);
	else
		Talk(1,"","������������û���޸����͡�")
		return -1;
	end

	-- ���;ö�����
	nAddMaxDur = 25; -- һ��ˮ������25������
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S").."��"..GetAccount().."("..GetName()..") ʹ��һƿ�޸����ͣ�"..get_repair_qualityname(nQuality).."װ��(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..")�;ö�����������"..nAddMaxDur.."��");
	Msg2Player("��ʹ����һƿ�޸����ͣ�װ���;ö�����������"..nAddMaxDur.."��");
end;

-- ȡ��
function RepairGE_Cancel()
end;

-- ���ڻƽ�װ��������
function RePairGE_About()
	_szInfo = 
	{
		"<color=green>���ޣ�<color>�۸���ˣ��������װ���;ö����޻ή��<enter>",	
		"<color=green>���ޣ�<color>�۸񰺹������װ���;ö����޲��ή��<enter>",		
		"<color=green>�޸��;ö����ޣ�<color>ʹ��ˮ�������޸�"..get_repair_qualityname(nQuality).."װ���Ĳ����;ö�����<enter>",
		"�޸�����ֻ���޸���װ��",
	}
	szInfo = _szInfo[1].._szInfo[2].._szInfo[3].._szInfo[4];

	Talk(1, "", szInfo)
end;

-- ���ڻƽ�װ��ĥ�����޵��޸�
--function RePairGE_AboutRestorMax()
--	Talk(1, "", "ʹ��<color=red>ˮ��<color>�����޸��ƽ�װ���Ĳ����;ö�����")
--end;

-----------------------------------------------------------------------------
-- ����װ��ά�޼۸� --
-- ����ֵ��-1 ��ʾ����; >=0 ��ʾ���������������
function get_repair_price(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice, nPriceScale, nMagicScale, nSumMagic)
	if( nCurMaxDur <= 0 or nCurMaxDur <= nCurDur ) then
		return 0;
	end
	local nRepairPrice = 0;
	if( nQuality == 0 ) then		-- ��ͨװ������/��ɫװ����
		nRepairPrice = nEquipPrice * nPriceScale / 100 * ( nCurMaxDur - nCurDur ) / nCurMaxDur * ( nMagicScale + nSumMagic ) / nMagicScale;
	elseif( nQuality == 2 ) then	-- ����Ƕװ������ɫװ����
		local arynMagLvl = GetItemAllParams( nItemIndex );
		local nItemVer = ITEM_GetItemVersion( nItemIndex );
		for i = 1, 6 do
			if( arynMagLvl[i] == 0 ) then
				break;
			elseif( arynMagLvl[i] < 0 or arynMagLvl[i] == 65535 ) then					-- MagicLevel�����ͻ�������WORD����ģ�(WORD)(-1) == 65535
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][4];				-- �տװ�4��ħ���ȼ����Լ���
			else
				local nCurMagLvl = getMagAttrLvlLevel( nItemVer, arynMagLvl[i] );
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][nCurMagLvl];	-- ��ħ���ȼ����Լ���
			end			
		end
		nRepairPrice = nRepairPrice * ( nCurMaxDur - nCurDur )
	end
	return nRepairPrice;
end;

-- ά��װ�� --
-- ����ֵ��-1  ��ʾ����= 0 ��ʾ����δ���޸�(��ͬ���ͻ���); >0 ��ʾ�ɹ�(֪ͨ�ͻ���)
function repair_equip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- SetMaxDurability(nItemIndex, 10);
	-- SetCurDurability(nItemIndex, 10);
	return -1;
end;

function get_repair_qualityname(nQ)
	if (nQ == 1) then
		return "�ƽ�";
	elseif (nQ == 4) then
		return "�׽�";
	else
		return "";
	end;
end;