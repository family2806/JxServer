Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

repute_reward_taskid	= 1865;
repute_reward_date_s	= 20081205;
repute_reward_date_e	= 20090104;

function christmas_repute_main()
	local n_dateD	= tonumber(GetLocalDate("%y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	local n_dateW	= tonumber(GetLocalDate("%w"));
	
	if (n_dateW ~= 0 or n_dateH < 12 or n_dateH >= 14) then	-- 活动时间判断
		Say("礼官: 现在还不是领奖时候，请阁下一会再来.", 0);
		return
	end
	
	if (GetLevel() < 50) then	-- 等级判断
		Say("礼官: 大虾还未到50级。先把等级练上去了再来领奖。", 0);
		return
	end
	
	if (GetRepute() < 450) then
		Say("礼官:阁下的名望值不足450，不能领奖.", 0);
		return
	end
	
	if (GetTask(repute_reward_taskid) == n_dateD) then	-- 一天只能领取一次的判断
		Say("礼官:今日大侠已领取了奖励.", 0);
		return
	end
	
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("大侠背包空间不足!",0);
		return
	end
	
	SetTask(repute_reward_taskid, n_dateD);
	local szName 		= "";
	local nItemIndex	= 0;
	if (GetRepute() > 10000) then
		nItemIndex	= AddItem(6, 1, 1838, 1, 0, 0);
		szName	= "白金佩";		
	elseif (GetRepute() > 3600) then
		nItemIndex	= AddItem(6, 1, 1837, 1, 0, 0);
		szName	= "黄金佩";
	else
		nItemIndex	= AddItem(6, 1, 1836, 1, 0, 0);
		szName	= "白银佩";
	end
	if (ITEM_GetExpiredTime(nItemIndex) == 0) then
		ITEM_SetExpiredTime(nItemIndex,christmas_box_expiredtime);
		SyncItem(nItemIndex);
	end
	Msg2Player(format("恭喜大侠得到1 %s!", szName));
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",
			"2008生日活动根据名望值领奖",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			szName));
end

function christmas_repute_info()
	Say("礼官: 按名望领奖活动从05-12-2008到04-01-2009的每周日12:00到14:00. 活动期间，各位同道到NPC礼官处对话领奖。玩家要达到50级以上同时名望要有450才可以领取到相应奖励.", 0);
end