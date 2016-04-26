Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbVngDenBuTKH = {
	nStartDate = 201112050800,
	nEndDate = 201112062400,
	tbBitTask = {
		nTaskID = 2912,
		nStartBit = 19,
		nBitCount = 1,
		nMaxValue = 1
	}	
}

function tbVngDenBuTKH:AddDialog(tbDialog)
	if self:IsActive() ~= 1 or tbVNG_BitTask_Lib:getBitTask(self.tbBitTask) == 1 then		
		return
	end
	tinsert(tbDialog,  "��ȡ�����Ĳ�������/#tbVngDenBuTKH:MainDialog()")  	
end

function tbVngDenBuTKH:MainDialog()
	local strTittle = "�����Ĳ�������Ҫ��:\n\t<color=red>- 150�����������������������û�еȼ�����\n\t- �Ѽ�����.<color>"
	Describe(strTittle, 2, "������ȡ/#tbVngDenBuTKH:GetAward()", "�ر�/OnCancel")	
end

function tbVngDenBuTKH:IsActive()
	local now = tonumber(date("%Y%m%d%H%M"));
	if now < self.nStartDate or now >= self.nEndDate then
		return 0
	end
	return 1
end

function tbVngDenBuTKH:GetAward()
	if self:IsActive() ~= 1 then
		Talk(1,"","�ѹ��콱ʱ��.")
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "����δ�����ᣬ�����콱!")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTask) == 1 then
		Talk(1, "", "�������콱��")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTask, 1)
	local tbAward = {szName = "�i����ֵ", nExp = 240e6}
	tbAwardTemplet:Give(tbAward, 1, {"Noel_2011","��ȡ�����Ĳ�������"});
end