IncludeLib("TIMER")

TIMER_XINNIANLIHUA = 83	--计时器;在settings\timertask.txt申请
XINNIANLIHUA_TIMES = 5*60	--礼花燃放5分钟
XINNIAN_MAXEXP = 100000000
TB_XINNIANLIHUA_SKILL = {757, 760};

TSK_XINNIANLIHUA_MAXEXP = 1587;
TSK_XINNIANNIANGAO_MAXEXP = 1588;

function isTakeXinNianItem(nItemIdx)
	if (GetLevel() < 80) then
		Say("您需要80级以后才能使用!", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate > 20070306) then
		Say(GetItemName(nItemIdx).."已过使用期，如果继续使用将有害，需要丢掉", 0);
		RemoveItemByIndex(nItemIdx);
		return 0;
	end;
	return 1;
end;

