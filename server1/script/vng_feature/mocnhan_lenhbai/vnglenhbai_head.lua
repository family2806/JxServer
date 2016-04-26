--令牌任务 - Created by DinhHQ - 20110510
IncludeLib("TASKSYS");
Include("\\script\\task\\system\\task_main.lua");
IncludeLib("ITEM")
tbVngLenhBai = {}
tbVngLenhBai.TSK_UseCountPerDay = 2589;

tbVngLenhBai.tbTaskList = {
	[1] = {302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321,},--打怪
	[2] = {201, 202, 204, 205, 207, 208, 209, 210, 217, 218, 219, 220, 221, 222, 224, 225, 226,},--物品
	[3] = {211, 212, 213, 214, 215, 216, 227, 228,},--矿石
}

function tbVngLenhBai:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end

function tbVngLenhBai:UseItem(nIndex, nTaskType)
	if self:isExpired(nIndex) == 1 then
		Msg2Player("物品过使用期")
		return 1
	end
	local nNowTaskID = GetTask(ID_RANDOMTASK); 	
	local nTaskState = 0;  
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)));
	end;	
	local nUseState = GetTask(self.TSK_UseCountPerDay)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nPerDayUseCount = 100
	if floor(nUseState / 256) ~= nCurDate then		
		nUseState = nCurDate * 256
		SetTask(self.TSK_UseCountPerDay, nUseState)
	end	
	if mod(nUseState, 256) >= nPerDayUseCount then		
		Talk(1, "", format("每人每天只能使用该物品%d 次.", nPerDayUseCount))
		return 1		
	end		
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>令牌任务<color>: 明确有随机任务为完成，依然想继续接新的任务吗?",
			2,
			format("对，我想放弃之前的任务/#tbVngLenhBai:ConfirmRandomBookTask(%d, %d)", nIndex, nTaskType),
			"不是，等一下先!/OnTaskWait");
		return 1;
	else
		local tbTempList = self.tbTaskList[nTaskType]
		if not tbTempList then
			return 1
		end
		local nItemParam = GetItemParam(nIndex, 1)
		local nTaskID = 0
		if nItemParam == 0 then
			nTaskID = tbTempList[random(1, getn(tbTempList))]
			SetSpecItemParam(nIndex, 1, nTaskID)
			SyncItem(nIndex)
		else
			nTaskID = nItemParam
		end
		SetTaskStatus(TaskName(nTaskID), 0);
		CloseTask(TaskName(nTaskID));
		SetTask(ID_RANDOMTASK_WAIT, nTaskID);		
		SyncTaskValue(ID_RANDOMTASK_WAIT);	
		SetTask(ID_RANDOMTASKTEMP, nIndex)	
		ApplyTask( TaskName(nTaskID) );		
		SetTask(self.TSK_UseCountPerDay, nUseState + 1);		
		return 1;
	end;
end;

function tbVngLenhBai:ConfirmRandomBookTask(nIndex, nTaskType)
	local tbTempList = self.tbTaskList[nTaskType]
	if not tbTempList then
		return 1
	end
	local nItemParam = GetItemParam(nIndex, 1)
	local nTaskID = 0
	if nItemParam == 0 then
		nTaskID = tbTempList[random(1, getn(tbTempList))]
		SetSpecItemParam(nIndex, 1, nTaskID)
		SyncItem(nIndex)
	else
		nTaskID = nItemParam
	end
	SetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMTASK)));
	SetTaskStatus(TaskName(nTaskID), 0);
	CloseTask(TaskName(nTaskID));	
	SetTask(ID_RANDOMTASK_WAIT, nTaskID);		
	SyncTaskValue(ID_RANDOMTASK_WAIT);	
	SetTask(ID_RANDOMTASKTEMP, nIndex);	
	ApplyTask( TaskName(nTaskID) );
	SetTask(self.TSK_UseCountPerDay, GetTask(self.TSK_UseCountPerDay) + 1);
	return	
end;