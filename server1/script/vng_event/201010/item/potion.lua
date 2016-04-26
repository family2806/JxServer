Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

 tbAwardExpUseLinhDuoc = {szName = "�i����ֵ", nExp = 10e6}
 
 TASK_LIMIT_EXP_USE_LINHDUOC 	= 2770
 TASK_DAILY_USE_LINHDUOC			= 2771
 
function main(nItemIndex)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("��Ʒ���ڣ��Զ�����.")
		return 0;
	end
	
	if GetLevel() < 50 then
		Say("50�����ϲſ���ʹ�ô���Ʒ",0)
		return 1
	end
	
	if (PlayerFunLib:CheckTaskDaily(TASK_DAILY_USE_LINHDUOC,5,"ÿ�����ֻ����5��!","<") ~= 1) then
			return 1
	end
	
	if (GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) >= 120) then
		Say("��ҩʹ���Ѵ�����!",0)
		return 1
	end
	
	SetTask(TASK_LIMIT_EXP_USE_LINHDUOC, GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) + 1)
	PlayerFunLib:AddTaskDaily(TASK_DAILY_USE_LINHDUOC,1)
	
	tbAwardTemplet:GiveAwardByList(tbAwardExpUseLinhDuoc, "ʹ����ҩ");
	return 0
end