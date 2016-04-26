-- 越南资料片生日活动
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")
tbBirthday0905_msg_award =
{
	[1]	= {szName="霸王枪", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 2},
	[2]	= {szName="霸王枪", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[3]	= {szName="霸王枪", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[4]	= {szName="天残刀", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 1},
	[5]	= {szName="天残刀", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 2},
	[6]	= {szName="天残刀", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 3},
	[7]	= {szName="下日弓", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1 },
	[8]	= {szName="下日弓", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1},
};
tbBirthday0905_msg_tskgoal =
{
	500, 6,100,100,1,1,2,100,
};

function birthday0905_settask_message(nIdx)
	if (nIdx == 0) then
		return
	end
	
	if (GetLevel() < 120) then
		Say("译官: 您还未达到领取任务的条件", 0);
		return
	end
	
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	if (ntskid == 0) then
		if (ntskdate ~= ndate) then
			Say("译官: 您要努力通过考验!", 0);
			SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, nIdx);
		else
			Say("译官: 您今日的任务数量已完成. 明天再来吧.", 0);
		end
	else
		if (ntskid == nIdx) then
			Say("译官: 您已经领取了此任务.", 0);
		else
			Say("译官: 一次只能领取一个信使任务.", 0);
		end
	end
end

function birthday0905_gettask_message(nIdx)
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	local ntskcount	= GetTask(tbBirthday0905.tbTask.tsk_msg_needcount);
	if (ntskid ~= nIdx) then
		Say("译官: 您还未达到领取任务的条件.", 0);
		return
	end
	
	if (ntskcount < tbBirthday0905_msg_tskgoal[nIdx]) then
		Say("译官: 你是没有生命力和信心通过这次考验吗?", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("译官: 为了保证物品的安全, 请整理好您的背包以防放不下(10个格).", 0);
		return
	end
	
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0);
	SetTask(tbBirthday0905.tbTask.tsk_msg_date + nIdx, ndate);
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("译官: 做得好, 这是您应得的奖励!", 0);
	tbAwardTemplet:GiveAwardByList(tbBirthday0905_msg_award[nIdx], "Hoat dong SNVLTK_Phan thuong nhiem vu tin su")
end

function birthday0905_cancel_message()
	local ntsk 	= tbBirthday0905.tbTask.tsk_msg_curtsk;
	if (GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk) == 0) then
		Say("译官: 您还未接受任务嘛!", 0);
		return
	end
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0)
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("译官: 您现在已成功取消任务!", 0);
end