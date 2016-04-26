-- 战役系统
-- Dongzhi

function TaskShedule()
	TaskName( "宋金国战战役20:50" );
	TaskInterval( 1440 );
	TaskTime( 20, 50 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "BATTLE[GuoZhan] 20:50 startup..." );

end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		
		if CW_GetOccupant(4) == CW_GetOccupant(7) then
			local szMsg  = format("诏告天下 \"%s\" 同时，占领临安和汴京，帮主可以直接登基成天子", CW_GetOccupant(4));
			local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
			GlobalExecute(szNews);
			
			for i = 0,10 do
				NW_SetTask(i, 0);
			end
			NW_Abdicate();			-- 原来天子退位
			NW_SetTask(0, 1);		-- 宋赢
			return
		end
		
		local szMsg  = format("前线密报，宋国\"%s\" 金国 \"%s\"天子席位争夺已开始，请各位将士到宋金报名处参战!", CW_GetOccupant(7), CW_GetOccupant(4));
		local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
		GlobalExecute(szNews);
		Battle_StartNewRound( 2, 3 );	-- GM指令，启动国战宋金
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
