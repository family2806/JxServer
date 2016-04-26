
tbAwardList = {}
tbAwardLog = {}

--you can defind award but you need to consider Bag space
tbAwardList["TREE"] = {
	[1]={szName="芒果",tbProp={6,1,3093,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[2]={szName="番荔枝果",tbProp={6,1,3094,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[3]={szName="柑子",tbProp={6,1,3095,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[4]={szName="梨子",tbProp={6,1,3096,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[5]={szName="柚子",tbProp={6,1,3097,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[6]={szName="香蕉",tbProp={6,1,3098,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[7]={szName="柿子",tbProp={6,1,3099,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[8]={szName="椰子",tbProp={6,1,3100,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[9]={szName="木瓜",tbProp={6,1,3101,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[10]={szName="无花果",tbProp={6,1,3102,1,0,0},nCount = 5,nExpiredTime=20120201,},
	}
	
tbAwardLog["TREE"] = {
	[1] = "在百果树上收获5个芒果",
	[2] = "在百果树上收获5个木瓜",
	[3] = "在百果树上收获5个柚子",
	[4] = "在百果树上收获5个梨子",
	[5] = "在百果树上收获5个无花果",
	[6] = "在百果树上收获5个香蕉",
	[7] = "在百果树上收获5个番荔枝",
	[8] = "在百果树上收获5个柿子",
	[9] = "在百果树上收获5个椰子",
	[10] = "在百果树上收获5个柑子",
	}	
	
tbAwardList["WUGUOBAIYINPAN"] = {
	[1]={nExp=1000000,},
	}	
tbAwardLog["WUGUOBAIYINPAN"] = "used wuguobaiyinpan"

tbAwardList["WUGUOBAIYINPAN_REDBAG"] = {
	{szName="新年红包(小)",tbProp={6,1,3108,1,0,0},nRate = 30.0,nExpiredTime=20120201,},
	}	
tbAwardLog["WUGUOBAIYINPAN_REDBAG"] = "使用五果银盘领新年红包"

tbAwardLog["WUGUOBAIYINPAN_USED"] = {
	[500] = "使用五果银盘500次",
	[1000] = "使用五果银盘1000次",
	}

--改变使用五果黄金盘奖励- Modified By DinhHQ - 20120103
--tbAwardList["WUGUOHUANGJINPAN"] = {
--	[1]={szName="玄晶矿石",tbProp={6,1,147,1,0,0}},
--	[2]={nExp=1,},
--	}
tbAwardLog["WUGUOHUANGJINPAN"] = "使用五果黄金盘领物品奖励"

tbAwardList["WUGUOHUANGJINPAN_REDBAG"] = {
	{szName="新年红包(小)",tbProp={6,1,3108,1,0,0},nRate = 60.0,nExpiredTime=20120201,},
	}
tbAwardLog["WUGUOHUANGJINPAN_REDBAG"] = "使用五果黄金盘领新年红包"

tbAwardList["WUGUOHUANGJINPAN_USED"] = {
	[100] = {nExp=10000000,},
	[200] = {nExp=10000000,},
	[300] = {nExp=10000000,},
	[400] = {nExp=10000000,},
	[500] = {nExp=20000000,},
	[600] = {nExp=20000000,},
	[700] = {nExp=20000000,},
	[800] = {nExp=20000000,},
	[900] = {nExp=20000000,},
	[1000] = {nExp=30000000,},
	[1100] = {nExp=30000000,},
	[1200] = {nExp=30000000,},
	[1300] = {nExp=30000000,},
	[1400] = {nExp=30000000,},
	[1500] = {nExp=40000000,},
	[1600] = {nExp=40000000,},
	[1700] = {nExp=40000000,},
	[1800] = {nExp=40000000,},
	[1900] = {nExp=40000000,},
	--Change request event 节气- Modified By DinhHQ - 20120103
	--[2000] = {nExp=50000000,},	
	[2000] = {szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,},
	}

tbAwardLog["WUGUOHUANGJINPAN_USED"] = {
	[100] = "使用五果黄金盘100次",
	[200] = "使用五果黄金盘200次",
	[300] = "使用五果黄金盘300次",
	[400] = "使用五果黄金盘400次",
	[500] = "使用五果黄金盘500次",
	[600] = "使用五果黄金盘600次",
	[700] = "使用五果黄金盘700次",
	[800] = "使用五果黄金盘800次",
	[900] = "使用五果黄金盘900次",
	[1000] = "使用五果黄金盘1000次",
	[1100] = "使用五果黄金盘1100次",
	[1200] = "使用五果黄金盘1200次",
	[1300] = "使用五果黄金盘1300次",
	[1400] = "使用五果黄金盘1400次",
	[1500] = "使用五果黄金盘1500次",
	[1600] = "使用五果黄金盘1600次",
	[1700] = "使用五果黄金盘1700次",
	[1800] = "使用五果黄金盘1800次",
	[1900] = "使用五果黄金盘1900次",
	[2000] = "使用五果黄金盘2000次",
	}
--改变五果黄金盘奖励- Modified By DinhHQ - 20120103 - Server c?
tbAwardList["WUGUOHUANGJINPAN"] = {
	[1] ={nExp=6000000,}, 
	[2] = {
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.05},
		{szName="金乌金牌",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
		{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.1},
		{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
		{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1},
		{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.05},
		{szName="炎帝令",tbProp={6,1,1617,1,0,0},nCount=1,nRate=1},
		{szName="龙血丸",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="苍狼石",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.5},
		{szName="云禄石",tbProp={6,1,2711,1,0,0},nCount=1,nRate=1},
		{szName="青驹石",tbProp={6,1,2710,1,0,0},nCount=1,nRate=1},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.1},
		{szName="天精白驹丸",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3},
		{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="长生",tbProp={0,3491},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="渤海",tbProp={0,3492},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="武威",tbProp={0,3493},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="弱水",tbProp={0,3494},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="镇岳",tbProp={0,3495},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="安巴",tbProp={0,3496},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="神慧",tbProp={0,3497},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="追英",tbProp={0,3498},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="龙胆",tbProp={0,3499},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="硫磺",tbProp={0,3500},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="狂澜",tbProp={0,3501},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="翠玉冰玄",tbProp={0,3502},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="红缨",tbProp={0,3503},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="凝雪寒霜",tbProp={0,3504},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="妙解尘缘",tbProp={0,3505},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="力破军精",tbProp={0,3506},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="7级黄金印 (强化)",tbProp={0,3211},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="7级黄金印(弱化)",tbProp={0,3221},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName = "经验值", nExp=5000000,nRate=40},
		{szName = "经验值", nExp=8000000,nRate=13},
		{szName = "经验值", nExp=10000000,nRate=10},
		{szName = "经验值", nExp=15000000,nRate=5},
		{szName = "经验值", nExp=20000000,nRate=1.6},
		{szName = "经验值", nExp=50000000,nRate=0.5},
		{szName = "经验值", nExp=100000000,nRate=0.05},
	},
}
