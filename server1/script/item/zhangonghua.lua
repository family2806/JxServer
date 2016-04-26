--战功花
--by 小浪多多
--2007-04-13
ZHANGONGHUA_EXP = 2557;		--经验变量，最多3E
function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070531) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("已充值50级以上玩家才能使用.");
		return 1;
	end;
	
	local nexp = GetTask(ZHANGONGHUA_EXP);
	local addexp = 1500000;
	if nexp >= 300000000 then
		Talk(1,"","您获得的经验已经过上限，最多只能领取3亿经验值.");
		return 1;
	end
	
	if nexp + addexp > 300000000 then
		addexp = 300000000 - nexp ;
		SetTask(ZHANGONGHUA_EXP,300000000);
	else
		SetTask(ZHANGONGHUA_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player("您增加 "..addexp.."经验值.");
	WriteLog(format("[ZhanGongHua]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end