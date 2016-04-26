Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
local  _Message =  function (nItemIndex, strBoxName)
	local handle = OB_Create()
	local msg = format("<color=green>祝贺高手<color=yellow>%s<color=green> 已经获得 <color=yellow><%s><color=green> 从<color=yellow><%s><color>" ,GetName(),GetItemName(nItemIndex), strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
local  BingoBoxAddExp =  function (nAmount, strBoxName)
	AddOwnExp(nAmount)
	Msg2Player("达到经验不能合并 "..nAmount)
	tbLog:PlayerAwardLog("BachBaoRuong", "SuDungTinhMyBaoRuong", "经验值", "", nAmount)
	local handle = OB_Create()
	local msg = format("<color=green>祝贺高手<color=yellow>%s<color=green> 已经获得<color=yellow><%s><color=green> 从<color=yellow><%s><color>" ,GetName(),nAmount.." 经验值", strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
tbBingoBoxAward = {
	[3053] = {		--贵重宝箱	
		{szName = "金乌发冠 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌金铠 (Max Option - 自选派系)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌鞋 (Max Option) - 自选派系)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌腰带 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌护腕(Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌项链(Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌玉佩(Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌上戒指(Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌下戒指(Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌器戒 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},	
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 12, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎武器图谱",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "经验值", nRate=10, pFun = function() %BingoBoxAddExp(200e6, "贵重宝箱") end},
		{szName = "经验值", nRate=6, pFun = function() %BingoBoxAddExp(500e6, "贵重宝箱") end},
		{szName="龙胆",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="刘玄",tbProp={0,3500},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="狂澜",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="翠玉冰玄",tbProp={0,3502},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="凝雪寒霜",tbProp={0,3504},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="加限符",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="风云石",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="黄金印 (强化)",tbProp={0,3211},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="黄金印 (弱化)",tbProp={0,3221},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
	},
	[3054] = {--精美宝箱
		{szName="金乌盔宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌衣宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌鞋宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌腰带宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌护腕宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌项链宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌佩宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌上戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌下戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌武器宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},	
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 15, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎武器图谱",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.5, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="龙胆",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="刘玄",tbProp={0,3500},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="狂澜",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="翠玉冰玄",tbProp={0,3502},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="凝雪寒霜",tbProp={0,3504},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="加限符",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="风云石",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="翻羽",tbProp={0,10,7,1,0,0},nCount=1,nRate=4,nExpiredTime=259200, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName = "经验值", nRate=15, pFun = function() %BingoBoxAddExp(100e6, "精美宝箱") end},
		{szName = "经验值", nRate=9, pFun = function() %BingoBoxAddExp(200e6, "精美宝箱") end},
		{szName = "经验值", nRate=2, pFun = function() %BingoBoxAddExp(500e6, "精美宝箱") end},		
	},
}
tbBingoBoxAward_2 = {
	[3053] = {		--贵重宝箱	
		{szName = "金乌发冠 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌金铠 (Max Option - 自选派系)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌鞋 (Max Option) - 自选派系)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌腰带  (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌护腕 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌项链 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌玉佩 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌上戒指(Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌下戒指(Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "金乌器戒 (Max Option) - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},	
		{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎武器图谱",tbProp={6,1,3182,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName = "经验值", nRate=16, pFun = function() %BingoBoxAddExp(200e6, "贵重宝箱") end},
		{szName = "经验值", nRate=8, pFun = function() %BingoBoxAddExp(500e6, "贵重宝箱") end},
		{szName="龙胆",tbProp={0,3499},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},		
		{szName="狂澜",tbProp={0,3501},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="翠玉冰玄",tbProp={0,3502},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="凝雪寒霜",tbProp={0,3504},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="加限符",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
		{szName="风云石",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8.4,CallBack = function(nParam) %_Message(nParam, "贵重宝箱") end},
	},
	[3054] = {--精美宝箱
		{szName="金乌盔宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌衣宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌鞋宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌腰带宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌护腕宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌项链宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌佩宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌上戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌下戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="金乌武器宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},			
		{szName="白虎盔图谱",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎鞋图谱",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎腰带图谱",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎佩图谱",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎上戒图谱",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎下戒图谱",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎武器图谱",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.8, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.8, CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="龙胆",tbProp={0,3499},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},		
		{szName="狂澜",tbProp={0,3501},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="翠玉冰玄",tbProp={0,3502},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="凝雪寒霜",tbProp={0,3504},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="加限符",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},
		{szName="风云石",tbProp={6,1,30224,1,0,0},nCount=1,nRate=9,CallBack = function(nParam) %_Message(nParam, "精美宝箱") end},		
		{szName = "经验值", nRate=16.6, pFun = function() %BingoBoxAddExp(100e6, "精美宝箱") end},
		{szName = "经验值", nRate=12, pFun = function() %BingoBoxAddExp(200e6, "精美宝箱") end},
		{szName = "经验值", nRate=5, pFun = function() %BingoBoxAddExp(500e6, "精美宝箱") end},		
	},
}
local tbBingoBoxLog = {
	[3053] = "SuDungQuyTrongBaoRuong",
	[3054] = "SuDungTinhMyBaoRuong",--精美宝箱
}
local tbBingoBoxTSKDailyLimit = {
	[3053] = 3078,
	[3054] = 3077,--精美宝箱
}
local tbBingoBoxFreeBag = {
	[3053] = {nW = 1, nH = 1},
	[3054] = {nW = 2, nH = 3},--精美宝箱
}
function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	if nP ~= 3053 and nP ~= 3054 then
		return 1
	end
	local nTSKID = %tbBingoBoxTSKDailyLimit[nP]
	if PlayerFunLib:CheckTaskDaily(nTSKID, 10, format("使用物品 %s 已达上限, 不能再使用.", GetItemName(nItemIndex)), "<") ~= 1 then
		return 1
	end
	local tbFreeBag = %tbBingoBoxFreeBag[nP]
	if PlayerFunLib:CheckFreeBagCellWH(tbFreeBag.nW, tbFreeBag.nH, 1, "default") ~= 1 then
		return 1
	end
	PlayerFunLib:AddTaskDaily(nTSKID, 1)	
	if mod(PlayerFunLib:GetTaskDailyCount(nTSKID), 4) == 0 then	
		tbAwardTemplet:Give(tbBingoBoxAward_2[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP].."2"})
	else
		tbAwardTemplet:Give(tbBingoBoxAward[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP]})
	end
	return 0
end