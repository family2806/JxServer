--国情徽章
--by 小浪多多
--2007-08-8
TASK_EXP = 1832;					--经验变量，最多4E,不叠加
TASK_TOP_EXP = 400000000;	--最多可得经验
TASK_GET_EXP = 2091945;		--一次获得经验
TASK_LEVEL = 50						--等级限制
TASK_DATE_END = 07092324--使用截至时间
function main(sel)
	nDate = tonumber(GetLocalDate("%y%m%d%H"))
	if TASK_DATE_END < nDate then
		Talk(1,"","真是遗憾，该物品已过使用期.")
		return 0
	end
	if GetLevel() < TASK_LEVEL then
		Talk(1,"","只有50级以上玩家才能使用国庆勋章.")
		return 1
	end
	local nexp = GetTask(TASK_EXP);
	local addexp = TASK_GET_EXP;
	if nexp >= TASK_TOP_EXP then
		Talk(1,"","只能最多获得4亿经验值!!!")
		return 1
	end
	
	if nexp + addexp > TASK_TOP_EXP then
		addexp = TASK_TOP_EXP - nexp ;
		SetTask(TASK_EXP,TASK_TOP_EXP);
	else
		SetTask(TASK_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player(format("您获得 %d 经验值.",addexp));
	WriteLog(format("[GuoQingHuiZhang]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end