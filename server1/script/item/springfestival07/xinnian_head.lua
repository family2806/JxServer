IncludeLib("TIMER")

TIMER_XINNIANLIHUA = 83	--��ʱ��;��settings\timertask.txt����
XINNIANLIHUA_TIMES = 5*60	--��ȼ��5����
XINNIAN_MAXEXP = 100000000
TB_XINNIANLIHUA_SKILL = {757, 760};

TSK_XINNIANLIHUA_MAXEXP = 1587;
TSK_XINNIANNIANGAO_MAXEXP = 1588;

function isTakeXinNianItem(nItemIdx)
	if (GetLevel() < 80) then
		Say("����Ҫ80���Ժ����ʹ��!", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate > 20070306) then
		Say(GetItemName(nItemIdx).."�ѹ�ʹ���ڣ��������ʹ�ý��к�����Ҫ����", 0);
		RemoveItemByIndex(nItemIdx);
		return 0;
	end;
	return 1;
end;

