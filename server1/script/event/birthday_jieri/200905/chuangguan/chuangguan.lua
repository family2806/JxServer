-- 越南资料片生日活动
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function guoguan_xunbao()
	Say("聂弑尘: 日19/06/2009 时24:00 19/07/2009 您可以从我们这领过关寻宝的任务.接受任务之后, 当您参加高级挑战将可领取开门信物雄心剑, 领取到雄心剑的数量多少是根据您闯过15, 20, 25还是29关而定的.", 3,
		"领取过关寻宝任务/gettask_chuangguan",
		"我来交过关寻宝的任务/fullfilltask_chuangguan",
		"我只是来看看./OnCancel");
end

function gettask_chuangguan()
	if (GetLevel() < 90) then
		Say("聂弑尘: 您不符合接受任务的条件.", 0);
		return
	end
	
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 1) then
		Say("聂弑尘: 您已接受了任务.", 0);
		return
	end
	
	Say("聂弑尘: 太好了, 祝您过关成功.", 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 1);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
end

function fullfilltask_chuangguan()
	if (GetTask(tbBirthday0905.tbTask.tsk_toll_cg_state) == 0) then
		Say("聂弑尘: 您还未接受任务\"过关寻宝\".", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("聂弑尘: 为了保证物品的安全, 请整理好您的背包以防放不下(10个格).", 0);
		return
	end
	
	local nToll = GetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount);
	if (nToll < 15) then
		Say("聂弑尘: 您没有完成任务吗?", 0);
		return
	end
	
	local nAwardCount = 0;
	if (nToll >= 29) then
		nAwardCount = 5;
	elseif (nToll >= 25) then
		nAwardCount = 3;
	elseif (nToll >= 20) then
		nAwardCount = 2;
	else
		nAwardCount = 1;
	end
	Say("聂弑尘: 太好了, 这是您应得的奖励!", 0);
	Msg2Player(format("得到 %d 雄心剑.", nAwardCount));
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_state, 0);
	SetTask(tbBirthday0905.tbTask.tsk_toll_cg_passcount, 0);
	for i = 1, nAwardCount do
		AddItem(6, 1, 2070, 1, 0, 0);
	end
end

function OnCancel()

end