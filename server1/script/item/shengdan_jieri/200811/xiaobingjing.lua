Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetTask(christmas_bingjing_taskid) == 300000) then
		Say("������ʹ�ô�����ˣ����ܼ���ʹ����.", 0);
		return 1;
	end
	SetTask(christmas_bingjing_taskid, 200000);
	Say("Ŀǰ�������Ի����ߵľ���Ϊ20��", 0);
end