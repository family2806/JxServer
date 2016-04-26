-- �ļ�������event.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-17 14:48:26
--�ӳ����(8��) �� NPC�������˶Ի��Լ���������
Include("\\script\\event\\springfestival08\\lib\\compose.lua")
Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
allbrother_0801_tbLingPai = 
	{
		{szName="������", tbProp={6, 1, 1643, 1, 0, 0}, },
		{szName="������", tbProp={6, 1, 1644, 1, 0, 0}, },
		{szName="�����", tbProp={6, 1, 1645, 1, 0, 0}, },
		{szName="��Ȩ��", tbProp={6, 1, 1646, 1, 0, 0}, },
		{szName="�����", tbProp={6, 1, 1647, 1, 0, 0}, },
		{szName="������", tbProp={6, 1, 1648, 1, 0, 0}, },
		{szName="ҡ����", tbProp={6, 1, 1649, 1, 0, 0}, },
		{szName="������", tbProp={6, 1, 1650, 1, 0, 0}, },
	}

function allbrother_0801_main()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	
	if allbrother_0801_IsAct() ~= 1 then
		Say(format("������˼, <color=yellow>%s<color> ��ѽ�������л�μӻ.",allbrother_0801_szActName), 0)
		return 0;
	end
	
	local szTitle = "��Һã������Ǳ����ŵĴ��ˣ���֪��λҪʲô?";
	local tbOpt = 
	{
		"���º͸�λ�ֵ��������./allbrother_0801_WantTask",
		"�����������ǰ��������./allbrother_0801_TaskPersonTaskAward",
		"���º͸�λ�ֵ��������ǰ��������./allbrother_0801_TeamTaskAward",
		"�治����˼���ͷ�����˵һ������./allbrother_0801_QueryPersonTask",
		"���޷������θ�������./allbrother_0801_CancelTask",
		"���¸��/OnCancel"
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

--ĳ����ִ��ĳ������
function allbrother_0801_PlayerDo(nPlayerIdx,fun,...)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIdx
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end

--��ѯ��������
function allbrother_0801_QueryPersonTask()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if allbrother_0801_CheckTaskState() == 0 then
		Say("��λ��û�н�����", 0)
	else
		if nTaskState > 1073741824 then
			nTaskState = nTaskState - 1073741824
		end
		Say(format("���ڵ������� %s", allbrother_0801_tbTaskList[nTaskState].szShow), 0)
	end
	
end

--�����������
function allbrother_0801_WantTask()
	local nTeamSize = GetTeamSize()
	local i
	if IsCaptain() ~= 1 then
		Say("�����鷳��λ�̶ӳ�����һ������.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say(format("���������������������ļ <color=yellow>%d<color> ��֮���ٻ���������.", allbrother_0801_TeamSizeLimit-nTeamSize), 0)
		return 0;
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("��Ķ�������û��50������û�г�ֵ�ģ��޷���������", 0)
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
		Say("��Ķ���������û�������������Ѿ�����������.", 0)
	end
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBacDau")
end


--��� ������ÿ���˵�����״̬�� ����û�����������
function allbrother_0801_CheckTeamTaskState()
	local nTeamSize = GetTeamSize()
	local nCount = 0;
	for i=1,nTeamSize do
		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTaskState)
	end
	return nTeamSize-nCount;
end

--���һ���˵�����״̬ 0Ϊû�����񣬷���������������������������Ѿ���ʱ��ִ��ȡ�����񷵻�0 û�н�����
function allbrother_0801_CheckTaskState()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskLimit	= GetTask(TSK_allbrother_0801_TaskLimit)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	
	if nTaskState == 0 then --û�н�����
		if nDate ~= floor(nTaskLimit/256) then --������ǽ��� ����������
			nTaskLimit = nDate * 256
			SetTask(TSK_allbrother_0801_TaskLimit, nTaskLimit)
		end
		if mod(nTaskLimit, 256) < TSKV_allbrother_0801_TaskLimit then --���ҽ��컹�ܽ�
			return 0
		else
			Msg2Team(format("%s �����ѽ��� %d�θ�����������������.", GetName(), TSKV_allbrother_0801_TaskLimit))
			return 1;
		end
	else --�������񣬿��Ƿ�ʱ
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --��ʱ
			allbrother_0801_CancelTask()
			Msg2Team(format("%s �����涨ʱ�䣬����ȡ��.", GetName()))
			Msg2Player(format("%s �����涨ʱ�䣬����ȡ��.", GetName()))
			return 0;
		else --û�г�ʱ��˵���Ѿ���������
			Msg2Team(format("%s�ѽ��ܱ������˵�����.", GetName()))
			return 1;
		end
	end
end

--һ���˽�������Ĵ��� ����һ��nTaskId�����񣬲�������ʱ�䣬�����������+1
function allbrother_0801_AcceptTask(nTaskId)
	--������������ n����״̬
	SetTask(TSK_allbrother_0801_TaskState, nTaskId)
	SetTask(TSK_allbrother_0801_TaskLimit, GetTask(TSK_allbrother_0801_TaskLimit)+1)
	SetTask(TSK_allbrother_0801_TaskTime, GetCurServerTime())
	Msg2Player(format("��ȡ���� %s", allbrother_0801_tbTaskList[nTaskId].szShow))
end



--����ȡ������ 
function allbrother_0801_TeamCancelTask()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CancelTask)
	end
end
--����ȡ������,����״̬��Ϊ0
function allbrother_0801_CancelTask()
	if GetTask(TSK_allbrother_0801_TaskState) == 0 then
		Say("�����ڻ�û�������𣿳�����������Ĺ涨ʱ�俴������ȡ����.", 0)
		return 0;
	end
	SetTask(TSK_allbrother_0801_TaskState, 0)
	Msg2Player("ȡ������")
end

--�Ƿ�50��
function allbrother_0801_islvl50()
	if GetLevel() >= 50 and IsCharged() == 1 then
		return 1
	else 
		Msg2Team(format("%s�ȼ�δ��50������δ��ֵ",GetName()))
	end
end

function allbrother_0801_TaskPersonTaskAward() --
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nTaskId		= 0;
	if nTaskState == 0 then
		Say("�һ�û�н����κ�����.",0)
		return	
	end
	if nTaskState < 1073741824 then
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --��ʱ
			SetTask(TSK_allbrother_0801_TaskState, 0)
			Say("������˼��ʱ��ܿ��ȥ�˵��ǻ�û����ɣ�����ʧ����.", 0)
			return
		end
		nTaskId = nTaskState
		if allbrother_0801_tbTaskList[nTaskId].nTaskType == 0 then 
			local tbAward = {0, allbrother_0801_TaskFindItemAward, 1}
			springfestival08_lib_material_compose({allbrother_0801_tbTaskList[nTaskId].tbList, tbAward, "�������", "������Ʒ���Ի�������������", "�������"}, "����Ʒ")
		else
			Say("����û���������", 0)	
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

--���������콱���ж������Ƿ���ɣ��Ƿ�ʱ��Ȼ�����Ʒ������״̬����Ϊ0
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
		{szName="��Ե¶(��) ", tbProp={6, 1, 124, 1, 0, 0}},
		{nExp = nExpAward},
	}
	if (nTaskState > 1073741824) then --�൱���ж����λ�����Ƿ�Ϊ1
		SetTask(TSK_allbrother_0801_TaskState, 0)
		--�Ƿ�ʱ
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --��ʱ
			Say("������˼��ʱ��ܿ��ȥ�˵��ǻ�û����ɣ�����ʧ����.", 0)
			return
		end
		--������
		springfestival08_lib_AddAward(tbAward[2], allbrother_0801_szActName)
		
		local nCurRate = random(1,100)
		if nCurRate < 20 then
			springfestival08_lib_AddAward(tbAward[1], allbrother_0801_szActName)
		end
		
		nCurRate = random(1,getn(allbrother_0801_tbLingPai))
		springfestival08_lib_AddAward(allbrother_0801_tbLingPai[nCurRate], allbrother_0801_szActName)
		return 1;
	else
		Say("�����û���������.", 0)
	end
end



function allbrother_0801_TeamTaskAward()
	local nTeamSize = GetTeamSize()
	if IsCaptain() ~= 1 then
		Say("��������ͷ���λ��ӳ���������.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say("���������������������ļ", 0)
		return
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("��Ķ�������û��50������û�г�ֵ�ģ��޷���������", 0)
			return 
		end
	end
	local tbAward = {0, allbrother_0801_TeamTaskAwardFun, 1}
	springfestival08_lib_material_compose({allbrother_0801_tbLingPai, tbAward, "�������", "������Ʒ���Ի�����������", "�������"}, "����Ʒ", "8�ֱ���������(����������������Ȩ����������ҡ���������)")
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
		Msg2Player(format("%s �����Ѿ���� %d �μ�������, �Ѿ��ﵽ����޷��콱.", GetName(), TSKV_allbrother_0801_TaskTeamLimit))
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
		{szName="��Ե¶(��) ", tbProp={6, 1, 124, 1, 0, 0}, nRate = 20},
		{szName="�ɲ�¶", tbProp={6, 1, 71, 1, 0, 0}, nRate = 5},
		{szName="��ˮ��", tbProp={4, 239, 1, 0, 0, 0}, nRate = 1},
	}
	springfestival08_lib_AddAward(tbExp, allbrother_0801_szActName)
	springfestival08_lib_GiveRandomAward(tbItem, allbrother_0801_szActName)
	SetTask(TSK_allbrother_0801_TaskTeamLimit, GetTask(TSK_allbrother_0801_TaskTeamLimit)+1)
	return 1;
end


function OnCancel()
end