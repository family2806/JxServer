IncludeLib("SETTING")

TSK_Lingyao_Date	= 2640

function main()
	if ((GetLevel() < 50 or GetExtPoint(0) == 0)and ST_IsTransLife() ~= 1) then
		Say("50�������Լ���ֵ�Ĳ���ʹ��", 0);
		return 1
	end
	
	ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(TSK_Lingyao_Date)) then
		SetTask(TSK_Lingyao_Date, ndate);
		AddOwnExp(20000000);
	else
		Say("ÿ��ֻ��ʹ��1��ǧ����ҩ", 0);
		return 1
	end
	local nLastTime = FormatTime2Number(GetCurServerTime());
	Msg2Player(nLastTime)
end
