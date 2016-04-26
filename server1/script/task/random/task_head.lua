
-- ====================== 文件信息 ======================

-- 剑侠情缘online 随机任务头文件
-- Edited by peres
-- 2005/08/12 PM 10:28

-- 只有晚上他们是在一起的
-- 他靠近她，拥抱她
-- 他的手指和皮肤
-- 她看着他，心里柔软而疼痛
-- 她想，她还是爱他
-- 她不想抱怨什么
-- 每天晚上他们都在做爱
-- 她不知道，除了这种接触，她的安全感和温暖，还能从哪里取得
-- 她喜欢那一瞬间。仿佛在黑暗的大海上，漂向世界的尽头

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 同伴系统的支持
IncludeLib("PARTNER");


-- 扩展表格文件类的支持
Include("\\script\\class\\ktabex.lua");

-- 藏宝图头文件的支持
Include("\\script\\task\\random\\treasure_head.lua");

tabMainType = new(KTabFileEx, "\\settings\\task\\random\\rate_type.txt", "MainType");

tabTalk = new(KTabFileEx, "\\settings\\task\\random\\rate_talk.txt", "TalkTable");
tabColl = new(KTabFileEx, "\\settings\\task\\random\\rate_coll.txt", "CollTable");
tabShow = new(KTabFileEx, "\\settings\\task\\random\\rate_show.txt", "ShowTable");
tabKill = new(KTabFileEx, "\\settings\\task\\random\\rate_kill.txt", "KillTable");
tabNext = new(KTabFileEx, "\\settings\\task\\random\\rate_nexttask.txt", "NextTable");

stuTaskFile = {
	["对话任务"] = tabTalk,
	["收集任务"] = tabColl,
	["展示任务"] = tabShow,
	["杀怪任务"] = tabKill,
}

-- 任务变量定义

ID_RANDOMTASK = 1301;  -- 存储当前玩家接到的随机任务
ID_RANDOMTASK_WAIT = 1302; -- 存储当前待接的随机任务
ID_RANDOMSTATE = 1303;  -- 存储随机任务的进展情况
ID_RANDOMBOOK = 1304;   -- 存储玩家当前的卷轴任务（第二层）

ID_RANDOMBOOKDATE = 1305;  -- 存储玩家使用任务卷轴的天数
ID_RANDOMBOOKNUM = 1306;  -- 存储玩家使用任务卷轴的次数

ID_RANDOMTASKDATE = 1308;  -- 存储玩家接随机任务时的日期
ID_RANDOMTASKNUM = 1309; -- 存储玩家接受随机任务的次数

ID_RANDOMBOOKTEMP = 1307;  -- 存储玩家使用任务卷轴的临时 INDEX，用于删除
ID_RANDOMTASKTEMP = 2391;  -- 存储帮会活动中随机任务令牌 INDEX

ID_USETREAMAP_TIME = 1738;  -- 储存玩家挖宝的次数

-- 初始化随机任务环境，如果条件成立则创建一个任务
-- 成功则返回 1，失败则返回 0
function initRandomTask()

local partnerindex, partnerstate = PARTNER_GetCurPartner()       -- 获得召唤出同伴的index,同伴状态为召出或为不召出

local nTaskID_Now = GetTask(ID_RANDOMTASK);
local nTaskID_Wait = createRandomTask();

	-- 如果等级小于 60 级，则不能接受随机任务
	if GetLevel()<60 then
		return 0;
	end;	
	
	-- 如果已经超过了一天 1O 次的限制则不能再产生随机任务
	if checkRandomTaskEnable()~=1 then
		return 0;
	end;
	
	if nTaskID_Now==nTaskID_Wait then -- 如果选到的随机任务和之前的一致，则直接返回 0
		return 0;
	else
		-- 将获取到的任务 ID 先存储在待接的任务变量中
		SetTask(ID_RANDOMTASK_WAIT, nTaskID_Wait);
		
		-- 同步任务变量
		SyncTaskValue(ID_RANDOMTASK_WAIT);
		
		setRandomTaskState(1);
		TaskTip("你接到了一个随机任务");
		
		-- 设置同伴的头顶显示状态，50 秒
		PARTNER_AddState(partnerindex, 662, 1, 50);
		return 1;
	end;

end;


-- 创建一个随机任务的主函数，将获取的任务 ID 存储在变量中
-- 返回值：正常返回创建随机任务的 ID，返回 0 则失败
function createRandomTask()

	local taskName = selectTask(selectType());   -- 随机得到一个任务
	local nTaskID = TaskNo(taskName);            -- 将任务名称变成任务 ID
	
	-- 出错处理
	if nTaskID~=0 and nTaskID~=nil then
		
		-- 返回该任务的 ID
		return nTaskID;
	else
		CDebug:MessageOut("获取随机任务失败，请检阅配置及脚本文件！");
		return 0;
	end;

end;

	
-- 选择任务的类型
-- 返回类型 string:strType
function selectType()
	local nLevel   = getTaskLevel();
	local nRow     = tabMainType:countArrayRate("Rate"..nLevel);
	local strType  = tabMainType:getCell("TaskType", nRow);
	CDebug:MessageOut("随机任务：选择到了一个任务类型："..strType);
	return strType;
end;


-- 根据任务类型选择具体的任务
-- 返回类型 string:taskName
function selectTask(strType)
	local nLevel   = getTaskLevel();
	local nRow     = stuTaskFile[strType]:countArrayRate("Rate"..nLevel);
	local taskName = stuTaskFile[strType]:getCell("TaskName", nRow);
	CDebug:MessageOut("随机任务：选择到了一个具体的任务名称："..taskName);
	return taskName;
end;


-- 选择第二层随机任务
-- 返回类型 string:taskName
function selectNextTask()
	local nRow     = tabNext:countArrayRate("Rate");
	local taskName = tabNext:getCell("TaskName", nRow);
	return taskName;
end;


-- 设置随机任务的状态
-- 传入参数：int:nState 任务的进展程度：0为没有任务，1为已有一个任务触发，2为已经确认了任务
function setRandomTaskState(nState)
	SetTask(ID_RANDOMSTATE, nState);
	
	-- 同步任务变量
	SyncTaskValue(ID_RANDOMSTATE);
end;


-- 获取随机任务的状态
-- 返回值：0为没有任务，1为已有一个任务触发，2为已经确认了任务
function getRandomTaskState()
	return GetTask(ID_RANDOMSTATE);
end;


-- 检查今天是否还能继续接随机任务
function checkRandomTaskEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- 取得今天的时间，年/月/日
local nOldDate = GetTask(ID_RANDOMTASKDATE);
local nTimes   = GetTask(ID_RANDOMTASKNUM);

	-- 如果时间不相同则可以做
	if nNowDate~=nOldDate then
		return 1;
	else
		-- 如果每天做了达到或者超过 10 次则不可以做
		if nTimes>=10 then
			return 0;
		else
			return 1;
		end;
	end;
	
end;

-- 写入随机任务完成的时间和次数
function writeRandomTaskEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- 取得今天的时间，年/月/日
local nOldDate = GetTask(ID_RANDOMTASKDATE);
local nTimes   = GetTask(ID_RANDOMTASKNUM);

	-- 如果时间不相同则清空时间
	if nNowDate~=nOldDate then
		nTimes = 0;
	end;

	SetTask(ID_RANDOMTASKDATE, nNowDate);
	SetTask(ID_RANDOMTASKNUM, nTimes + 1);
	
end;



-- 检查今天是否还能继续使用任务卷轴
function checkTaskBookEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- 取得今天的时间，年/月/日
local nOldDate = GetTask(ID_RANDOMBOOKDATE);
local nTimes   = GetTask(ID_RANDOMBOOKNUM);

	-- 如果时间不相同则可以做
	if nNowDate~=nOldDate then
		return 1;
	else
		-- 如果每天做了达到或者超过 8 次则不可以做
		if nTimes>=8 then
			return 0;
		else
			return 1;
		end;
	end;
end;


-- 写入任务卷轴当天完成的时间与次数
function writeTaskBookTimes()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- 取得今天的时间，年/月/日
local nOldDate = GetTask(ID_RANDOMBOOKDATE);
local nTimes   = GetTask(ID_RANDOMBOOKNUM);

	-- 如果时间不相同则清空时间
	if nNowDate~=nOldDate then
		nTimes = 0;
	end;

	SetTask(ID_RANDOMBOOKDATE, nNowDate);
	SetTask(ID_RANDOMBOOKNUM, nTimes + 1);
	
end;


-- 确认接受随机任务的回调函数
function _confirmRandomTask()

local nTaskID_Now = GetTask(ID_RANDOMTASK);
local nTaskID_Wait = GetTask(ID_RANDOMTASK_WAIT);
	
	-- 清空等待接的随机任务
	SetTaskStatus(TaskName(nTaskID_Wait), 0);
	CloseTask( TaskName(nTaskID_Wait) );	
	
	-- 将帮会令牌的临时变量清零
	SetTask(ID_RANDOMTASKTEMP, 0);
	
	ApplyTask( TaskName(nTaskID_Wait) );   -- 申请开始一个任务

end;


-- 获取任务的等级区间 10~100 每 10 级一个等级
-- 返回值：int:level
function getTaskLevel()

	local nLevel = GetLevel();

	if nLevel<10 then return 10; end;	
	if nLevel>100 then return 100; end;
	
	return floor(nLevel/10)*10;
	
end;
