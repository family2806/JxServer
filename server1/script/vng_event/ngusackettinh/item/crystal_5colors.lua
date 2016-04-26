Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal5Col = {}

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
	-- ʹ����Ʒ�ɹ���ɾ�� item
	local nResult, szErrorMessage = tbNSKT_Crystal5Col:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- ��ɾ��item	
		end
	end
end

--su dung item, gia tri tra ve:
function tbNSKT_Crystal5Col:UseItem()
	if (tbNSKT_Crystal:isMaxItemUse() == 1 ) then	
		return 0, "����������޶�ʹ�ø���Ʒ��!"
	end
	if (tbNSKT_Crystal:checkBag(6) == 0)then
		return 0, "Ϊ�����Ʋ���������6��װ����λ�����ʹ�ø���Ʒ!" --װ�������λ������ɾ����Ʒ
	end
			
	--�������齱����
	local tbExp = {
							{n_Exp =25e6, n_Rate = 40},
							{n_Exp =30e6, n_Rate = 45},
							{n_Exp =40e6, n_Rate = 12},
							{n_Exp =50e6, n_Rate = 2},
							{n_Exp =100e6, n_Rate = 1}	
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
		tbAward[i] = 
			{
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
		{szName="��Գ��",tbProp={6,1,2351,1,0,0},nRate=2,nCount=1},
		{szName="��Ч�׾���",tbProp={6,1,1157,1,0,0},nRate=6,nCount=1},
		{szName="�쾧�׾���",tbProp={6,1,2183,1,0,0},nRate=8,nCount=1},
		{szName="��Ԫ��¶",tbProp={6,1,2312,1,0,0},nRate=3,nCount=5},
		{szName="�������",tbProp={6,1,2402,1,0,0},nRate=5,nCount=5},
		{szName="���ܻԻ͹�",tbProp={6,1,2271,1,0,0},nRate=9.3,nCount=2},
		{szName="����",nJxb=5000000,nRate=10,nCount=1},
		{szName="����",nJxb=10000000,nRate=2,nCount=1},
		{szName="����",nJxb=20000000,nRate=1,nCount=1},
		{szName="����",nJxb=50000000,nRate=0.2,nCount=1},
		{szName="������",tbProp={6,1,2115,1,0,0},nRate=2,nCount=3},
		{szName="��Ѫ��",tbProp={6,1,2117,1,0,0},nRate=2,nCount=3},
		{szName="���з�",tbProp={6,1,1266,1,0,0},nRate=1.5,nCount=1,nExpiredTime=14400},
		{szName="�����������",tbProp={6,1,1781,1,0,0},nRate=5,nCount=5,tbParam={60}},
		{szName="�ٻ�����",tbProp={6,1,30074,1,0,0},nRate=16,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
		{szName="������",tbProp={6,1,2256,1,0,0},nRate=2,nCount=5},
		{szName="�ĺ���ң�����",tbProp={6,1,2398,1,0,0},nRate=1,nCount=1},
		{szName="������յ����",tbProp={6,1,2399,1,0,0},nRate=1,nCount=1},
		{szName="�������ε����",tbProp={6,1,2400,1,0,0},nRate=1,nCount=1},
		{szName="�������ǲ�",tbProp={6,1,1674,1,0,0},nRate=0.5,nCount=1},
		{szName="ǧ�����ǲ�",tbProp={6,1,1675,1,0,0},nRate=0.3,nCount=1},
		{szName="������ʻ�",tbProp={6,1,2265,1,0,0},nRate=0.2,nCount=1},
		{szName="Ԫ˧���",tbProp={0,11,447,1,0,0},nRate=4,nCount=1},
		{szName="��ɽѩ��",tbProp={6,1,1431,1,0,0},nRate=1,nCount=1},
		{szName="��Ч�ɲ�¶",tbProp={6,1,1181,1,0,0},nRate=4,nCount=2},
		{szName="���������",tbProp={6,1,2517,1,0,0},nRate=5,nCount=5},
		{szName="���������",tbProp={6,1,2520,1,0,0},nRate=5,nCount=5},
		{szName="�ƽ�֮��",tbProp={6,1,907,1,0,0},nRate=2,nCount=1,nExpiredTime=10080},
	}
	--	}
	--����������Ʒ������	
	
	--��Ʒ��������
	local tbStarAward =
		{
			[1] = {szName="������",tbProp={6,1,30078,1,0,0},nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
			nRate = 100
		}
		
	--tang thuong
	if (tbAward)then
		tbNSKT_Crystal:giveAward(tbAward, "��ɫ�ᾧ���齱��");	
	end
	if(tbStarAward)then
		tbNSKT_Crystal:giveAward(tbStarAward, "��ɫ�ᾧ�����ǽ���");
	end		
	if (tbItemAward)then
		tbNSKT_Crystal:giveAward(tbItemAward, "��ɫ�ᾧ����");
	end
	return 1;		
end
