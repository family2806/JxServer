Include("\\script\\missions\\autohang\\head.lua");

-- 根据玩家级别，计算经验值
-- 此函数在GameServer启动时自动调用，用于建立挂机经验数值表
function AEXP_GetHangExpValue(nLevel)	

	nExp = 0;
	-- 一小时挂机经验：e={3.5w+floor[(lv-50)/5]*0.5w}*1.2
	if (nLevel == 50) then 	-- 50
		nExp = 700; -- 每分钟获得的经验值
	elseif (nLevel < 100) then 	-- 51~99
		nExp = 700 + floor((nLevel - 50)/5)*100; -- 每分钟获得的经验值
	else -- 100级及100级以上
		nExp = 1700; -- 每分钟获得的经验值[700 + floor((100 - 50)/5)*100]
	end
	
	--2007-01-05 经验调整为原来的3倍
	nExp = nExp * AEXP_FREQ * 3 / 2; -- (10)分钟获得的经验值
	
	return nExp;
end;

-- 根据玩家级别，以及挂机时间(以小时为单位)，计算所需的金钱
function AEXP_GetNeedMoney(nLevel, nTime)
	nTemp =  60 / AEXP_FREQ; -- 一小时(60分钟)调整几次经验
	nMoney = AEXP_GetHangExpValue(nLevel) * nTemp * nTime / 2; -- 经验值:银两数 = 2:1
	return nMoney;
end;

-- 进入桃花岛
-- 返回值：1表示成功，0表示失败，-1表示银两不足
function aexp_gotothd(nSubWorldID)
	if (GetCash() < AEXP_TICKET) then
		return -1;
	end
	
	if(GetExtPoint( 0 ) <= 0 ) then
		Say("不好意思！只有充值才可以去桃花岛 ",0)
		return -2
	end

	Pay(AEXP_TICKET)
	LeaveTeam(); -- 离开队伍
	SetAutoHangMapFlag(1) -- 设置进入挂机地图标记(屏蔽公聊、回城等功能)
	
	-- 免费双经验时间，不需校正挂机时间
	if (AEXP_IsFreeTimeDoubleExp() == 0) then-- 非免费双经验日子
		-- 剩余时间校正 - start
		-- 玩家在离开桃花岛时，腊八粥的药力无效但有效时间仍会消耗
		-- 所以在再次进入时需扣除这部分挂机时间
		--06.06.13
		--腊八粥已被挖矿时间替换；玩家离开桃花岛时间不会消耗，不需扣除时间
		--nTime = GetTask(AEXP_OLTIME_TASKID);
		--if (nTime > 0) then
		--	nTime = floor((GetGameTime() - nTime) / 60); -- 单位：分钟
		--	nPointTime = GetTask(AEXP_TASKID) - nTime;  -- 扣时间(单位：分钟)
		--	if (nPointTime < 0) then
		--		nPointTime = 0;
		--	end
		--	
		--	SetTask(AEXP_TASKID, nPointTime); -- 新的剩余时间
		--end
		-- 剩余时间校正 - end
	end
	
	NewWorld(nSubWorldID,1523,3237)
	SetFightState(0)
	Msg2Player("你已来到一个单独的世界。在这你的能力会被影响：不能和世界、门派和世界联系；不能使用土地符，心心相印符；不能组队，不能买卖。");
	return 1;
end;
