--����ʧ�ĵ���ǹ�����Ȳ���ʱ�Ĳ��佱��- Created By DinhHQ - 20120409
Include("\\script\\vng_lib\\bittask_lib.lua")
tbVnExtAward = {
	tbBitTSK = {
		nTaskID = 3080,
		nStartBit = 8,
		nBitCount = 1,
		nMaxValue = 1},
}
function tbVnExtAward:VnBonusAward()	
	if PlayerFunLib:CheckTaskDaily(3086, 2, "����������2�ν����ˣ�����������.", "<") then
		local tbVnBonusAward = {
			{szName = "����ֵ", nExp=10000000},			
			{szName="����Ҫ��(����ؾ�)",tbProp={6,1,30164,1,0,0},nCount=1,nExpiredTime=10080},
			{szName="����ر�",tbProp={6,1,30193,1,0,0},nCount=3},
		}
		PlayerFunLib:AddTaskDaily(3086, 1)
		tbAwardTemplet:Give(tbVnBonusAward, 1, {"ThienTriMatCanh", "NhanThuongTaiAnSi"})
	end
end

function tbVnExtAward:SetAwardFlag(nVal)
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTSK, nVal)
end

function tbVnExtAward:ToFloor3GetAward()
	if PlayerFunLib:CheckTaskDaily(3086, 2, "����������2�ν����ˣ�����������.", "<") ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.tbBitTSK, 1, "�㲻���콱����.", "==") ~= 1 then
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "Ϊ�����Ʋ�������������2��װ����λ�����콱.")
		return
	end
	self:VnBonusAward()
	self:SetAwardFlag(0)
end