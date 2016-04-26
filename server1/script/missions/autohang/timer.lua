Include("\\script\\missions\\autohang\\head.lua");

g_nPassTimes = 0;
g_bFreeTime = 0; -- 免费时间

function OnTimer()

	g_bFreeTime = AEXP_IsFreeTimeDoubleExp();
	
	-- 设置是否免费，以及经验倍数(>=1)
	SetAutoHangFreeFlag(g_bFreeTime, AEXP_FREEDATE_EXPFACTOR);
	
	-- 尝试走程序版本的OnTimer处理函数
	nRun = TimerFuncForAutoHang();
	
	-- 服务器设置OnTimer处理为程序版本(不再向下执行了)
	if (nRun > 0) then
		return 1;
	end

	PlayerTab = {};
	pidx = GetFirstPlayerAtSW();
	i = 1;
	while (pidx > 0) do
		PlayerTab[i] = pidx;		
		pidx = GetNextPlayerAtSW();
		i = i + 1;
	end
	
	PCount = getn(PlayerTab);
	
	-- print("当前桃花岛人数: "..PCount);

	OldPlayer = PlayerIndex;
	-- 随机产生幸运玩家，并获得随机物品 - start
	nLockNum = floor(PCount / 100);
	for i = 1, nLockNum do
		nTemp = random(1, PCount);
		PlayerIndex = PlayerTab[nTemp];
		if (g_bFreeTime == 1) then -- 免费时间
			AddItemForAutoHang(); -- 幸运物品
		else
			nPointTime = GetTask(AEXP_TASKID);
			if (nPointTime >= AEXP_TIME_UPDATE) then -- 若这人挂机点数不足，就不能得到幸运物品了
				AddItemForAutoHang();
			end	
		end
	end
	-- 随机产生幸运玩家，并获得随机物品 - end

	-- 增加经验值 - start
	nValidCount = 0; -- 有效挂机玩家人数
	nRet = 0;
	for i  = 1, PCount do
		PlayerIndex = PlayerTab[i];
		nRet = AEXP_AddHangExp();
		if (nRet > 0) then
			nValidCount = nValidCount + 1;
		end
	end
	-- 增加经验值 - end	
	PlayerIndex = OldPlayer;
	
	-- 统计自动挂机人数
	g_nPassTimes = g_nPassTimes + 1;
	if (g_nPassTimes >= AEXP_STAT_FREQ) then
		CalcAutoHangPlayerCount(SubWorldIdx2ID(), PCount, nValidCount);
		g_nPassTimes = 0;
	end
end;

-- 增加某个挂机玩家的经验值
-- 此函数在OnTimer时被AutoAddExpForAllPlayers调用
function AEXP_AddHangExp()

	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Msg2Player("<#>你的功力太差了！到"..AEXP_NEEDLEVEL.."<#> 级再回来吧！");
		return -1;
	end
	
	nExp = 0;
	nPointTime = 0;
	-----------------------
	if (g_bFreeTime == 1) then-- 免费加倍经验日子
		-- 不需要腊八粥
		-- 经验加倍
		nExp = GetAutoHangExpValue(nLevel);
		nExp = nExp * AEXP_FREEDATE_EXPFACTOR;
	else -- 普通日子
		nPointTime = GetTask(AEXP_TASKID);
	
		if (nPointTime == 0) then
			Msg2Player("只有腊八粥才可以吸收这个岛的精华，请你到桃花隐士处买点粥."); -- Todo
			return -1;	
		elseif (nPointTime < AEXP_TIME_UPDATE) then
			Msg2Player("腊八粥的效力快没有了，你要到桃花隐士那里再买点才可以增加功力."); -- Todo
			return -1;
		end
		
		nExp = GetAutoHangExpValue(nLevel);
	end;
	-----------------------
	
	-- 分时段 - start
	szHour = date("%H");
	nHour = tonumber(szHour);
	
	if (nHour < 9) then -- 凌晨(0~9)
		nExp = floor(nExp * 1.2);
	elseif (nHour < 18) then  -- 白天(9~18)
		nExp = nExp;
	elseif (nHour < 24) then  -- 晚上(18~24)
		nExp = floor(nExp * 0.8);
	end;
	-- 分时段 - end
	
	if (nExp > 0) then
		if (g_bFreeTime == 0) then -- 非免费，扣时间
			SetTask(AEXP_TASKID, nPointTime - AEXP_TIME_UPDATE); -- 扣时间
		end
		
		AddOwnExp(nExp); -- 加经验
		Msg2Player("<#>你的经验增加"..nExp.."<#> 点."); -- Todo
	else
		WriteLog(GetLoop()..date("%m%d-%H:%M").."Auto AddExp Error!")
	end

	return 1;
end;
