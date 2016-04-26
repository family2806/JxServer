Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>恭喜高手<color=yellow>%s<color=green> 已获得<color=yellow><%s><color=green> t?<color=yellow><水贼宝箱><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbPirate_Box_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbPirateBoxNewAward = 
{	
	["chiakhoanhuy"] = 
	{
		{szName="经验值1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "水贼宝箱")
					end,
					nRate = 52,
		},
		{szName="经验值2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "水贼宝箱")
					end,
					nRate = 30,
		},
		{szName="经验值3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "水贼宝箱")
					end,
					nRate = 10,
		},
		{szName="经验值4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "水贼宝箱")
					end,
					nRate = 5,
		},
		{szName="经验值5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "水贼宝箱")
					end,
					nRate = 3,
		},
	},	
	["chiakhoavang"] = 
	{
		{szName="金乌盔图谱",tbProp={6,1,2982,1,0,0},nCount=1,nRate=1},
		{szName="金乌衣图谱",tbProp={6,1,2983,1,0,0},nCount=1,nRate=1},
		{szName="金乌鞋图谱",tbProp={6,1,2984,1,0,0},nCount=1,nRate=1},
		{szName="金乌腰带图谱",tbProp={6,1,2985,1,0,0},nCount=1,nRate=1},
		{szName="金乌护腕图谱",tbProp={6,1,2986,1,0,0},nCount=1,nRate=1},
		{szName="金乌项链图谱",tbProp={6,1,2987,1,0,0},nCount=1,nRate=1},
		{szName="金乌佩图谱",tbProp={6,1,2988,1,0,0},nCount=1,nRate=1},
		{szName="金乌上戒图谱",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.4},
		{szName="金乌下戒图谱",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.4},
		{szName="金乌器械图谱",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.1},
		{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
		{szName="金乌盔宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.01},
		{szName="金乌上戒宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.01},
		{szName="金乌鞋宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01},
		{szName="金乌腰带宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.01},
		{szName="金乌护腕宝箱",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.01},
		{szName="水贼令牌",tbProp={6,1,2745,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		{szName="贡献礼包",tbProp={6,1,30214,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="云禄石",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.6},
		{szName="建设礼包",tbProp={6,1,30216,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="白虎衣图谱",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.008},
		{szName="白虎项链图谱",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.008},
		{szName="白虎武器图谱",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.004},
		{szName="白虎令",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.005},		
		{szName="经验值1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "水贼宝箱")
					end,
					nRate = 42.905,
		},
		{szName="经验值2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "水贼宝箱")
					end,
					nRate = 25,
		},
		{szName="经验值 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "水贼宝箱")
					end,
					nRate = 10,
		},
		{szName="经验值4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "水贼宝箱")
					end,
					nRate = 5,
		},
		{szName="经验值 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "水贼宝箱")
					end,
					nRate = 3,
		},
		{szName="经验值 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "水贼宝箱")
					end,
					nRate = 2,
		},	
		{szName="经验值 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "水贼宝箱")
					end,
					nRate = 1,
		},
	},	
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function VnPirateBox_main(nIndexItem)
	local tbKey1 = tbPirate_Box_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbPirate_Box_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("需要有金钥匙或者如意钥匙才能打开水贼宝箱", 1, "сng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为了确保大侠的财产，请留空%d %dx%d装备", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("使用如意钥匙/#VnPirateBoxGiveAward(%d, '%s')", nIndexItem, "如意钥匙"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("使用金钥匙/#VnPirateBoxGiveAward(%d, '%s')", nIndexItem, "金钥匙"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "сng/Oncancel")
		Say("使用钥匙开箱:", getn(tbOpt), tbOpt)
	end
	return 1	
end
function Oncancel()end

function VnPirateBoxGiveAward(nItemIdx, strKeyType)
	local tbKey = tbPirate_Box_Key_Require[strKeyType]
	local tbAward = tbPirateBoxNewAward[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("需要有金钥匙或者如意钥匙才能打开水贼宝箱", 1, "сng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2743, -1) ~= 1 then
		Say("找不到水贼宝箱", 1, "сng/no")
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"PhongLangDo", "use_shuizeibaoxiang"})		
end