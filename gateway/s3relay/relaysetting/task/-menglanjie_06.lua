greatseed_configtab = {
	{37, 2, 50, "\\settings\\maps\\great_night\\汴京南门.txt",}, --汴京南门;
	{162, 3, 50, "\\settings\\maps\\great_night\\大理北门.txt"},	--大理北门
	{80, 3, 50, "\\settings\\maps\\great_night\\扬州东门.txt"},	--扬州东门;
	{1, 1, 50, "\\settings\\maps\\great_night\\凤翔南门.txt"},	--凤翔南门;
	{176, 2, 50, "\\settings\\maps\\great_night\\临安南门.txt"},	--临安南门;
	{11, 2, 50, "\\settings\\maps\\great_night\\成都北门.txt"},	--成都北门;
	{78, 3, 50, "\\settings\\maps\\great_night\\襄阳西门.txt"},	--襄阳西门;
};

function TaskShedule()
	--设置方案名称
	TaskName("盂兰")
	
	local nHour = tonumber(date("%H"))
	local nMin = tonumber(date("%M"));
	nMin = nMin + 2;
	if (nMin >= 60) then
		nMin = nMin - 60;
		nHour = nHour + 1;
	end;
	
	if (nHour >= 24) then
		nHour = 0;
	end;
	TaskTime(nHour, nMin);
	
	--设置间隔时间，单位为分钟
	TaskInterval(1)
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("==================盂兰节"..nHour..":"..nMin.."开始===================");
end

function TaskContent()
	--在19:30到20:01分中间才能触发
	local START_TIME = 1930;
	local END_TIME = 2000;
	
	local nNowTime = tonumber(date("%H%M"));
	local nDate = tonumber(date("%y%m%d"));
	
	if (nDate >= 60808 and nDate <= 60815) then
		if (nNowTime >= 800 and nNowTime <= 2400)  then
			GlobalExecute("dw ShowFlower()"); --越南盂兰节种花
			OutputMsg("=================盂兰===================");
		end;
	end;
end;
