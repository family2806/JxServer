Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

 tbAwardExpUseLinhDuoc = {szName = "经验值", nExp = 10e6}
 
 TASK_LIMIT_EXP_USE_LINHDUOC 	= 2770
 TASK_DAILY_USE_LINHDUOC			= 2771
 
function main(nItemIndex)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("物品过期，自动丢弃.")
		return 0;
	end
	
	if GetLevel() < 50 then
		Say("50级以上才可以使用此物品",0)
		return 1
	end
	
	if (PlayerFunLib:CheckTaskDaily(TASK_DAILY_USE_LINHDUOC,5,"每天最多只能用5次!","<") ~= 1) then
			return 1
	end
	
	if (GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) >= 120) then
		Say("灵药使用已达上限!",0)
		return 1
	end
	
	SetTask(TASK_LIMIT_EXP_USE_LINHDUOC, GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) + 1)
	PlayerFunLib:AddTaskDaily(TASK_DAILY_USE_LINHDUOC,1)
	
	tbAwardTemplet:GiveAwardByList(tbAwardExpUseLinhDuoc, "使用灵药");
	return 0
end