Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("大理报名开始");
	-- 星期二
	TaskInterval(1440);
	
	-- 18点00分开始
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 大理编号为3,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,1) == 1) then
			StartSignUp(3);
		end
	else
		cw_startsignup_fun(2,3)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
