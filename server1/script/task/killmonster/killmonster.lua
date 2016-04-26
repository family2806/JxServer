IncludeLib("FILESYS")
IncludeLib("TASKSYS");
Include("\\script\\lib\\baseclass.lua")
--Include("\\script\\activitysys\\npcfunlib.lua")

tbKillMonster = tbBaseClass:new()

tbKillMonster.szPath = "\\settings\\task\\killmostert.txt"
tbKillMonster.TSK_TASK_ID = 1994
tbKillMonster.TSK_KILL_COUNT = 1995
function tbKillMonster:_init()

	
	
	local szPath = self.szPath
	
	if TabFile_Load(szPath, szPath) == 0 then
		
		WriteLog(format("Load %s is fail", szPath))
		return 0;
	end
	local nTotalRow = TabFile_GetRowCount(szPath)
	self.tbTaskList = {}
	for nRow = 2, nTotalRow do
		
		local tbTask = {}
		tbTask.nTaskId = tonumber(TabFile_GetCell(szPath, nRow, "TaskId"));
		tbTask.szTaskName = TabFile_GetCell(szPath, nRow, "TaskName");		
		tbTask.nMapId = tonumber(TabFile_GetCell(szPath, nRow, "MapId"));
		tbTask.szMapName = TabFile_GetCell(szPath, nRow, "MapName");
		tbTask.szMonsterName = TabFile_GetCell(szPath, nRow, "MonsterName");
		tbTask.nKillCount = tonumber(TabFile_GetCell(szPath, nRow, "KillCount"));
		
		if tbTask.szTaskName == nil or tbTask.szTaskName == "" then
			
			tbTask.szTaskName = format("消灭 %s", tbTask.szMonsterName)
		end
		
		tinsert(self.tbTaskList, tbTask)
	end
	
	
end

function tbKillMonster:AcceptTask(nStart, nEnd)
	if not self.tbTaskList then
		return 
	end
	
	local nTaskCount = getn(self.tbTaskList)
	
	if (nStart == nil or nStart < 1 or nStart > nTaskCount) then
		nStart = 1;
	end
	
	if (nEnd == nil or nEnd < 1 or nEnd > nTaskCount) then
		nEnd = nTaskCount;
	end
	
	if (nStart > nEnd) then
		return
	end

	local nId = random(nStart,nEnd)
	local tbTask = self.tbTaskList[nId]
	if tbTask == nil then
		return
	end
	
	SetTask(self.TSK_TASK_ID, tbTask.nTaskId)
	SetTask(self.TSK_KILL_COUNT, 0)
	
	
	local szMsg = format("获得 <color=yellow><%s> <color> 在<%s>", tbTask.szTaskName, tbTask.szMapName)
	Msg2Player(szMsg)
	Talk(1, "", "请大侠努力完成任务")
end

function tbKillMonster:IsHaveTask(bFlag)
	
	if bFlag == "" then
		bFlag = 0
	end
	bFlag = bFlag or 0 
	if GetTask(self.TSK_TASK_ID) <= 0 then
		
		if bFlag == 1 then
			return 1
		else
			Talk(1, "", "没有要取消的任务")
			return 	
		end
	else
		if bFlag == 1 then
			Talk(1, "", "大侠已接任务了.")
			return 
		else
			return 1	
		end
		
	end
end

function tbKillMonster:CancelTask()

	
	SetTask(self.TSK_TASK_ID, 0)
	SetTask(self.TSK_KILL_COUNT, 0)
	
	Msg2Player("取消任务成功")
	
end


function tbKillMonster:KillMonster(nNpcIndex)
	local nTaskId = GetTask(self.TSK_TASK_ID)
	local nKillCount = GetTask(self.TSK_KILL_COUNT)
	
	if nTaskId == nil or nTaskId <= 0 then
		return
	end
	if not self.tbTaskList then
		
		return 
	end
	
	
	for i=1, getn(self.tbTaskList) do
		if nTaskId == self.tbTaskList[i].nTaskId then
			local tbTask = self.tbTaskList[i]
			
			if NpcFunLib:CheckName(tbTask.szMonsterName, nNpcIndex) == 1 and NpcFunLib:CheckInMap(tbTask.nMapId, nNpcIndex) == 1 then
				
				if nKillCount < tbTask.nKillCount then
					SetTask(self.TSK_KILL_COUNT, nKillCount + 1)
					local szMsg = format("大侠已经 %s : <color=yellow>%d/%d<color>", tbTask.szTaskName, nKillCount + 1, self.tbTaskList[i].nKillCount)
					Msg2Player(szMsg)
				end				
			end
			return
		end
	end
	
end

function tbKillMonster:CheckTaskId(nStart,nEnd)
	if not self.tbTaskList then
		return 
	end
	
	local nTaskCount = getn(self.tbTaskList)
	
	if (nStart == nil or nStart < 1 or nStart > nTaskCount) then
		nStart = 1;
	end
	
	if (nEnd == nil or nEnd < 1 or nEnd > nTaskCount) then
		nEnd = nTaskCount;
	end
	
	if (nStart > nEnd) then
		return
	end

	local nTaskId = GetTask(self.TSK_TASK_ID)
	
	if nTaskId <= 0 then
		return
	end
	
	if (nStart <= nTaskId and nTaskId <= nEnd) then
		return 1
	end
	
end

function tbKillMonster:CheckTaskComplete()

	
	local nTaskId = GetTask(self.TSK_TASK_ID)
	local nKillCount = GetTask(self.TSK_KILL_COUNT)
	
	if not self.tbTaskList then
		return 
	end
	if nTaskId <= 0 then
		Talk(1, "", "大侠未接任务")
		return
	end

	for i=1, getn(self.tbTaskList) do
		if nTaskId == self.tbTaskList[i].nTaskId then
			local tbTask = self.tbTaskList[i]
			if tbTask.nKillCount == nKillCount then		
				return 1
			else
				local szMsg = format("大侠有 %s:<color=yellow> %d/%d<color>", tbTask.szTaskName, nKillCount, self.tbTaskList[i].nKillCount)
				Msg2Player(szMsg)
				Talk(1, "", "依然未完成就不能领奖，请努力.")
				return
			end
		end
	end
end


function tbKillMonster:CompleteTask()
	SetTask(self.TSK_TASK_ID, 0)
	SetTask(self.TSK_KILL_COUNT, 0)
	Msg2Player("完成任务")
end

tbKillMonster:_init()