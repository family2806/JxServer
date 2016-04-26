------------------------------------------------------------------------------------------------
--Author: NgaVN
--Des: Event Ph?N?Vi�t Nam
--Date: 2011-10-13
------------------------------------------------------------------------------------------------
Include("\\script\\activitysys\\config\\1007\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1007\\variables.lua")

--���齱��
local tbUseBTT_AdditionalAward = {
	[50] 		= {szName = "�i����ֵ", nExp=5000000},
	[100] 	= {szName = "�i����ֵ", nExp=5000000},
	[200] 	= {szName = "�i����ֵ", nExp=5000000},
	[300] 	= {szName = "�i����ֵ", nExp=10000000},
	[400] 	= {szName = "�i����ֵ", nExp=10000000},
	[500] 	= {szName = "�i����ֵ", nExp=10000000},
	[600] 	= {szName = "�i����ֵ", nExp=15000000},
	[700] 	= {szName = "�i����ֵ", nExp=15000000},
	[800] 	= {szName = "�i����ֵ", nExp=20000000},
	[900] 	= {szName = "�i����ֵ", nExp=25000000},
	[1000] 	= {szName = "�i����ֵ", nExp=50000000},
}

--local tbLogUseIceCrystals = {
--	[500] = "�Ͻ���ʯ��Ʒ500��",
--	[1000] = "�Ͻ���ʯ��Ʒ1000��",
--	[1500] = "�Ͻ���ʯ��Ʒ1500��",	
--	[1500] = "�Ͻ���ʯ��Ʒ2000��",		
--}

--Ph�n th��ng Item
local tbUseBTT_ItemAward = {
	[1] = {szName="��ç����ͼ��",				tbProp	= {6,1,2714,1,0,0}, nCount=1,nRate= 1},
	[2] = {szName="��ç���ͼ��",					tbProp	= {6,1,2715,1,0,0}, nCount=1,nRate=1},
	[3] = {szName = "��ç����ͼ��", 				tbProp = {6,1,2717,1,0,0}, nCount=1, nRate = 1},	
	[4] = {szName = "��ç����ͼ��", 				tbProp = {6,1,2718,1,0,0}, nCount=1, nRate = 1},
	[5] = {szName = "��ç��ͼ��", 						tbProp = {6,1,2720,1,0,0}, nCount=1, nRate = 1},
	[6] = {szName = "��çЬͼ��", 						tbProp = {6,1,2716,1,0,0}, nCount=1, nRate = 1},		
	[7] = {szName = "��ç����ͼ��", 			tbProp = {6,1,2719,1,0,0}, nCount=1, nRate = 1},
	[8] = {szName = "��ç�Ͻ�ָͼ��", 	tbProp = {6,1,2721,1,0,0}, nCount=1, nRate = 0.5},
	[9] = {szName = "��ç�½�ָͼ��", 			tbProp = {6,1,2722,1,0,0}, nCount=1, nRate = 0.5},
	[10] = {szName = "��ç��еͼ��", 				tbProp = {6,1,2723,1,0,0}, nCount=1, nRate = 0.5},
	[11] = {szName="��ç��",									tbProp = {6,1,2350,1,0,0},nCount=1, nRate=0.2},
	[12] = {szName="��Գ��",									tbProp = {6,1,2351,1,0,0},nCount=1, nRate=0.3},
	[13] = {szName="������", 											tbProp = {6,1,2349,1,0,0}, nCount=1, nRate = 0.01},	
	[14] = {szName="������",								tbProp = {6,1,2352,1,0,0},nCount=1,nRate=0.5},
	[15] = {szName="��¹��",										tbProp = {6,1,2353,1,0,0},nCount=1,nRate=1},
	[16] = {szName="�����",									tbProp = {6,1,2369,1,0,0},nCount=1,nRate=1},
	[17] = {szName="������ʯ",							tbProp = {6,1,2125,1,0,0},nCount=1,nRate=25},
	[18] = {szName="�ν��б���",					tbProp = {6,1,30083,1,0,0},nCount=1,nRate=3, nExpiredTime=10080},
	[19] = {szName="�ν��б����",				tbProp = {6,1,30084,1,0,0},nCount=1,nRate=1, nExpiredTime=10080},
	[20] = {szName="��Ѫ��",								tbProp = {6,1,2117,1,0,0},nCount=1,nRate=1},  --20111019
	[21] = {szName="ɱ������",							tbProp = {6,1,2339,1,0,0},nCount=1,nRate=2},  --20111019
	[22] = {szName="���",											tbProp = {6,1,2311,1,0,0},nCount=1,nRate=1},
	[23] = {szName="ɽ������ͼ(1000��)", tbProp = {6,1,2514,1,0,0}, nCount=1, nRate=3},
	[24] = {szName="Į��������",				tbProp = {6,1,1448,1,0,0},nCount=1,nRate=2},	--20111019
	[25] = {szName="΢ɽ���������",			tbProp = {6,1,2525,1,1,0},nCount=1,nRate=2},		--20111019   - L�nh B�i Vi S�n ��o L?Bao				
	[26] = {szName="������",							tbProp = {6,1,30104,1,0,0},nCount=1,nRate=0.3},
	[27] = {szName = "��֮��", 							tbProp = {6,1,3002,1,0,0},nCount=1,nRate=0.1},
	[28] = {szName="�ر��ɲ�¶",						tbProp = {6,1,1181,1,0,0},nCount=1,nRate=6.74},  --20111019
	[29] = {szName="������",									tbProp = {6,1,2115,1,0,0},nCount=1,nRate=1},		--20111019
	[30] = {szName = "���ڿ�ͼ��", 							tbProp = {6,1,2982,1,0,0}, nCount=1,nRate=0.05},
	[31] = {szName="������ͼ��",								tbProp = {6,1,2983,1,0,0},nCount=1,nRate = 0.05},
	[32] = {szName="����Ьͼ��",								tbProp = {6,1,2984,1,0,0},nCount=1,nRate = 0.01},	
	[33] = {szName="��������ͼ��",						tbProp = {6,1,2985,1,0,0},nCount=1, nRate = 0.01},
	[34] = {szName="���ڻ���ͼ��",						tbProp = {6,1,2986,1,0,0},nCount=1, nRate = 0.01},
	[35] = {szName="��������ͼ��",					tbProp = {6,1,2987,1,0,0},nCount=1, nRate = 0.05},
	[36] = {szName="������ͼ��",								tbProp = {6,1,2988,1,0,0},nCount=1, nRate = 0.05},
	[37] = {szName="�����Ͻ�ָͼ��",				tbProp = {6,1,2989,1,0,0},nCount=1, nRate = 0.04},
	[38] = {szName="�����½�ָͼ��",						tbProp = {6,1,2990,1,0,0},nCount=1, nRate = 0.04},
	[39] = {szName="������еͼ��",						tbProp = {6,1,2991,1,0,0},nCount=1, nRate = 0.04},
	[40] = {szName = "�i����ֵ", 							nExp=5000000, nRate = 15},
	[41] = {szName = "�i����ֵ", 							nExp=10000000, nRate = 10},
	[42] = {szName = "�i����ֵ", 							nExp=20000000, nRate = 2},
	[43] = {szName="������",						        tbProp = {6,1,2566,1,0,0},nCount=1, nRate = 10},   --20111019
	[44] = {szName="�Ի͹�",						            tbProp={6,1,907,1,0,0},nCount=1,nRate=1, nExpiredTime=10080},            --20111019
	[45] = {szName="�Ի͹���",					    	tbProp={6,1,1075,1,0,0},nCount=1, nRate = 2, nExpiredTime=10080},       --20111019
}
	
--Function ����ʯ����
function pActivity:HandInHoangThachLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveHoangThachLimit) == 1 then
		Talk(1, "", "�����Һܶ��ʯ�ˣ���Щ��ʯ������.");
		Msg2Player("�����Һܶ��ʯ�ˣ���Щ��ʯ������.");
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveHoangThachLimit)
	if (nTaskVal + nCount) > %nHoangThachMaxCount then
		Msg2Player(format("�����������ƣ���ֻ�ܽ�<color=yellow>%d <color>��ʯ��.", %nHoangThachMaxCount - nTaskVal))
		return nil
	end
	return 1
end

--Function ����ʯ
function pActivity:HandInHoangThach(nCount)		
	local tbAward = {szName = "�i����ֵ", nExp=1000000};
	
	for i = 1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveHoangThachLimit) == 1 then
			return nil
		end
		%tbVNG_BitTask_Lib:addTask(%tbGiveHoangThachLimit, 1)
		tbAwardTemplet:Give(tbAward, 1, {"Event_PNVN", "����ʯ��Ʒ"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "����ʯ��Ʒ", "1000000 exp", 1)			
	end
	--Ghi Log	
end


--Function ����
function pActivity:UseBTT_Limit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbUseBTTLimit) == 1 then
		Talk(1, "", "ʹ����Ʒ�Ѵ����ޣ�������ʹ����")
		Msg2Player("ʹ����Ʒ�Ѵ����ޣ�������ʹ����");
		return nil
	end
	return 1
end

function pActivity:Use_BTT()
	local tbExpAward = {szName = "�i����ֵ", nExp=6000000}
	%tbVNG_BitTask_Lib:addTask(%tbUseBTTLimit, 1)	
	--���齱��
	tbAwardTemplet:Give(tbExpAward, 1, {"Event_PNVN", "ʹ�ñ���ʯ��ȡ��Ʒ"});
	--item����
	local tbTranslog = {strFolder = %strTranLogFolder, nPromID = %nPromotionID, nResult = 1}	
	tbAwardTemplet:Give(%tbUseBTT_ItemAward, 1, {"Event_PNVN", "ʹ�ñ���ʯ��ȡ��Ʒ", tbTranslog});
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbUseBTTLimit);
	--����齱��
	if %tbUseBTT_AdditionalAward[nTaskVal] then
		local tbTempAward = %tbUseBTT_AdditionalAward[nTaskVal]
		tbAwardTemplet:Give(tbTempAward, 1, {"Event_PNVN", format("ʹ��%d�α���ʯ", nTaskVal)})
		%tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, format("ʹ��%d�α���ʯ", nTaskVal), tbTempAward.nExp.." Exp", 1)
		Msg2Player(format("<color=green>��ϲ��ʹ����Ʒ%s %d ��, ���%d ����ֵ<color>", "����ʯ", nTaskVal, tbTempAward.nExp))
	end
end
