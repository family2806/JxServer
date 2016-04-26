Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	SetTask(christmas_bingjing_taskid, 300000);
	Say("大侠可以获得的经验最高为30亿", 0);
end