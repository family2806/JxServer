--ս����
--by С�˶��
--2007-04-13
ZHANGONGHUA_EXP = 2557;		--������������3E
function main(sel)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (nDate > 070531) then
		return 0
	end;
	if (GetLevel() < 50) then
		Msg2Player("�ѳ�ֵ50��������Ҳ���ʹ��.");
		return 1;
	end;
	
	local nexp = GetTask(ZHANGONGHUA_EXP);
	local addexp = 1500000;
	if nexp >= 300000000 then
		Talk(1,"","����õľ����Ѿ������ޣ����ֻ����ȡ3�ھ���ֵ.");
		return 1;
	end
	
	if nexp + addexp > 300000000 then
		addexp = 300000000 - nexp ;
		SetTask(ZHANGONGHUA_EXP,300000000);
	else
		SetTask(ZHANGONGHUA_EXP,tonumber(nexp+addexp));
	end
	
	AddOwnExp(addexp);
	Msg2Player("������ "..addexp.."����ֵ.");
	WriteLog(format("[ZhanGongHua]\t Date:%s\t Account:%s\t Name:%s\t Effect:GetExp %s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),addexp));
		
end