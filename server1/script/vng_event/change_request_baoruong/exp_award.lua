Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
tbvng_ChestExpAward = {}
tbvng_ChestExpAward.MAX_EXP_PER_DAY = 50
tbvng_ChestExpAward.TSK_DAY = 2744
--tbvng_ChestExpAward.TSK_EXP = 2742
tbvng_ChestExpAward.tbBitTask = {
	["宋金秘宝"] = {
		nTaskID = 2705,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["闯关宝箱"] = {
		nTaskID = 2705,
		nStartBit = 8,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["水贼宝箱"] = {
		nTaskID = 2705,
		nStartBit = 15,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["信使宝箱"] = {
		nTaskID = 2705,
		nStartBit = 22,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["炎帝秘宝"] = {
		nTaskID = 2706,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["卫主礼包"] = {
		nTaskID = 2706,
		nStartBit = 8,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["攻城礼包(新)"] = {
		nTaskID = 2706,
		nStartBit = 15,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["天池秘宝"] = {
		nTaskID = 3080,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["剑冢宝箱"] = {
		nTaskID = 3080,
		nStartBit = 9,
		nBitCount = 7,
		nMaxValue = 50,
	},
}
function tbvng_ChestExpAward:ExpAward(nValue, strItemName)
	local nTskDayValue = GetTask(self.TSK_DAY)
	local now = tonumber(GetLocalDate("%Y%m%d"))
	local tbBitTSK_Exp = self.tbBitTask[strItemName]
	if not tbBitTSK_Exp then
		return
	end
	if (now ~= nTskDayValue) then
		SetTask(self.TSK_DAY, now)
		for key, val in self.tbBitTask do
			%tbVNG_BitTask_Lib:setBitTask(val, 0)
		end
	else
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(tbBitTSK_Exp) == 1 then
			Msg2Player(format("今天已领够 <color=yellow>%d <color>百万经验, 不能再领了.", self.MAX_EXP_PER_DAY))
			return
		end
	end
	
	local nTskExpValue = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp)
	if (nTskExpValue + nValue/1e6) > self.MAX_EXP_PER_DAY then
		nValue = (self.MAX_EXP_PER_DAY - nTskExpValue)*1e6
	end
	--SetTask(self.TSK_EXP, GetTask(self.TSK_EXP) + nValue/1e6)
	local nNextValue = nTskExpValue + nValue/1e6
	%tbVNG_BitTask_Lib:setBitTask(tbBitTSK_Exp, nNextValue)
	AddOwnExp(nValue)
	Msg2Player(format("你已获得 %d 不叠加经验值", nValue))
	local strTongName, nResult = GetTong()
	if nResult == 0 then
		strTongName = "不"
	end
	local nMapID, _, _ = GetWorldPos()
	local strItemProp = nValue.." exp"
	local nDaylyExp = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp) * 1e6
	local strExtraInfo = "当日已领经验: "..nDaylyExp
	local strLog = GetLocalDate("%Y-%m-%d %H:%M:%S").."\t".."使用 "..strItemName.."\t"..GetAccount().."\t"..GetName().."\t"..GetLevel().."\t"..ST_GetTransLifeCount().."\t".."领取经验".."\t".."经验".."\t"..strItemProp.."\t".."1".."\t"..strTongName.."\t"..nMapID.."\t"..strExtraInfo
	WriteLog(strLog);	
end