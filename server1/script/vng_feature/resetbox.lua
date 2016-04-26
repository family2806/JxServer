
ResetBox = {}

ResetBox.TSK_TIME_ASSIGN = 2752

ResetBox.WAIT_DATE = 7

ResetBox.TBMONTH =  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

function ResetBox:ShowDialog()
	local tbOpt = {}
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	self:CheckExpiredDate()
	
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		tinsert(tbOpt ,"登记删除pass箱/#ResetBox:AssignResetBox()")
	end
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		if (self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7) == nCurDate) then
			tinsert(tbOpt ,"确认删除pass箱/#ResetBox:ConfirmResetBox()")
		end	
		tinsert(tbOpt ,"看删除pass箱完成时间/#ResetBox:ShowTimeResetBox()")
		tinsert(tbOpt, "放弃删除pass箱/#ResetBox:CancelResetBox()")
	end
	tinsert(tbOpt, "退出/nothing")
	Say("大侠找我有什么事吗 ", getn(tbOpt), tbOpt)	
end

function ResetBox:AssignResetBox()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	SetTask(self.TSK_TIME_ASSIGN, nCurDate)
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "pass箱将删除于 <color=yellow>" .. szDate  .. "<color>\n 如果24小时后<color=yellow>" .. szDate .. " <color>大侠确认则登记删除pass箱将被删除")
	self:WriteLogResetBox("Reset pass箱 - 登记")
end

function ResetBox:CancelResetBox()
	SetTask(self.TSK_TIME_ASSIGN, 0)
	Msg2Player("放弃删除pass箱成功!")
	self:WriteLogResetBox("Reset pass箱 - 放弃登记")
end

function ResetBox:ShowTimeResetBox()
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "pass箱将删除于 <color=yellow>" .. szDate  .. "<color>\n如果24小时后<color=yellow>" .. szDate .. " <color>大侠确认则登记删除pass箱将被删除")
end

function ResetBox:ConfirmResetBox()
	GMCancleBoxPassword()
	Msg2Player("开pass箱成功!")
	SetTask(self.TSK_TIME_ASSIGN, 0)
	self:WriteLogResetBox("Reset pass箱 - 成功删除pass箱")
end

function ResetBox:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		return
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate == self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 8)) then
		SetTask(self.TSK_TIME_ASSIGN, 0)
		Msg2Player("你确定删除已过期的pass箱, 请重新登记!")
	end
end

function ResetBox:AnnounceResetBoxDate()
	self:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
		local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
		Talk(1, "", "pass箱将删除于 <color=yellow>" .. szDate  .. "<color>\n如果24小时后<color=yellow>" .. szDate .. " <color>大侠确认则登记删除pass箱将被删除 ")
	end
end

function ResetBox:GetNextDate(oldday, num)
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	while (nDay > self.TBMONTH[nMonth]) do
		nDay = nDay - self.TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function nothing()

end

function ResetBox:WriteLogResetBox(szLogTitle)
	WriteLog(date("%Y%m%d %H%M%S").."\t".. GetAccount().."\t"..GetName().."\t".. szLogTitle)
end