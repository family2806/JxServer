-- �������ʹ�ýű�
Include("\\script\\lib\\awardtemplet.lua")

--��ʹ�ø��ֱ���ʱÿ��ľ���ֵ������5000�� - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName="����ֵ 1", 
--				pFun = function (tbItem, nItemCount, szLogTitle)
--					%tbvng_ChestExpAward:ExpAward(1500000, "������� (��)")
--				end,
--				nRate = 60,
--	},
	{szName="�i����ֵ2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "������� (��)")
				end,
				nRate = 97.20,
	},
	{szName="����ֵ3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "������� (��)")
				end,
				nRate = 2,
	},
	{szName="����ֵ4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "������� (��)")
				end,
				nRate = 0.05,
	},
	{szName="����ֵ5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "�������(��)")
				end,
				nRate = 0.02,
	},
	{szName="����ֵ 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "�������(��)")
				end,
				nRate = 0.01,
	},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "������",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "��Գ��",			tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.10},
	{szName = "Ԫ˧���",	tbProp = {0, 11, 447, 1, 0, 0}, nRate = 0.10},
	{szName = "������¶",		tbProp = {6, 1, 2266, 1, 0, 0}, nRate = 0.05},
	{szName = "������¶",		tbProp = {6, 1, 2268, 1, 0, 0}, nRate = 0.02},
	{szName = "ǧ����¶",		tbProp = {6, 1, 2267, 1, 0, 0}, nRate = 0.01},	
	{szName = "���з�",			tbProp = {6, 1, 1266, 1, 0, 0}, nRate = 0.01, nExpiredTime = 14 * 24 * 60},
	
--��ʹ�ø��ֱ���ʱÿ��ľ���ֵ������5000�� - Modified by DinhHQ - 20110428
--	{nExp = 1500000,  nRate = 48.02},
--	{nExp = 2000000,  nRate = 30},
--	{nExp = 5000000,  nRate = 5},
--	{nExp = 10000000, nRate	= 3},
--	{nExp = 20000000, nRate	= 2},
--	{nExp = 50000000, nRate	= 1},	

	{szName = "����Կ��",		tbProp = {6, 1, 2744, 1, 0, 0}, nRate = 0.1},
	{szName = "��Ԫ��¶",		tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 0.01},
	{szName = "���",		tbProp = {6, 1, 2311, 1, 0, 0}, nRate = 0.01},
	{szName = "�����������",	tbProp = {6, 1, 1781, 1, 0, 0}, nRate = 0.1, tbParam = {60}},
	{szName = "��Ч�ɲ�¶",		tbProp = {6, 1, 1181, 1, 0, 0}, nRate = 0.1},
}

function main(nItemIndex)
	if (CalcFreeItemCellCount() < 1) then
		Say("װ������Ҫ��<color=red>1<color>��λ�����콱.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseCityAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("total rate is wrong", rate))
	end
end

test()
