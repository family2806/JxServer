Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("�����Ҫ��ֵ�Լ��ﵽ50�����ϲ���ʹ�ð׽���.", 0);
	end
	if (GetTask(christmas_yupei_taskid) + 30000000 <= 200000000) then
		SetTask(christmas_yupei_taskid, GetTask(christmas_yupei_taskid) + 30000000);
		AddOwnExp(30000000);
	else
		Say("�Ѵﾭ�����ޣ�������ʹ�ð׽�����.", 0);
		return 1;
	end
end