
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����ϵͳ���߽ű�
-- Edited by peres
-- 2005/07/29 PM 12:30

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- �������ݶ���ͷ�ļ�
Include("\\script\\task\\system\\task_head.lua");

-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_debug.lua");

strTitle        = "<color=green>�������<color>��";
strTitle_Normal = strTitle.."����鿴�ĸ��¼��أ�<enter>"
strTitle_None   = strTitle.."����ǰû���κ��¼����ڽ��С�";


function main()

Say(strTitle.."������ΰ�������˹�����ɵ����������ʲô�أ�",4,
	"�鿴��ǰ�����ڽ��е��¼�/ShowEventMain",
	"��һ�������ɻ�û��ʼ/MenuSetTaskClearn",
	"��һ���¼������������/MenuSetEventClearn",
	"�ر�/Task_Exit");

return 1;

end;

-- ���ѡ��鿴�¼����������г��������ڽ��е��¼������ѡ��
function ShowEventMain()

local i=0;
local aryEvent = EnumEventList();
local aryTalkText = {strTitle_Normal};

	if aryEvent==nil then
		Say(strTitle_None, 0);
		return
	end;
	
	for i,j in aryEvent do
		rawset(aryTalkText,
				getn(aryTalkText)+1,
				TaskEvent(i, 1, 1).."/#ShowEventDetail("..i..")");
	end;
	
	rawset(aryTalkText, getn(aryTalkText)+1, "�ر�/Task_Exit");
	
	SelectSay(aryTalkText);
	
	return 1;


end;


function ShowEventDetail(nEventID)

local aryTask = EnumEventTask(nEventID);
local strMain = {strTitle.."����������<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>����ϸ�����<enter><enter>"} -- �����б��ַ���

local i=0;


	for i=1, getn(aryTask) do
		strMain[1] = strMain[1]..GetTaskText(TaskName(aryTask[i]), 1, 3)..GetTaskStatusText(aryTask[i]).."<enter>";
	end;
	
	rawset(strMain, getn(strMain)+1, "��մ�����/#_ClearnTaskState("..nEventID..")");
	rawset(strMain, getn(strMain)+1, "������Ŀ¼/main");
	rawset(strMain, getn(strMain)+1, "�ر�/Task_Exit");
	
	SelectSay(strMain);

end;


-- ö�ٳ���ǰ���ڽ��е��¼�
function EnumEventList()

local aryTask  = EnumTaskList(); -- ȡ�õ�ǰ���ڽ�չ������
local aryEvent = {}
local i=0;

	if aryTask==nil then return nil; end;
	
	for i=1, getn(aryTask) do
		rawset(aryEvent,
				GetTaskEventID(aryTask[i]),
				1);
	end;
	
	return aryEvent;

end;


-- ö�ٳ�һ�¼������������񣬷���һ������
function EnumEventTask(nEventID)

local aryTask = {};

local nEvent = GetEventTaskCount(nEventID);

	CDebug:MessageOut("��ȡ�¼���"..nEventID.." ���������Ϊ��"..nEvent);

local i=0;

	if nEvent==0 then return nil; end;
	
	for i=1, nEvent do
		CDebug:MessageOut("���ڼ����������飺"..TaskNo(GetEventTask(nEventID, i)));
		rawset(aryTask,
				getn(aryTask)+1,
				TaskNo(GetEventTask(nEventID, i))
				);
	end;
	
	return aryTask;

end;


-- �ص����������һ���¼����������״̬��������ʱ����
function _ClearnTaskState(nEventID)

local aryTask = EnumEventTask(nEventID);

if aryTask==nil then return end;

	for i=1, getn(aryTask) do
		CDebug:MessageOut("�������"..TaskName(aryTask[i]).."�����״̬");
		SetTaskStatus(TaskName(aryTask[i]), 0);
		CloseTask(TaskName(aryTask[i]));
	end;

	Say(strTitle.."���Ѿ������<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>�µ����з�֧����", 0);

end;


-- ��һ���������óɻ�δ��ʼ��״̬
function MenuSetTaskClearn()
	AskClientForString("_SetTaskClearn", "", 1, 20, "�������������ֱ�ţ�");
end;


function _SetTaskClearn(taskID, nIndex)

	if TaskName(taskID)==0 or TaskName(taskID)==nil then
		Say(strTitle.."���ǲ��Ǻ�Ϳ�ˣ��������Ų�������Ŷ��", 0);
		return
	end;

	SetTaskStatus(TaskName(taskID), 0);
	CloseTask(TaskName(taskID));
	
	Say(strTitle.."���Ѿ���<color=yellow>"..TaskName(taskID).."<color>��ɻ�û��ʼ��״̬��", 0);

end;


-- ��һ���¼������е��������
function MenuSetEventClearn()
	AskClientForString("_SetEventClearn", "", 1, 20, "�������¼����ֱ�ţ�");
end;


function _SetEventClearn(eventID, nIndex)

local nEvent = GetEventTaskCount(eventID);

	if nEvent==0 then
		Say(strTitle.."���ǲ��Ǻ�Ϳ�ˣ�����¼���Ų�������Ŷ��", 0);
		return
	end;

	_ClearnTaskState(eventID);
end;


-- ���ַ�����ʾһ�������״̬
function GetTaskStatusText(nTaskID)

local aryText = {
	[0]=" - <color=red>δ��ʼ<color>",
	[1]=" - <color=green>������<color>",
	[2]=" - <color=yellow>�Ѿ����<color>",
	[3]=" - <color=yellow>�Ѿ��콱<color>",
}

	return aryText[GetTaskStatus(TaskName(nTaskID))];
	
end;