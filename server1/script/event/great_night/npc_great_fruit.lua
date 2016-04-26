IncludeLib("ITEM")
Include("\\script\\tong\\tong_award_head.lua");-- by志山，帮会周目标贡献度
Include("\\script\\item\\huihuangzhiguo_advance.lua")
Include("\\script\\activitysys\\g_activity.lua")

function main()
	
	if (0 == GetCamp()) then
		Msg2Player("你尚未加入门派，不能拾取果实.")
		return
	end
	if (0 == GetFightState() or GetLife(0) <= 0) then
		Msg2Player("不能拾取果实.")
		return
	end

	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel;
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	
	if (nGetSeedLevel ~= GetNpcParam(nNpcIdx, 1)) then -- 如果级别不对,不能进行拾取
		--这里告诉玩家级别不对,不能拾取
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("90级以下的玩家可以拾取这类果实!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("90到119级的玩家才可以拾取这类果实.")
		else
			Msg2Player("120级以上的玩家才可以拾取这类果实!")
		end
		return
	end;
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 10) then
			-- 新果实
			if (huihuangzhiguo_advance:GetGuoZiAvd() == 0) then
				-- 旧果实
				local nItemIndex = AddItem(6,1,904 + nGetSeedLevel - 1,1,0,0,0);
				ITEM_SetExpiredTime(nItemIndex, 10080);
	--			local nowdate = tonumber(GetLocalDate("%y%m%d"))
	--			SetSpecItemParam(nItemIndex, 1, nowdate)
				SyncItem(nItemIndex)
				Msg2Player("你得到一个辉煌果实 ");
			end
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			DelNpc(nNpcIdx)
			SetNpcParam(nNpcIdx, 4, 1)
			tongaward_goldenseed();-- by志山，帮会周目标贡献度
			
			G_ACTIVITY:OnMessage("CaiJiHuiHuangZhiGuo");

		else	--时间没到10秒钟;
			Msg2Player(format("你已选取这种果实，秒之后才可以拾取.",
						(10 - (nTime - GetTask(GREADSEED_TIME_TASKID)))
							))
			return
		end;
	else
		Msg2Player("你已选取这种果实，10秒之后果实成熟就可以拾取了.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;

