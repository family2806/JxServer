IncludeLib("TIMER")
Include("\\script\\missions\\newpracticemap\\head.lua")

function OnTimer()
	
	-- 检查当前的 mapid
	local nMapType = tbNewPracticeMap:checkMapId();
	
	if nMapType ~= 1 and nMapType ~= 2 then
		if tbNewPracticeMap.bDeBug == 1 then
			print("Wrong Map");
		end
		return
	end
	
	-- 检查并预扣除玩家的剩余的时间
	local nTimeLeft;
	
	if nMapType == 1 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_A) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_A, nTimeLeft);
	elseif nMapType == 2 then
		nTimeLeft = GetTask(tbNewPracticeMap.TimeLeft_B) - 1;
		SetTask(tbNewPracticeMap.TimeLeft_B, nTimeLeft);
	end

	if tbNewPracticeMap.bDeBug == 1 then
		print("Name:"..GetName().." MapType:"..nMapType.." TimeLeft:"..nTimeLeft);
	end
	
	-- 开启下一个Timer
	TM_SetTimer(tbNewPracticeMap.interval, tbNewPracticeMap.timerId, 1, 0);
	
	if nTimeLeft < 0 then
		Msg2Player("你的修炼时间已结束,将被强制推出地图!");
		local nSubWorldId, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nSubWorldId, nX/32, nY/32);
		return
	end
		
	if nTimeLeft <= tbNewPracticeMap.WarningTime then
		Msg2Player("你的修炼时间已结束, 请准备离开地图!");
	end
		
end

