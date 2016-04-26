_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>恭喜<color=yellow>%s<color=green>  收到物品<color=yellow>%s<color=green>", GetName(), strItemName)
	AddGlobalNews(strMessage)
	--local handle = OB_Create();
	--ObjBuffer:PushObject(handle, strMessage)
	--RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	--OB_Release(handle)
end	
Award_A = 
{
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
	{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.4},
	{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
	{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
	{szName = "金乌发冠- 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "金乌铠- 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "金乌鞋 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "金乌腰带- 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}, nRate =0.004, CallBack = _Message},
	{szName = "金乌护腕 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "金乌项链 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "金乌玉佩 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "金乌上戒指- 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "金乌下戒指- 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "金乌器械 - 自选派系", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, nRate = 0.001, CallBack = _Message},
	{szName="黄金印",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="黄金印",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="黄金印",tbProp={0,3210},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="黄金印",tbProp={0,3220},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="如意钥匙",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	{szName="简礼盒杀手",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
	{szName="面具- 英雄战场",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.2,nExpiredTime=10080,nUsageTime=60},
	{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="元帅面具",tbProp={0,11,447,1,0,0},nCount=1,nRate=1,nExpiredTime=10080,nUsageTime=60},
	{szName="鬼影面具",tbProp={0,11,455,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="金钥匙",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="天灵丹",tbProp={6,1,3022,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="乾坤双绝",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
	{szName="五行奇石",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
	{szName="激功助力",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="阴阳活血丹",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="飞速还礼包",tbProp={6,1,2520,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="大力还礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="富贵锦盒",tbProp={6,1,2402,1,0,0},nCount=1,nRate=4,nExpiredTime=10080},
	{szName="水贼令牌",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="天宝库令",tbProp={6,1,2813,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="金乌重练玉",tbProp={6,1,3005,1,0,0},nCount=1,nRate=0.2},
	{szName="宋金招兵礼包",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName = "经验值", nExp=5000000,nRate=46.417},
	{szName = "经验值", nExp=10000000,nRate=6},
	{szName = "经验值", nExp=15000000,nRate=2.5},
	{szName = "经验值", nExp=20000000,nRate=0.5},
	{szName = "经验值", nExp=50000000,nRate=0.05},
}

