Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("大理报名完成");
	-- 星期二
	TaskInterval(1440);	--每天
	
	-- 19点00分结束
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 大理编号为3,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,2) == 1) then
			EndSignUp(3);
		end
	else
		cw_endsignup_fun(2,3)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
