-- �������ʹ�ýű�
Include("\\script\\lib\\awardtemplet.lua")

--��ʹ�ø��ֱ���ʱÿ��ľ���ֵ������5000�� - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName = "����Ьͼ��", 		tbProp = {6, 1, 2716, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "��������ͼ��", 		tbProp = {6, 1, 2717, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "��������ͼ��", 		tbProp = {6, 1, 2718, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "��ˮ����ʯ", 			tbProp = {6, 1, 30040, 1, 0, 0}, 	nRate = 44},
--	{szName = "����ʯ", 			tbProp = {6, 1, 2280, 1, 0, 0}, 	nRate = 27.34},
--	{szName = "��겹Ѫ����С��", 	tbProp = {6, 1, 2583, 1, 0, 0}, 	nRate = 18.3,	nCount = 10},
--	{szName = "��겹Ѫ��(��)",	tbProp = {6, 1, 2582, 1, 0, 0},		nRate = 10,		nCount = 10},

--��ʹ�ø��ֱ���ʱÿ��ľ���ֵ������5000�� - Modified by DinhHQ - 20110428	
--	{szName="�i����ֵ", nExp=5000000, nRate=30},
--	{szName="�i����ֵ", nExp=10000000, nRate=20},
--	{szName="�i����ֵ", nExp=15000000, nRate=15},
--	{szName="�i����ֵ", nExp=20000000, nRate=10},
	{szName="�i����ֵ 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "�������")
				end,
				nRate = 30,
	},
	{szName="�i����ֵ 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "�������")
				end,
				nRate = 20,
	},
	{szName="�i����ֵ 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "�������")
				end,
				nRate = 15,
	},
	{szName="�i����ֵ 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "�������")
				end,
				nRate = 10,
	},
	
	{szName="�����������", tbProp={6,1,1781,1,0,0}, tbParam={60}, nRate=8},
	{szName="��Ч�ɲ�·", tbProp={6,1,1181,1,0,0}, nRate=7},
	{szName="������¶", tbProp={6,1,2266,1,0,0}, nRate=5},
	{szName="������¶", tbProp={6,1,2268,1,0,0}, nRate=2},
	{szName="ǧ����¶", tbProp={6,1,2267,1,0,0}, nRate=1},
	{szName="���з�", tbProp={6,1,1266,1,0,0}, nRate=2, nExpiredTime=20160},

}

function main()
	if (CalcFreeItemCellCount() < 1) then
		Say("װ������Ҫ��<color=red>1<color> ��λ�����콱.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseGuardAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("invalid rate: %d", rate))
	end
end

