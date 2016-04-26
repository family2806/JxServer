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
	tinsert(tbDialog,  "领取凯旋鼓补偿奖励/#tbVngDenBuTKH:MainDialog()")  	
end

function tbVngDenBuTKH:MainDialog()
	local strTittle = "凯旋鼓补偿奖励要求:\n\t<color=red>- 150级以上人物或者已重生任务没有等级限制\n\t- 已加入帮会.<color>"
	Describe(strTittle, 2, "我想领取/#tbVngDenBuTKH:GetAward()", "关闭/OnCancel")	
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
		Talk(1,"","已过领奖时间.")
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "阁下未加入帮会，不能领奖!")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTask) == 1 then
		Talk(1, "", "阁下已领奖了")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTask, 1)
	local tbAward = {szName = "经验值", nExp = 240e6}
	tbAwardTemplet:Give(tbAward, 1, {"Noel_2011","领取凯旋鼓补偿奖励"});
end