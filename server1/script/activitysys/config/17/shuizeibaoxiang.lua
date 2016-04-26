Include("\\script\\activitysys\\config\\17\\head.lua")
-- Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

pActivity.tbAward = {}
pActivity.tbAward["shuizeibaoxiang"] = 
{	
	{szName="紫蟒盔图谱",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="紫蟒衣图谱",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="紫蟒腰带图谱",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="紫蟒护腕图谱",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="紫蟒项链图谱",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.03},
	{szName="紫蟒佩图谱",tbProp={6,1,2720,1,0,0},nCount=1,nRate=1.8},
	{szName="紫蟒鞋图谱",tbProp={6,1,2716,1,0,0},nCount=1,nRate=1.8},
	{szName="紫蟒上戒图谱",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.03},
	{szName="紫蟒下戒图谱",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.03},
	{szName="紫蟒器械图谱",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.03},
	{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.3},
	{szName="玄猿令",tbProp={6,1,2351,1,0,0},nCount=1,nRate=1},
	{szName="元帅面具",tbProp={0,11,447,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="海龙珠",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="百年珍露",tbProp={6,1,2266,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="万年珍露",tbProp={6,1,2268,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="千年珍露",tbProp={6,1,2267,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="神行符",tbProp={6,1,1266,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	
	{szName="经验值1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(3000000, "水贼宝箱")
				end,
				nRate = 25,
	},
	{szName="经验值2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "水贼宝箱")
				end,
				nRate = 17.78,
	},
	{szName="经验值3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(8000000, "水贼宝箱")
				end,
				nRate = 7,
	},
	{szName="经验值4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(12000000, "水贼宝箱")
				end,
				nRate = 4,
	},
	{szName="经验值5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "水贼宝箱")
				end,
				nRate = 2,
	},
	{szName="经验值6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "水贼宝箱")
				end,
				nRate = 1,
	},
	
	{szName="特殊仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=4},
	{ szName = "黄金印(强化)", tbProp = {0,3205}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(强化)", tbProp = {0,3206}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(强化)", tbProp = {0,3207}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(强化)", tbProp = {0,3208}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(强化)", tbProp = {0,3209}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(弱化)", tbProp = {0,3215}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(弱化)", tbProp = {0,3216}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(弱化)", tbProp = {0,3217}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(弱化)", tbProp = {0,3218}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "黄金印(弱化)", tbProp = {0,3219}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
}
