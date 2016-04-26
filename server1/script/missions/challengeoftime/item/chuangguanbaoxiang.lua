-- 闯关宝箱物品（随机获得一样物品）
-- By: Wangjingjun(2011-03-02)

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>祝贺高手<color=yellow>%s<color=green> 已领取<color=yellow><%s><color=green>从<color=yellow><闯关宝箱><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbCOT_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbCOT_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="经验 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "闯关宝箱")
					end,
					nRate = 52,
		},
		{szName="经验 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "闯关宝箱")
					end,
					nRate = 30,
		},
		{szName="经验 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "闯关宝箱")
					end,
					nRate = 10,
		},
		{szName="经验 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "闯关宝箱")
					end,
					nRate = 5,
		},
		{szName="经验 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "闯关宝箱")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="精炼石",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=2},
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},		
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="小包玉罐",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="大包玉罐",tbProp={6,1,2801,1,0,0},nCount=1, nRate=0.04},		
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.05},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=2},
		{szName="特别仙草露",tbProp={6,1,1181,1,0,0},nCount=1,nRate=15,nExpiredTime=43200},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.08},
		{szName="玉罐",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.08},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.01},
		{szName="经验 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "闯关宝箱")
					end,
					nRate = 35,
		},
		{szName="经验 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "闯关宝箱")
					end,
					nRate = 25,
		},
		{szName="经验 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "闯关宝箱")
					end,
					nRate = 10,
		},
		{szName="经验 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "闯关宝箱")
					end,
					nRate = 5,
		},
		{szName="经验 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "闯关宝箱")
					end,
					nRate = 3,
		},
		{szName="经验 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "闯关宝箱")
					end,
					nRate = 2,
		},
		{szName="经验 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "闯关宝箱")
					end,
					nRate = 1,
		},		
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},		
		{szName="黄金印(强化)",tbProp={0,3211},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
		{szName="黄金印(弱化)",tbProp={0,3221},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbCOT_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbCOT_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("要有金钥匙或者如意钥匙才可以打开闯关宝箱", 1, "关/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为保护大侠的财产安全，请整理%d %dx%d空间", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("使用如意钥匙/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("使用金钥匙/#VnCOTBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "关/Oncancel")
		Say("用钥匙开宝箱:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnCOTBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbCOT_Key_Require[strKeyType]
	local tbAward = tbCOT_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("要有金钥匙或者如意钥匙才可以打开闯关宝箱", 1, "关闭/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2742, -1) ~= 1 then
		Say("没有找到闯关宝箱", 1, "关闭/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"chuangguan", "use chuangguanbaoxiang"})
	AddStatData("baoxiangxiaohao_kaichuangguanbaoxiang", 1)	--数据埋点第一期
end