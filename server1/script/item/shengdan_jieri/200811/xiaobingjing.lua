Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetTask(christmas_bingjing_taskid) == 300000) then
		Say("大侠已使用大冰晶了，不能继续使用了.", 0);
		return 1;
	end
	SetTask(christmas_bingjing_taskid, 200000);
	Say("目前大侠可以获得最高的经验为20亿", 0);
end