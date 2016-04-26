-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 玉璧宝箱
-- 文件名　：yubi_baoxiang.lua
-- 创建者　：子非魚
-- 创建时间：2011-03-23 17:08:58

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua")

--在使用各类宝箱时，经验值限制是3亿. - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

local tbAward = 
{
	[1]={szName="紫蟒盔图谱",tbProp={6,1,2714,1,0,0},nRate = 0.15,},
	[2]={szName="紫蟒衣图谱",tbProp={6,1,2715,1,0,0},nRate = 0.15,},
	[3]={szName="紫蟒腰带图谱",tbProp={6,1,2717,1,0,0},nRate = 0.15,},
	[4]={szName="紫蟒护腕图谱",tbProp={6,1,2718,1,0,0},nRate = 0.15,},
	[5]={szName="紫蟒项链图谱",tbProp={6,1,2719,1,0,0},nRate = 0.01,},
	[6]={szName="紫蟒佩图谱",tbProp={6,1,2720,1,0,0},nRate = 0.15,},
	[7]={szName="紫蟒鞋图谱",tbProp={6,1,2716,1,0,0},nRate = 0.15,},
	[8]={szName="紫蟒上戒指图谱",tbProp={6,1,2721,1,0,0},nRate = 0.15,},
	[9]={szName="紫蟒器戒图谱",tbProp={6,1,2723,1,0,0},nRate = 0.01,},
	[10]={szName="紫蟒下戒指图谱",tbProp={6,1,2722,1,0,0},nRate = 0.01,},
	[11]={szName="紫蟒令",tbProp={6,1,2350,1,0,0},nRate = 0.1,},
	[12]={szName="玄猿令",tbProp={6,1,2351,1,0,0},nRate = 0.2,},
	[13]={szName="元帅面具",tbProp={0,11,447,1,0,0},nRate = 0.2,},
	[14]={szName="百年真露",tbProp={6,1,2266,1,0,0},nRate = 0.5,},
	[15]={szName="万年真露",tbProp={6,1,2268,1,0,0},nRate = 0.2,},
	[16]={szName="千年真露",tbProp={6,1,2267,1,0,0},nRate = 0.3,},
	[17]={szName="神行符",tbProp={6,1,1266,1,0,0},nExpiredTime=20160,nRate = 0.1,},
--在使用各类宝箱时，经验值限制是3亿. - Modified by DinhHQ - 20110428
--	[18]={nExp=1,nRate = 48.72,nCount = 1500000,},
--	[19]={nExp=1,nRate = 30.0,nCount = 2000000,},
--	[20]={nExp=1,nRate = 5.0,nCount = 5000000,},
--	[21]={nExp=1,nRate = 3.0,nCount = 10000000,},
--	[22]={nExp=1,nRate = 2.0,nCount = 20000000,},
--	[23]={nExp=1,nRate = 1.0,nCount = 50000000,},
	[18]={szName="经验值 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(1500000, "玉璧宝箱")
				end,
				nRate = 48.72,
			},
	[19]={szName="经验值 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "玉璧宝箱")
				end,
				nRate = 30.0,
			},
	[20]={szName="经验值 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "玉璧宝箱")
				end,
				nRate = 5.0,
			},
	[21]={szName="经验值 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "玉璧宝箱")
				end,
				nRate = 3.0,
			},
	[22]={szName="经验值 5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "玉璧宝箱")
				end,
				nRate = 2.0,
			},
	[23]={szName="经验值 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "玉璧宝箱")
				end,
				nRate = 1.0,
			},

	[24]={szName="如意钥匙",tbProp={6,1,2744,1,0,0},nRate = 1.0,},
	[25]={szName="混元灵露",tbProp={6,1,2312,1,0,0},nRate = 0.2,},
	[26]={szName="玉罐",tbProp={6,1,2311,1,0,0},nRate = 0.4,},
	[27]={szName="回天再造锦囊",tbProp={6,1,1781,1,0,0},tbParam = {60}, nRate = 5.0,},
	[28]={szName="特别仙草露",tbProp={6,1,1181,1,0,0},nRate = 1.0,},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	
	-- 判定如意钥匙是否存在
	local nCount = CalcItemCount(3, 6, 1, 2744, -1) 
	if nCount == 0 then
		Say("要有如意钥匙才可以打开玉璧宝箱", 1, "сng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为保护大侠的财产安全, 请整理出 %d %dx%d 的背包空间", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end
	if ConsumeItem(3, 1, 6, 1, 2744, -1) == 1 then	-- 消耗如意钥匙
		tbAwardTemplet:GiveAwardByList(%tbAward, "use yubi_baoxiang", 1);
	end
	return 0
end
