Include("\\script\\activitysys\\config\\1003\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1003\\variables.lua")

local tbUseTTHT_AdditionalAward = {
	[20] = {szName = "§iÓm Kinh NghiÖm", nExp=2000000},
	[40] = {szName = "§iÓm Kinh NghiÖm", nExp=4000000},
	[60] = {szName = "§iÓm Kinh NghiÖm", nExp=6000000},
	[80] = {szName = "§iÓm Kinh NghiÖm", nExp=8000000},
	[100] = {szName = "§iÓm Kinh NghiÖm", nExp=10000000},
	[200] = {szName = "§iÓm Kinh NghiÖm", nExp=12000000},
	[300] = {szName = "§iÓm Kinh NghiÖm", nExp=14000000},
	[400] = {szName = "§iÓm Kinh NghiÖm", nExp=16000000},
	[500] = {szName = "§iÓm Kinh NghiÖm", nExp=18000000},
	[600] = {szName = "§iÓm Kinh NghiÖm", nExp=20000000},
	[700] = {szName = "§iÓm Kinh NghiÖm", nExp=20000000},
	[800] = {szName = "§iÓm Kinh NghiÖm", nExp=20000000},
	[900] = {szName = "§iÓm Kinh NghiÖm", nExp=20000000},
	[1000] = {szName = "§iÓm Kinh NghiÖm", nExp=20000000},
	[1100] = {szName = "§iÓm Kinh NghiÖm", nExp=25000000},
	[1200] = {szName = "§iÓm Kinh NghiÖm", nExp=25000000},
	[1300] = {szName = "§iÓm Kinh NghiÖm", nExp=25000000},
}

local tbUseTTHT_ItemAward = {
	{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.35},
	{szName="§å Phæ Tö M·ng Kh«i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Yªu §¸i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Hé UyÓn",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Béi",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Hµi",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
	{szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
	{szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
	{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
	{szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
	{szName="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="B¾c §Èu truyÒn c«ng thuËt",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
	{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
	{szName="Thiªn tinh b¹ch c©u hoµn",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
	{szName="B¹ch C©u Hoµn ®Æc biÖt",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
	{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=5,nExpiredTime=43200},
	{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=5,nExpiredTime=43200},
	{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="Viªm §Õ LÖnh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="Tèng Kim Chiªu Binh LÔ Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName = "§iÓm Kinh NghiÖm", nExp=25000000,nRate=1},
	{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=2},
	{szName = "§iÓm Kinh NghiÖm", nExp=15000000,nRate=3},
	{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=10},
	{szName = "§iÓm Kinh NghiÖm", nExp=6000000,nRate=25},
	{szName="DÞ Dung BÝ ThuËt",tbProp={6,1,2951,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
	{szName="KÝch C«ng Trî Lùc Hoµn",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="¢m D­¬ng Ho¹t HuyÕt §¬n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Hoµn Hån §¬n",tbProp={6,1,2837,1,0,0},nCount=1,nRate=5},
	{szName="Tiªu Diªu T¸n",tbProp={6,1,2831,1,0,0},nCount=1,nRate=5},
}

function pActivity:InitNpc()
	local tbNpcPos = {
		[1] = 
		{
			{176,1441,3277},			
		},		
	}
	local tbNpc = {
		[1] = {
			szName = "Môc KiÒu Liªn", 
			nLevel = 95,
			nNpcId = 342,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},		
	}
	for i=1,getn(tbNpc) do
		for j = 1, getn(tbNpcPos[i]) do
			local nMapId, nPosX, nPosY = unpack(tbNpcPos[i][j])
			basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
		end
	end
end

function pActivity:GiveRedRoseBud(nCount)
	local tbAward = {szName="Cöu Tiªn Ngù YÕn",tbProp={6,1,30128,1,0,0},nCount=1,nExpiredTime=%nItemExpiredTime}
	for i = 1, nCount do
		--¾­Ñé½±Àø
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseBudLimit) ~= 1 then
			%tbVNG_BitTask_Lib:addTask(%tbGiveRedRoseBudLimit, 1)
			tbAwardTemplet:Give({szName = "§iÓm Kinh NghiÖm", nExp=1000000}, 1, {"EventVuLanBaoHieu", "DoiNuHoaHongDoNhanKinhNghiem"})
		end		
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "DoiNuHoaHongDoNhanVatPham"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "Doi1NuHoaHongDo", "1 Cöu Tiªn Ngù YÕn", 1)
	end
end

function pActivity:CheckGiveRedRoseLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseLimit) == 1 then
		Talk(1, "", "Ng­¬i tÆng ta nhiÒu hoa råi, sè hoa nµy xin h·y nhËn l¹i.")
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveRedRoseLimit)
	if (nTaskVal + nCount) > %nRedRoseMaxCount then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, ng­¬i chØ cã thÓ tÆng <color=yellow>%d <color>Hoa Hång §á n÷a.", %nRedRoseMaxCount - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:GiveRedRose(nCount)
	local tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=500000}
	for i = 1, nCount do
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveRedRoseLimit) == 1 then
			return nil
		end
		%tbVNG_BitTask_Lib:addTask(%tbGiveRedRoseLimit, 1)
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "TangHoaHongDo"})		
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "TangHoaHongDo", "500000 §iÓm Kinh NghiÖm", 1)
	end
end

function pActivity:TTHT_Limit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbUseTTHTLimit) == 1 then
		Talk(1, "", "Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm")
		return nil
	end
	return 1
end

function pActivity:Use_TTHT()
	local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp=5000000}
	%tbVNG_BitTask_Lib:addTask(%tbUseTTHTLimit, 1)	
	tbAwardTemplet:Give(tbExpAward, 1, {"EventVuLanBaoHieu", "SuDungThuyTuuHoTienNhanKinhNghiem"})
	--½±Àøitem
	local tbTranslog = {strFolder = %strTranLogFolder, nPromID = %nPromotionID, nResult = 1}
	tbAwardTemplet:Give(%tbUseTTHT_ItemAward, 1, {"EventVuLanBaoHieu", "SuDungThuyTuuHoTienNhanVatPham", tbTranslog})
	--Ê¹ÓÃÎïÆ·´ï±ê½±Àø
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbUseTTHTLimit)
		if %tbUseTTHT_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbUseTTHT_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"EventVuLanBaoHieu", format("SuDung%dlanVatPhamThuyTuuHoTien", nTaskVal)})
		end
end

function pActivity:GiveCuuTienLimit(nCount)
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(%TSK_GIVE_CUU_TIEN_NGU_YEN_DAILY)
	if not nTaskVal then
		return nil
	end
	if (nTaskVal + nCount) > %nGive_Cuu_Tien_Daily_Max_Count then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, ng­¬i chØ cã thÓ tÆng <color=yellow>%d <color>Cöu Tiªn Ngù YÕn n÷a.", %nGive_Cuu_Tien_Daily_Max_Count - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:GiveCuuTien(nCount)		
	local tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=1000000}
	PlayerFunLib:AddTaskDaily(%TSK_GIVE_CUU_TIEN_NGU_YEN_DAILY, nCount)
	for i = 1, nCount do		
		tbAwardTemplet:Give(tbAward, 1, {"EventVuLanBaoHieu", "TangCuuTienNguYen"})
		tbVngTransLog:Write(%strTranLogFolder, %nPromotionID, "TangCuuTienNguYen", "1000000 §iÓm Kinh NghiÖm", 1)
	end
	return 1
end