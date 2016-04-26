Include("\\script\\activitysys\\config\\32\\dailytask.lua")

tbKillDailyTask = tbDailyTask:new()

tbKillDailyTask.TSK_DAILY_TASK_COMPLETE_STATE = TSK_DAILY_TASK_COMPLETE_COUNT;
tbKillDailyTask.nStateBit = 1;
tbKillDailyTask.szConfigPath = "\\settings\\task\\dailytask\\killmonster.txt";
tbKillDailyTask.szTaskName = "ɱ������";

tbKillDailyTask.TSK_KILL_TASK_ID = TSK_KILL_TASK_ID;
tbKillDailyTask.TSK_KILL_COUNT = TSK_KILL_COUNT;

function tbKillDailyTask:Init()
	return self:_init();
end

function tbKillDailyTask:LoadDataFromConfig()
	local nTotalRow = TabFile_GetRowCount(self.szConfigPath)
	self.tbTaskList = {}
	for nRow = 2, nTotalRow do
		local tbTask = {}
		tbTask.nTaskId = tonumber(TabFile_GetCell(self.szConfigPath, nRow, "TaskId"));
		tbTask.szTaskName = TabFile_GetCell(self.szConfigPath, nRow, "TaskName");		
		tbTask.nMapId = tonumber(TabFile_GetCell(self.szConfigPath, nRow, "MapId"));
		tbTask.szMapName = TabFile_GetCell(self.szConfigPath, nRow, "MapName");
		tbTask.szMonsterName = TabFile_GetCell(self.szConfigPath, nRow, "MonsterName");
		tbTask.nKillCount = tonumber(TabFile_GetCell(self.szConfigPath, nRow, "KillCount"));
		tinsert(self.tbTaskList, tbTask)
	end
	
	return 1;
end

function tbKillDailyTask:CheckCanAccept()
	if (self:_CheckCanAccept() ~= 1) then
		Talk(1,"",format("�ǰﻵ�˽��콫���������ˣ���������鷳%s �����Ŷ",GetSex() == 1 and "���" or "���"))
		return nil;
	end
	return 1;
end

function tbKillDailyTask:AcceptTask()
	if (self:CheckCanAccept() ~= 1) then
		return nil;
	end
	
	if (self:IsHaveTask() == 1) then
		local tbTask = self:GetTaskData(GetTask(self.TSK_KILL_TASK_ID));
		if (tbTask ~= nil) then
			Talk(1,"",format("��λ %s, ������Ҳ���Ҹ����ǰ�һ�<color=green>%d<color>��<color=yellow>%s<color>�������������ȥ<color=red>%s<color> ����������ǰ�", GetSex() == 1 and "���" or "���",  tbTask.nKillCount, tbTask.szMonsterName, tbTask.szMapName));
		end
		return nil;
	end
	
	local nTaskCount = getn(self.tbTaskList)
	
	local nId = random(1,nTaskCount)
	local tbTask = self.tbTaskList[nId]
	if tbTask == nil then
		return nil;
	end
	
	SetTask(self.TSK_KILL_TASK_ID, nId);
	SetTask(self.TSK_KILL_COUNT, 0);
	
	Talk(1,"",format("�����������˵<color=red>%s<color> ��<color=yellow>%s<color> ���׶���λ%s,����԰��Ҵ����ǰﻵ�ˮ�<color=green>%d<color> ��<color=red>%s<color> ������?", tbTask.szMapName, tbTask.szMonsterName, GetSex() == 1 and "���" or "���",  tbTask.nKillCount, tbTask.szMonsterName));

	WriteLog(format("[%s]\t%s\t%s\t%s","ÿ������",GetName(), GetAccount(),format("�Ӵ�����񣺻�ɱ%d con %s",tbTask.nKillCount, tbTask.szMonsterName)))

	return 1;
end

function tbKillDailyTask:IsHaveTask()
	if GetTask(self.TSK_KILL_TASK_ID) <= 0 then
		return nil;
	else
		return 1;
	end
end

function tbKillDailyTask:CancelTask()
	SetTask(self.TSK_KILL_TASK_ID, 0)
	SetTask(self.TSK_KILL_COUNT, 0)
	return 1;
end

function tbKillDailyTask:CheckCompleteTask()
	local nTskId = GetTask(self.TSK_KILL_TASK_ID);
	local nCount = GetTask(self.TSK_KILL_COUNT);
	local tbTask = self:GetTaskData(nTskId);
	
	if (self:IsHaveTask() ~= 1 or tbTask == nil) then
		Talk(1,"",format("��λ %s, ������ʲô����?", GetSex() == 1 and "���" or "���"));
		return nil;
	end
	
	if (tbTask.nKillCount > nCount) then
		Talk(1,"",format("��λ%s, ������Ҳ���Ҹ����ǰ�һ�<color=green>%d<color>��<color=yellow>%s<color> ��������������ȥ<color=red>%s<color>����������ǰ�", GetSex() == 1 and "���" or "���",  tbTask.nKillCount, tbTask.szMonsterName, tbTask.szMapName));
		return nil;
	end
	
	return 1;
end

function tbKillDailyTask:CompleteTask()
	if (self:CheckCompleteTask() ~= 1) then
		return nil;
	end
	
	local tbTask = self:GetTaskData(GetTask(self.TSK_KILL_TASK_ID));
	
	SetTask(self.TSK_KILL_TASK_ID, 0)
	SetTask(self.TSK_KILL_COUNT, 0)
	
	self:_CompleteTask();
	
	WriteLog(format("[%s]\t%s\t%s\t%s","ÿ������",GetName(), GetAccount(),format("���ɱ�����񣺻�ɱ%d con%s",tbTask.nKillCount, tbTask.szMonsterName)));
	AddStatData("richangrenwu_shaguaicishu")
	return 1;
end

function tbKillDailyTask:OnKillMonster_Person(nNpcIndex)
	local nTaskId = GetTask(self.TSK_KILL_TASK_ID)
	local nKillCount = GetTask(self.TSK_KILL_COUNT)
	
	if nTaskId == nil or nTaskId <= 0 then
		return nil;
	end
	local tbTask = self.tbTaskList[nTaskId];
	
	if not tbTask then
		return nil
	end
	
	if (NpcFunLib:CheckName(tbTask.szMonsterName, nNpcIndex) == 1 and NpcFunLib:CheckInMap(tbTask.nMapId, nNpcIndex) == 1) then
		if nKillCount < tbTask.nKillCount then
			SetTask(self.TSK_KILL_COUNT, nKillCount + 1)
			local szMsg = format("%s:<color=yellow>%s<color><color=green>%d/%d<color>", self.szTaskName, tbTask.szMonsterName, nKillCount + 1, tbTask.nKillCount)
			Msg2Player(szMsg)
		end
	end
end

function tbKillDailyTask:OnKillMonster(nNpcIndex)
	local nCount = GetTeamSize()
	
	if nCount > 0 then
		for i=1, nCount do 
			DynamicExecuteByPlayer(GetTeamMember(i), "", "tbKillDailyTask:OnKillMonster_Person", nNpcIndex)
		end
	else
		self:OnKillMonster_Person(nNpcIndex)
	end
end
