Include("\\script\\missions\\challengeoftime\\include.lua")
TSK_Longxuewan_Date = 2641
TSK_Longxuewan_Use	= 2642
function main()
--	if (GetLevel() < 90 or GetExtPoint(0) == 0) then
--		Say("�����Ҫ90���������ѳ�ֵ����ʹ��", 0);
--		return 1
--	end
	
	ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(TSK_Longxuewan_Date)) then
		SetTask(TSK_Longxuewan_Date, ndate);
		SetTask(TSK_Longxuewan_Use, 0);
		if (ndate ~= GetTask(1551)) then
			SetTask(1551, ndate);
			SetTask(1550, COUNT_LIMIT);
		end
	end
		
	if(GetTask(TSK_Longxuewan_Use) >= 2) then
		Say("ÿ��ֻ��ʹ��2����Ѫ��", 0);
		return 1
	end
	

	SetTask(1550, GetTask(1550) + 1);
	SetTask(TSK_Longxuewan_Use, GetTask(TSK_Longxuewan_Use) + 1);
	Say("����һ�βμӻ�Ļ���<��սʱ��>!", 0);
end