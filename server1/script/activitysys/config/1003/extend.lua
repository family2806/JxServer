Include("\\script\\activitysys\\config\\1003\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1003\\variables.lua")

local tbUseTTHT_AdditionalAward = {
	[20] = {szName = "�i����ֵ", nExp=2000000},
	[40] = {szName = "�i����ֵ", nExp=4000000},
	[60] = {szName = "�i����ֵ", nExp=6000000},
	[80] = {szName = "�i����ֵ", nExp=8000000},
	[100] = {szName = "�i����ֵ", nExp=10000000},
	[200] = {szName = "�i����ֵ", nExp=12000000},
	[300] = {szName = "�i����ֵ", nExp=14000000},
	[400] = {szName = "�i����ֵ", nExp=16000000},
	[500] = {szName = "�i����ֵ", nExp=18000000},
	[600] = {szName = "�i����ֵ", nExp=20000000},
	[700] = {szName = "�i����ֵ", nExp=20000000},
	[800] = {szName = "�i����ֵ", nExp=20000000},
	[900] = {szName = "�i����ֵ", nExp=20000000},
	[1000] = {szName = "�i����ֵ", nExp=20000000},
	[1100] = {szName = "�i����ֵ", nExp=25000000},
	[1200] = {szName = "�i����ֵ", nExp=25000000},
	[1300] = {szName = "�i����ֵ", nExp=25000000},
}

local tbUseTTHT_ItemAward = {
	{szName="������ʯ",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.35},
	{szName="��ç��ͼ��",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç��ͼ��",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç����ͼ��",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç����ͼ��",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç��ͼ��",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
	{szName="��çЬͼ��",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç����ͼ��",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
	{szName="��ç�Ͻ�ָͼ��",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
	{szName="��ç�½�ָͼ��",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
	{szName="��ç��еͼ��",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
	{szName="Ǭ��˫����",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
	{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
	{szName="���з�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="�����������",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="����������",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
	{szName="�ر��ɲ�¶",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
	{szName="�쾫�׾���",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
	{szName="�ر�׾���",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
	{szName="ɱ������",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="�շ������",tbProp={6,1,2520,1,0,0},nCount=1,nRate=5,nExpiredTime=43200},
	{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=5,nExpiredTime=43200},
	{szName="���������",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="�׵���",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="�ν��б����",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName = "�i����ֵ", nExp=25000000,nRate=1},
	{szName = "�i����ֵ", nExp=20000000,nRate=2},
	{szName = "�i����ֵ", nExp=15000000,nRate=3},
	{szName = "�i����ֵ", nExp=10000000,nRate=10},
	{szName = "�i����ֵ", nExp=6000000,nRate=25},
	{szName="��������",tbProp={6,1,2951,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="����������",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="������Ѫ��",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="���굤",tbProp={6,1,2837,1,0,0},nCount=1,nRate=5},
	{szName="��ңɢ",tbProp={6,1,2831,1,0,0},nCount=1,nRate=5},
}

function pActivity:InitNpc()
	local tbNpcPos = {
		[1] = 
		{
			{176,1441,3277},			
		},		
	}
	local tbNpc = {
		[1] = {
			szName = "������", 
			nLevel = 95,
			nNpcId = 342,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},		
	}
	for i=1,getn(tbNpc) do
		for j = 1, getn(tbNpcPos[i]) do
			local nMapId, nPosX, nPosY = unpack(tbNpcPos[i][j])
			basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
		end
	end
end

function pActivity:GiveRedRoseBud(nCount)
	local tbAward = {szName="��������",tbProp={6,1,30128,1,0,0},nCount=1,nExpiredTime=%nItemExpiredTime}
	for i = 1, nCount do
		--���齱��
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseBudLimit) ~= 1 then
			%tbVNG_BitTask_Lib:addTask(%tbGiveRedRoseBudLimit, 1)
			tbAwardTemplet:Give({szName = "�i����ֵ", nExp=1000000}, 1, {"EventVuLanBaoHieu", "DoiNuHoaHongDoNhanKinhNghiem"})
		end		
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "DoiNuHoaHongDoNhanVatPham"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "Doi1NuHoaHongDo", "1 ��������", 1)
	end
end

function pActivity:CheckGiveRedRoseLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseLimit) == 1 then
		Talk(1, "", "�����Һܶ໨�ˣ���Щ��������.")
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveRedRoseLimit)
	if (nTaskVal + nCount) > %nRedRoseMaxCount then
		Msg2Player(format("�����������ޣ���ֻ����<color=yellow>%d <color>��õ����.", %nRedRoseMaxCount - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:GiveRedRose(nCount)
	local tbAward = {szName = "����ֵ", nExp=500000}
	for i = 1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseLimit) == 1 then
			return nil
		end
		%tbVNG_BitTask_Lib:addTask(%tbGiveRedRoseLimit, 1)
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "�ͺ�õ��"})		
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "�ͺ�õ��", "500000 ����ֵ", 1)
	end
end

function pActivity:TTHT_Limit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbUseTTHTLimit) == 1 then
		Talk(1, "", "ʹ�ø���Ʒ�ѵ����ޣ�����ʹ����")
		return nil
	end
	return 1
end

function pActivity:Use_TTHT()
	local tbExpAward = {szName = "�i����ֵ", nExp=5000000}
	%tbVNG_BitTask_Lib:addTask(%tbUseTTHTLimit, 1)	
	tbAwardTemplet:Give(tbExpAward, 1, {"EventVuLanBaoHieu", "SuDungThuyTuuHoTienNhanKinhNghiem"})
	--����item
	local tbTranslog = {strFolder = %strTranLogFolder, nPromID = %nPromotionID, nResult = 1}
	tbAwardTemplet:Give(%tbUseTTHT_ItemAward, 1, {"EventVuLanBaoHieu", "SuDungThuyTuuHoTienNhanVatPham", tbTranslog})
	--ʹ����Ʒ��꽱��
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbUseTTHTLimit)
		if %tbUseTTHT_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbUseTTHT_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"EventVuLanBaoHieu", format("SuDung%dlanVatPhamThuyTuuHoTien", nTaskVal)})
		end
end

function pActivity:GiveCuuTienLimit(nCount)
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(%TSK_GIVE_CUU_TIEN_NGU_YEN_DAILY)
	if not nTaskVal then
		return nil
	end
	if (nTaskVal + nCount) > %nGive_Cuu_Tien_Daily_Max_Count then
		Msg2Player(format("�����������ޣ���ֻ����<color=yellow>%d <color>����������.", %nGive_Cuu_Tien_Daily_Max_Count - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:GiveCuuTien(nCount)		
	local tbAward = {szName = "�i����ֵ", nExp=1000000}
	PlayerFunLib:AddTaskDaily(%TSK_GIVE_CUU_TIEN_NGU_YEN_DAILY, nCount)
	for i = 1, nCount do		
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "�;�������"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "�;�������", "1000000 ����ֵ", 1)
	end
	return 1
end