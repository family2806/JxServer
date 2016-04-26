Include("\\script\\gb_taskfuncs.lua")

local nStartDate	 = 20091116;
local nCloseDate	 = 21091202;			

local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end
function TaskShedule()
	TaskName("越南教师节活动-猜花灯");
	local  nInterval = 15
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数
	

	TaskCountLimit(0)
	OutputMsg("越南教师节活动-猜花灯");
end

function TaskContent()
	
	local nDate = tonumber(date("%Y%m%d"));
	local nTime = tonumber(date("%H%M%S"));

	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	
	--if (110000 <= nTime and nTime <= 120000) or (190000 <= nTime and nTime <= 200000) then
	if (143000 <= nTime and nTime <= 153000) or (200000 <= nTime and nTime <= 210000) then
		OutputMsg("[2009Teacher's Day] tbJiaoShi2009:AddHuaDeng()");
		GlobalExecute("dwf \\script\\event\\jiaoshi_jieri\\200910\\huadeng_fresh.lua tbJiaoShi2009:AddHuaDeng()");
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end