Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("玩家需要充值以及达到50级以上才能使用白金佩.", 0);
	end
	if (GetTask(christmas_yupei_taskid) + 30000000 <= 200000000) then
		SetTask(christmas_yupei_taskid, GetTask(christmas_yupei_taskid) + 30000000);
		AddOwnExp(30000000);
	else
		Say("已达经验上限，不能再使用白金佩了.", 0);
		return 1;
	end
end