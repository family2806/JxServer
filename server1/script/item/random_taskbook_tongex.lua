
-- ====================== �ļ���Ϣ ======================

-- ������Եonline �������������ᴥ���ű� - ��������ر��
-- Edited by peres
-- 2005/09/01 PM 16:40

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");

-- ��������ϵͳͷ�ļ��������������
Include("\\script\\task\\system\\task_main.lua");

strPublic       = "<color=green>��������<color>��";

local TSK_UseCountPerDay = 2589;

function main(nIndex)

	local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- ����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	
	local nTaskID = GetItemMagicLevel(nIndex, 1);
	
	local nNowTaskID = GetTask(ID_RANDOMTASK);  -- ��ȡ��ǰ��������� ID
	
	local nTaskState = 0;  -- ��ǰ���������״̬

	if (GetProductRegion() == "cn") then
		-- �ж��Ƿ��ٻ���ͬ��
		if partnerindex==0 or partnerstate==0 then
		Msg2Player(strPublic.."<color=yellow>��û���ٻ�ͬ���޷���ȡ�����������������Ŷ��<color>");
			return 1;
		end;
	end;
	
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)));
	end;
	
	local nUseState = GetTask(%TSK_UseCountPerDay)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nPerDayUseCount = 100
	if floor(nUseState / 256) ~= nCurDate then
		
		nUseState = nCurDate * 256
		SetTask(%TSK_UseCountPerDay, nUseState)
	end
	
	if mod(nUseState, 256) >= nPerDayUseCount then
		
		Talk(1, "", format("ÿ��ÿ��ֻ��ʹ�ø���Ʒ %d��.", nPerDayUseCount))
		return 1
		
	end
	
	
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>��������<color>������ǰ�л�δ��ɵ����������ȷ��Ҫ�����µ�������",
			2,
			"�ǵģ���Ҫ����֮ǰ���������/#_confirmRandomBookTask("..nIndex..")",
			"���ˣ����ǵȵȰ�/OnTaskWait");
		return 1;
	else
		
		-- ����������������ص����񣬷��������������濪ʼ
		SetTaskStatus(TaskName(nTaskID), 0);
		CloseTask(TaskName(nTaskID));

		-- �����ӵ����񴢴�����ʱ������
		SetTask(ID_RANDOMTASK_WAIT, nTaskID);
		
		-- ͬ���������
		SyncTaskValue(ID_RANDOMTASK_WAIT);
	
		-- �洢��Ʒ INDEX �����������
		SetTask(ID_RANDOMTASKTEMP, nIndex)		
		
		ApplyTask( TaskName(nTaskID) );
		
		
		SetTask(%TSK_UseCountPerDay, nUseState + 1);
		
		return 1;
	end;

end;


-- ȷ�Ͻ��ܾ�������
function _confirmRandomBookTask(nIndex)

local nTaskID = GetItemMagicLevel(nIndex, 1);

	-- ��յ�ǰ�������ľ�������
	SetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMTASK)));

	-- ����������������ص����񣬷��������������濪ʼ
	SetTaskStatus(TaskName(nTaskID), 0);
	CloseTask(TaskName(nTaskID));
	
	-- �����ӵ����񴢴�����ʱ������
	SetTask(ID_RANDOMTASK_WAIT, nTaskID);
		
	-- ͬ���������
	SyncTaskValue(ID_RANDOMTASK_WAIT);
	
	-- �洢��Ʒ INDEX �����������
	SetTask(ID_RANDOMTASKTEMP, nIndex);
	
	ApplyTask( TaskName(nTaskID) );
	SetTask(%TSK_UseCountPerDay, GetTask(%TSK_UseCountPerDay) + 1);
	
	return
	
end;