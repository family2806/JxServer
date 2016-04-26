Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\EventThangLong1000\\head.lua")

function main()
	local n_size = GetTeamSize();
	local strLeaderName = ""
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>请与会员组队，然后才打开箱子!", "结束对话OnCancel"});
		return
	end
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>只有队长才能开箱.", "结束对话/OnCancel"});
		return
	else
		strLeaderName = GetName()
	end
	if (GetTask(Task_Allow_OpenBox) ~= 1) then
		Talk(1,"","需要消灭<color=yellow>镇龙护宝 <color> 才能打开箱子!")
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox,3,"每天只能打开3个古物箱子!","<") ~= 1) then
			return
	end
	PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox,1)
	
	local oldPlayer = PlayerIndex;
	for i = 1, n_size do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		SetTask(Task_Allow_OpenBox, 0)
		Talk(1,"","чi Trng <color=yellow>" ..strLeaderName.. "<color> 刚刚成功打开古物箱子!")
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_GetBonusByKillBoss,21,"每天玩家可以与组队最多领取21次经验值!","<") ~= 1) then
			Msg2Player("今天您与组队领够21次经验值了")
		else
			PlayerFunLib:AddTaskDaily(Task_Daily_GetBonusByKillBoss,1)
			GetBonusOpenBox(IsCaptain())
		end
	end;
	PlayerIndex = oldPlayer;
end

function GetBonusOpenBox(nValue)
	
	if (nValue ~= 0) then--la doi truong
		local nVar = random(1, 3)
		if (nVar ==1) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30045, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		if (nVar ==2) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30046, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		if (nVar ==3) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30047, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		AddOwnExp(4000000)
		Msg2Player("你获得4000000经验值")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 年升龙"..GetAccount().."\t"..GetName().."\t".."打开箱子获得4000000 点EXP ")
	else --la thanh vien
			local nVar2 = random(1, 3)
			if (nVar2 ==1) then
					local nItemIndex = AddStackItem(20, 6, 1, 30045, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
			if (nVar2 ==2) then
					local nItemIndex = AddStackItem(20, 6, 1, 30046, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
			if (nVar2 ==3) then
					local nItemIndex = AddStackItem(20, 6, 1, 30047, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
	AddOwnExp(1000000)
	Msg2Player("你获得1000000 经验值")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 年升龙"..GetAccount().."\t"..GetName().."\t".."开箱获得1000000 点EXP ")
	end
end

function OnCancel()
end
