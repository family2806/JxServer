Include("\\script\\activitysys\\config\\1000\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

local nYellowDaisyMaxCount = 1000

local tbGiveDaisyTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 1,
	nBitCount = 12,
	nMaxValue = 1000
}
local tbGourdUseTaskInfo =
{
	nTaskID = 2712,
	nStartBit = 13,
	nBitCount = 12,
	nMaxValue = 1000
}
--local tbSteelHeartWineUseTaskInfo =
--{
--	nTaskID = 2712,
--	nStartBit = 25,
--	nBitCount = 6,
--	nMaxValue = 5
--}
local tbGiveDaisy_AdditionalAward = {
	[500] = {szName = "§iÓm kinh nghiÖm", nExp=5000000},
	[1000] = {szName = "§iÓm kinh nghiÖm", nExp=10000000},
}
local tbUseGourd_AdditionalAward = {
	[50] = {szName = "§iÓm kinh nghiÖm", nExp=3000000},
	[100] = {szName = "§iÓm kinh nghiÖm", nExp=6000000},
	[200] = {szName = "§iÓm kinh nghiÖm", nExp=8000000},
	[300] = {szName = "§iÓm kinh nghiÖm", nExp=10000000},
	[400] = {szName = "§iÓm kinh nghiÖm", nExp=12000000},
	[500] = {szName = "§iÓm kinh nghiÖm", nExp=14000000},
	[600] = {szName = "§iÓm kinh nghiÖm", nExp=16000000},
	[700] = {szName = "§iÓm kinh nghiÖm", nExp=18000000},
	[800] = {szName = "§iÓm kinh nghiÖm", nExp=20000000},
	[900] = {szName = "§iÓm kinh nghiÖm", nExp=25000000},
	[1000] = {szName = "§iÓm kinh nghiÖm", nExp=30000000},
}
local tbUseWine_ExpAward = {
	[1] = {szName = "§iÓm kinh nghiÖm", nExp=2000000},
	[2] = {szName = "§iÓm kinh nghiÖm", nExp=3000000},
	[3] = {szName = "§iÓm kinh nghiÖm", nExp=4000000},
	[4] = {szName = "§iÓm kinh nghiÖm", nExp=5000000},
	[5] = {szName = "§iÓm kinh nghiÖm", nExp=6000000},
	[6] = {szName = "§iÓm kinh nghiÖm", nExp=6000000},
	[7] = {szName = "§iÓm kinh nghiÖm", nExp=7000000},
	[8] = {szName = "§iÓm kinh nghiÖm", nExp=8000000},
	[9] = {szName = "§iÓm kinh nghiÖm", nExp=9000000},
	[10] = {szName = "§iÓm kinh nghiÖm", nExp=10000000},
}

local tbUseWine_ItemAward = {
	{szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nCount=1,nRate=1},
	{szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nCount=1,nRate=1},
	{szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nCount=1,nRate=1},
	{szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.5},
	{szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	{szName="Phi phong Kinh L«i (DÞch chuyÓn tøc thêi)",tbProp={0,3470},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Kinh L«i (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3471},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Kinh L«i ( Träng kÝch )",tbProp={0,3472},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3210},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3220},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=20160,},
	{szName = "Sö dông ThiÕt T©m töu kh«ng may m¾n",
		pFun = function (nItemCount, szLogTitle)
			Msg2Player("LÇn nµy kh«ng may m¾n, ta ph¶i thö thªm lÇn n÷a")
		end,
		nRate = 93.5,
	}
}
local tbUseGourd_ItemAward = {
	{szName="§å Phæ Tö M·ng Kh«i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Yªu §¸i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Hé UyÓn",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Béi",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Hµi",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.1},
	{szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.1},
	{szName="HuyÒn Viªn LÖnh",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.3},
	{szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
	{szName="LÖnh Bµi Thñy TÆc",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=1, nExpiredTime = 10080},
	{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="M¹c B¾c TruyÒn Tèng LÖnh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="HuyÒn Thiªn CÈm Nang",tbProp={6,1,2355,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Ngäc Qu¸n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1},
	{szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},nCount=1,nRate=1},
	{szName="Hång bao Sum vÇy",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
	{szName="Hång bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
	{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=41.6},
	{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=10,nExpiredTime=20160},
	{szName="Ngäc Trïng LuyÖn",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.5},
	{szName="Phi phong L¨ng V©n",tbProp={0,3465},nCount=1,nRate=0.4,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong TuyÖt ThÕ",tbProp={0,3466},nCount=1,nRate=0.3,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong cÊp Ph¸ Qu©n ( dÞch chuyÓn tøc thêi )",tbProp={0,3467},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Ngao tuyÕt (DÞch chuyÓn tøc thêi)",tbProp={0,3468},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName="Phi phong Ng¹o TuyÕt (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3469},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
	{szName = "§iÓm kinh nghiÖm", nExp=7000000, nRate = 25},
}

function pActivity:VngCheckWeeklyTaskCount(nTaskID, nValue, strComparison, strFailMessage)
	local nResult = dostring("return "..%VngTaskWeekly:GetWeeklyCount(nTaskID)..strComparison..nValue)
	if not nResult then
		Talk(1, "", strFailMessage)
		return nil
	end
	return 1
end

function pActivity:VngAddWeeklyTaskCount(nTaskID, nValue)
	%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
end

function pActivity:VngGiveDaisyLimit(nCount)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGiveDaisyTaskInfo) == 1 then
		Talk(1, "", "Ng­¬i tÆng ta nhiÒu hoa råi, sè hoa nµy xin h·y nhËn l¹i.")
		return nil
	end
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
	if (nTaskVal + nCount) > %nYellowDaisyMaxCount then
		Msg2Player(format("Sè l­îng v­ît qu¸ giíi h¹n, ng­¬i chØ cã thÓ tÆng <color=yellow>%d <color>hoa cóc n÷a.", %nYellowDaisyMaxCount - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:VngGiveDaisy(nCount)
	local tbAward = {szName = "§iÓm kinh nghiÖm", nExp=1000000}
	for i = 1, nCount do
		%tbVNG_BitTask_Lib:addTask(%tbGiveDaisyTaskInfo, 1)
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "NopHoaCucVang"})
		
		--µ±½»×ã500, 1000¾Õ»¨µÄÔÙ¼Ó½±Àø
		local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGiveDaisyTaskInfo)
		if %tbGiveDaisy_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbGiveDaisy_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("Nop%dlanvatphamHoaCucVang", nTaskVal)})
		end
	end
end

function pActivity:VngGourdUseLimit()
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(%tbGourdUseTaskInfo) == 1 then
		Talk(1, "", "Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm")
		return nil
	end
	return 1
end

function pActivity:VngUseGourd()
	local tbAward = {szName = "§iÓm kinh nghiÖm", nExp=7000000}
	%tbVNG_BitTask_Lib:addTask(%tbGourdUseTaskInfo, 1)	
	tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "SudungvatphamBinhHoLoPhongVanNhanPhanThuong"})
	--½±Àøitem
	tbAwardTemplet:Give(%tbUseGourd_ItemAward, 1, {"Event_MungPBM", "SudungvatphamBinhHoLoPhongVanNhanPhanThuong"})
	--Ê¹ÓÃÎïÆ·´ï±êµÄ½±Àø
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbGourdUseTaskInfo)
		if %tbUseGourd_AdditionalAward[nTaskVal] then
			local tbTempAward = %tbUseGourd_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"Event_MungPBM", format("SuDung%dlanVatPhamBinhHoLoPhongVanPhongVan", nTaskVal)})
		end
end

function pActivity:VngUseSteelHeartWine()
	local nDailyCount = PlayerFunLib:GetTaskDailyCount(2711)	
	local tbAward = %tbUseWine_ExpAward[nDailyCount]
	if tbAward then
		tbAwardTemplet:Give(tbAward, 1, {"Event_MungPBM", "SudungvatphamPhongVanThietTamTuuNhanPhanThuong"})
	end
	tbAwardTemplet:Give(%tbUseWine_ItemAward, 1, {"Event_MungPBM", "SudungvatphamPhongVanThietTamTuuNhanPhanThuong"})	
end

function pActivity:VngCheckWeeklyFeatureMatchCount(nTaskID1, nTaskID2, nTaskID3)
	local nTongKim = %VngTaskWeekly:GetWeeklyCount(nTaskID1)
	local nVuotAi = %VngTaskWeekly:GetWeeklyCount(nTaskID2)
	local nViemDe = %VngTaskWeekly:GetWeeklyCount(nTaskID3)
	local strTittle = format("TuÇn nµy c¸c h¹ ®· hoµn thµnh:\n<color=yellow>\t\t\t%-6d<color> trËn Tèng Kim\n<color=yellow>\t\t\t%-6d<color> lÇn V­ît ¶i\n<color=yellow>\t\t\t%-6d<color> lÇn v­ît ¶i Viªm §Õ", nTongKim, nVuotAi, nViemDe)	
	Say(strTittle, 1, "§ãng/OnCancel")
end

function OnCancel()
end
