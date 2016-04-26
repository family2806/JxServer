Include("\\script\\activitysys\\config\\30\\head.lua")
Include("\\script\\activitysys\\config\\30\\config.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")

local szEventName = "Event_NhaGiaoVN"
local nMaxAskNumber = 2000 -- ����Ͻ�ʱ����֧����


local tbBookPartAward = {
	[20]={szName="��֮��",tbProp={6,1,3043,1,0,0},nExpiredTime=20111201},
	[40]={szName="��֮��",tbProp={6,1,3043,1,0,0},nCount = 3,nExpiredTime=20111201},
	[60]={szName="��֮��",tbProp={6,1,3043,1,0,0},nCount = 4,nExpiredTime=20111201},
	[80]={szName="��֮��",tbProp={6,1,3043,1,0,0},nCount = 5,nExpiredTime=20111201},
	[100]={szName="��֮��",tbProp={6,1,3043,1,0,0},nCount = 7,nExpiredTime=20111201},
	[200]={nExp_tl=1,nCount = 20000000,},
	[300]={nExp_tl=1,nCount = 20000000,},
	[400]={szName="�����",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[500]={szName="�����",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[600]={szName="�����",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[700]={szName="�����",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[800]={szName="�����",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[900]={szName="�����",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1000]={nExp_tl=1,nCount = 20000000,},
	[1100]={szName="�����",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1200]={szName="�����",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1300]={szName="�����",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1400]={szName="�����",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1500]={nExp_tl=1,nCount = 50000000,},
	[1600]={nExp_tl=1,nCount = 60000000,},
	[1700]={nExp_tl=1,nCount = 70000000,},
	[1800]={nExp_tl=1,nCount = 80000000,},
	[1900]={nExp_tl=1,nCount = 90000000,},
	[2000]={nExp_tl=1,nCount = 100000000,},
}
local tbBookPartAwardLog ={
	[20] = "ʹ��20���鼮",
	[40] = "ʹ��40���鼮",
	[60] = "ʹ��60���鼮",
	[80] = "ʹ��80���鼮",
	[100] = "ʹ��100���鼮", 
	[200] = "ʹ��200���鼮",
	[300] = "ʹ��300���鼮",
	[400] = "ʹ��400���鼮",
	[500] = "ʹ��500���鼮",
	[600] = "ʹ��600���鼮", 
	[700] = "ʹ��700���鼮",
	[800] = "ʹ��800���鼮",
	[900] = "ʹ��900���鼮",
	[1000] = "ʹ��1000���鼮",
	[1100] = "ʹ��1100���鼮", 
	[1200] = "ʹ��1200���鼮h",
	[1300] = "ʹ��1300���鼮",
	[1400] = "ʹ��1400���鼮",
	[1500] = "ʹ��1500���鼮",
	[1600] = "ʹ��1600���鼮", 
	[1700] = "ʹ��1700���鼮",
	[1800] = "ʹ��1800���鼮",
	[1900] = "ʹ��1900���鼮",
	[2000] = "ʹ��2000���鼮",
}

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("�����"..nCount.."��ṱ�׵�")
		%tbLog:PlayerActionLog(%szEventName, "ʹ���鼮�����Ʒ", nCount.."��ṱ�׵�")
	end
end

local tbBookAward = {
	{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
	{szName="���ڽ���",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.05},
	{szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.1},
	{szName="������ͼ��",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.1},
	{szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.05},
	{szName="��������ͼ��",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.05},
	{szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
	{szName="��������ͼ��",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.1},
	{szName="������ͼ��",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.1},
	{szName="�����Ͻ�ͼ��",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
	{szName="�����½�ͼ��",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
	{szName="������еͼ��",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
	{szName="��֮��",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.05},
	{szName="���֮��",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.03},
	{szName="����֮��",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.001},
	{szName="���ʯ",tbProp={6,1,2710,1,0,0},nCount=1,nRate=0.4},
	{szName="��»ʯ",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.3},
	{szName="����ʯ",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.2},
	{szName = "6000000 �i����ֵ", nExp=6000000,nRate=35},
	{szName = "8000000 �i����ֵ", nExp=8000000,nRate=22},
	{szName = "12000000 �i����ֵ", nExp=12000000,nRate=10},
	{szName = "20000000 �i����ֵ", nExp=20000000,nRate=3},
	{szName = "50000000 �i����ֵ", nExp=50000000,nRate=0.5},
	{szName = "100000000 �i����ֵ", nExp=100000000,nRate=0.1},
	{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3},
	{szName="���������",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3},
	{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="�ν��б���",tbProp={6,1,30083,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
	{szName="������",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
	{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.04,nExpiredTime=43200},
	{szName="����������",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="������Ѫ��",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="ľ����",tbProp={6,1,30105,1,0,0},nCount=5,nRate=9.664},
	{szName="50000 ����ṱ�׵�",nCount=1,nRate=2, pFun = function() %pContributionAward(50000) end},
	{szName="100000 ����ṱ�׵�",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
	{szName="����֮��(ñ)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={1,0,0,0,0,0}},
	{szName="����֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={4,0,0,0,0,0}},
	{szName="����֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={3,0,0,0,0,0}},
	{szName="����֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={8,0,0,0,0,0}},
	{szName="����֮��(�·�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={5,0,0,0,0,0}},
	{szName="����֮��(Ь��)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={7,0,0,0,0,0}},
	{szName="����֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={0,0,0,0,0,0}},
	{szName="����֮��(�Ͻ�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={2,0,0,0,0,0}},
	{szName="����֮��(�½�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={9,0,0,0,0,0}},
	{szName="����֮��(����)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={6,0,0,0,0,0}},
}

local tbBaizhiPartLog = {
	[500] = "����ֽ��Ʒ500��",
	[1000] = "����ֽ��Ʒ1000��",
	[1500] = "����ֽ��Ʒ1500��",
	[2000] = "����ֽ��Ʒ2000��",
	[2500] = "����ֽ��Ʒ2500��",
	[3000] = "����ֽ��Ʒ3000��",
}	

function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1431,3287,},
		[2] = {176,1428,3283,},
	}
	local tbNpc = {
		[1] = {
			szName = "����ʦ", 
			nLevel = 95,
			nNpcId = 1877,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "��ͯ", 
			nLevel = 95,
			nNpcId = 1878,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:GetItemCount(tbMaterial)
	local nMaxCount = -1
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
			nCount = floor(nCount / tbMaterial[i].nCount)
			if nMaxCount < 0 then
				nMaxCount = nCount
			else
				nMaxCount = min(nMaxCount, nCount)
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
		nMaxCount = min(nMaxCount, nCount)
	end
	nMaxCount = max(0, nMaxCount)
	return nMaxCount
end

function pActivity:ConsumeItem(tbMaterial, nCount)
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nTotalCount = nCount * tbMaterial[i].nCount
			if ConsumeItem(3, nTotalCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
				Msg2Player(format("������%s ��ʧ��, ���һ������",tbMaterial[i].szName))
				return 0
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		if ConsumeItem(3, nCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
			Msg2Player(format("������%s ��ʧ��, ���һ������",tbMaterial[i].szName))
			return 0
		end
	end
	return 1
end

function pActivity:CheckItemCount(nValue, nTarget)
	if nValue < nTarget then
		Say("�㲻��ԭ�ϣ�����׼��")
		return 0
	end
	return 1
end

-- �Ͻ��鱾�ɹ�����ز���
--function pActivity:DoHandInBook(nCount, nTaskId)
--	local nPreCount = self:GetTask(nTaskId)
--	local nNowCount = nPreCount + nCount
--	
--	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
--		return 
--	end
--	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham"})
--	for key,value in %tbBookPartAward do
--		if key > nPreCount and key <= nNowCount then
--			tbAwardTemplet:Give(value, 1, {%szEventName,%tbBookPartAwardLog[key]})
--		end
--	end
--	self:AddTask(nTaskId, nCount)
--end

-- �Ͻ���ֽ�ɹ�����ز���
function pActivity:DoHandInPaper(nCount, nTaskId)
	local tbExp = {{nExp_tl=1,nCount = 1000000,},}
	local nPreCount = self:GetTask(nTaskId)
	local nNowCount = nPreCount + nCount
	tbAwardTemplet:Give(tbExp, nCount, {%szEventName, "HandInPaper"})
	for key,value in %tbBaizhiPartLog do
		if key > nPreCount and key <= nNowCount then
			%tbLog:PlayerActionLog(%szEventName, value)
			tbVngTransLog:Write("201111_20Thang11/", 16, value, "N/A", 1)
		end
	end
	self:AddTask(nTaskId, nCount)
end

-- �Ͻ����߽׶��Խ���
function pActivity:GiveAward(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		self:DoHandInBook(nCount, nTaskId)
	elseif nTaskId == %TSK_HandInPaper then
		self:DoHandInPaper(nCount, nTaskId)
	end
	
end

function pActivity:CheckFreeCell(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		local nFreeCount = nCount * 3 -- Į����������3���Ҳ��ɵ���
		if CalcFreeItemCellCount() < nFreeCount then
			Say(format("Ϊ��ȷ���Ʋ���ȫ����ȷ��װ����ʣ%d��λ.",nFreeCount))
			return 0
		end
	end
	return 1
end

-- ȷ���Ͻ�����
function pActivity:SureHandIn(tbMaterial, nTaskId, nCount)
	if nCount <= 0 then
		return 
	end	
	--����Ͻ�������û�г�������- Modified by DinhHQ - 20111101
	local nMaxCount = 0
	if nTaskId == %TSK_HandInBook then
		nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook) - nCount
	elseif nTaskId == %TSK_HandInPaper then
		nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper) - nCount
	end	
		
	if nMaxCount < 0 then
		Say("�����������ޣ�������������!")
		return 
	end
	
	local nItemCount = self:GetItemCount(tbMaterial)
	if self:CheckItemCount(nItemCount, nCount) ~= 1 then
		return
	end
	
	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
		return 
	end 
	
	if self:ConsumeItem(tbMaterial, nCount) ~= 1 then
		return 
	end
	
	self:GiveAward(nTaskId, nCount)
end

-- �Ͻ��鱾
--function pActivity:HandInBook()
--	print("�Ͻ��鼮")
--	local tbBook = {
--		[1]={szName="�鼮",tbProp={6,1,3042,1,0,0},},	
--	}
--	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
--	if nMaxCount < 1 then
--		Say("Ŀǰ�����Ͻ������Ѵ�������ޣ��������Ͻ���")
--		return 
--	end
--	print("nMaxCount = " .. nMaxCount)
--	print("nMaxAskNumber" .. %nMaxAskNumber)
--	nMaxCount = min(%nMaxAskNumber, nMaxCount)
--	local nItemCount = self:GetItemCount(tbBook)
--	nMaxCount = min(nMaxCount, nItemCount)
--	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
--		return
--	end
--	g_AskClientNumberEx(0,nMaxCount, format("��������(0-%d)", nMaxCount), {self.SureHandIn, {self,tbBook,%TSK_HandInBook}})
--end


-- �Ͻ���ֽ
function pActivity:HandInPaper()
	local tbPape = {
		[1]={szName="��ֽ",tbProp={6,1,3039,1,0,0},},	
	}
	local nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper)
	if nMaxCount < 1 then
		Say("Ŀǰ���Ͻ������Ѵ�������ޣ��������Ͻ���")
		return 
	end
	nMaxCount = min(%nMaxAskNumber, nMaxCount)
	local nItemCount = self:GetItemCount(tbPape)	
	nMaxCount = min(nMaxCount, nItemCount)
	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
		return
	end
	g_AskClientNumberEx(0,nMaxCount, format("��������(0-%d)", nMaxCount), {self.SureHandIn, {self,tbPape,%TSK_HandInPaper}})
end

-- ��ȡ��ʦ�ھ��齱��
function pActivity:TeacherAward()
	local nStartTime = 20111120
	if tonumber(GetLocalDate("%Y%m%d")) ~= nStartTime then
		Say("ֻ���� <color=yellow>  20/11/2011 <color> ���ܻ�øý�����Ŀǰ������ȡ")
		return 
	end
	local tbTeacherEXP = { {nExp_tl=1,nCount = 100000000,}, }
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(tbTeacherEXP,1,{%szEventName, "��ȡ������NPC����ʦ", tbTranslog})
	self:AddTask(%TSK_TeacherAward, 1)
end

local tbJinwu = {
	[1]={szName="���ڿ�ͼ��",tbProp={6,1,2982,1,0,0},},
	[2]={szName="������ͼ��",tbProp={6,1,2983,1,0,0},},
	[3]={szName="����Ьͼ��",tbProp={6,1,2984,1,0,0},},
	[4]={szName="��������ͼ��",tbProp={6,1,2985,1,0,0},},
	[5]={szName="���ڻ���ͼ��",tbProp={6,1,2986,1,0,0},},
	[6]={szName="��������ͼ��",tbProp={6,1,2987,1,0,0},},
	[7]={szName="������ͼ��",tbProp={6,1,2988,1,0,0},},
}
-- ��ȡ�ϴ��鱾��������700ʱ�Ľ��ڽ���
function pActivity:JinwuAward()
	print("��ȡ����ͼ�׽���")
	local szTitle = "��ѡ��������ȡ��ͼ��:"
	local tbOpt = {}
	for nIndex=1,getn(%tbJinwu) do
		tinsert(tbOpt, {%tbJinwu[nIndex].szName, self.SelectJinWu,{self, nIndex}})
	end
	tinsert(tbOpt, {"����������!", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:SelectJinWu(nIndex)
	local nFreeItemCellLimit = 1
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("Ϊȷ�����ĲƲ���ȫ����ȷ������<color=yellow>%d <color> װ����λ",nFreeItemCellLimit))
		return 
	end
	tbAwardTemplet:Give(%tbJinwu[nIndex], 1, {%szEventName, "ʹ��700���鼮_����"})
	self:AddTask(%TSK_JinwuAward, 1)
end

function pActivity:UseZhienhua()
	local tbUseLog = {
		[10] = "ʹ�û�֮��10��",
		[20] = "ʹ�û�֮��20��",
		}
	self:AddTask(%TSK_UsedZhienhua,1)
	local nUseTime = self:GetTask(%TSK_UsedZhienhua)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("ʹ�óɹ�<color=yellow>%s<color>, ���<color=yellow>%d<color> �Ͻ� <color=yellow>%s<color> ��","��֮��",%nPerZhienhua,"��ֽ"))
end

function pActivity:UseTianyuhun()
	local tbUseLog = {
		[10] = "ʹ�������10��",
		[20] = "ʹ�������20��",
		}
	self:AddTask(%TSK_UsedTianyuhun,1)
	local nUseTime = self:GetTask(%TSK_UsedTianyuhun)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("ʹ�óɹ�<color=yellow>%s<color>, ���<color=yellow>%d<color> �Ͻ� <color=yellow>%s<color> ��","�����",%nPerTianyuhun,"�鼮"))
end

function pActivity:CheckBookLimit()
	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
	if nMaxCount < 1 then
		Say("������ʹ�ø���Ʒ�����ֵ��������ʹ����!")
		return nil
	end
	return 1
end

function pActivity:UseBook()
	self:AddTask(%TSK_HandInBook,1)	
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham", tbTranslog})
	local nUseTime = self:GetTask(%TSK_HandInBook)
	--print(nUseTime)
	if %tbBookPartAward[nUseTime] then
		tbAwardTemplet:Give(%tbBookPartAward[nUseTime], 1, {%szEventName,%tbBookPartAwardLog[nUseTime]})
		tbVngTransLog:Write("201111_20Thang11/", 16, %tbBookPartAwardLog[nUseTime], "N/A", 1)
	end	
end

pActivity.nPak = curpack()
