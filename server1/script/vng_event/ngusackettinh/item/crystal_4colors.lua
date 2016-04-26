Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal4Col = {}

function main(itemidx)
	--kiem tra dieu kien su dung vat pham
	if(tbNSKT_Crystal:checkCondition() == 0)then
		Talk(1, "", "�㲻������ʹ����Ʒ��Ҫ��50�����ϳ�ֵ�û�")
		return 1
	end
	-- het event, ��Ʒʹ�õ���
	if (tbNSKT_Crystal:isExpired(itemidx) == 1) then
		Msg2Player("��Ʒʹ�ù��ڣ��Զ���ʧ.")
		return 0; -- delete item
	end
	-- ʹ����Ʒ�ɹ���ɾ��item
	local nResult, szErrorMessage = tbNSKT_Crystal4Col:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 --��ɾ��item	
		end
	end
end

function tbNSKT_Crystal4Col:UseItem()
	if (tbNSKT_Crystal:isMaxItemUse() == 1 ) then	
		return 0, "����������޶�ʹ�ø���Ʒ��!"
	end
	if (tbNSKT_Crystal:checkBag(1) == 0)then
		return 0, "Ϊ�����Ʋ���������һ��װ����λ�����ʹ�ø���Ʒ!" --װ�������λ������ɾ����Ʒ
	end	
	
	--�������齱����
	local tbExp = {
							{n_Exp =5e6, n_Rate = 20},
							{n_Exp =6e6, n_Rate = 65},
							{n_Exp =8e6, n_Rate = 12},
							{n_Exp =10e6, n_Rate = 2},
							{n_Exp =20e6, n_Rate = 1}	
						};							
	local nTaskValue = GetBitTask(tbNSKT_Crystal.nTaskID, tbNSKT_Crystal.nStartBit, tbNSKT_Crystal.nEndBit)
	local nTemp = (tbNSKT_Crystal.nMaxExp  - nTaskValue) * tbNSKT_Crystal.nScaleFactor
	--neu tbExp = nil, ������������1ɾ����Ʒ
	if (not tbExp) then
		return 1;
	end
	-- ���鲻�ܳ���8ti����
	for i = 1, getn(tbExp) do
		if (nTemp < tbExp[i].n_Exp) then
			tbExp[i].n_Exp = nTemp
		end
	end		
	
	local tbAward = {}
	for i = 1, getn(tbExp) do
		tbAward[i] = {
								[1] = {nExp = tbExp[i].n_Exp},
								[2] = 
										{
											pFun = function (tbItem, nItemCount, szLogTitle)
												%tbNSKT_Crystal:addTask(%tbExp[%i].n_Exp)
											end
										},
								nRate = tbExp[i].n_Rate,
							}
	end
	--����������Ʒ���齱����

	--������Ʒ������
	local tbItemAward = 
		{
			{szName="Į��������",tbProp={6,1,1448,1,0,0},nRate=2,nCount=1},
			{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nRate=2,nCount=1},
			{szName="Ԫ˧���",tbProp={0,11,447,1,0,0},nRate=2,nCount=1},
			{szName="�������",tbProp={6,1,2402,1,0,0},nRate=12,nCount=1},
			{szName="����",nJxb=1000000,nRate=10,nCount=1},
			{szName="����",nJxb=2000000,nRate=2,nCount=1},
			{szName="����",nJxb=5000000,nRate=1,nCount=1},
			{szName="����",nJxb=10000000,nRate=0.2,nCount=1},
			{szName="���������",tbProp={6,1,2517,1,0,0},nRate=3,nCount=1},
			{szName="���������",tbProp={6,1,2520,1,0,0},nRate=3,nCount=1},
			{szName="�����������",tbProp={6,1,1781,1,0,0},nRate=3,nCount=1,tbParam={60}},
			{szName="���",tbProp={6,1,2311,1,0,0},nRate=4.3,nCount=1},
			{szName="������",tbProp={6,1,30078,1,0,0},nRate=24,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
			{szName="������",tbProp={6,1,2256,1,0,0},nRate=4,nCount=1},
			{szName="������",tbProp={6,1,2115,1,0,0},nRate=1,nCount=1},
			{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nRate=1,nCount=1},
			{szName="������¶",tbProp={6,1,2266,1,0,0},nRate=4,nCount=1},
			{szName="ǧ����¶",tbProp={6,1,2267,1,0,0},nRate=3,nCount=1},
			{szName="������¶",tbProp={6,1,2268,1,0,0},nRate=2,nCount=1},
			{szName="���丣������",tbProp={6,1,1817,1,0,0},nRate=5,nCount=1},
			{szName="ɱ������",tbProp={6,1,2339,1,0,0},nRate=2,nCount=1},
			{szName="���з�",tbProp={6,1,1266,1,0,0},nRate=0.3,nCount=1,nExpiredTime=14400},
			{szName="��ɽѩ��",tbProp={6,1,1431,1,0,0},nRate=0.1,nCount=1},
			{szName="��Գ��",tbProp={6,1,2351,1,0,0},nRate=0.1,nCount=1},
			{szName="�������",tbProp={6,1,2355,1,0,0},nRate=3,nCount=1},
			{szName="��Ч�ɲ�¶",tbProp={6,1,1181,1,0,0},nRate=6,nCount=1},
		}
	--����������Ʒ������	
	if (tbAward) then
		tbNSKT_Crystal:giveAward(tbAward, "��ɫ�ᾧ���齱��");
	end	
	if(tbItemAward)then
		tbNSKT_Crystal:giveAward(tbItemAward, "��ɫ�ᾧ����");
	end
	return 1;	
end
