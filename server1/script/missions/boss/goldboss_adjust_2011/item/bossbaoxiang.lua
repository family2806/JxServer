-- 文件名　：bossbaoxiang.lua
-- 创建者　：wangjingjun
-- 内容　　：道具boss宝箱使用脚本
-- 创建时间：2011-08-29 11:44:06

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1]={szName="紫蟒盔图谱",tbProp={6,1,2714,1,0,0},nRate = 1.1,},
	[2]={szName="紫蟒衣图谱",tbProp={6,1,2715,1,0,0},nRate = 1.1,},
	[3]={szName="紫蟒腰带图谱",tbProp={6,1,2717,1,0,0},nRate = 1.1,},
	[4]={szName="紫蟒护腕图谱",tbProp={6,1,2718,1,0,0},nRate = 1.1,},
	[5]={szName="紫蟒项链图谱",tbProp={6,1,2719,1,0,0},nRate = 0.5,},
	[6]={szName="紫莽玉佩图谱",tbProp={6,1,2720,1,0,0},nRate = 0.5,},
	[7]={szName="紫蟒鞋图谱",tbProp={6,1,2716,1,0,0},nRate = 0.7,},
	[8]={szName="紫蟒上戒指图谱",tbProp={6,1,2721,1,0,0},nRate = 0.3,},
	[9]={szName="紫蟒下戒指图谱",tbProp={6,1,2722,1,0,0},nRate = 0.3,},
	[10]={szName="紫蟒器械图谱",tbProp={6,1,2723,1,0,0},nRate = 0.1,},
	[11]={szName="紫蟒令",tbProp={6,1,2350,1,0,0},nRate = 0.05,},
	[12]={szName="如意钥匙",tbProp={6,1,2744,1,0,0},nRate = 1,},
	[13]={nExp_tl=1,nRate = 39.29,nCount = 1500000,},
	[14]={nExp_tl=1,nRate = 32.14,nCount = 3000000,},
	[15]={nExp_tl=1,nRate = 16,nCount = 5000000,},
	[16]={nExp_tl=1,nRate = 2,nCount = 8000000,},
	[17]={nExp_tl=1,nRate = 1,nCount = 12000000,},
	[18]={nExp_tl=1,nRate = 0.2,nCount = 15000000,},
	[19]={nExp_tl=1,nRate = 0.1,nCount = 20000000,},
	[20]={szName="特效仙草露",tbProp={6,1,1181,1,0,0},nRate = 1,},
	[21]={szName="黄金印 (强化)",tbProp={0,3208,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
	[22]={szName="特效白驹丸",tbProp={6,1,1157,1,0,0},nRate = 0.02,},
	[23]={szName="黄金印 (强化)",tbProp={0,3218,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
}

function main(nIndexItem)
	nWidth = 1
	nHeight = 1
	nFreeItemCellLimit = 1
	-- 判定如意钥匙是否存在
	local nCount = CalcItemCount(3, 6, 1, 2744, -1) 
	if nCount == 0 then
		Say("需要用如意钥匙才能打开Boss宝箱!", 1, "关闭/no")
		return 1
	end
	
	local Genre, DetailType, Particular=GetItemProp(nIndexItem)
	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为保护大侠的财产，请留下g %d %dx%d 装备空位", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end
	
	ConsumeItem(3, 1, 6, 1, 2744, -1)	-- 消耗如意钥匙
	tbAwardTemplet:Give(%tbAward, 1, {"GoldBoss", "use_bossBox"})
	
	return 0
end