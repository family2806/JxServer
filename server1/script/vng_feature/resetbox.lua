
ResetBox = {}

ResetBox.TSK_TIME_ASSIGN = 2752

ResetBox.WAIT_DATE = 7

ResetBox.TBMONTH =  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

function ResetBox:ShowDialog()
	local tbOpt = {}
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	self:CheckExpiredDate()
	
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		tinsert(tbOpt ,"�Ǽ�ɾ��pass��/#ResetBox:AssignResetBox()")
	end
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		if (self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7) == nCurDate) then
			tinsert(tbOpt ,"ȷ��ɾ��pass��/#ResetBox:ConfirmResetBox()")
		end	
		tinsert(tbOpt ,"��ɾ��pass�����ʱ��/#ResetBox:ShowTimeResetBox()")
		tinsert(tbOpt, "����ɾ��pass��/#ResetBox:CancelResetBox()")
	end
	tinsert(tbOpt, "�˳�/nothing")
	Say("����������ʲô���� ", getn(tbOpt), tbOpt)	
end

function ResetBox:AssignResetBox()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	SetTask(self.TSK_TIME_ASSIGN, nCurDate)
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "pass�佫ɾ���� <color=yellow>" .. szDate  .. "<color>\n ���24Сʱ��<color=yellow>" .. szDate .. " <color>����ȷ����Ǽ�ɾ��pass�佫��ɾ��")
	self:WriteLogResetBox("Reset pass�� - �Ǽ�")
end

function ResetBox:CancelResetBox()
	SetTask(self.TSK_TIME_ASSIGN, 0)
	Msg2Player("����ɾ��pass��ɹ�!")
	self:WriteLogResetBox("Reset pass�� - �����Ǽ�")
end

function ResetBox:ShowTimeResetBox()
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "pass�佫ɾ���� <color=yellow>" .. szDate  .. "<color>\n���24Сʱ��<color=yellow>" .. szDate .. " <color>����ȷ����Ǽ�ɾ��pass�佫��ɾ��")
end

function ResetBox:ConfirmResetBox()
	GMCancleBoxPassword()
	Msg2Player("��pass��ɹ�!")
	SetTask(self.TSK_TIME_ASSIGN, 0)
	self:WriteLogResetBox("Reset pass�� - �ɹ�ɾ��pass��")
end

function ResetBox:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		return
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate == self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 8)) then
		SetTask(self.TSK_TIME_ASSIGN, 0)
		Msg2Player("��ȷ��ɾ���ѹ��ڵ�pass��, �����µǼ�!")
	end
end

function ResetBox:AnnounceResetBoxDate()
	self:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
		local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
		Talk(1, "", "pass�佫ɾ���� <color=yellow>" .. szDate  .. "<color>\n���24Сʱ��<color=yellow>" .. szDate .. " <color>����ȷ����Ǽ�ɾ��pass�佫��ɾ�� ")
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