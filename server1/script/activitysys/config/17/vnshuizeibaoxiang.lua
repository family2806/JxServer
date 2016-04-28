Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Chóc mõng cao thñ <color=yellow>%s<color=green> ®· nhËn ®­îc <color=yellow><%s><color=green> tõ <color=yellow><B¶o R­¬ng Thñy TÆc><color>" ,GetName(),GetItemName(nItemIndex))
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
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 52,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 30,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 10,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 5,
		},
		{szName="§iÓm kinh nghiÖm 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 3,
		},
	},	
	["chiakhoavang"] = 
	{
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=1},
		{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=1},
		{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=1},
		{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=1},
		{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=1},
		{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=1},
		{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=1},
		{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.4},
		{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.4},
		{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.1},
		{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
		{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.01},
		{szName="LÖnh Bµi Thñy TÆc",tbProp={6,1,2745,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		{szName="Cèng HiÕn LÔ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="V©n Léc Th¹ch",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.6},
		{szName="KiÕn ThiÕt LÔ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.008},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.008},
		{szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.004},
		{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.005},		
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 42.905,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 25,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 10,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 5,
		},
		{szName="§iÓm kinh nghiÖm 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 3,
		},
		{szName="§iÓm kinh nghiÖm 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "B¶o R­¬ng Thñy TÆc")
					end,
					nRate = 2,
		},	
		{szName="§iÓm kinh nghiÖm 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "B¶o R­¬ng Thñy TÆc")
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
		Say("CÇn ph¶i cã Ch×a Khãa Vµng hoÆc Ch×a Khãa Nh­ ý míi cã thÓ më ®­îc B¶o R­¬ng Thñy TÆc", 1, "§ãng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa nh­ ý/#VnPirateBoxGiveAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa vµng/#VnPirateBoxGiveAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "§ãng/Oncancel")
		Say("Sö dông ch×a khãa ®Ó më r­¬ng:", getn(tbOpt), tbOpt)
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
		Say("CÇn ph¶i cã Ch×a Khãa Vµng hoÆc Ch×a Khãa Nh­ ý míi cã thÓ më ®­îc B¶o R­¬ng Thñy TÆc", 1, "§ãng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2743, -1) ~= 1 then
		Say("Kh«ng t×m thÊy B¶o R­¬ng Thñy TÆc", 1, "§ãng/no")
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"PhongLangDo", "use_shuizeibaoxiang"})		
end