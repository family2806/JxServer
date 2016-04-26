-- 卫柱礼包使用脚本
Include("\\script\\lib\\awardtemplet.lua")

--当使用各种宝箱时每天的经验值上限是5000万 - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName = "紫蟒鞋图谱", 		tbProp = {6, 1, 2716, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "紫蟒腰带图谱", 		tbProp = {6, 1, 2717, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "紫蟒护腕图谱", 		tbProp = {6, 1, 2718, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "紫水晶矿石", 			tbProp = {6, 1, 30040, 1, 0, 0}, 	nRate = 44},
--	{szName = "炼晶石", 			tbProp = {6, 1, 2280, 1, 0, 0}, 	nRate = 27.34},
--	{szName = "神龟补血丹（小）", 	tbProp = {6, 1, 2583, 1, 0, 0}, 	nRate = 18.3,	nCount = 10},
--	{szName = "神龟补血丹(中)",	tbProp = {6, 1, 2582, 1, 0, 0},		nRate = 10,		nCount = 10},

--当使用各种宝箱时每天的经验值上限是5000万 - Modified by DinhHQ - 20110428	
--	{szName="经验值", nExp=5000000, nRate=30},
--	{szName="经验值", nExp=10000000, nRate=20},
--	{szName="经验值", nExp=15000000, nRate=15},
--	{szName="经验值", nExp=20000000, nRate=10},
	{szName="经验值 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "卫主礼包")
				end,
				nRate = 30,
	},
	{szName="经验值 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "卫主礼包")
				end,
				nRate = 20,
	},
	{szName="经验值 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "卫主礼包")
				end,
				nRate = 15,
	},
	{szName="经验值 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "卫主礼包")
				end,
				nRate = 10,
	},
	
	{szName="回天再造锦囊", tbProp={6,1,1781,1,0,0}, tbParam={60}, nRate=8},
	{szName="特效仙草路", tbProp={6,1,1181,1,0,0}, nRate=7},
	{szName="百年珍露", tbProp={6,1,2266,1,0,0}, nRate=5},
	{szName="万年珍露", tbProp={6,1,2268,1,0,0}, nRate=2},
	{szName="千年珍露", tbProp={6,1,2267,1,0,0}, nRate=1},
	{szName="神行符", tbProp={6,1,1266,1,0,0}, nRate=2, nExpiredTime=20160},

}

function main()
	if (CalcFreeItemCellCount() < 1) then
		Say("装备至少要有<color=red>1<color> 空位才能领奖.")
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

