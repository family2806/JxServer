Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\19\\valentinehead.lua")

function IsInValentineEx()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))	
	if ACTIVITY_STARTTIME <= nDate and nDate <= 20110223 then
		return 1
	end
	Msg2Player("���ǻʱ��,������Ч ")
	return 0
end


function main()
	
	if IsInValentineEx() ~= 1 then
		return
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1
	end
	
	if pActivity:CheckTask(QingRenLiHeExpLimit,500000000 ,"ͨ��������л���ܾ����Ѵ�����","<") ~= 1 then
		return 1
	end
	
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "2011�����˽ڣ����������")
	pActivity:AddTask(QingRenLiHeExpLimit,5000000)
end