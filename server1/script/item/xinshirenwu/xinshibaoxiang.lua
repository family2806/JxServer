Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

function GetDesc(nItem)
	return ""
end

function main(nItem)
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>请安排一下装备，至少要留一个空位，然后打开宝箱")
		return 1
	end
	local nCount = CalcItemCount(3, 6, 1, 2744, -1)
	if nCount >= 1 then
		--当放入箱子，Fix 错误不失去如意钥匙- Modified by DinhHQ -20110812
    		if ConsumeItem(3, 1, 6, 1, 2744, -1) ~= 1 then
    			Msg2Player("需要如意钥匙才能打开宝箱")
			return 1
    		end
    	--ConsumeEquiproomItem(1, 6, 2812, 1, -1);--扣除信使宝箱
	
tbAward = {
	{szName="经验值 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(1500000, "信使宝箱")
				end,
				nRate = 60,
	},
	{szName="经验值2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "信使宝箱")
				end,
				nRate = 97.20,
	},
	{szName="经验值3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "信使宝箱")
				end,
				nRate = 2,
	},
	{szName="经验值4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "信使宝箱")
				end,
				nRate = 0.05,
	},
	{szName="经验值5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "信使宝箱")
				end,
				nRate = 0.02,
	},
	{szName="经验值 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "信使宝箱")
				end,
				nRate = 0.01,
	},
	{szName = "仙草露",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "仙草露",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "仙草露",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "仙草露",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "仙草露",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "仙草露",			tbProp = {6, 1, 71, 1, 0, 0}, nRate = 0.01},
	{szName = "玄猿令",			tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.10},
	{szName = "紫蟒令",		tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.05},
	{szName = "如意钥匙",		tbProp = {6, 1, 2744, 1, 0, 0}, nRate = 0.1},
	{szName = "混元灵露",		tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 0.01},
	{szName = "玉罐",		tbProp = {6, 1, 2311, 1, 0, 0}, nRate = 0.01},
	{szName = "回天再造锦囊",	tbProp = {6, 1, 1781, 1, 0, 0}, nRate = 0.1, tbParam = {60}},
	{szName = "特效仙草露",		tbProp = {6, 1, 1181, 1, 0, 0}, nRate = 0.1},
}
    	
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseCityAward"})
    	return 0
	else
		Msg2Player("需要一个如意钥匙才能打开宝箱")
		return 1
	end
end
