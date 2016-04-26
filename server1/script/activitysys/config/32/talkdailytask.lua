Include("\\script\\activitysys\\config\\32\\dailytask.lua")

tbTalkDailyTask = tbDailyTask:new()

tbTalkDailyTask.TSK_DAILY_TASK_COMPLETE_STATE = TSK_DAILY_TASK_COMPLETE_COUNT;
tbTalkDailyTask.nStateBit = 3;
tbTalkDailyTask.szConfigPath = {"\\settings\\task\\dailytask\\talk.txt" ,"\\settings\\task\\dailytask\\talk_pos.txt"};
tbTalkDailyTask.szTaskName = "�Ի����� ";
tbTalkDailyTask.tbNpcPos = {}
tbTalkDailyTask.TSK_TALK_TASK_ID = TSK_TALK_TASK_ID;
tbTalkDailyTask.TSK_TALK_TASK_STATE = TSK_TALK_TASK_STATE;

function tbTalkDailyTask:Init()
	local nRet = self:_init();
	if not nRet then
		return nil;
	end
	
	return nRet;
end

function tbTalkDailyTask:AddTalkNpc(nMapTemplate, nMapId)
	if (self.tbNpcPos[nMapTemplate] ~= nil) then
		local nRandIdx = random(1,getn(self.tbNpcPos[nMapTemplate]));
		local tbPos = self.tbNpcPos[nMapTemplate][nRandIdx];
		if (tbPos ~= nil) then
			local nNpcIdx = AddNpc(tbPos.nNpcRes, 1, SubWorldID2Idx(nMapId), tbPos.nX * 32, tbPos.nY * 32, 0, tbPos.szNpcName);
			if (nNpcIdx ~= nil and nNpcIdx > 0) then
				SetNpcScript(nNpcIdx, tbPos.szNpcScript);
				--SetNpcParam(nNpcIdx, 1, tbPos.nTaskId);
			end
		end
	end

end

function tbTalkDailyTask:LoadDataFromConfig()
	local nTotalRow = TabFile_GetRowCount(self.szConfigPath[1])
	self.tbTaskList = {}
	for nRow = 2, nTotalRow do
		local tbTask = {}
		tbTask.nTaskId = tonumber(TabFile_GetCell(self.szConfigPath[1], nRow, "TaskId"));
		tbTask.szTaskName = TabFile_GetCell(self.szConfigPath[1], nRow, "TaskName");
		tbTask.szMapName = TabFile_GetCell(self.szConfigPath[1], nRow, "MapName");
		tbTask.szNpcName = TabFile_GetCell(self.szConfigPath[1], nRow, "NpcName");
		tbTask.nSex = tonumber(TabFile_GetCell(self.szConfigPath[1], nRow, "NpcGender"));
		tinsert(self.tbTaskList, tbTask)
	end
	
	nTotalRow = TabFile_GetRowCount(self.szConfigPath[2])
	self.tbNpcPos = {}
	for nRow = 2, nTotalRow do
		local tbPos = {}	
		tbPos.nMapId = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "MapId"));
		tbPos.nX = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "X"));
		tbPos.nY = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "Y"));
		tbPos.nNpcRes = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "NpcRes"));
		tbPos.szNpcName = TabFile_GetCell(self.szConfigPath[2], nRow, "NpcName");
		tbPos.szNpcScript = TabFile_GetCell(self.szConfigPath[2], nRow, "NpcScript");
		tbPos.nTaskId = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "TaskId"));
		if not self.tbNpcPos[tbPos.nMapId] then
			self.tbNpcPos[tbPos.nMapId] = {}
		end
		
		tinsert(self.tbNpcPos[tbPos.nMapId], tbPos)
	end
	return 1;
end

function tbTalkDailyTask:CheckCanAccept()
	if (self:_CheckCanAccept() ~= 1) then
		Talk(1,"",format("���Ѿ��յ�������ˣ���л%s��İ�����.",GetSex() == 1 and "���" or "���"))
		return nil;
	end
	return 1;
end

function tbTalkDailyTask:AcceptTask()
	if (self:CheckCanAccept() ~= 1) then
		return nil;
	end
	
	if (self:IsHaveTask() == 1) then
		local tbTask = self:GetTaskData(GetTask(self.TSK_TALK_TASK_ID));
		if (tbTask ~= nil) then
			Talk(1,"",format("��λ %s, ����Ҽ��Ÿ�<color=yellow>%s<color> ��������ȥ<color=red>%s<color>��%s��, ������źܼ��İ�.", GetSex() == 1 and "���" or "���", tbTask.szNpcName, tbTask.szMapName, tbTask.nSex == 1 and "���" or "��� "));
		end
		return nil;
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
		return nil;
	end
	
	local nTaskCount = getn(self.tbTaskList)
	
	local nId = random(1,nTaskCount)
	local tbTask = self.tbTaskList[nId]
	if tbTask == nil then
		return nil;
	end
	
	SetTask(self.TSK_TALK_TASK_ID, nId);
	SetTask(self.TSK_TALK_TASK_STATE, 0);
	
	Talk(1,"",format("��λ %s, ����Ϥ<color=yellow>%s<color> ��<color=red>%s<color> �� �ܾò���%s ��,����԰��Ҵ���ȥ�� %s����<color=red>%s<color>.", GetSex() == 1 and "Ch?" or "Ca Ca", tbTask.szMapName, tbTask.szNpcName, tbTask.nSex == 1 and "���" or "��� ", tbTask.nSex == 1 and "���" or "��� ", tbTask.szMapName));

	tbAwardTemplet:GiveAwardByList({szName="��������",tbProp={6,1,2571,1,0,0}}, "���նԻ������յ���������");

	WriteLog(format("[%s]\t%s\t%s\t%s","ÿ������",GetName(), GetAccount(),format("�ӶԻ�������%s�Ի�",tbTask.szNpcName)))

	return 1;
end

function tbTalkDailyTask:IsHaveTask()
	if GetTask(self.TSK_TALK_TASK_ID) <= 0 then
		return nil;
	else
		return 1;
	end
end

function tbTalkDailyTask:CancelTask()
	SetTask(self.TSK_TALK_TASK_ID, 0)
	SetTask(self.TSK_TALK_TASK_STATE, 0)
	return 1;
end

function tbTalkDailyTask:CheckCompleteTask()
	local nTskId = GetTask(self.TSK_TALK_TASK_ID);
	local nState = GetTask(self.TSK_TALK_TASK_STATE);
	local tbTask = self:GetTaskData(nTskId);
	
	if (self:IsHaveTask() ~= 1 or tbTask == nil) then
		Talk(1,"",format("��λ %s, ������ʲô����", GetSex() == 1 and "���" or "���"));
		return nil;
	end
	
	if (nState ~= 1) then
		Talk(1,"",format("��λ%s,�㻹δ���Ҵ��Ÿ�<color=yellow>%s<color>. ����ȥ<color=red>%s<color>��%s ��, ������źܼ�", GetSex() == 1 and "���" or "���", tbTask.szNpcName, tbTask.szMapName, tbTask.nSex == 1 and "���" or "��� "));
		return nil;
	end
	
	return 1;
end

function tbTalkDailyTask:CompleteTask()
	if (self:CheckCompleteTask() ~= 1) then
		return nil;
	end
	
	local tbTask = self:GetTaskData(GetTask(self.TSK_TALK_TASK_ID));
	
	SetTask(self.TSK_TALK_TASK_ID, 0)
	SetTask(self.TSK_TALK_TASK_STATE, 0)
	self:_CompleteTask();
	
	WriteLog(format("[%s]\t%s\t%s\t%s","ÿ������",GetName(), GetAccount(),format("�Ի�����:��%s�Ի�",tbTask.szNpcName)))
	AddStatData("richangrenwu_songxincishu")
	return 1;
end

function tbTalkDailyTask:TalkToNpc()
	local szNpc = GetNpcName(GetLastDiagNpc());
	local nTskId = GetTask(self.TSK_TALK_TASK_ID);
	local nState = GetTask(self.TSK_TALK_TASK_STATE);
	local tbTask = self:GetTaskData(nTskId);
	
	if (tbTask == nil or tbTask.szNpcName ~= szNpc or nState == 1) then
		Talk(1,"",format("������û��Ū���˰�."));
		return nil;
	end
	
	if (PlayerFunLib:CheckItemInBag({tbProp={6,1,2571,-1,-1,0}}, 1, "��������������������?") ~= 1) then
		return nil;
	end
	
	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2571,-1,-1,0}}, 1)

	SetTask(self.TSK_TALK_TASK_STATE, 1);
	
	Talk(1,"",format("��л����."));
	return 1;
end
