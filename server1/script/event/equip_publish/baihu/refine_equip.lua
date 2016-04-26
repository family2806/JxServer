-- �����׻�װ��

Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("ITEM")
tbBaiHuRefineEquip = {}

tbBaiHuRefineList = 
{
	[1]= {szName="�׻�����", nStone = 1, nWidth = 2, nHeight = 1, },
	[2]= {szName="�׻���",   nStone = 1, nWidth = 2, nHeight = 2, },
	[3]= {szName="�׻��Ͻ�", nStone = 1, nWidth = 1, nHeight = 1, },
	[4]= {szName="�׻�����", nStone = 1, nWidth = 1, nHeight = 2, },
	[5]= {szName="�׻�����", nStone = 1, nWidth = 2, nHeight = 1, },
	[6]= {szName="�׻���",   nStone = 1, nWidth = 2, nHeight = 3, },
	[7]= {szName="�׻�����",nStone = 1, nWidth = 2, nHeight = 4, },
	[8]= {szName="�׻�Ь",   nStone = 1, nWidth = 2, nHeight = 2, },
	[9]= {szName="�׻���",   nStone = 1, nWidth = 1, nHeight = 2, },
	[10]={szName="�׻��½�", nStone = 1, nWidth = 1, nHeight = 1, },
}

BAIHU_IDX_START = 2285
BAIHU_IDX_END = 2514


tbRefineMaterial = {szName = "�׻�����ʯ", tbProp = {6,1,3187, -1},}

function tbBaiHuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "�׻�װ��", " �׻�����ʯ")
	
	local strDesc = ""
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s%-21s\t%d\n", strDesc, pTmp.szName, pTmp.nStone)	
	end
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbBaiHuRefineEquip:GiveUIOk(nPutCount)	
	
	if nPutCount ~= 1 then
		Talk(1, "", "ֻ�����1���׻�װ��")
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	local nItemQuality = GetItemQuality(nItemIndex)
	if nItemQuality ~= 1 then
		Talk(1, "", "�㲻�÷���ƽ�װ��")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nItemIndex)
	if %BAIHU_IDX_START > nGoldEquipIdx or nGoldEquipIdx > %BAIHU_IDX_END  then
		Talk(1, "", "�㲻Ӧ�÷���׻�װ��")
		return
	end
	--����״̬
	local nBindState = GetItemBindState(nItemIndex)
	if nBindState ~= 0 then
		Talk(1, "", "�������ڰ�״̬, �޷�����.")
		return
	end
	
	--����Ƿ�������װ��
	local nG, _, _ = GetItemProp(nItemIndex)
	if nG == 7 then
		Talk(1, "", "���װ���ѱ�����޷�����.")
		return
	end
	if ITEM_GetExpiredTime(nItemIndex) ~= 0 then
		Talk(1, "", "��������װ���޷�����")
		return
	end
	
	
	local nEquType = mod(nGoldEquipIdx - %BAIHU_IDX_START, 10) + 1
	
	local nWidth = %tbBaiHuRefineList[nEquType].nWidth
	local nHeight = %tbBaiHuRefineList[nEquType].nHeight
	
	if nWidth ~= 0 and nHeight ~= 0 and CountFreeRoomByWH(nWidth, nHeight, 1) < 1 then
		Say(format("Ϊ��֤�����ĲƲ���ȫ, ������� %d %dx%d�ı����ռ�", 1, nWidth, nHeight))
		return
	end	

	local tbItem = 
	{
		szName = %tbRefineMaterial.szName, 
		tbProp = %tbRefineMaterial.tbProp, 
		nCount = %tbBaiHuRefineList[nEquType].nStone
	}
	local tbProp = tbItem.tbProp
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
		Talk(1, "", format("<color=red>�����ı���%����. <color>", tbItem.szName))
		return
	end
	
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	RemoveItemByIndex(nItemIndex)
	if ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
		return
	end	

	tbAwardTemplet:Give({tbProp = {0, nGoldEquipIdx}, nQuality = 1}, 1, {self.szLogTitle})
end

function tbBaiHuRefineEquip:Dialog()
		
	local strDesc = "<npc>��<color=yellow>��Ҫ�����İ׻�װ��<color> ������<color=yellow> ��Ӧ�İ׻�����ʯ<color>����"
	
	strDesc = format("%s\n\t\t\t\t\t%-29s%s", strDesc, "�׻�װ��", " �׻�����ʯ")
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", strDesc, pTmp.szName, pTmp.nStone)
	end
	local tbOpt = {}
	tinsert(tbOpt, {"�����׻�װ��", self.ComposeGiveUI, {self}})
	tinsert(tbOpt, {"����"})
	CreateNewSayEx(strDesc, tbOpt);
end

--��ʱ�ر�����׻�����- Modified By DinhHQ - 20120511
--pEventType:Reg("��������", "�������������׻�װ��", tbBaiHuRefineEquip.Dialog, {tbBaiHuRefineEquip})