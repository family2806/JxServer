--从百宝箱性能获得的奖励 - Created By DinhHQ - 20120415
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\composeex.lua")
tbBBRAward = {}
tbBBRAward.tbFlag = {
	["LongLenhKy"] = {szName = "龙令旗", tbProp = {6, 1, 3056, 1, 0, 0}},
	["LanLenhKy"] = {szName = "麟令旗", tbProp = {6, 1, 3057, 1, 0, 0}},
	["QuyLenhKy"] = {szName = "龟令旗", tbProp = {6, 1, 3059, 1, 0, 0}},
	["PhungLenhKy"] = {szName = "凤令旗", tbProp = {6, 1, 3058, 1, 0, 0}},
}
tbBBRAward.tbProduct = {
	["LongLenhKy"] = {
		{tbProduct = {szName = "金乌发冠 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "金乌鞋 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "金乌铠 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}}, nFlagRequire = 900},
		{tbProduct = {szName = "金乌腰带 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "金乌项链 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}}, nFlagRequire = 700},
		{tbProduct = {szName = "金乌护腕 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "金乌玉佩 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}}, nFlagRequire = 750},
		{tbProduct = {szName = "金乌上戒指 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "金乌下戒指 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "金乌器械 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}}, nFlagRequire = 3000},
		{tbProduct = {szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1}, nFlagRequire = 600},
		{tbProduct = {szName="武大海",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="清平乐",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="回春",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="枯木",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="流云",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="倪泽",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="雷火劫",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="迷醉天香",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="蝶舞花飞",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="英雄帖",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["LanLenhKy"] = {
		{tbProduct = {szName="王者面具",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 400},
		{tbProduct = {szName="英雄战场面具",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime=60}, nFlagRequire = 30},
		{tbProduct = {szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 240},
		{tbProduct = {szName="风云白马",tbProp={0,10,19,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 100, },
		{tbProduct = {szName="翻羽 (使用期一个月)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 20},
		{tbProduct = {szName="翻羽(使用期3个月)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 60},
		{tbProduct = {szName="武大海",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="清平乐",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="回春",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="枯木",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="流云",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="倪泽",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="雷火劫",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="迷醉天香",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="蝶舞花飞",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="英雄帖",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["QuyLenhKy"] = {
		{tbProduct = {szName="1000 万银两", nJxb = 10000000, nCount = 1}, nFlagRequire = 8},
		{tbProduct = {szName="5000 万银两", nJxb = 50000000, nCount = 1}, nFlagRequire = 40},
		{tbProduct = {szName="10000 万银两", nJxb = 100000000, nCount = 1}, nFlagRequire = 80},
		{tbProduct = {szName="50000 万银两", nJxb = 500000000, nCount = 1}, nFlagRequire = 400},
		{tbProduct = {szName="武大海",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="武大海",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="清平乐",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="回春",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="枯木",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="流云",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="倪泽",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="雷火劫",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="迷醉天香",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="蝶舞花飞",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="英雄帖",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["PhungLenhKy"] = {
		{tbProduct = {szName="黄金印 (强化) 级数7",tbProp={0,3211},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="黄金印 (强化) 级数8",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="黄金印 (弱化) 级数7",tbProp={0,3221},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="黄金印 (弱化) 级数8",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="武大海",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="清平乐",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="回春",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="枯木",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="流云",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="倪泽",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="雷火劫",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="迷醉天香",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="蝶舞花飞",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="英雄帖",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
}
function tbBBRAward:main()
	local tb = {
		format("我想使用龙令旗换奖励/#tbBBRAward:SelectAward('%s', %d)", "LongLenhKy", 1),
		format("我想使用麟令旗换奖励/#tbBBRAward:SelectAward('%s', %d)", "LanLenhKy", 1),
		format("我想使用龟令旗换奖励/#tbBBRAward:SelectAward('%s', %d)", "QuyLenhKy", 1),
		format("我想使用凤令旗换奖励/#tbBBRAward:SelectAward('%s', %d)", "PhungLenhKy", 1),
		"放弃 Oncancel",
	}
	Describe("当收集够令旗，你可以带到我这里换奖励. 领奖名单和换取价值将不断更新.", getn(tb), tb)
end

function tbBBRAward:SelectAward(strFlag, nStartIndex)	
	local tb1 = self.tbProduct[strFlag]
	if nStartIndex < 1 or nStartIndex > getn(tb1) then
		return
	end
	local tb2
	local nEndIndex
	local tbDialog = {}
	if nStartIndex +11 > getn(tb1) then
		nEndIndex = getn(tb1)
	else
		nEndIndex = nStartIndex + 11
	end
	for i = nStartIndex, nEndIndex do
		tb2 = tb1[i]
		tinsert(tbDialog , format("%s/#tbBBRAward:MakeCompose('%s', %d)", tb2.tbProduct.szName, strFlag, i))
	end
	if nEndIndex < getn(tb1) then	
		tinsert(tbDialog, format("下一页/#tbBBRAward:SelectAward('%s', %d)", strFlag, nEndIndex + 1))
	end
	if nStartIndex > 1 then
		tinsert(tbDialog, format("返回/#tbBBRAward:SelectAward('%s', %d)", strFlag, nStartIndex - 12))
	end
	tinsert(tbDialog, "放弃Oncancel")
	Describe("请选择奖励:", getn(tbDialog), tbDialog)
end

function tbBBRAward:MakeCompose(strFlag, nProductID)
	local tbTemp = self.tbProduct[strFlag][nProductID]
	local tbMat = {}
	tbMat[1] = {}
	tbMat[1].nCount = tbTemp.nFlagRequire
	tbMat[1].szName = self.tbFlag[strFlag].szName
	tbMat[1].tbProp = self.tbFlag[strFlag].tbProp	
	local tbFormula = {		
		tbMaterial = tbMat,		
		tbProduct = tbTemp.tbProduct,	
		nWidth = 3,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	}
	pCompos = tbActivityCompose:new(tbFormula, strFlag.."DoiPhanThuong");
	pCompos:ComposeDailog(1);
end

pEventType:Reg("礼官", "风云宝殿奖励", tbBBRAward.main, {tbBBRAward})