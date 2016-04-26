--����װ���������� - Created by DinhHQ - 20110517

Include("\\script\\vng_feature\\trungluyen\\globalvar.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbVNG_RefineEquip = {}


function tbVNG_RefineEquip:ShowDialog()
	local strDesc = "Ҫ��������Ҫ1 <color=yellow>����װ��<color> ���� <color=yellow>������<color> ��������װ��:"	
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "װ��", "��")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "������", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "������", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "����Ь", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��������", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��������", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��������", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "��ç����", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "������ָ", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "������е", 3)
	Describe(strDesc, 2, "��������/#tbVNG_RefineEquip:main()", "ȡ��/OnCancel")
end

function tbVNG_RefineEquip:main()	
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(nTSK_DAILY_REFINE_LIMIT)
	if nTaskVal >= nDAILY_REFINE_MAX_COUNT then
		Talk(1, "", format("ÿ��ֻ������װ�� <color=red>%d<color> �Σ�����������!", nDAILY_REFINE_MAX_COUNT))
		return
	end
	
	local strDesc = format("%-22s%s\n", "װ��", "��")
	strDesc = strDesc..format("\n%-29s%d", "������", 1)
	strDesc = strDesc..format("\n%-29s%d", "������", 2)
	strDesc = strDesc..format("\n%-29s%d", "����Ь", 2)
	strDesc = strDesc..format("\n%-29s%d", "��������", 1)
	strDesc = strDesc..format("\n%-29s%d", "��������", 1)
	strDesc = strDesc..format("\n%-29s%d", "��������", 2)
	strDesc = strDesc..format("\n%-29s%d", "��ç����", 2)
	strDesc = strDesc..format("\n%-29s%d", "��ָ", 2)
	strDesc = strDesc..format("\n%-29s%d", "������е", 3)
	GiveItemUI("��������", strDesc, "RefineUIConfirm", "OnCancel")
end

function RefineUIConfirm(nCount)	
	local tbGoldEquip = {}
	local tbStoneList = {}
	local nTempIdx = 0
	local nItemQuality = -1
	for i = 1, nCount do
		nTempIdx = GetGiveItemUnit(i)
		if nTempIdx < 0 then
			Talk(1, "", "��Ʒ������")
			return
		end
		nItemQuality = GetItemQuality(nTempIdx)
		--item ho�ng kim
		if nItemQuality == 1 then
			tinsert(tbGoldEquip, getn(tbGoldEquip) + 1 ,nTempIdx)
		else --item th��ng
			tinsert(tbStoneList, getn(tbStoneList) + 1, nTempIdx)		
		end	
	end
	
	--���item ������
	local nResult, strFailMessage = tbVNG_RefineEquip:CheckItems(tbGoldEquip, tbStoneList)
	if nResult ~= 1 and strFailMessage then
		Talk(1, "", strFailMessage)
		return
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGoldEquip[1]) 
	
	--ɾ��ԭ��
	local nConsumeResult, strConsumeFailMessage = tbVNG_RefineEquip:ConsumeItems(tbGoldEquip, tbStoneList)
	if nConsumeResult ~= 1 and strConsumeFailMessage then
		Talk(1, "", strConsumeFailMessage)
		return
	end
	PlayerFunLib:AddTaskDaily(nTSK_DAILY_REFINE_LIMIT, 1)
	local nNextEquipIdx = AddGoldItem(0, nGoldEquipID)
	if nNextEquipIdx <= 0 then
		Msg2Player("��������ʧ�ܣ�ʧȥһЩԭ��!")
		tbLog:PlayerActionLog("��������","AddTrangBiThatBai", "", "", "", SubWorld)
		return
	end
	Msg2Player("<color=green>���������ɹ�������װ��")
	tbLog:PlayerActionLog("��������","Addװ���ɹ�", GetItemName(nNextEquipIdx), GetGlodEqIndex(nNextEquipIdx), 1, SubWorld)
end

function tbVNG_RefineEquip:CheckItems(tbGold, tbStone)
	--������Ļƽ�װ��
	if getn(tbGold) > 1 or getn(tbGold) <= 0 then
		return 0, "ÿ��ֻ������һ������װ��"
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGold[1])
	
	--����Ĳ�������װ��
	if not tbRE_Formula[nGoldEquipID] then
		return 0, "װ�����벻������������."
	end
	
	--�������״̬
	local nBindState = GetItemBindState(tbGold[1])
	if nBindState ~= 0 then
		return 0, "װ��������������ס״̬����������!."
	end
	
	--���
	local nG, _, _ = GetItemProp(tbGold[1])
	if nG == 7 then
		return 0, "װ�����ˣ���������!."
	end
	
	--����������
	local nStoneRequire = tbRE_Formula[nGoldEquipID].nStoneRequire
	if getn(tbStone) ~= nStoneRequire then
		return 0, "ԭ�ϲ��㣬��������!"
	end	
	
	--���������ĺ�����
	for i = 1, getn(tbStone) do
		if self:CheckStone(tbStone[i]) ~= 1 then
			return 0, "�������Ʒ����������!"
		end
	end	
	
	return 1
end

function tbVNG_RefineEquip:CheckStone(nStoneIdx)
	local nG, nD, nP = GetItemProp(nStoneIdx)
	if nG ~= tbSTONE_GDP.nG or nD ~= tbSTONE_GDP.nD or nP ~= tbSTONE_GDP.nP then
		return 0
	end
	return 1
end

function tbVNG_RefineEquip:ConsumeItems(tbGold, tbStone)
	--consume stones
	local nStoneIdx = 0
	local nStoneRemoved = 0
	for i = 1, getn(tbStone) do
		nStoneIdx = tbStone[i]
		local nG, nD, nP = GetItemProp(nStoneIdx)
		local strItemCode = nG..", "..nD..", "..nP
		local strStoneName = GetItemName(nStoneIdx)
		if IsMyItem(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("��������","��Ʒ��������", strStoneName, strItemCode, 1, SubWorld)
			return 0, "��Ʒ�������ϣ�����ʧ�ܣ�ʧȥһЩ��Ʒ!!"
		end
		if RemoveItemByIndex(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("��������","ɾ��ԭ��ʧ��", strStoneName, strItemCode, 1, SubWorld)
			return 0, "��������ʧ�ܣ�ʧȥһЩԭ��!"
		else			
			tbLog:PlayerActionLog("��������","ɾ��ԭ�ϳɹ�", strStoneName, strItemCode, 1, SubWorld)
			nStoneRemoved = nStoneRemoved + 1
		end
	end
	if nStoneRemoved ~= getn(tbStone) then
		tbLog:PlayerActionLog("��������","����ʧ��", "�������������ͬ��")
		return 0, "��������ʧ�ܣ�ʧȥһЩԭ��!"
	end
	--consume gold equip
	local nGoldEquipIdx = tbGold[1]
	local strEquipName = GetItemName(nGoldEquipIdx)
	local nEquipID = GetGlodEqIndex(nGoldEquipIdx)
	if IsMyItem(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("��������","װ����������", strEquipName, nEquipID, 1, SubWorld)
		return 0, "��Ʒ�������ϣ�����ʧ�ܣ�ʧȥһЩ��Ʒ!!"
	end
	
	if RemoveItemByIndex(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("��������","ɾ��װ��ʧ��", strEquipName, nEquipID, 1, SubWorld)
		return 0, "����ʧ�ܣ�ʧȥһЩ��Ʒ!!"
	else	
		tbLog:PlayerActionLog("��������","�ɹ�ɾ��װ��", strEquipName, nEquipID, 1, SubWorld)
		return 1
	end	
end

function OnCancel()
end