Include("\\script\\event\\other\\caipiao\\head_gs.lua")

function tbCaiPiao:ShowAllInfo(tbNumberList, tbNumberNameList)
	for nNumber, nCount in tbNumberList do
		local tbName	= tbNumberNameList[nNumber]
		local szMsg		= ""
		for k, v in tbName do
			if v then
				szMsg = szMsg.." "..k
			end
		end
		szMsg = format("号码<color=yellow>%s<color> 已选中 <color=yellow>%s<color> 次, 你选 <color=green>%s<color>", nNumber, nCount, szMsg)
		Msg2Player(szMsg)
	end
end

function tbCaiPiao:ApplyStartRound(nWeekDay)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)	
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_StartRound", handle)
	OB_Release(handle)
end

function tbCaiPiao:SetStage(nStage)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nStage)	
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_SetStage", handle)
	OB_Release(handle)
end

function tbCaiPiao:ApplyGetInfo(nWeekDay)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_ApplyGetInfo", handle, "tbCaiPiao_ApplyGetInfo_CallBack")
	OB_Release(handle)
end

function tbCaiPiao:AutoTest(nWeekDay, nOnlyWager)
	local handle = OB_Create()
	nWeekDay = nWeekDay or 0
	nOnlyWager = nOnlyWager or 0
	ObjBuffer:PushObject(handle, nWeekDay)
	ObjBuffer:PushObject(handle, nOnlyWager)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_AutoTest", handle)
	OB_Release(handle)
end

function tbCaiPiao:GM(nWeekDay)
	local szTitle = "指令"	
	nWeekDay = nWeekDay or 15
	local tbOpt = 
	{
		{"自动测试", self.AutoTest, {self}},
		{"自动测试某天", self.AutoTest, {self, nWeekDay}},
		{"自动竞投某天", self.AutoTest, {self, nWeekDay, 1}},
		{"看选择号码信息", self.ApplyGetInfo, {self, nWeekDay} },
		{"竞投", self.OpenInputUI, {self}},
		{"领奖", self.ApplyGetAward, {self, nWeekDay}},
		{"看结果", self.QueryResult, {self, nWeekDay}},
		{"允许投注", self.SetStage, {self, 1}},
		{"开始算中奖", self.SetStage, {self, 2}},
		
		
		{"重载脚本head_gs", LoadScript, {[[\script\event\other\caipiao\head_gs.lua]]}},
		{"重载脚本GM", LoadScript, {[[\script\event\other\caipiao\testcomand.lua]]}},
		{"结束对话"},
	}
	
	
	CreateNewSayEx(szTitle, tbOpt)
end

--relay 回调
local _CheckPlayer = function(nPlayerIndex)
	if nPlayerIndex <= 0 then
		return 
	end
	local szOldName = tbCaiPiao.tbTempCallBack[nPlayerIndex]
	local szCurName = lib:DoFunByPlayer(nPlayerIndex, GetName)
	if szOldName ~= nil and szCurName ~= nil and szOldName == szCurName then
		tbCaiPiao.tbTempCallBack[nPlayerIndex] = nil
		return 1
	end
end

function tbCaiPiao_ApplyGetInfo_CallBack(nParam, ResultHandle)

	if %_CheckPlayer(nParam) ~= 1 then
		return 
	end
	local szMsg = ObjBuffer:PopObject(ResultHandle)
	
	lib:DoFunByPlayer(nParam, Msg2Player, szMsg)
end

