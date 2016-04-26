VLKH1_EXTPOINT = 3
nBit_GetTLL = 1
nBit_GetKimTiger = 2
nBit_GetKimTiger2 = 3
nBit_GetHoaTiger = 4
nBit_GetHoaTiger2 = 5
nBit_GetTKCD = 6
nBit_GetCLBHB = 7

function CheckGetBonusVLKH1(numExtpoint, numBit)
	local nValuePoint	= GetExtPoint(numExtpoint)
	local nBit = GetBit(nValuePoint, numBit)
	
	if (nBit < 1) then
		return 1
	end
	if (nBit > 0) then
		return 0
	end
end

function SetBit2GetBonusVLKH1(numExtpoint, numBit, numValue)
	local nValuePoint	= GetExtPoint(numExtpoint);
	local nBit = SetBit(nValuePoint, numBit, numValue);
	local nBitTemp = nBit - nValuePoint;
	AddExtPoint(numExtpoint, nBitTemp);
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function GetBonusTLL(nCount)
	if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetTLL)~= 1) then
		Talk(1, "", "��������ý��� !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "������װ������60��λ.");
		return
	end
	--set bit khi user get item
	SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetTLL,1)
	for i=1, nCount do
		local nIndex = AddItem(6,1,2352,1,0,0)
		SyncItem(nIndex)
	end
	Msg2Player(format("�����ոջ�� %d ������", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."��ȡ�����������"..nCount)
end

function GetBonusTKCD(nCount)
	if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetTKCD)~= 1) then
		Talk(1, "", "��������ý��� !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "������װ������60��λ.");
		return
	end
	--set bit khi user get item
	SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetTKCD,1)
	for i=1, nCount do
		local nIndex = AddItem(6,1,2263,1,0,0)
		SetSpecItemParam(nIndex,1,2000000000)
		SyncItem(nIndex)
	end
	Msg2Player(format("�����ոջ�� %d �Ͻ��浤", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."��ȡ�Ͻ��浤��������"..nCount)
end

function GetBonusKimTiger(nCount, nTime)
	if (nTime ==1) then
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetKimTiger)~= 1) then
			Talk(1, "", "��������ý��� !");
			return
		end
	else
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetKimTiger2)~= 1) then
			Talk(1, "", "��������ý��� !");
			return
		end
	end
	
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return
	end
	--set bit khi user get item
	if (nTime == 1) then
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetKimTiger,1)
	else
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetKimTiger2,1)
	end
	
	for i=1, nCount do
		local nIndex = AddItem(0,10,16,10,0,0)
		ITEM_SetExpiredTime(nIndex, 259200);
		SyncItem(nIndex)
	end
	Msg2Player(format("�����ոջ�� %d ���ǰ׻���", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."��ȡ���ǰ׻�����������"..nCount)
end

function GetBonusHoaTiger(nCount, nTime)
	if (nTime == 1) then
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetHoaTiger)~= 1) then
			Talk(1, "", "��������ý��� !");
			return
		end
	else
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetHoaTiger2)~= 1) then
			Talk(1, "", "��������ý��� !");
			return
		end
	end
	
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return
	end
	--set bit khi user get item
	if (nTime ==1) then
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetHoaTiger,1)
	else
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetHoaTiger2,1)
	end
	
	
	for i=1, nCount do
		local nIndex = AddItem(0,10,15,10,0,0)
		ITEM_SetExpiredTime(nIndex, 259200);
		SyncItem(nIndex)
	end
	Msg2Player(format("�����ոջ�� %d ���ǽ���", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."��ȡ���ǽ�����������"..nCount)
end

function GetBonusCLBHBVLKH1(nCount)
	if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetCLBHB)~= 1) then
		Talk(1, "", "��������ý��� !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "װ������60��λ.");
		return
	end
	--set bit khi user get item
	SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetCLBHB,1)
	
	for i=1, nCount do
		local nIndex = AddItem(6,1,30032,1,0,0)
		ITEM_SetExpiredTime(nIndex, 43200);
		SyncItem(nIndex)
	end
	Msg2Player(format("�����ոջ�� %d ���ֲ����", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."��ȡ���ֲ������������"..nCount)
end