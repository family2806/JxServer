Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

function GetDesc(nItem)
	return ""
end

function main(nItem)
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>�밲��һ��װ��������Ҫ��һ����λ��Ȼ��򿪱���")
		return 1
	end
	local nCount = CalcItemCount(3, 6, 1, 2744, -1)
	if nCount >= 1 then
		--���������ӣ�Fix ����ʧȥ����Կ��- Modified by DinhHQ -20110812
    		if ConsumeItem(3, 1, 6, 1, 2744, -1) ~= 1 then
    			Msg2Player("��Ҫ����Կ�ײ��ܴ򿪱���")
			return 1
    		end
    	--ConsumeEquiproomItem(1, 6, 2812, 1, -1);--�۳���ʹ����
	
tbAward = {
	{szName="����ֵ 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(1500000, "��ʹ����")
				end,
				nRate = 60,
	},
	{szName="����ֵ2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "��ʹ����")
				end,
				nRate = 97.20,
	},
	{szName="����ֵ3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "��ʹ����")
				end,
				nRate = 2,
	},
	{szName="����ֵ4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "��ʹ����")
				end,
				nRate = 0.05,
	},
	{szName="����ֵ5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "��ʹ����")
				end,
				nRate = 0.02,
	},
	{szName="����ֵ 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "��ʹ����")
				end,
				nRate = 0.01,
	},
	{szName = "�ɲ�¶",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "�ɲ�¶",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "�ɲ�¶",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "�ɲ�¶",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "�ɲ�¶",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "�ɲ�¶",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "��Գ��",			tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.10},
	{szName = "������",		tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.05},
	{szName = "����Կ��",		tbProp = {6, 1, 2744, 1, 0, 0}, nRate = 0.1},
	{szName = "��Ԫ��¶",		tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 0.01},
	{szName = "���",		tbProp = {6, 1, 2311, 1, 0, 0}, nRate = 0.01},
	{szName = "�����������",	tbProp = {6, 1, 1781, 1, 0, 0}, nRate = 0.1, tbParam = {60}},
	{szName = "��Ч�ɲ�¶",		tbProp = {6, 1, 1181, 1, 0, 0}, nRate = 0.1},
}
    	
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseCityAward"})
    	return 0
	else
		Msg2Player("��Ҫһ������Կ�ײ��ܴ򿪱���")
		return 1
	end
end
