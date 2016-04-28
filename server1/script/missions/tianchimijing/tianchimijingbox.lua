Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Chóc mõng cao thñ <color=yellow>%s<color=green> ®· nhËn ®­îc <color=yellow><%s><color=green> tõ <color=yellow><Thiªn Tr× BÝ B¶o><color>" ,GetName(),GetItemName(nItemIndex))
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
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 52,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 30,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 10,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 5,
		},
		{szName="§iÓm kinh nghiÖm 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.008},
		{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.008},
		{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.005},
		{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.3},
		{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
		{szName="Phong V©n Chi B¶o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1},
		{szName="B¶o R­¬ng Kim ¤ Kh«i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, CallBack = _Message, nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Hµi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Yªu §¸i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Hé UyÓn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},CallBack = _Message, nRate=0.01},
		{szName="B¶o R­¬ng Kim ¤ Béi",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, CallBack = _Message, nRate=0.01},
		{szName="MËt tÞch kÜ n¨ng 150 (CÊp 19)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.02},
		{szName="MËt tÞch kÜ n¨ng 150 (CÊp 20)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.02},
		{szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.1,nExpiredTime=10080,nUsageTime=60},
		{szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1.05,nExpiredTime=43200},
		{szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2744,1,0,0},nCount=1,nRate=4,nExpiredTime=20160},
		{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
		{szName="Vò §· Hµ",tbProp={0,3880},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="Thanh B×nh L¹c",tbProp={0,3881},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="Håi Xu©n",tbProp={0,3882},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="Kh« Méc",tbProp={0,3883},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="L­u V©n ",tbProp={0,3884},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="Nª Tr¹ch",tbProp={0,3885},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="L«i Háa KiÕp",tbProp={0,3886},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="Mª Tóy Thiªn H­¬ng",tbProp={0,3887},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},
		{szName="§iÖp Vò Hoa Phi",tbProp={0,3888},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=1440,},		
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(6000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 80.069,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(12000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 6,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "Thiªn Tr× BÝ B¶o")
					end,
					nRate = 3,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "Thiªn Tr× BÝ B¶o")
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
		Say("ÐèÒªÓÐ»Æ½ðÔ¿³×»òÕßCh×a Khãa Nh­ ý²ÅÄÜ´ò¿ªThiªn Tr× BÝ B¶o", 1, "§ãng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("Ê¹ÓÃCh×a Khãa Nh­ ý #VnTCMJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa vµng/#VnTCMJBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "§ãng/Oncancel")
		Say("Sö dông ch×a khãa ®Ó më r­¬ng:", getn(tbOpt), tbOpt)
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
		Say("ÐèÒªÓÐ»Æ½ðÔ¿³×»òÕßCh×a Khãa Nh­ ý²ÅÄÜ´ò¿ªThiªn Tr× BÝ B¶o", 1, "§ãng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 30193, -1) ~= 1 then
		Say("ÕÒ²»µ½Thiªn Tr× BÝ B¶o", 1, "§ãng/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"ThienTriMatCanh", "Ê¹ÓÃThiªn Tr× BÝ B¶o"})	
end
