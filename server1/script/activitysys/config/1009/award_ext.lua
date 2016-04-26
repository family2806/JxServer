Include("\\script\\lib\\log.lua")
_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>恭喜<color=yellow>%s<color=green> 已获得<color=yellow>%s<color=green>", GetName(), strItemName)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("您获得"..nCount.."帮会贡献点")
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "使用物品", nCount.." 帮会贡献点")
	end
end

tbAward_Ext = {
	["award2000"] = {
		--{szName="金乌武器宝箱,tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message}
		  {szName = "金乌器械-自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message},
	},
	["awardspecial"] = { 
			{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200, CallBack = _Message},
			{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="紫莽之宝 (帽子)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={1,0,0,0,0,0}},
			{szName="紫莽之宝  (腰带)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={4,0,0,0,0,0}},
			{szName="紫莽之宝  (手套)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={3,0,0,0,0,0}},
			{szName="紫莽之宝  (玉佩)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={8,0,0,0,0,0}},
			{szName="紫莽之宝  (衣服)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={5,0,0,0,0,0}},
			{szName="紫莽之宝  (鞋子)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={7,0,0,0,0,0}},
			{szName="紫莽之宝  (项链)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={0,0,0,0,0,0}},
			{szName="紫莽之宝  (上戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={2,0,0,0,0,0}},
			{szName="紫莽之宝 (下戒)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={9,0,0,0,0,0}},
			{szName="紫莽之宝  (武器)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={6,0,0,0,0,0}},
			{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=2},
			{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=2},
			{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},
			{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},
			{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},
			{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=2},
			{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=2},
			{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},
			{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},
			{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},
			{szName = "经验值", nExp=20000000,nRate=40.5},
			{szName = "经验值", nExp=50000000,nRate=10},
			{szName = "经验值", nExp=100000000,nRate=5},
			{szName="金乌盔宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="金乌衣宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="金乌鞋宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="金乌腰带宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="金乌护腕宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="金乌项链宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="金乌佩宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="金乌上戒宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="金乌下戒宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="金乌武器宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=3.3},
			{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=2, CallBack = _Message},
			{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="王者面具",tbProp={0,11,561,1,0,0},nCount=1,nRate=1,nExpiredTime=43200, CallBack = _Message},	
		},
	["awardnomal"] ={ --Server 旧以及超光
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
		{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.3},
		{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.3},
		{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3},
		{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3},
		{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.3},
		{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.3},
		{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
		{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},
		{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.5},
		{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2,CallBack = _Message},
		{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1,CallBack = _Message},
		{szName="金乌盔宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="金乌衣宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="金乌鞋宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="金乌腰带宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="金乌护腕宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="金乌项链宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="金乌佩宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="金乌上戒宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="金乌下戒宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="金乌武器宝箱",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.001, CallBack = _Message},
		{szName="20000 帮会贡献值",nCount=1,nRate=4.5, pFun = function() %pContributionAward(20000) end},
		{szName="50000 帮会贡献值",nCount=1,nRate=2.5, pFun = function() %pContributionAward(50000) end},
		{szName="100000 帮会贡献值",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
		{szName="150技能秘籍 (19级)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="150技能秘籍 (20级)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="王者面具",tbProp={0,11,561,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200, CallBack = _Message},
		{szName="英雄帖",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="杀手锏礼包",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
		{szName="炎帝令",tbProp={6,1,1617,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="黄金钥匙",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="如意钥匙",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
		{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
		{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName="积功助力丸",tbProp={6,1,2952,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="阴阳活血丹",tbProp={6,1,2953,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="百年珍露",tbProp={6,1,2266,1,0,0},nCount=1,nRate=0.1},
		{szName="千年珍露",tbProp={6,1,2267,1,0,0},nCount=1,nRate=0.1},
		{szName="万年珍露",tbProp={6,1,2268,1,0,0},nCount=1,nRate=0.1},
		{szName="回城符(小) ",tbProp={6,1,1082,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="回城符(大) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="龙血丸",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName = "经验值", nExp=5000000,nRate=49.527},
		{szName = "经验值", nExp=10000000,nRate=6},
		{szName = "经验值", nExp=15000000,nRate=2.5},
		{szName = "经验值", nExp=20000000,nRate=0.5},
		{szName = "经验值", nExp=50000000,nRate=0.05},
	},
}	
