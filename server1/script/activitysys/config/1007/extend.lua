------------------------------------------------------------------------------------------------
--Author: NgaVN
--Des: Event Ph?N?ViÖt Nam
--Date: 2011-10-13
------------------------------------------------------------------------------------------------
Include("\\script\\activitysys\\config\\1007\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1007\\variables.lua")

--¾­Ñé½±Àø
local tbUseBTT_AdditionalAward = {
	[50] 		= {szName = "§iÓm kinh nghiÖm", nExp=5000000},
	[100] 	= {szName = "§iÓm kinh nghiÖm", nExp=5000000},
	[200] 	= {szName = "§iÓm kinh nghiÖm", nExp=5000000},
	[300] 	= {szName = "§iÓm kinh nghiÖm", nExp=10000000},
	[400] 	= {szName = "§iÓm kinh nghiÖm", nExp=10000000},
	[500] 	= {szName = "§iÓm kinh nghiÖm", nExp=10000000},
	[600] 	= {szName = "§iÓm kinh nghiÖm", nExp=15000000},
	[700] 	= {szName = "§iÓm kinh nghiÖm", nExp=15000000},
	[800] 	= {szName = "§iÓm kinh nghiÖm", nExp=20000000},
	[900] 	= {szName = "§iÓm kinh nghiÖm", nExp=25000000},
	[1000] 	= {szName = "§iÓm kinh nghiÖm", nExp=50000000},
}

--local tbLogUseIceCrystals = {
--	[500] = "NopVatPhamHoangThach500Lan",
--	[1000] = "NopVatPhamHoangThach1000Lan",
--	[1500] = "NopVatPhamHoangThach1500Lan",	
--	[1500] = "NopVatPhamHoangThach2000Lan",		
--}

--PhÇn th­ëng Item
local tbUseBTT_ItemAward = {
	[1] = {szName="§å phæ Tö M·ng Ph¸t Qu¸n",				tbProp	= {6,1,2714,1,0,0}, nCount=1,nRate= 1},
	[2] = {szName="§å phæ Tö M·ng Kim Kh¶i",					tbProp	= {6,1,2715,1,0,0}, nCount=1,nRate=1},
	[3] = {szName = "§å Phæ Tö M·ng Yªu §¸i", 				tbProp = {6,1,2717,1,0,0}, nCount=1, nRate = 1},	
	[4] = {szName = "§å Phæ Tö M·ng Hé UyÓn", 				tbProp = {6,1,2718,1,0,0}, nCount=1, nRate = 1},
	[5] = {szName = "§å Phæ Tö M·ng Béi", 						tbProp = {6,1,2720,1,0,0}, nCount=1, nRate = 1},
	[6] = {szName = "§å Phæ Tö M·ng Hµi", 						tbProp = {6,1,2716,1,0,0}, nCount=1, nRate = 1},		
	[7] = {szName = "§å Phæ Tö M·ng H¹ng Liªn", 			tbProp = {6,1,2719,1,0,0}, nCount=1, nRate = 1},
	[8] = {szName = "§å Phæ Tö M·ng Th­îng Giíi ChØ", 	tbProp = {6,1,2721,1,0,0}, nCount=1, nRate = 0.5},
	[9] = {szName = "§å Phæ Tö M·ng H¹ Giíi ChØ", 			tbProp = {6,1,2722,1,0,0}, nCount=1, nRate = 0.5},
	[10] = {szName = "§å Phæ Tö M·ng KhÝ Giíi", 				tbProp = {6,1,2723,1,0,0}, nCount=1, nRate = 0.5},
	[11] = {szName="Tö M·ng LÖnh	",									tbProp = {6,1,2350,1,0,0},nCount=1, nRate=0.2},
	[12] = {szName="HuyÒn Viªn LÖnh",									tbProp = {6,1,2351,1,0,0},nCount=1, nRate=0.3},
	[13] = {szName="Kim ¤ LÖnh", 											tbProp = {6,1,2349,1,0,0}, nCount=1, nRate = 0.01},	
	[14] = {szName="Th­¬ng Lang LÖnh",								tbProp = {6,1,2352,1,0,0},nCount=1,nRate=0.5},
	[15] = {szName="V©n Léc LÖnh",										tbProp = {6,1,2353,1,0,0},nCount=1,nRate=1},
	[16] = {szName="Thanh C©u LÖnh",									tbProp = {6,1,2369,1,0,0},nCount=1,nRate=1},
	[17] = {szName="Ngò Hµnh Kú Th¹ch",							tbProp = {6,1,2125,1,0,0},nCount=1,nRate=25},
	[18] = {szName="Tèng kim chiªu binh lÖnh",					tbProp = {6,1,30083,1,0,0},nCount=1,nRate=3, nExpiredTime=10080},
	[19] = {szName="Tèng Kim Chiªu Binh LÔ Bao",				tbProp = {6,1,30084,1,0,0},nCount=1,nRate=1, nExpiredTime=10080},
	[20] = {szName="Long HuyÕt Hoµn",								tbProp = {6,1,2117,1,0,0},nCount=1,nRate=1},  --20111019
	[21] = {szName="S¸t Thñ Gi¶n lÔ hép",							tbProp = {6,1,2339,1,0,0},nCount=1,nRate=2},  --20111019
	[22] = {szName="Ngäc Qu¸n",											tbProp = {6,1,2311,1,0,0},nCount=1,nRate=1},
	[23] = {szName="M¶nh b¶n ®å s¬n hµ x· t¾c (1000 m¶nh)", tbProp = {6,1,2514,1,0,0}, nCount=1, nRate=3},
	[24] = {szName="M¹c B¾c TruyÒn Tèng LÖnh",				tbProp = {6,1,1448,1,0,0},nCount=1,nRate=2},	--20111019
	[25] = {szName="LÖnh Bµi Vi S¬n §¶o LÔ Bao",			tbProp = {6,1,2525,1,1,0},nCount=1,nRate=2},		--20111019   - LÖnh Bµi Vi S¬n §¶o L?Bao				
	[26] = {szName="Ngäc Trïng LuyÖn",							tbProp = {6,1,30104,1,0,0},nCount=1,nRate=0.3},
	[27] = {szName = "Kim Hoa Chi B¶o", 							tbProp = {6,1,3002,1,0,0},nCount=1,nRate=0.1},
	[28] = {szName="Tiªn Th¶o Lé ®Æc biÖt",						tbProp = {6,1,1181,1,0,0},nCount=1,nRate=6.74},  --20111019
	[29] = {szName="H¶i long ch©u",									tbProp = {6,1,2115,1,0,0},nCount=1,nRate=1},		--20111019
	[30] = {szName = "§å Phæ Kim ¤ Kh«i", 							tbProp = {6,1,2982,1,0,0}, nCount=1,nRate=0.05},
	[31] = {szName="§å Phæ Kim ¤ Y",								tbProp = {6,1,2983,1,0,0},nCount=1,nRate = 0.05},
	[32] = {szName="§å Phæ Kim ¤ Hµi",								tbProp = {6,1,2984,1,0,0},nCount=1,nRate = 0.01},	
	[33] = {szName="§å Phæ Kim ¤ Yªu §¸i",						tbProp = {6,1,2985,1,0,0},nCount=1, nRate = 0.01},
	[34] = {szName="§å Phæ Kim ¤ Hé UyÓn",						tbProp = {6,1,2986,1,0,0},nCount=1, nRate = 0.01},
	[35] = {szName="§å Phæ Kim ¤ H¹ng Liªn",					tbProp = {6,1,2987,1,0,0},nCount=1, nRate = 0.05},
	[36] = {szName="§å Phæ Kim ¤ Béi",								tbProp = {6,1,2988,1,0,0},nCount=1, nRate = 0.05},
	[37] = {szName="§å Phæ Kim ¤ Th­îng Giíi",				tbProp = {6,1,2989,1,0,0},nCount=1, nRate = 0.04},
	[38] = {szName="§å Phæ Kim ¤ H¹ Giíi",						tbProp = {6,1,2990,1,0,0},nCount=1, nRate = 0.04},
	[39] = {szName="§å Phæ Kim ¤ KhÝ Giíi",						tbProp = {6,1,2991,1,0,0},nCount=1, nRate = 0.04},
	[40] = {szName = "§iÓm kinh nghiÖm", 							nExp=5000000, nRate = 15},
	[41] = {szName = "§iÓm kinh nghiÖm", 							nExp=10000000, nRate = 10},
	[42] = {szName = "§iÓm kinh nghiÖm", 							nExp=20000000, nRate = 2},
	[43] = {szName="Hµnh HiÖp LÖnh",						        tbProp = {6,1,2566,1,0,0},nCount=1, nRate = 10},   --20111019
	[44] = {szName="Qu¶ Hoµng Kim",						            tbProp={6,1,907,1,0,0},nCount=1,nRate=1, nExpiredTime=10080},            --20111019
	[45] = {szName="Qu¶ Hoµng KimºÐ",					    	tbProp={6,1,1075,1,0,0},nCount=1, nRate = 2, nExpiredTime=10080},       --20111019
}
	
--Function ½»»ÆÊ¯ÏÞÖÆ
function pActivity:HandInHoangThachLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveHoangThachLimit) == 1 then
		Talk(1, "", "Ng­¬i tÆng ta nhiÒu Hoµng Th¹ch råi, sè Hoµng Th¹ch nµy xin h·y nhËn l¹i.");
		Msg2Player("Ng­¬i tÆng ta nhiÒu Hoµng Th¹ch råi, sè Hoµng Th¹ch nµy xin h·y nhËn l¹i.");
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveHoangThachLimit)
	if (nTaskVal + nCount) > %nHoangThachMaxCount then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, ng­¬i chØ cã thÓ nép <color=yellow>%d <color>Hoµng Th¹ch n÷a.", %nHoangThachMaxCount - nTaskVal))
		return nil
	end
	return 1
end

--Function ½»»ÆÊ¯
function pActivity:HandInHoangThach(nCount)		
	local tbAward = {szName = "§iÓm kinh nghiÖm", nExp=1000000};
	
	for i = 1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveHoangThachLimit) == 1 then
			return nil
		end
		%tbVNG_BitTask_Lib:addTask(%tbGiveHoangThachLimit, 1)
		tbAwardTemplet:Give(tbAward, 1, {"Event_PNVN", "NopVatPhamHoangThach"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "NopVatPhamHoangThach", "1000000 exp", 1)			
	end
	--Ghi Log	
end


--Function ÏÞÖÆ
function pActivity:UseBTT_Limit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbUseBTTLimit) == 1 then
		Talk(1, "", "Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm")
		Msg2Player("Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm");
		return nil
	end
	return 1
end

function pActivity:Use_BTT()
	local tbExpAward = {szName = "§iÓm kinh nghiÖm", nExp=6000000}
	%tbVNG_BitTask_Lib:addTask(%tbUseBTTLimit, 1)	
	--¾­Ñé½±Àø
	tbAwardTemplet:Give(tbExpAward, 1, {"Event_PNVN", "SuDungBangTinhThachNhanKinhNghiem"});
	--item½±Àø
	local tbTranslog = {strFolder = %strTranLogFolder, nPromID = %nPromotionID, nResult = 1}	
	tbAwardTemplet:Give(%tbUseBTT_ItemAward, 1, {"Event_PNVN", "SuDungBangTinhThachNhanKinhNghiem", tbTranslog});
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbUseBTTLimit);
	--³¬¶î¾­Ñé½±Àø
	if %tbUseBTT_AdditionalAward[nTaskVal] then
		local tbTempAward = %tbUseBTT_AdditionalAward[nTaskVal]
		tbAwardTemplet:Give(tbTempAward, 1, {"Event_PNVN", format("SuDung%dLanBangTinhThach", nTaskVal)})
		%tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, format("SuDung%dLanBangTinhThach", nTaskVal), tbTempAward.nExp.." Exp", 1)
		Msg2Player(format("<color=green>Chóc mõng b¹n sö dông vËt phÈm %s %d lÇn, nhËn ®­îc %d ®iÓm kinh nghiÖm<color>", "B¨ng Tinh Th¹ch", nTaskVal, tbTempAward.nExp))
	end
end
