--�Ӱٱ������ܻ�õĽ��� - Created By DinhHQ - 20120415
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\composeex.lua")
tbBBRAward = {}
tbBBRAward.tbFlag = {
	["LongLenhKy"] = {szName = "������", tbProp = {6, 1, 3056, 1, 0, 0}},
	["LanLenhKy"] = {szName = "������", tbProp = {6, 1, 3057, 1, 0, 0}},
	["QuyLenhKy"] = {szName = "������", tbProp = {6, 1, 3059, 1, 0, 0}},
	["PhungLenhKy"] = {szName = "������", tbProp = {6, 1, 3058, 1, 0, 0}},
}
tbBBRAward.tbProduct = {
	["LongLenhKy"] = {
		{tbProduct = {szName = "���ڷ��� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "����Ь - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "������ - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}}, nFlagRequire = 900},
		{tbProduct = {szName = "�������� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "�������� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}}, nFlagRequire = 700},
		{tbProduct = {szName = "���ڻ��� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "�������� - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}}, nFlagRequire = 750},
		{tbProduct = {szName = "�����Ͻ�ָ - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "�����½�ָ - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "������е - ��ѡ��ϵ", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}}, nFlagRequire = 3000},
		{tbProduct = {szName="������",tbProp={6,1,2349,1,0,0},nCount=1}, nFlagRequire = 600},
		{tbProduct = {szName="���",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ƽ��",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�ش�",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ľ",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�׻��",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��������",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="���軨��",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Ӣ����",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["LanLenhKy"] = {
		{tbProduct = {szName="�������",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 400},
		{tbProduct = {szName="Ӣ��ս�����",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime=60}, nFlagRequire = 30},
		{tbProduct = {szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 240},
		{tbProduct = {szName="���ư���",tbProp={0,10,19,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 100, },
		{tbProduct = {szName="���� (ʹ����һ����)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 20},
		{tbProduct = {szName="����(ʹ����3����)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 60},
		{tbProduct = {szName="���",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ƽ��",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�ش�",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ľ",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�׻��",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��������",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="���軨��",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Ӣ����",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["QuyLenhKy"] = {
		{tbProduct = {szName="1000 ������", nJxb = 10000000, nCount = 1}, nFlagRequire = 8},
		{tbProduct = {szName="5000 ������", nJxb = 50000000, nCount = 1}, nFlagRequire = 40},
		{tbProduct = {szName="10000 ������", nJxb = 100000000, nCount = 1}, nFlagRequire = 80},
		{tbProduct = {szName="50000 ������", nJxb = 500000000, nCount = 1}, nFlagRequire = 400},
		{tbProduct = {szName="���",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="���",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ƽ��",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�ش�",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ľ",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�׻��",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��������",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="���軨��",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Ӣ����",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["PhungLenhKy"] = {
		{tbProduct = {szName="�ƽ�ӡ (ǿ��) ����7",tbProp={0,3211},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="�ƽ�ӡ (ǿ��) ����8",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="�ƽ�ӡ (����) ����7",tbProp={0,3221},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="�ƽ�ӡ (����) ����8",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="���",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ƽ��",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�ش�",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��ľ",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="����",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="�׻��",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="��������",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="���軨��",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Ӣ����",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
}
function tbBBRAward:main()
	local tb = {
		format("����ʹ�������컻����/#tbBBRAward:SelectAward('%s', %d)", "LongLenhKy", 1),
		format("����ʹ�������컻����/#tbBBRAward:SelectAward('%s', %d)", "LanLenhKy", 1),
		format("����ʹ�ù����컻����/#tbBBRAward:SelectAward('%s', %d)", "QuyLenhKy", 1),
		format("����ʹ�÷����컻����/#tbBBRAward:SelectAward('%s', %d)", "PhungLenhKy", 1),
		"���� Oncancel",
	}
	Describe("���ռ������죬����Դ��������ﻻ����. �콱�����ͻ�ȡ��ֵ�����ϸ���.", getn(tb), tb)
end

function tbBBRAward:SelectAward(strFlag, nStartIndex)	
	local tb1 = self.tbProduct[strFlag]
	if nStartIndex < 1 or nStartIndex > getn(tb1) then
		return
	end
	local tb2
	local nEndIndex
	local tbDialog = {}
	if nStartIndex +11 > getn(tb1) then
		nEndIndex = getn(tb1)
	else
		nEndIndex = nStartIndex + 11
	end
	for i = nStartIndex, nEndIndex do
		tb2 = tb1[i]
		tinsert(tbDialog , format("%s/#tbBBRAward:MakeCompose('%s', %d)", tb2.tbProduct.szName, strFlag, i))
	end
	if nEndIndex < getn(tb1) then	
		tinsert(tbDialog, format("��һҳ/#tbBBRAward:SelectAward('%s', %d)", strFlag, nEndIndex + 1))
	end
	if nStartIndex > 1 then
		tinsert(tbDialog, format("����/#tbBBRAward:SelectAward('%s', %d)", strFlag, nStartIndex - 12))
	end
	tinsert(tbDialog, "����Oncancel")
	Describe("��ѡ����:", getn(tbDialog), tbDialog)
end

function tbBBRAward:MakeCompose(strFlag, nProductID)
	local tbTemp = self.tbProduct[strFlag][nProductID]
	local tbMat = {}
	tbMat[1] = {}
	tbMat[1].nCount = tbTemp.nFlagRequire
	tbMat[1].szName = self.tbFlag[strFlag].szName
	tbMat[1].tbProp = self.tbFlag[strFlag].tbProp	
	local tbFormula = {		
		tbMaterial = tbMat,		
		tbProduct = tbTemp.tbProduct,	
		nWidth = 3,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	}
	pCompos = tbActivityCompose:new(tbFormula, strFlag.."DoiPhanThuong");
	pCompos:ComposeDailog(1);
end

pEventType:Reg("���", "���Ʊ����", tbBBRAward.main, {tbBBRAward})