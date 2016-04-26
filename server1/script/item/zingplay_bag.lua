-- 玩ZingPlay获得奖品
-- ZingPlay红包

-- COMMON 常量 --
ZingPlay_Start_Date	= 20081018;		-- 活动起始时间
ZingPlay_End_Date	= 20081107;		-- 红包使用限期


-- TSK 任务变量 --
TSK_ZINGPLAY_VERSION	= 2563;		-- 记录活动起始时间
TSK_ZINGPLAY_MAXEXP		= 2564;		-- 记录获得的经验值

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	
	local n_cur_date = GetTask(TSK_ZINGPLAY_VERSION);
	
	if (n_cur_date ~= ZingPlay_Start_Date) then
		SetTask(TSK_ZINGPLAY_VERSION, ZingPlay_Start_Date);
		SetTask(TSK_ZINGPLAY_MAXEXP, 0);
	end
	
	local n_max_exp = 200000000;
	local n_one_exp = 20000000;
	
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		local n_cur_exp = GetTask(TSK_ZINGPLAY_MAXEXP);
		
		if (n_cur_exp >= n_max_exp) then
			Say(format("大侠从zingplay获得中已获得%d经验，所以，不能继续使用zingplay红包了.", n_max_exp), 0);
			return 1;
		end
		
		SetTask(TSK_ZINGPLAY_MAXEXP, n_cur_exp + n_one_exp);
		AddOwnExp(n_one_exp);
		
		local sz_msg = format("使用zingplay红包获得%d 经验", n_one_exp);
		
		Msg2Player(sz_msg);
		
		WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
				GetLocalDate("%Y-%m-%d_%X"),
				GetName(),
				GetAccount(),
				sz_msg	));
	else
		
		Say("活动已结束，不能使用该物品了.");
		return 0;
	end
end
