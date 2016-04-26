Include("\\script\\activitysys\\config\\1002\\head.lua")
Include("\\script\\activitysys\\config\\1002\\config.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1002\\variables.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")

local tbUpgradeStarAward = 
{
	[1] = 
	{
		{
			[1] = {tbProp={6,1,30118,1,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2,CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_Event雪星星/", %nPromotionID, "升级雪冰晶1级", GetItemName(nItemIdx), 1) end},
			nRate=90, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=1e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶1级", "1000000 exp 叠加", 0) end},
			nRate = 10,
		},
	},
	[2] = 
	{
		{
			[1] = {tbProp={6,1,30118,2,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶2级", GetItemName(nItemIdx), 1) end},
			nRate=85, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=2e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶2级", "2000000 exp 叠加", 0) end},
			nRate = 15,
		},
	},
	[3] = 
	{
		{
			[1] = {tbProp={6,1,30118,3,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶3级", GetItemName(nItemIdx), 1) end},
			nRate=80, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=4e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶3级", "4000000 exp 叠加", 0) end},
			nRate = 20,
		},
	},
	[4] = 
	{
		{
			[1] = {tbProp={6,1,30118,4,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶4级", GetItemName(nItemIdx), 1) end},
			nRate=70, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=6e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶4级", "6000000 exp 叠加", 0) end},
			nRate = 30,
		},
	},	
	[5] = 
	{
		{
			[1] = {tbProp={6,1,30118,5,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶5级", GetItemName(nItemIdx), 1) end},
			nRate=70, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=10e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶5级", "10000000 exp 叠加", 0) end},
			nRate = 30,
		},
	},	
	[6] = 
	{
		{
			[1] = {tbProp={6,1,30118,6,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶6级", GetItemName(nItemIdx), 1) end},
			nRate=60, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=15e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶6级", "15000000 exp 叠加", 0) end},
			nRate = 40,
		},
	},	
	[7] = 
	{
		{
			[1] = {tbProp={6,1,30118,7,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶7级", GetItemName(nItemIdx), 1) end},
			nRate=60, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=25e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶7级", "25000000 exp 叠加", 0) end},
			nRate = 40,
		},
	},
	[8] = 
	{
		{
			[1] = {tbProp={6,1,30118,8,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶8级", GetItemName(nItemIdx), 1) end},
			nRate=40, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=40e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶8级", "40000000 exp 叠加", 0) end},
			nRate = 60,
		},
	},
	[9] = 
	{
		{
			[1] = {tbProp={6,1,30118,9,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶9级", GetItemName(nItemIdx), 1) end},
			nRate=35, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=80e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶9级", "80000000 exp 叠加", 0) end},
			nRate = 65,
		},
	},
	[10] = 
	{
		{
			[1] = {tbProp={6,1,30118,10,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶10级", GetItemName(nItemIdx), 1) end},
			nRate=30, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=200e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶10级", "200000000 exp 叠加", 0) end},
			nRate = 70,
		},
	},
	[11] = 
	{
		{
			[1] = {tbProp={6,1,30118,11,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶11级", GetItemName(nItemIdx), 1) end},
			nRate=20, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=350e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶11级", "350000000 exp 叠加", 0) end},
			nRate = 80,
		},
	},
	[12] = 
	{
		{
			[1] = {tbProp={6,1,30118,12,0,0},nCount=1,nExpiredTime = nItemExpiredTime, nBindState = -2, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "升级雪冰晶12级", GetItemName(nItemIdx), 1) end},
			nRate=10, 
		},
		{
			[1] = {szName = "经验值", nExp_tl=700e6},
			[2] = {pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "升级雪冰晶12级", "700000000 exp 叠加", 0) end},
			nRate = 90,
		},
	},	
}

local tbGiveStarAward = 
{
	[1] = 
	{
		{szName = "经验值", nExp_tl=3e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶1级", "3000000 exp 叠加", 1) end},
	},
	[2] = 
	{
		{szName = "经验值", nExp_tl=6e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶2级", "6000000 exp 叠加", 1) end},
	},
	[3] = 
	{
		{szName = "经验值", nExp_tl=12e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶3级", "12000000 exp 叠加", 1) end},
	},
	[4] = 
	{
		{szName = "经验值", nExp_tl=20e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶4级", "20000000 exp 叠加", 1) end},
	},
	[5] = 
	{
		{szName = "经验值", nExp_tl=35e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶5级", "35000000 exp 叠加", 1) end},
	},
	[6] = 
	{
		{szName = "经验值", nExp_tl=50e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶6级", "50000000 exp 叠加", 1) end},
	},
	[7] = 
	{
		{szName = "经验值", nExp_tl=80e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶7级", "80000000 exp 叠加", 1) end},
	},
	[8] = 
	{
		{tbProp={6,1,30121,1,0,0},nCount=1,nExpiredTime = nItemExpiredTime, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "TangTuyetBangTinhCap8", GetItemName(nItemIdx), 1) end},
		{szName = "经验值", nExp_tl=120e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶8级", "120000000 exp 叠加", 1) end},
	},
	[9] = 
	{
		{tbProp={6,1,30122,1,0,0},nCount=1, nExpiredTime = nItemExpiredTime, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "TangTuyetBangTinhCap9", GetItemName(nItemIdx), 1) end},
		{szName = "经验值", nExp_tl=300e6},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶9级", "300000000 exp 叠加", 1) end},
	},
	[10] = 
	{
		{tbProp={6,1,30123,1,0,0},nCount=1,nExpiredTime = nItemExpiredTime, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "TangTuyetBangTinhCap10", GetItemName(nItemIdx), 1) end},
		{szName = "经验值", nExp_tl=700e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶10级", "700000000 exp 叠加", 1) end},
	},
	[11] = 
	{
		{tbProp={6,1,30124,1,0,0},nCount=1, nExpiredTime = nItemExpiredTime, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "TangTuyetBangTinhCap11", GetItemName(nItemIdx), 1) end},
		{szName = "经验值", nExp_tl=1500e6,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶11级", "1500000000 exp 叠加", 1) end},
	},
	[12] = 
	{
		{tbProp={6,1,30125,1,0,0},nCount=1, nExpiredTime = nItemExpiredTime, CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "TangTuyetBangTinhCap12", GetItemName(nItemIdx), 1) end},
		{szName = "经验值", nExp_tl=3e9,},
		{pFun = function() %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "送雪冰晶12级", "3000000000 exp 叠加", 1) end},
	},
}

local tbWoodenChest = {
	{szName="紫莽盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=14,
		CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "使用木宝箱", GetItemName(nItemIdx), 1) end},
	{szName="紫莽衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=15,
		CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "使用木宝箱", GetItemName(nItemIdx), 1) end},
	{szName="紫莽腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=14,
		CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "使用木宝箱", GetItemName(nItemIdx), 1) end},
	{szName="紫莽护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=14,
		CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "使用木宝箱", GetItemName(nItemIdx), 1) end},
	{szName="紫莽佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=14,
		CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "使用木宝箱", GetItemName(nItemIdx), 1) end},
	{szName="紫莽鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=15,
		CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "使用木宝箱", GetItemName(nItemIdx), 1) end},
	{szName="紫莽项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=14,
		CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_雪星星活动/", %nPromotionID, "使用木宝箱", GetItemName(nItemIdx), 1) end},
}


function pActivity:InitNpc()
	local tbNpcPos = {
		[1] = 
		{
			{11,3121,4997,},
			{80,1750,3000},
			{78,1532,3241},
			{162,1591,3214},
		},
		[2] = 
		{
			{11,3119,5000,},
			{80,1739,2990},
			{78,1521,3228},
			{162,1610,3211},
		},
	}
	local tbNpc = {
		[1] = {
			szName = "天精老人", 
			nLevel = 95,
			nNpcId = 1374,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "小童子", 
			nLevel = 95,
			nNpcId = 1448,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			}
	}
	for i=1,getn(tbNpc) do
		for j = 1, getn(tbNpcPos[i]) do
			local nMapId, nPosX, nPosY = unpack(tbNpcPos[i][j])
			basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
		end
	end
end

function pActivity:UpgradeStar(nLevel, nCount)
	local tbAward = %tbUpgradeStarAward[nLevel]
	if tbAward then
		for i = 1, nCount do
			tbAwardTemplet:Give(tbAward, 1, {"Event_雪星星", "升级...级雪冰晶"..nLevel})			
		end
	end
end

function pActivity:GiveStar(nLevel, nCount)
	local tbAward = %tbGiveStarAward[nLevel]
	if tbAward then
		for i = 1, nCount do
			tbAwardTemplet:Give(tbAward, 1, {"Event_雪星星", "送...级雪冰晶"..nLevel})			
		end
	end
end

function pActivity:UseWoodenChest()
	local tbAward = %tbWoodenChest
	for i = 1, 2 do
		tbAwardTemplet:Give(tbAward, 1, {"Event_雪星星", "使用木宝箱"})
	end
end

function pActivity:UseFreezingStoneBoxLog()
	%tbVngTransLog:Write("201107_Event雪星星/", %nPromotionID, "tSuDungTuyetBangThachLeHop", "10 雪冰石", 1)
end