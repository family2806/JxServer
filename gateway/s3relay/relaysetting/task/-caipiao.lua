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

Include("\\script\\event\\other\\caipiao\\head_gc.lua")

Include("\\script\\lib\\baseclass.lua")


local tbCaiPiao_TaskShedule = function()
	local nHM = tonumber(date("%H%M"))
	local nWeekDay = tonumber(date("%W%w"))
	local nDay = tonumber(date("%w"))
	local nDate = tonumber(date("%Y%m%d%H%M"))
	
	local nAwardWeekDay = tbCaiPiao:GetCurAwardWeekDay()
	if 201002040000 > nDate or nDate > 201003220000 then
		return 
	end
	
	if tonumber(date("%Y%m%d")) < 20100224 then
		--暂时不开放
		return 
	end
	
	
	if (nDay == 5 or nDay == 6 or nDay == 0) then
		if 0800 <= nHM and nHM < 2100  then
			if tbCaiPiao:CheckRound(nWeekDay) ~= 1 then
				tbCaiPiao:NewRound(nWeekDay)
				tbCaiPiao:DebugOut("选号资料 , nWeekDay, "不存在,新建一个，开始竞投")
			else
				tbCaiPiao:LoadAllData(nWeekDay)
				tbCaiPiao:DebugOut("选号资料, nWeekDay, "读取，开始竞投")
			end
		end
	end
	
	
	if nAwardWeekDay ~= nil then
			
		local tbTemp = tbBaseClass:NewClass(tbCaiPiao, nAwardWeekDay)
		
		if mod(nAwardWeekDay, 10) == 0 and tbTemp:CheckRound(nAwardWeekDay) ~= 1 then
			tbTemp:NewRound(nAwardWeekDay)
			tbTemp:DebugOut("周日竟然没人投，必须产生一个", nAwardWeekDay)
		end
		
		if tbTemp:CheckRound(nAwardWeekDay) == 1 then				
			tbTemp:LoadAllData(nAwardWeekDay)
			
			if tbTemp.nStage == 3 then
				tbTemp:DebugOut("已经有结果", nAwardWeekDay)
			else
				tbTemp:CalcResult()
				tbTemp:DebugOut("【计算】彩票数据", nAwardWeekDay)
			end
		else
			tbTemp:DebugOut("选号资料, nAwardWeekDay, "不存在，不计算结果")
		end
	end
end
function TaskShedule()
	--设置方案名称
	TaskName("时间方案")
	
	local  nInterval = 30
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数	
	
	TaskCountLimit(0)
	%tbCaiPiao_TaskShedule()
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "caipiao",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	
	%tbCaiPiao_TaskShedule()
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end