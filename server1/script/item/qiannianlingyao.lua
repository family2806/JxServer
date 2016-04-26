IncludeLib("SETTING")

TSK_Lingyao_Date	= 2640

function main()
	if ((GetLevel() < 50 or GetExtPoint(0) == 0)and ST_IsTransLife() ~= 1) then
		Say("50级以上以及充值的才能使用", 0);
		return 1
	end
	
	ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(TSK_Lingyao_Date)) then
		SetTask(TSK_Lingyao_Date, ndate);
		AddOwnExp(20000000);
	else
		Say("每天只能使用1个千年灵药", 0);
		return 1
	end
	local nLastTime = FormatTime2Number(GetCurServerTime());
	Msg2Player(nLastTime)
end
