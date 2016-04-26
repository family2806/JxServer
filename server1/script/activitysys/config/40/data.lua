
_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>恭喜 <color=yellow>%s<color=green> 已获得物品<color=yellow>%s<color=green> 当使用 <color=yellow>永久玫瑰花篮<color>", GetName(), strItemName)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end	

tbActivityNpc = {	
	[1] = {
		szName = "合成花的人", 
		nLevel = 95,
		nNpcId = 1888,
		nIsboss = 0,
		szScriptPath = "\\script\\activitysys\\npcdailog.lua",
		},
	[2] = {
		szName = "绿草", 
		nLevel = 95,
		nNpcId = 1889,
		nIsboss = 0,
		bNoRevive = 0,
		szScriptPath = "\\script\\activitysys\\config\\40\\npc_grass.lua",
		}
}

tbActivityNpcPos = {
	[1] = {
			[1] = {78,1588,3221,},
			[2] = {11,3141,5061,},
			[3] = {37,1707,3117,},
		},
	[2] = {
		{20, 3593, 6273,},
		{53, 1670, 3256,},
		{99, 1717, 3279,},
		{100, 1576, 3226,},
		{101, 1766, 3272,},
		{121, 1874, 4587,},
		{153, 1715, 3297,},
		{174, 1544, 3287,},
		},
	}
	
	
tbMonstorAward = {
	[321] = {	-- 长白山南
		[1]={szName="白玫瑰",tbProp={6,1,3117,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="黄玫瑰",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="玫瑰香袋",tbProp={6,1,3125,1,0,0},nExpiredTime=20120401,nRate = 10.0,},
		},	
	[322] = {	-- 长白山北
		[1]={szName="蓝玫瑰",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="红玫瑰",tbProp={6,1,3120,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="玫瑰香袋",tbProp={6,1,3125,1,0,0},nExpiredTime=20120401,nRate = 10.0,},
		},
	[227] = {	-- 沙漠山洞3
		[1]={szName="白玫瑰",tbProp={6,1,3117,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[2]={szName="黄玫瑰",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[3]={szName="蓝玫瑰",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		},
	[340] = {	-- 莫高窟
		[1]={szName="蓝玫瑰",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[2]={szName="黄玫瑰",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[3]={szName="红玫瑰",tbProp={6,1,3120,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		},
	}	
	
tbItemAward = {
	["3Color_Rose"] = {szName = "500000 点exp", nExp=500000},
	["4Color_Rose"] = {szName = "1000000 点exp", nExp=1000000},
	["MeiGuiXiangDai"] = {
		[1]={szName="蓝玫瑰",tbProp={6,1,3118,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="黄玫瑰",tbProp={6,1,3119,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="红玫瑰",tbProp={6,1,3120,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[4]={szName="白玫瑰",tbProp={6,1,3117,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		},		
	}	

tbItemOtherAward = {
	["3Color_Rose"] = {
		[500] = "使用500次三色花束",
		[1000] = "使用1000次三色花束",
		},
	["4Color_Rose"] = {
		[500] = "使用500次三色花束",
		[1000] = "使用1000次三色花束",
		[1500] = "使用1500次三色花束",
		},
	["Corbeil"] = {
		[100] = {
			tbAward = {nExp_tl=10000000},
			szLog = "使用永久玫瑰花篮100次",
			},
		[200] = {
			tbAward = {nExp_tl=10000000},
			szLog = "使用永久玫瑰花篮200次",
			},
		[300] = {
			tbAward = {nExp_tl=10000000},
			szLog = "使用永久玫瑰花篮300次",
			},
		[400] = {
			tbAward = {nExp_tl=10000000},
			szLog = "使用永久玫瑰花篮400次",
			},
		[500] = {
			tbAward = {nExp_tl=20000000},
			szLog = "使用永久玫瑰花篮500次",
			},
		[600] = {
			tbAward = {nExp_tl=20000000},
			szLog = "使用永久玫瑰花篮600次",
			},
		[700] = {
			tbAward = {nExp_tl=20000000},
			szLog = "使用永久玫瑰花篮700次",
			},
		[800] = {
			tbAward = {nExp_tl=20000000},
			szLog = "使用永久玫瑰花篮800次",
			},
		[900] = {
			tbAward = {nExp_tl=20000000},
			szLog = "使用永久玫瑰花篮900次",
			},
		[1000] = {
			tbAward = {nExp_tl=30000000},
			szLog = "使用永久玫瑰花篮1000次",
			},
		[1100] = {
			tbAward = {nExp_tl=30000000},
			szLog = "使用永久玫瑰花篮1100次",
			},
		[1200] = {
			tbAward = {nExp_tl=30000000},
			szLog = "使用永久玫瑰花篮1200次",
			},
		[1300] = {
			tbAward = {nExp_tl=40000000},
			szLog = "使用永久玫瑰花篮1300次",
			},
		[1400] = {
			tbAward = {nExp_tl=50000000},
			szLog = "使用永久玫瑰花篮1400次",
			},
		[1500] = {
			tbAward ={
					{szName="金乌盔宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=14, CallBack = _Message},
					{szName="金乌衣宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="金乌鞋宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="金乌腰带宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=11, CallBack = _Message},
					{szName="金乌护腕宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=11, CallBack = _Message},
					{szName="金乌项链宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="金乌佩宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=10, CallBack = _Message},
					{szName="金乌上戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=5, CallBack = _Message},
					{szName="金乌下戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=5, CallBack = _Message},
					{szName="金乌武器宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=2, CallBack = _Message},	
			},
			szLog = "使用永久玫瑰花篮1500次金宝箱O",
			},	
		},
	}	
	
-- 幸运带的奖励以及概率	
tbLuckBeltAward = {
	[1]={szName="三色玫瑰花束",tbProp={6,1,3121,1,0,0},nExpiredTime=20120401,nBindState = -2,},
	[2]={szName="四色玫瑰花束",tbProp={6,1,3122,1,0,0},nExpiredTime=20120401,nBindState = -2,},
	[3]={szName="永久玫瑰花篮",tbProp={6,1,3127,1,0,0},nExpiredTime=20120401,nBindState = -2,},	
	}	
tbLuckBelt = {
	[1] = {nRate = 45, szActionLog = "使用幸运袋领取三色花束",},
	[2] = {nRate = 45, szActionLog = "使用幸运袋领取四色花束",},
	[3] = {nRate = 10, szActionLog = "使用幸运袋领取永久玫瑰花篮",},
	}	
