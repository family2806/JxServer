Include("\\script\\activitysys\\config\\1000\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

local nYellowDaisyMaxCount = 1000

local tbGiveDaisyTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 1,
	nBitCount = 12,
	nMaxValue = 1000
}
local tbGourdUseTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 13,
	nBitCount = 12,
	nMaxValue = 1000
}
--local tbSteelHeartWineUseTaskInfo =
--{
--	nTaskID = 2712,
--	nStartBit = 25,
--	nBitCount = 6,
--	nMaxValue = 5
--}
local tbGiveDaisy_AdditionalAward = {
	[500] = {szName = "����ֵ", nExp=5000000},
	[1000] = {szName = "����ֵ", nExp=10000000},
}
local tbUseGourd_AdditionalAward = {
	[50] = {szName = "�i����ֵ", nExp=3000000},
	[100] = {szName = "�i����ֵ", nExp=6000000},
	[200] = {szName = "�i����ֵ", nExp=8000000},
	[300] = {szName = "�i����ֵ", nExp=10000000},
	[400] = {szName = "�i����ֵ", nExp=12000000},
	[500] = {szName = "�i����ֵ", nExp=14000000},
	[600] = {szName = "�i����ֵ", nExp=16000000},
	[700] = {szName = "�i����ֵ", nExp=18000000},
	[800] = {szName = "�i����ֵ", nExp=20000000},
	[900] = {szName = "�i����ֵ", nExp=25000000},
	[1000] = {szName = "�i����ֵ", nExp=30000000},
}
local tbUseWine_ExpAward = {
	[1] = {szName = "�i����ֵ", nExp=2000000},
	[2] = {szName = "�i����ֵ", nExp=3000000},
	[3] = {szName = "�i����ֵ", nExp=4000000},
	[4] = {szName = "�i����ֵ", nExp=5000000},
	[5] = {szName = "�i����ֵ", nExp=6000000},
	[6] = {szName = "�i����ֵ", nExp=6000000},
	[7] = {szName = "�i����ֵ", nExp=7000000},
	[8] = {szName = "�i����ֵ", nExp=8000000},
	[9] = {szName = "����ֵ", nExp=9000000},
	[10] = {szName = "�i����ֵ", nExp=10000000},
}

local tbUseWine_ItemAward = {
	{szName="��ç����ͼ��",tbProp={6,1,2719,1,0,0},nCount=1,nRate=1},
	{szName="��ç�Ͻ�ͼ��",tbProp={6,1,2721,1,0,0},nCount=1,nRate=1},
	{szName="��ç�½�ͼ��",tbProp={6,1,2722,1,0,0},nCount=1,nRate=1},
	{szName="��ç��еͼ��",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.5},
	{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	{szName="�ɷ羪��(��ʱת��)",tbProp={0,3470},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="�ɷ羪��(���ʻ���ɱǹ)",tbProp={0,3471},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="�ɷ羪��( �ػ�)",tbProp={0,3472},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="�ƽ�ӡ(ǿ��)",tbProp={0,3210},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="�ƽ�ӡ(����)",tbProp={0,3220},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName = "ʹ�����ľƲ�����",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("�˴β����ˣ���Ҫ����һ��")
		end,
		nRate = 93.5,
	}
}
local tbUseGourd_ItemAward = {
	{szName="��ç��ͼ��",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç��ͼ��",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç����ͼ��",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç����ͼ��",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç��ͼ��",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
	{szName="��çЬͼ��",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç����ͼ��",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.1},
	{szName="��ç�Ͻ�ͼ��",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.1},
	{szName="��ç�½�ͼ��",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.1},
	{szName="��ç��еͼ��",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.1},
	{szName="��Գ��",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
	{szName="ˮ������",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nCount=1,nRate=1, nExpiredTime = 10080},
	{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Į��������",tbProp={6,1,1448,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="�������",tbProp={6,1,2355,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="���",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1},
	{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=1},
	{szName="������",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
	{szName="�������",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
	{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=41.6},
	{szName="���������",tbProp={6,1,2520,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="������",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.5},
	{szName="�ɷ�����",tbProp={0,3465},nCount=1,nRate=0.4,nQuality = 1,nExpiredTime=20160,},
	{szName="�ɷ����",tbProp={0,3466},nCount=1,nRate=0.3,nQuality = 1,nExpiredTime=20160,},
	{szName="�ɷ缱�ƾ�( ��ʱת��)",tbProp={0,3467},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=20160,},
	{szName="�ɷ��ѩ(��ʱת��)",tbProp={0,3468},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName="�ɷ��ѩ(���ʻ���ɱǹ)",tbProp={0,3469},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName = "�i����ֵ", nExp=7000000, nRate = 25},
}

function pActivity:VngCheckWeeklyTaskCount(nTaskID, nValue, strComparison, strFailMessage)
	local nResult = dostring("return "..%VngTaskWeekly:GetWeeklyCount(nTaskID)..strComparison..nValue)
	if not nResult then
		Talk(1, "", strFailMessage)
		return nil
	end
	return 1
end

function pActivity:VngAddWeeklyTaskCount(nTaskID, nValue)
	%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
end

function pActivity:VngGiveDaisyLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveDaisyTaskInfo) == 1 then
		Talk(1, "", "���͸��Һܶ໨�ˣ���Щ�������.")
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
	if (nTaskVal + nCount) > %nYellowDaisyMaxCount then
		Msg2Player(format("�����������ƣ���ֻ������<color=yellow>%d <color>�ջ���.", %nYellowDaisyMaxCount - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:VngGiveDaisy(nCount)
	local tbAward = {szName = "�i����ֵ", nExp=1000000}
	for i = 1, nCount do
		%tbVNG_BitTask_Lib:addTask(%tbGiveDaisyTaskInfo, 1)
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "NopHoaCucVang"})
		
		--������500, 1000�ջ����ټӽ���
		local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
		if %tbGiveDaisy_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbGiveDaisy_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("��%d�λƾջ���Ʒ", nTaskVal)})
		end
	end
end

function pActivity:VngGourdUseLimit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGourdUseTaskInfo) == 1 then
		Talk(1, "", "ʹ����Ʒ�Ѵ����ޣ�������ʹ����")
		return nil
	end
	return 1
end

function pActivity:VngUseGourd()
	local tbAward = {szName = "�i����ֵ", nExp=7000000}
	%tbVNG_BitTask_Lib:addTask(%tbGourdUseTaskInfo, 1)	
	tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "ʹ�÷��ƺ�«ƿ��ȡ����"})
	--����item
	tbAwardTemplet:Give(%tbUseGourd_ItemAward, 1, {"Event_MungPBM", "ʹ�÷��ƺ�«ƿ��ȡ����"})
	--ʹ����Ʒ���Ľ���
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGourdUseTaskInfo)
		if %tbUseGourd_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbUseGourd_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("ʹ��%d�η��ƺ�«ƿ", nTaskVal)})
		end
end

function pActivity:VngUseSteelHeartWine()
	local nDailyCount = PlayerFunLib:GetTaskDailyCount(2711)	
	local tbAward = %tbUseWine_ExpAward[nDailyCount]
	if tbAward then
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "ʹ�÷������ľ���ȡ����"})
	end
	tbAwardTemplet:Give(%tbUseWine_ItemAward, 1, {"Event_MungPBM", "ʹ�÷������ľ���ȡ����"})	
end

function pActivity:VngCheckWeeklyFeatureMatchCount(nTaskID1, nTaskID2, nTaskID3)
	local nTongKim = %VngTaskWeekly:GetWeeklyCount(nTaskID1)
	local nVuotAi = %VngTaskWeekly:GetWeeklyCount(nTaskID2)
	local nViemDe = %VngTaskWeekly:GetWeeklyCount(nTaskID3)
	local strTittle = format("���ܸ��������:\n<color=yellow>\t\t\t%-6d<color> ���ν�\n<color=yellow>\t\t\t%-6d<color>�δ���\n<color=yellow>\t\t\t%-6d<color> ���׵۴���", nTongKim, nVuotAi, nViemDe)	
	Say(strTittle, 1, "��ng/OnCancel")
end

function OnCancel()
end
