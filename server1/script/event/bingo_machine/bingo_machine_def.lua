
BingoMachine = {}

S2C_RESULT = 1
S2C_DATA = 2


C2S_OPERATION_ROTATE = 1
C2S_OPERATION_AWARD = 2

ROTATE_SUCCESS = 0
ROTATE_ERROR_STATUS = 1
ROTATE_ERROR_PRINING = 2

S2C_GET_AWARD_SUCCESS = 0
S2C_GET_AWARD_ERR_NO_SPACE = 1
S2C_GET_AWARD_ERR_OTHER = 2



AWARD_TYPE =
{
	[1] = "A",
	[2] = "B",
	[3] = "C",
	[4] = "D",
	[5] = "E",
}

ODDS2COIN = 
{
	[1] = {1, 2},
	[2] = {5, 10},
	[3] = {10, 20},
}

tbBingoMachineAward = { 
	[1] = {szName = "龙令旗", 
		[1] = {	
			[1]={szName="龙令旗",tbProp={6,1,3056,1,0,0}, nCount=1},
			[2]={szName="龙令旗",tbProp={6,1,3056,1,0,0}, nCount=3},
			[3]={szName="龙令旗",tbProp={6,1,3056,1,0,0}, nCount=10},
			[4]={szName="龙令旗",tbProp={6,1,3056,1,0,0}, nCount=35},
			[5]={szName="龙令旗",tbProp={6,1,3056,1,0,0}, nCount=120},
	  	[6]={szName="龙令旗",tbProp={6,1,3056,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[2] = {szName = "麟令旗", 
		[1] = {	
			[1]={szName="麟令旗",tbProp={6,1,3057,1,0,0}, nCount=1},
			[2]={szName="麟令旗",tbProp={6,1,3057,1,0,0}, nCount=3},
			[3]={szName="麟令旗",tbProp={6,1,3057,1,0,0}, nCount=10},
			[4]={szName="麟令旗",tbProp={6,1,3057,1,0,0}, nCount=35},
			[5]={szName="麟令旗",tbProp={6,1,3057,1,0,0}, nCount=120},
	  	[6]={szName="麟令旗",tbProp={6,1,3057,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[3] ={szName = "凤令旗", 
		[1] = {	
			[1]={szName="凤令旗",tbProp={6,1,3058,1,0,0}, nCount=1},
			[2]={szName="凤令旗",tbProp={6,1,3058,1,0,0}, nCount=3},
			[3]={szName="凤令旗",tbProp={6,1,3058,1,0,0}, nCount=10},
			[4]={szName="凤令旗",tbProp={6,1,3058,1,0,0}, nCount=35},
			[5]={szName="凤令旗",tbProp={6,1,3058,1,0,0}, nCount=120},
	  	[6]={szName="凤令旗",tbProp={6,1,3058,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[4] ={szName = "龟令旗", 
		[1] = {	
			[1]={szName="龟令旗",tbProp={6,1,3059,1,0,0}, nCount=1},
			[2]={szName="龟令旗",tbProp={6,1,3059,1,0,0}, nCount=3},
			[3]={szName="龟令旗",tbProp={6,1,3059,1,0,0}, nCount=10},
			[4]={szName="龟令旗",tbProp={6,1,3059,1,0,0}, nCount=35},
			[5]={szName="龟令旗",tbProp={6,1,3059,1,0,0}, nCount=120},
	  	[6]={szName="龟令旗",tbProp={6,1,3059,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[5] = {szName = "KindBox", 
		[1] = {	
			[1]={szName="贵重宝箱",tbProp={6,1,3053,1,0,0}, nCount=1, nExpiredTime = 43200},
			[2]={szName="精美宝箱",tbProp={6,1,3054,1,0,0}, nCount=1, nExpiredTime = 43200},},
		[2] = {20, 80}},		
}
tbBingoMachineAwardSpace = {
	[1] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
	[2] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
	[3] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
	[4] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
  [5] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1}}
	
tbEquipList = 
{
	[1] = 
	{
		[1]={szName="金乌之乌之锦澜僧帽",tbProp={0,2056,},nQuality=1,},
		[2]={szName="金乌之珈蓝僧帽",tbProp={0,2066,},nQuality=1,},
		[3]={szName="金乌之般若僧帽",tbProp={0,2076,},nQuality=1,},
		[4]={szName="金乌之震岳盔",tbProp={0,2086,},nQuality=1,},
		[5]={szName="金乌之照胆盔",tbProp={0,2096,},nQuality=1,},
		[6]={szName="金乌之沥血盔",tbProp={0,2106,},nQuality=1,},
		[7]={szName="金乌之无意发带",tbProp={0,2116,},nQuality=1,},
		[8]={szName="金乌之凝霜发带",tbProp={0,2126,},nQuality=1,},
		[9]={szName="金乌之丁香簪",tbProp={0,2136,},nQuality=1,},
		[10]={szName="金乌之璎珞簪",tbProp={0,2146,},nQuality=1,},
		[11]={szName="金乌之幽冥发带",tbProp={0,2156,},nQuality=1,},
		[12]={szName="金乌之曼陀发带",tbProp={0,2166,},nQuality=1,},
		[13]={szName="金乌之绝情冠",tbProp={0,2176,},nQuality=1,},
		[14]={szName="金乌之碧落冠",tbProp={0,2186,},nQuality=1,},
		[15]={szName="金乌之霹雳发冠",tbProp={0,2196,},nQuality=1,},
		[16]={szName="金乌之铁骨头环",tbProp={0,2206,},nQuality=1,},
		[17]={szName="金乌之龙血头冠",tbProp={0,2216,},nQuality=1,},
		[18]={szName="金乌之炀风盔",tbProp={0,2226,},nQuality=1,},
		[19]={szName="金乌之映血冠冕",tbProp={0,2236,},nQuality=1,},
		[20]={szName="金乌之六合冠",tbProp={0,2246,},nQuality=1,},
		[21]={szName="金乌之太和冠",tbProp={0,2256,},nQuality=1,},
		[22]={szName="金乌之月影道冠",tbProp={0,2266,},nQuality=1,},
		[23]={szName="金乌之祥云道冠",tbProp={0,2276,},nQuality=1,},
	},
	[2] = 
	{
		[1]={szName="金乌之锦澜袈裟",tbProp={0,2060,},nQuality=1,},
		[2]={szName="金乌之珈蓝袈裟",tbProp={0,2070,},nQuality=1,},
		[3]={szName="金乌之般若袈裟",tbProp={0,2080,},nQuality=1,},
		[4]={szName="金乌之震岳铠",tbProp={0,2090,},nQuality=1,},
		[5]={szName="金乌之照胆铠",tbProp={0,2100,},nQuality=1,},
		[6]={szName="金乌之沥血铠",tbProp={0,2110,},nQuality=1,},
		[7]={szName="金乌之无意纱衣",tbProp={0,2120,},nQuality=1,},
		[8]={szName="金乌之凝霜衫",tbProp={0,2130,},nQuality=1,},
		[9]={szName="金乌之丁香衫",tbProp={0,2140,},nQuality=1,},
		[10]={szName="金乌之璎珞衫",tbProp={0,2150,},nQuality=1,},
		[11]={szName="金乌之无名骨衣",tbProp={0,2160,},nQuality=1,},
		[12]={szName="金乌之曼陀秘装",tbProp={0,2170,},nQuality=1,},
		[13]={szName="金乌之绝情甲衣",tbProp={0,2180,},nQuality=1,},
		[14]={szName="金乌之碧落甲衣",tbProp={0,2190,},nQuality=1,},
		[15]={szName="金乌之霹雳甲衣",tbProp={0,2200,},nQuality=1,},
		[16]={szName="金乌之铁骨丐衣",tbProp={0,2210,},nQuality=1,},
		[17]={szName="金乌之龙血丐衣",tbProp={0,2220,},nQuality=1,},
		[18]={szName="金乌之炀风甲衣",tbProp={0,2230,},nQuality=1,},
		[19]={szName="金乌之映血道袍",tbProp={0,2240,},nQuality=1,},
		[20]={szName="金乌之六合道袍",tbProp={0,2250,},nQuality=1,},
		[21]={szName="金乌太和道袍",tbProp={0,2260,},nQuality=1,},
		[22]={szName="金乌之月影道袍",tbProp={0,2270,},nQuality=1,},
		[23]={szName="金乌之祥云道袍",tbProp={0,2280,},nQuality=1,},
	},}
tbEquipSize = 
{
	[1] = {nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},	-- 盔
	[2] = {nWidth = 2, nHeight = 3, nFreeItemCellLimit = 1},  	-- 衣
}
