-- 文件名　：event.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-01-17 14:48:26
--队长组队(8人) 跟 NPC北斗老人对话以及接受任务
Include("\\script\\event\\springfestival08\\lib\\compose.lua")
Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
allbrother_0801_tbLingPai = 
	{
		{szName="天枢令", tbProp={6, 1, 1643, 1, 0, 0}, },
		{szName="天钻令", tbProp={6, 1, 1644, 1, 0, 0}, },
		{szName="天机令", tbProp={6, 1, 1645, 1, 0, 0}, },
		{szName="天权令", tbProp={6, 1, 1646, 1, 0, 0}, },
		{szName="玉衡令", tbProp={6, 1, 1647, 1, 0, 0}, },
		{szName="开阳令", tbProp={6, 1, 1648, 1, 0, 0}, },
		{szName="摇光令", tbProp={6, 1, 1649, 1, 0, 0}, },
		{szName="七星令", tbProp={6, 1, 1650, 1, 0, 0}, },
	}

function allbrother_0801_main()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	
	if allbrother_0801_IsAct() ~= 1 then
		Say(format("不好意思, <color=yellow>%s<color> 活动已结束，多谢参加活动.",allbrother_0801_szActName), 0)
		return 0;
	end
	
	local szTitle = "大家好，在下是北斗门的传人，不知各位要什么?";
	local tbOpt = 
	{
		"在下和各位兄弟想接任务./allbrother_0801_WantTask",
		"在下已完成了前辈的任务./allbrother_0801_TaskPersonTaskAward",
		"在下和各位兄弟已完成了前辈的任务./allbrother_0801_TeamTaskAward",
		"真不好意思，劳烦您再说一次任务./allbrother_0801_QueryPersonTask",
		"我无法完成这次个人任务./allbrother_0801_CancelTask",
		"在下告辞/OnCancel"
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

--某个人执行某个函数
function allbrother_0801_PlayerDo(nPlayerIdx,fun,...)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIdx
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end

--查询个人任务
function allbrother_0801_QueryPersonTask()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if allbrother_0801_CheckTaskState() == 0 then
		Say("各位还没有接任务", 0)
	else
		if nTaskState > 1073741824 then
			nTaskState = nTaskState - 1073741824
		end
		Say(format("现在的任务是 %s", allbrother_0801_tbTaskList[nTaskState].szShow), 0)
	end
	
end

--队伍想接任务
function allbrother_0801_WantTask()
	local nTeamSize = GetTeamSize()
	local i
	if IsCaptain() ~= 1 then
		Say("此事麻烦各位教队长和我一起商讨.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say(format("队伍人数不够，请继续招募 <color=yellow>%d<color> 人之后再回来领任务.", allbrother_0801_TeamSizeLimit-nTeamSize), 0)
		return 0;
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("你的队伍中有没到50级或者没有充值的，无法接受任务。", 0)
			return 
		end
	end
	
	local nCount = allbrother_0801_CheckTeamTaskState();
	local tbTeamTask = {}
	if nCount == nTeamSize then
		for i=1,nTeamSize do
			local nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			while tbTeamTask[nTaskId] == 1 do
				nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			end
			tbTeamTask[nTaskId] = 1
			allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_AcceptTask, nTaskId)
		end
	else
		Say("你的队伍中有人没有完成任务或者已经做完任务了.", 0)
	end
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBacDau")
end


--检查 队伍内每个人的任务状态， 返回没接任务的人数
function allbrother_0801_CheckTeamTaskState()
	local nTeamSize = GetTeamSize()
	local nCount = 0;
	for i=1,nTeamSize do
		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTaskState)
	end
	return nTeamSize-nCount;
end

--检查一个人的任务状态 0为没有任务，非零代表接受了哪种任务，如果任务已经超时，执行取消任务返回0 没有接任务
function allbrother_0801_CheckTaskState()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskLimit	= GetTask(TSK_allbrother_0801_TaskLimit)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	
	if nTaskState == 0 then --没有接任务
		if nDate ~= floor(nTaskLimit/256) then --如果不是今天 ，计数清零
			nTaskLimit = nDate * 256
			SetTask(TSK_allbrother_0801_TaskLimit, nTaskLimit)
		end
		if mod(nTaskLimit, 256) < TSKV_allbrother_0801_TaskLimit then --并且今天还能接
			return 0
		else
			Msg2Team(format("%s 今天已接受 %d次个人任务，明天再来吧.", GetName(), TSKV_allbrother_0801_TaskLimit))
			return 1;
		end
	else --接了任务，看是否超时
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --超时
			allbrother_0801_CancelTask()
			Msg2Team(format("%s 超过规定时间，任务被取消.", GetName()))
			Msg2Player(format("%s 超过规定时间，任务被取消.", GetName()))
			return 0;
		else --没有超时，说明已经接了任务
			Msg2Team(format("%s已接受北斗老人的任务.", GetName()))
			return 1;
		end
	end
end

--一个人接受任务的处理 给他一个nTaskId的任务，并且设置时间，个人任务次数+1
function allbrother_0801_AcceptTask(nTaskId)
	--设置人物身上 n任务状态
	SetTask(TSK_allbrother_0801_TaskState, nTaskId)
	SetTask(TSK_allbrother_0801_TaskLimit, GetTask(TSK_allbrother_0801_TaskLimit)+1)
	SetTask(TSK_allbrother_0801_TaskTime, GetCurServerTime())
	Msg2Player(format("领取任务 %s", allbrother_0801_tbTaskList[nTaskId].szShow))
end



--队伍取消任务 
function allbrother_0801_TeamCancelTask()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CancelTask)
	end
end
--个人取消任务,任务状态设为0
function allbrother_0801_CancelTask()
	if GetTask(TSK_allbrother_0801_TaskState) == 0 then
		Say("你现在还没有任务吗？超过了做任务的规定时间看来任务被取消了.", 0)
		return 0;
	end
	SetTask(TSK_allbrother_0801_TaskState, 0)
	Msg2Player("取消任务")
end

--是否50级
function allbrother_0801_islvl50()
	if GetLevel() >= 50 and IsCharged() == 1 then
		return 1
	else 
		Msg2Team(format("%s等级未到50级或者未充值",GetName()))
	end
end

function allbrother_0801_TaskPersonTaskAward() --
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nTaskId		= 0;
	if nTaskState == 0 then
		Say("我还没有接受任何任务.",0)
		return	
	end
	if nTaskState < 1073741824 then
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --超时
			SetTask(TSK_allbrother_0801_TaskState, 0)
			Say("不好意思！时间很快过去了但是还没有完成，任务失败了.", 0)
			return
		end
		nTaskId = nTaskState
		if allbrother_0801_tbTaskList[nTaskId].nTaskType == 0 then 
			local tbAward = {0, allbrother_0801_TaskFindItemAward, 1}
			springfestival08_lib_material_compose({allbrother_0801_tbTaskList[nTaskId].tbList, tbAward, "完成任务", "任务物品不对或者数量不够。", "任务出错"}, "交物品")
		else
			Say("依旧没有完成任务", 0)	
		end
	else
		allbrother_0801_TaskFindNpcAward();
	end
	
	
	
end

function allbrother_0801_TaskFindItemAward(nTaskId)
	if allbrother_0801_CompleteTask() == 1 then
		return allbrother_0801_TaskFindNpcAward()
	end
end

--个人任务领奖，判断任务是否完成，是否超时，然后给物品，任务状态设置为0
function allbrother_0801_TaskFindNpcAward()
	
	local nExpAward = 0;
	local nTransCount = ST_GetTransLifeCount();
	
	if nTransCount == 0 then
		nExpAward = 5000000;
	elseif nTransCount == 1 then
		nExpAward = 9000000;
	elseif nTransCount >= 2 then
		nExpAward = 12000000;
	end
		
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local tbAward = 
	{
		{szName="福缘露(大) ", tbProp={6, 1, 124, 1, 0, 0}},
		{nExp = nExpAward},
	}
	if (nTaskState > 1073741824) then --相当于判断最高位设置是否为1
		SetTask(TSK_allbrother_0801_TaskState, 0)
		--是否超时
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --超时
			Say("不好意思！时间很快过去了但是还没有完成，任务失败了.", 0)
			return
		end
		--给奖励
		springfestival08_lib_AddAward(tbAward[2], allbrother_0801_szActName)
		
		local nCurRate = random(1,100)
		if nCurRate < 20 then
			springfestival08_lib_AddAward(tbAward[1], allbrother_0801_szActName)
		end
		
		nCurRate = random(1,getn(allbrother_0801_tbLingPai))
		springfestival08_lib_AddAward(allbrother_0801_tbLingPai[nCurRate], allbrother_0801_szActName)
		return 1;
	else
		Say("你好像还没有完成任务.", 0)
	end
end



function allbrother_0801_TeamTaskAward()
	local nTeamSize = GetTeamSize()
	if IsCaptain() ~= 1 then
		Say("这个事情劳烦各位请队长和我商量.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say("队伍人数不够，请继续招募", 0)
		return
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("你的队伍中有没到50级或者没有充值的，无法接受任务", 0)
			return 
		end
	end
	local tbAward = {0, allbrother_0801_TeamTaskAwardFun, 1}
	springfestival08_lib_material_compose({allbrother_0801_tbLingPai, tbAward, "完成任务", "任务物品不对或者数量不够", "任务出错"}, "交物品", "8种北斗门令牌(天枢令，天钻令，天机令，天权令，玉衡令，开阳令，摇光令，七星令)")
end

--function allbrother_0801_CheckAllTeamTaskLimit()
--	local nTeamSize = GetTeamSize()
--	local nCount = 0;
--	for i=1,nTeamSize do
--		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTeamTaskLimit)
--	end
--	return nCount;
--end

function allbrother_0801_CheckTeamTaskLimit()
	local nTaskTeamLimit = GetTask(TSK_allbrother_0801_TaskTeamLimit)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate ~= floor(nTaskTeamLimit/256) then
		nTaskTeamLimit = nDate * 256
		SetTask(TSK_allbrother_0801_TaskTeamLimit, nTaskTeamLimit)
	end
	if mod(nTaskTeamLimit, 256) < TSKV_allbrother_0801_TaskTeamLimit then
		return 1;
	else
		Msg2Player(format("%s 今天已经完成 %d 次集体任务, 已经达到最大，无法领奖.", GetName(), TSKV_allbrother_0801_TaskTeamLimit))
		return 0;
	end
	return 0;
end

function allbrother_0801_TeamTaskAwardFun()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_TaskAwardFun)
	end
	while GetTeamSize() > 0 do
		allbrother_0801_PlayerDo(GetTeamMember(1), LeaveTeam);
	end
	return 1;	
end

function allbrother_0801_TaskAwardFun()
	
	if allbrother_0801_CheckTeamTaskLimit() == 0 then
		return 1
	end
	
	local tbExp = {nExp = 8000000}
	local tbItem = 
	{
		{szName="福缘露(大) ", tbProp={6, 1, 124, 1, 0, 0}, nRate = 20},
		{szName="仙草露", tbProp={6, 1, 71, 1, 0, 0}, nRate = 5},
		{szName="紫水晶", tbProp={4, 239, 1, 0, 0, 0}, nRate = 1},
	}
	springfestival08_lib_AddAward(tbExp, allbrother_0801_szActName)
	springfestival08_lib_GiveRandomAward(tbItem, allbrother_0801_szActName)
	SetTask(TSK_allbrother_0801_TaskTeamLimit, GetTask(TSK_allbrother_0801_TaskTeamLimit)+1)
	return 1;
end


function OnCancel()
end