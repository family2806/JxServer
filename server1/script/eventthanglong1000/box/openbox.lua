Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\EventThangLong1000\\head.lua")

function main()
	local n_size = GetTeamSize();
	local strLeaderName = ""
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>�����Ա��ӣ�Ȼ��Ŵ�����!", "�����Ի�OnCancel"});
		return
	end
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>ֻ�жӳ����ܿ���.", "�����Ի�/OnCancel"});
		return
	else
		strLeaderName = GetName()
	end
	if (GetTask(Task_Allow_OpenBox) ~= 1) then
		Talk(1,"","��Ҫ����<color=yellow>�������� <color> ���ܴ�����!")
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox,3,"ÿ��ֻ�ܴ�3����������!","<") ~= 1) then
			return
	end
	PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox,1)
	
	local oldPlayer = PlayerIndex;
	for i = 1, n_size do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		SetTask(Task_Allow_OpenBox, 0)
		Talk(1,"","��i Tr��ng <color=yellow>" ..strLeaderName.. "<color> �ոճɹ��򿪹�������!")
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_GetBonusByKillBoss,21,"ÿ����ҿ�������������ȡ21�ξ���ֵ!","<") ~= 1) then
			Msg2Player("������������칻21�ξ���ֵ��")
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
		Msg2Player("����4000000����ֵ")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 ������"..GetAccount().."\t"..GetName().."\t".."�����ӻ��4000000 ��EXP ")
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
	Msg2Player("����1000000 ����ֵ")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 ������"..GetAccount().."\t"..GetName().."\t".."������1000000 ��EXP ")
	end
end

function OnCancel()
end
