--交丢失的刀，枪，剑等材料时的补充奖励- Created By DinhHQ - 20120409
Include("\\script\\vng_lib\\bittask_lib.lua")
tbVnExtAward = {
	tbBitTSK = {
		nTaskID = 3080,
		nStartBit = 8,
		nBitCount = 1,
		nMaxValue = 1},
}
function tbVnExtAward:VnBonusAward()	
	if PlayerFunLib:CheckTaskDaily(3086, 2, "今天你已领2次奖励了，不能再领了.", "<") then
		local tbVnBonusAward = {
			{szName = "经验值", nExp=10000000},			
			{szName="修真要诀(天池秘境)",tbProp={6,1,30164,1,0,0},nCount=1,nExpiredTime=10080},
			{szName="天池秘宝",tbProp={6,1,30193,1,0,0},nCount=3},
		}
		PlayerFunLib:AddTaskDaily(3086, 1)
		tbAwardTemplet:Give(tbVnBonusAward, 1, {"ThienTriMatCanh", "NhanThuongTaiAnSi"})
	end
end

function tbVnExtAward:SetAwardFlag(nVal)
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTSK, nVal)
end

function tbVnExtAward:ToFloor3GetAward()
	if PlayerFunLib:CheckTaskDaily(3086, 2, "今天你已领2次奖励了，不能再领了.", "<") ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.tbBitTSK, 1, "你不够领奖条件.", "==") ~= 1 then
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "为保护财产，请留下最少2个装备空位才能领奖.")
		return
	end
	self:VnBonusAward()
	self:SetAwardFlag(0)
end