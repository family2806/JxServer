Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("大理攻城战开始 ");
	-- 星期三
	TaskInterval(1440);
	
	-- 20点00分开战
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 大理编号为3,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,4) == 1) then
			StartCityWar(3);
		end
	else
		cw_start_fun(3,3)	--4代表周4,1代表cw_CanStart(3,4)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
