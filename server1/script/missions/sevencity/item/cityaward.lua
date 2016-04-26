-- 攻城礼包使用脚本
Include("\\script\\lib\\awardtemplet.lua")

--在使用各种宝箱时每天的经验值上限是5000万 - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName="经验值 1", 
--				pFun = function (tbItem, nItemCount, szLogTitle)
--					%tbvng_ChestExpAward:ExpAward(1500000, "攻城礼包 (新)")
--				end,
--				nRate = 60,
--	},
	{szName="经验值2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "攻城礼包 (新)")
				end,
				nRate = 97.20,
	},
	{szName="经验值3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "攻城礼包 (新)")
				end,
				nRate = 2,
	},
	{szName="经验值4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "攻城礼包 (新)")
				end,
				nRate = 0.05,
	},
	{szName="经验值5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "攻城礼包(新)")
				end,
				nRate = 0.02,
	},
	{szName="经验值 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "攻城礼包(新)")
				end,
				nRate = 0.01,
	},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "紫蟒令",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "玄猿令",			tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.10},
	{szName = "元帅面具",	tbProp = {0, 11, 447, 1, 0, 0}, nRate = 0.10},
	{szName = "百年珍露",		tbProp = {6, 1, 2266, 1, 0, 0}, nRate = 0.05},
	{szName = "万年珍露",		tbProp = {6, 1, 2268, 1, 0, 0}, nRate = 0.02},
	{szName = "千年珍露",		tbProp = {6, 1, 2267, 1, 0, 0}, nRate = 0.01},	
	{szName = "神行符",			tbProp = {6, 1, 1266, 1, 0, 0}, nRate = 0.01, nExpiredTime = 14 * 24 * 60},
	
--在使用各种宝箱时每天的经验值上限是5000万 - Modified by DinhHQ - 20110428
--	{nExp = 1500000,  nRate = 48.02},
--	{nExp = 2000000,  nRate = 30},
--	{nExp = 5000000,  nRate = 5},
--	{nExp = 10000000, nRate	= 3},
--	{nExp = 20000000, nRate	= 2},
--	{nExp = 50000000, nRate	= 1},	

	{szName = "如意钥匙",		tbProp = {6, 1, 2744, 1, 0, 0}, nRate = 0.1},
	{szName = "混元灵露",		tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 0.01},
	{szName = "玉罐",		tbProp = {6, 1, 2311, 1, 0, 0}, nRate = 0.01},
	{szName = "回天再造锦囊",	tbProp = {6, 1, 1781, 1, 0, 0}, nRate = 0.1, tbParam = {60}},
	{szName = "特效仙草露",		tbProp = {6, 1, 1181, 1, 0, 0}, nRate = 0.1},
}

function main(nItemIndex)
	if (CalcFreeItemCellCount() < 1) then
		Say("装备至少要有<color=red>1<color>空位才能领奖.")
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
