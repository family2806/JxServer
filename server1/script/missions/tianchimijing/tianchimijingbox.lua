Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>恭喜高手 <color=yellow>%s<color=green> 已获得 <color=yellow><%s><color=green> t?<color=yellow><天池秘宝><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbTCMJ_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbTCMJ_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="经验值 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "天池秘宝")
					end,
					nRate = 52,
		},
		{szName="经验值 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "天池秘宝")
					end,
					nRate = 30,
		},
		{szName="经验值 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "天池秘宝")
					end,
					nRate = 10,
		},
		{szName="经验值 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "天池秘宝")
					end,
					nRate = 5,
		},
		{szName="经验值 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "天池秘宝")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.008},
		{szName="白虎护腕图谱",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.008},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.005},
		{szName="金花之宝",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.3},
		{szName="翡翠之宝",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
		{szName="风云之宝",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1},
		{szName="金乌盔宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, CallBack = _Message, nRate=0.01},
		{szName="金乌衣宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="金乌鞋宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="金乌腰带宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="金乌护腕宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="金乌项链宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="金乌佩宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, CallBack = _Message, nRate=0.01},
		{szName="150技能秘籍(19级)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.02},
		{szName="150技能秘籍 (20级)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.02},
		{szName="面具- 英雄战场",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.1,nExpiredTime=10080,nUsageTime=60},
		{szName="回天再造礼包",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1.05,nExpiredTime=43200},
		{szName="如意钥匙",tbProp={6,1,2744,1,0,0},nCount=1,nRate=4,nExpiredTime=20160},
		{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
		{szName="武大河",tbProp={0,3880},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="清平乐",tbProp={0,3881},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="回春",tbProp={0,3882},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="枯木",tbProp={0,3883},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="流云",tbProp={0,3884},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="尼石",tbProp={0,3885},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="雷火劫",tbProp={0,3886},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="迷醉天香",tbProp={0,3887},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="蝶舞花飞",tbProp={0,3888},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},		
		{szName="经验值 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(6000000, "天池秘宝")
					end,
					nRate = 80.069,
		},
		{szName="经验值 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(12000000, "天池秘宝")
					end,
					nRate = 6,
		},
		{szName="经验值 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "天池秘宝")
					end,
					nRate = 3,
		},
		{szName="经验值 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "天池秘宝")
					end,
					nRate = 0.5,
		},	
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbTCMJ_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbTCMJ_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("需要有黄金钥匙或者如意钥匙才能打开天池秘宝", 1, "关闭/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为确保大侠财产安全，请留下%d %dx%d 装备空位", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("使用如意钥匙 #VnTCMJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("使用黄金钥匙/#VnTCMJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "关闭/Oncancel")
		Say("使用钥匙开箱:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnTCMJBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbTCMJ_Key_Require[strKeyType]
	local tbAward = tbTCMJ_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("需要有黄金钥匙或者如意钥匙才能打开天池秘宝", 1, "关闭/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 30193, -1) ~= 1 then
		Say("找不到天池秘宝", 1, "关闭/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"天池秘境", "使用天池秘宝"})	
end
