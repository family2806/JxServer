
-- ====================== 文件信息 ======================

-- 剑侠情缘online 任务系统工具脚本
-- Edited by peres
-- 2005/07/29 PM 12:30

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 读入数据定义头文件
Include("\\script\\task\\system\\task_head.lua");

-- 读入 DEBUG 输出处理文件
Include("\\script\\task\\system\\task_debug.lua");

strTitle        = "<color=green>任务锦囊<color>：";
strTitle_Normal = strTitle.."您想查看哪个事件呢？<enter>"
strTitle_None   = strTitle.."您当前没有任何事件正在进行。";


function main()

Say(strTitle.."您想用伟大的佩雷斯所生成的任务锦囊做什么呢？",4,
	"查看当前我正在进行的事件/ShowEventMain",
	"将一个任务变成还没开始/MenuSetTaskClearn",
	"将一个事件所有任务清空/MenuSetEventClearn",
	"关闭/Task_Exit");

return 1;

end;

-- 玩家选择查看事件，在下面列出所有正在进行的事件供玩家选择
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
	
	rawset(aryTalkText, getn(aryTalkText)+1, "关闭/Task_Exit");
	
	SelectSay(aryTalkText);
	
	return 1;


end;


function ShowEventDetail(nEventID)

local aryTask = EnumEventTask(nEventID);
local strMain = {strTitle.."以下是您在<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>的详细情况：<enter><enter>"} -- 任务列表字符串

local i=0;


	for i=1, getn(aryTask) do
		strMain[1] = strMain[1]..GetTaskText(TaskName(aryTask[i]), 1, 3)..GetTaskStatusText(aryTask[i]).."<enter>";
	end;
	
	rawset(strMain, getn(strMain)+1, "清空此任务/#_ClearnTaskState("..nEventID..")");
	rawset(strMain, getn(strMain)+1, "返回主目录/main");
	rawset(strMain, getn(strMain)+1, "关闭/Task_Exit");
	
	SelectSay(strMain);

end;


-- 枚举出当前正在进行的事件
function EnumEventList()

local aryTask  = EnumTaskList(); -- 取得当前正在进展的任务
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


-- 枚举出一事件所包含的任务，返回一个数组
function EnumEventTask(nEventID)

local aryTask = {};

local nEvent = GetEventTaskCount(nEventID);

	CDebug:MessageOut("获取事件："..nEventID.." 的任务个数为："..nEvent);

local i=0;

	if nEvent==0 then return nil; end;
	
	for i=1, nEvent do
		CDebug:MessageOut("正在加入任务数组："..TaskNo(GetEventTask(nEventID, i)));
		rawset(aryTask,
				getn(aryTask)+1,
				TaskNo(GetEventTask(nEventID, i))
				);
	end;
	
	return aryTask;

end;


-- 回调函数，清空一个事件所有任务的状态，包括临时变量
function _ClearnTaskState(nEventID)

local aryTask = EnumEventTask(nEventID);

if aryTask==nil then return end;

	for i=1, getn(aryTask) do
		CDebug:MessageOut("正在清空"..TaskName(aryTask[i]).."任务的状态");
		SetTaskStatus(TaskName(aryTask[i]), 0);
		CloseTask(TaskName(aryTask[i]));
	end;

	Say(strTitle.."您已经清空了<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>下的所有分支任务", 0);

end;


-- 将一个任务设置成还未开始的状态
function MenuSetTaskClearn()
	AskClientForString("_SetTaskClearn", "", 1, 20, "请输入任务数字编号：");
end;


function _SetTaskClearn(taskID, nIndex)

	if TaskName(taskID)==0 or TaskName(taskID)==nil then
		Say(strTitle.."你是不是糊涂了？这个任务号并不存在哦！", 0);
		return
	end;

	SetTaskStatus(TaskName(taskID), 0);
	CloseTask(TaskName(taskID));
	
	Say(strTitle.."您已经将<color=yellow>"..TaskName(taskID).."<color>变成还没开始的状态。", 0);

end;


-- 将一个事件里所有的任务都清空
function MenuSetEventClearn()
	AskClientForString("_SetEventClearn", "", 1, 20, "请输入事件数字编号：");
end;


function _SetEventClearn(eventID, nIndex)

local nEvent = GetEventTaskCount(eventID);

	if nEvent==0 then
		Say(strTitle.."你是不是糊涂了？这个事件编号并不存在哦！", 0);
		return
	end;

	_ClearnTaskState(eventID);
end;


-- 用字符串表示一个任务的状态
function GetTaskStatusText(nTaskID)

local aryText = {
	[0]=" - <color=red>未开始<color>",
	[1]=" - <color=green>正进行<color>",
	[2]=" - <color=yellow>已经完成<color>",
	[3]=" - <color=yellow>已经领奖<color>",
}

	return aryText[GetTaskStatus(TaskName(nTaskID))];
	
end;