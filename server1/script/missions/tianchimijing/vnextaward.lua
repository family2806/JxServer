--½»¶ªÊ§µÄµ¶£¬Ç¹£¬½£µÈ²ÄÁÏÊ±µÄ²¹³ä½±Àø- Created By DinhHQ - 20120409
Include("\\script\\vng_lib\\bittask_lib.lua")
tbVnExtAward = {
	tbBitTSK = {
		nTaskID = 3080,
		nStartBit = 8,
		nBitCount = 1,
		nMaxValue = 1},
}
function tbVnExtAward:VnBonusAward()	
	if PlayerFunLib:CheckTaskDaily(3086, 2, "H«m nay ng­¬i ®· nhËn 2 lÇn phÇn th­ëng nµy, kh«ng thÓ nhËn thªm.", "<") then
		local tbVnBonusAward = {
			{szName = "§iÓm Kinh NghiÖm", nExp=10000000},			
			{szName="Tu ch©n yÕu quyÕt (Thiªn tr× mËt c¶nh)",tbProp={6,1,30164,1,0,0},nCount=1,nExpiredTime=10080},
			{szName="Thiªn Tr× Bİ B¶o",tbProp={6,1,30193,1,0,0},nCount=3},
		}
		PlayerFunLib:AddTaskDaily(3086, 1)
		tbAwardTemplet:Give(tbVnBonusAward, 1, {"ThienTriMatCanh", "NhanThuongTaiAnSi"})
	end
end

function tbVnExtAward:SetAwardFlag(nVal)
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTSK, nVal)
end

function tbVnExtAward:ToFloor3GetAward()
	if PlayerFunLib:CheckTaskDaily(3086, 2, "H«m nay ng­¬i ®· nhËn 2 lÇn phÇn th­ëng nµy, kh«ng thÓ nhËn thªm.", "<") ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.tbBitTSK, 1, "Ng­¬i kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.", "==") ~= 1 then
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n, xin h·y chõa İt nhÊt 2 « trèng trong hµnh trang råi míi nhËn th­ëng.")
		return
	end
	self:VnBonusAward()
	self:SetAwardFlag(0)
end