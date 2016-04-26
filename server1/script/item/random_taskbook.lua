
-- ====================== �ļ���Ϣ ======================

-- ������Եonline �������������ᴥ���ű�
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

strPublic       = "<color=green>�������<color>��";

function main(nIndex)

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- ����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�

local nTaskID = GetItemMagicLevel(nIndex, 1);

local nNowTaskID = GetTask(ID_RANDOMBOOK);  -- ��ȡ��ǰ��������� ID

local nTaskState = 0;  -- ��ǰ���������״̬

	if (GetProductRegion() == "cn") then
		-- �ж��Ƿ��ٻ���ͬ��
		if partnerindex==0 or partnerstate==0 then
		Msg2Player(strPublic.."<color=yellow>��û���ٻ�ͬ���޷���ȡ�������������Ŷ��<color>");
			return 1;
		end;
	end;
	
	-- �ж�ÿ�� 8 �ε������Ƿ����
	if checkTaskBookEnable()~=1 then
		Msg2Player(strPublic.."<color=white>�����̫���ˣ����ǵ������ٿ����������ɣ�<color>");
		return 1;
	end;
	
	
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)));
	end;
	
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>�������<color>������ǰ�л�δ��ɵľ���������ȷ��Ҫ�����µ�������",
			2,
			"�ǵģ���Ҫ����֮ǰ�ľ�������/#_confirmRandomBookTask("..nIndex..")",
			"���ˣ����ǵȵȰ�/OnTaskExit");
		return 1;
	else
		
		-- ����������������ص����񣬷��������������濪ʼ
		SetTaskStatus(TaskName(nTaskID), 0);
		local nResult = CloseTask(TaskName(nTaskID));

		-- �洢��Ʒ INDEX �����������
		SetTask(ID_RANDOMBOOKTEMP, nIndex)		
		
		ApplyTask( TaskName(nTaskID) );

		if nResult~=1 then
			WriteTaskLog("[״̬�쳣] �� Task ID:"..nTaskID..", ������ȷ�ر�! Process Ϊ: TaskBook Main().");
		end;
		
		return 1;
	end;

end;


-- ȷ�Ͻ��ܾ�������
function _confirmRandomBookTask(nIndex)

local nTaskID = GetItemMagicLevel(nIndex, 1);

	-- ��յ�ǰ�������ľ�������
	SetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMBOOK)));

	-- ����������������ص����񣬷��������������濪ʼ
	SetTaskStatus(TaskName(nTaskID), 0);
	local nResult = CloseTask(TaskName(nTaskID));
	
	-- �洢��Ʒ INDEX �����������
	SetTask(ID_RANDOMBOOKTEMP, nIndex)
	
	ApplyTask( TaskName(nTaskID) );
	
	if nResult~=1 then
		WriteTaskLog("[״̬�쳣] �� Task ID:"..nTaskID..", ������ȷ�ر�! Process Ϊ: _confirmRandomBookTask, �������Ϊ:"..nIndex);
	end;
	
	return
	
end;