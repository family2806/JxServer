Include("\\script\\lib\\awardtemplet.lua")

--µ±Ê¹ÓÃ¸÷ÖÖ±¦ÏäÊ±£¬Ã¿ÌìÊ¹ÓÃ¾­ÑéÖµµÄÉÏÏÞÎª5000Íò- Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Chóc mõng cao thñ <color=yellow>%s<color=green> ®· nhËn ®­îc <color=yellow><%s><color=green> tõ <color=yellow><Viªm §Õ BÝ B¶o><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbYdbz_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}

tbYdbz_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 52,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 30,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 10,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 5,
		},
		{szName="§iÓm kinh nghiÖm 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=10},
		{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2280,1,0,0},nCount=1,nRate=5},
		{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},
		{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2349,1,0,0},nCount=1,nRate=2},
		{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2},		
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn",tbProp={6,1,2800,1,0,0},nCount=1, nRate=0.04},
		{szName="B¶o R­¬ng Kim ¤ Vò KhÝ",tbProp={6,1,2801,1,0,0},nCount=1, nRate=0.04},		
		{szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2311,1,0,0},nCount=1,nRate=10},
		{szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2311,1,0,0},nCount=1,nRate=5},
		{szName="Méc Nh©n LÖnh",tbProp={6,1,30105,1,0,0},nCount=2,nRate=3},
		{szName="Hoµn Hån §¬n",tbProp={6,1,2837,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 30,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 25,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(8000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 10,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(10000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 5,
		},
		{szName="§iÓm kinh nghiÖm 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(15000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 3,
		},
		{szName="§iÓm kinh nghiÖm 6", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 2,
		},
		{szName="§iÓm kinh nghiÖm 7", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "Viªm §Õ BÝ B¶o")
					end,
					nRate = 1,
		},
		{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},
		{szName="Tö M·ng Chi B¶o (Nãn)",tbProp={6,1,2350,1,0,0},nCount=1,nRate=2},		
		{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3211},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
		{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3221},nCount=1,nRate=1.5,nQuality = 1,nExpiredTime=10080,},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.08},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.04},
		{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.01},
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	local tbKey1 = tbYdbz_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbYdbz_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("ÐèÒªÓÐ»Æ½ðÔ¿³×»òÕßÈçÒâÔ¿³×²ÅÄÜ´ò¿ªViªm §Õ BÝ B¶o", 1, "§ãng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa nh­ ý/#VnYdbzBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa vµng/#VnYdbzBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "§ãng/Oncancel")
		Say("Sö dông ch×a khãa ®Ó më r­¬ng:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnYdbzBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbYdbz_Key_Require[strKeyType]
	local tbAward = tbYdbz_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("ÐèÒªÓÐ»Æ½ðÔ¿³×»òÕßÈçÒâÔ¿³×²ÅÄÜ´ò¿ªViªm §Õ BÝ B¶o", 1, "§ãng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2805, -1) ~= 1 then
		Say("ÕÒ²»µ½Viªm §Õ BÝ B¶o", 1, "§ãng/no")
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"YDBZ", "use yandimibao"})	
end
