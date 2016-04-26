
-- ====================== 文件信息 ======================

-- 剑侠情缘online 任务系统回调函数头文件
-- Edited by peres
-- 2005/07/04 PM 19:59

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 物品库支持
IncludeLib("ITEM");

-- 随机任务的处理支持
Include("\\script\\task\\random\\task_head.lua");


-- 任务过程间传递任务 ID 的临时变量号
TASK_TEMP_ID = 201;

-- 用于临时记录的物品 ID 总数
TASK_CHECKITEM_NUM = 202;

-- 用于临时记录的物品 ID 起始变量号
TASK_CHECKITEM_START = 203;

-- 用于临时记录的物品 ID 最大数
TAKS_CHECKITEM_MAX = 20;


TaskID_Table = {
	CanCancel    = 4,
	TaskText_Row = 5,
}

-- 任务条件的表格定义
Condition = {

	TaskType_Row    = 1,
	TaskDesc_Row    = 2,
	
	TaskStart       = "任务开始",	
	TaskEnd         = "任务结束",
	LevelMore       = "等级大于",
	LevelLess       = "等级小于",
	LevelEqual      = "等级等于",
	ValueMore       = "变量大于",
	ValueLess       = "变量小于",
	ValueEqual      = "变量等于",
	ReputeMore      = "声望大于",
	HaveItem        = "持有物品",
	
	CanRestart      = "可重复开始",

}

-- 任务内容的表格定义
Entity = {

	TaskType_Row          = 1,
	Goods_Genre_Row       = 2,
	Goods_Detail_Row      = 3,
	Goods_Particular_Row  = 4,
	Goods_Level_Row       = 5,
	Goods_GoodsFive_Row   = 6,
	Goods_Quality_Row     = 7,
	Goods_GoodsNum_Row    = 8,
	Goods_DelGoods_Row    = 9,
	Goods_RecordSeed_Row  = 10,
	Money_Row             = 11,
	KillNpcName_Row       = 12,
	DropItemRate_Row      = 13,
	TalkNpcName_Row       = 14,
	TalkNpcMap_Row        = 15,
	TaskText_Row          = 16,
	
	Collect               = "收集物品",
	CollectGoldItem       = "收集黄金装备",
	CollectNpcItem		  = "杀怪掉落物品",
	KillNpc               = "杀怪",
	TalkNpc               = "对话",

}

-- 任务奖励的表格定义
Award = {

	AwardType_Row         = 1,
	AwardText_Row         = 2,
	Goods_Genre_Row       = 3,
	Goods_Detail_Row      = 4,
	Goods_Particular_Row  = 5,
	Goods_Level_Row       = 6,
	Goods_GoodsFive_Row   = 7,
	Goods_Quality_Row     = 8,
	Goods_RandomSeed_Row  = 9,
	Goods_GoodsNum_Row    = 10,
	MoneyNum_Row          = 11,
	ExpNum_Row            = 12,
	ReputeNum_Row         = 13,
	AwardTask_Row         = 14,
	SelectTask_Row        = 15,
	ArrayID_Row           = 16,
	ArrayRate_Row         = 17,
	AlliedAward_Row       = 18,
	
	Money                 = "金钱",
	Exp                   = "经验",
	Goods                 = "物品",
	GoldItem              = "黄金装备",
	Task                  = "开始任务",
	RandomTask            = "随机任务卷轴",  -- 特殊的奖励类型，调用特定的过程产生一个任务卷轴
	AlliedAwardIndex      = "奖励索引",      -- 特殊的奖励类型，直接索引到别的任务奖励上，并派发一模一样的奖励
	TreasureMap           = "藏宝图",        -- 特殊的奖励类型，调用特定的过程给玩家发一张藏宝图
	
}

-- 任务临时变量的存储 ID 定义
TmpType = {
	
	Collect        = "Collect",
	CollectGold    = "CollectGold",
	KillNpc        = "KillNpc",
	TalkNpc        = "TalkNpc",
	ItemNpc        = "ItemNpc",
	ItemRate       = "ItemRate",
	ItemSeed       = "ItemSeed",

}

-- 获取一个任务的简要描述
function GetTaskText(taskName)

local strText = TaskId(TaskNo(taskName), 1, TaskID_Table.TaskText_Row);

	if strText==nil then strText=""; end;
	
	return strText;
end;


-- 获取一个任务所属的事件名
function GetTaskEventName(taskName)

local nEventID = GetTaskEventID(taskName)
	return TaskEvent(nEventID, 1, 1);
end;


-- 检查一个任务是否可以取消
function CheckTaskCanCancel(taskName)
	local nCanCancel = tonumber(TaskId(TaskNo(taskName), 1, TaskID_Table.CanCancel));
	
	if nCanCancel~=nil and nCanCancel~=0 then
		return 1;
	else
		return 0;
	end;
	
end;


-- 询问是否取消任务
function CancelTaskConfirm(nTaskID)
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
	Say("你确认要取消此次任务吗：<color=yellow>"..szText.."<color>。", 
		2,
		"是的/#CancelTaskMain("..nTaskID..")",
		"不了/Task_Exit");
end;


-- 取消任务的主过程
function CancelTaskMain(nTaskID)
	
	local taskName = TaskName(nTaskID);
	local szText = GetTaskText(taskName);
	
		SetTaskStatus(taskName, 0);
		CloseTask(taskName);
		
		Msg2Player("您已经成功的取消了：<color=yellow>"..szText.."<color>。");
		
		WriteTaskLog("取消了任务："..taskName);
		
end;


-- 执行任务对话
function ShowTaskSay(taskID)

local taskName = TaskName(taskID)

	OnTaskSay_Call(taskName, GetTaskStatus(taskName));
	
end;


-- 用对话面版显示任务的详细信息
function ShowTaskInfo(taskID)

local taskName = TaskName(taskID);
local strInfo = TaskTalk(taskName, 1, 6);

	Say(strInfo, 1, "返回/#BackTaskStart("..TaskNo(taskName)..")");

end;


-- 返回任务对话主面版
function BackTaskStart(taskID)
	OnTaskSay_Call(TaskName(taskID), 0);
end;


-- 获取一个任务所需要的完成条件数量
function GetTaskFinishConditionNum(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nRightCheck = nRow;
	local i=0;
	
	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		-- 如果有收集怪物掉落物品的任务，则不计算
		if strType==Entity.CollectNpcItem then
			nRightCheck = nRightCheck - 1;
		end;
	end;
	
	return nRightCheck;
end;


-- 获取一个任务的搜集类型是物品还是黄金装备
-- 返回值：1 为物品，2 为黄金装备，nil 为没收集任务
function GetTaskCollectType(taskName)

local nRow, nCol = TaskEntityMatrix(taskName);	
local checkType = nil;
local i=0;

	-- 检查此任务是找黄金装备还是找普通物品
	for i=1, nRow do
		
		-- 是黄金装备
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
			checkType=2;
		end;
		
		-- 是普通物品
		if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
			checkType=1;
		end;
		
	end;
	
	return checkType;
	
end;

-- 返回一个任务中收集类型的物品数组
-- 物品数组类型：{nGenre, nDetail, nParticular, nLevel, nGoodsFive, nNum, nIsDel}
-- 黄金装备数组类型：{nQuality, nNum, nIsDel}
function GetTaskCollectArray(taskName, nType)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
local nQuality, nGoodsNum, nDelGoods = 0,0,0;

local nRow, nCol = TaskEntityMatrix(taskName);
local aryCollect = {}
local i=0;

	if (nType==1) then
		for i=1, nRow do
		
			nGenre      = tonumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
			nDetail     = tonumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
			nParticular = tonumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
			nLevel      = tonumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
			nGoodsFive  = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.Collect then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nGenre,
						 nDetail,
						 nParticular,
						 nLevel,
						 nGoodsFive,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	if (nType==2) then
		for i=1, nRow do
			nQuality    = tonumber(TaskEntity(taskName, i, Entity.Goods_Quality_Row));
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nDelGoods   = tonumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
			
			if TaskEntity(taskName, i, Entity.TaskType_Row)==Entity.CollectGoldItem then
				rawset(aryCollect,
						getn(aryCollect)+1,
						{nQuality,
						 nGoodsNum,
						 nDelGoods
						}
						);
			end;
		end;
	end;
	
	return aryCollect;

end;

-- 取得一个任务所要收集物品的总数
function GetTaskCollectNum(taskName)

local nNum = 0;
local strType = "";
local nRow, nCol = TaskEntityMatrix(taskName);

local i=0;

	for i=1, nRow do
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
			nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
			nNum = nNum + nGoodsNum;
		end;
	end;
	
	return nNum;
	
end;


-- 取得一任务收集物品的行数
function GetTaskCollectRow(taskName)

local aryRow = {}
local nRow, nCol = TaskEntityMatrix(taskName);
local i=0;

	for i=1, nRow do
	
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		nGoodsNum   = tonumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
		
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
		
			if aryRow[i]==nil then rawset(aryRow, i, {}); end;
			
			rawset(aryRow, i, {nGoodsNum, 0});
		end;
		
	end;
	
	return aryRow;

end;


-- 发奖的主函数入口，只需调用次函数即可实现完整的发奖
-- 传入参数：string:taskName 发奖的任务名称
-- 传入参数：nAlliedTask 可选参数，如果非空，则表明是由索引奖励来发奖
function PayAwardMain(taskName, nAlliedTask)

	local nRow, nCol = TaskAwardMatrix(taskName);
	local nResult = 0; -- 发奖的结果，如果有开始新任务的话则返回 1
	local i=0;
	
	local aryAward = {{}};
	local strType = "";
	local strArray = "";
	local strArrayRate = "";
	
	local nIsArray = 0; -- 判断是否有数组
	
	local nAdd = 0; -- 计算概率时累加的变量
	local nRandom = 0; -- 取的随机值
	
	local nIsTaskStart = 0;  -- 是否开始新任务


	-- 如果非空，则表明是由索引奖励调用此过程来发奖
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;
	
		CDebug:MessageOut(taskName.."任务开始给予奖励");
	
		for i=1, nRow do
		
			strType = TaskAward(taskName, i, Award.AwardType_Row);
			strArray = TaskAward(taskName, i, Award.ArrayID_Row);
			strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
			
			-- 如果奖励被定义了数组
			if strArray~="" then
			
				CDebug:MessageOut(taskName.."的奖励包含有数组。");
				
				-- 如果数组不存在则初始化数组
				if aryAward[tonumber(strArray)]==nil then
					CDebug:MessageOut(taskName.."初始化奖励数组："..tonumber(strArray));
					rawset(aryAward, tonumber(strArray), {}); 
				end;
				
				 rawset(aryAward[tonumber(strArray)],
				 		getn(aryAward[tonumber(strArray)])+1,
				 		{i,tonumber(strArrayRate)}
				 		);
				 		
				 nIsArray = 1;
			else
				nResult = PayAward(taskName, i, strType, nAlliedTask);
				-- 储存是否开始任务
				if nResult==1 then nIsTaskStart = 1; end;
			end;
		
		end;
		
		-- 如果奖励被定义了数组，则调用数组发奖函数
		if nIsArray==1 then
			CDebug:MessageOut(taskName.."奖励有被定义的数组，开始调用数组发奖函数！");
			for i=1, getn(aryAward) do
				if PayAwardForArray(taskName, aryAward[i], nAlliedTask)==1 then
					nResult = 1;
					nIsTaskStart = 1;
				end;
			end;
		
		end;
		
		
		-- 如果任务奖励没有开始新任务的话则展开任务完成后的对话
		if nIsTaskStart==0 then
			CDebug:MessageOut(taskName.." 任务没有开始新任务，则调用结束发奖时的对话");
			CreateTaskSay({TaskTalk(taskName, 1, 5),
						  "结束对话/OnTaskExit"
						  });
			return 1;
		end;
		
		return 1;
		
end;


-- 发奖的统一细节处理过程
-- 传入参数为任务的名字、奖励行号、发奖类型
-- 传入参数：nAlliedTask 可选参数，如果非空，则表明是由索引奖励来发奖
function PayAward(taskName, nRow, strType, nAlliedTask)

local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nNum = 0,0,0,0,0,0,0;
local nMoney, nExp = 0,0
local nRandomItemIndex = 0;  -- 产生随机任务卷轴的索引
local nRandomTaskID = 0;  -- 产生随机任务的任务索引

-- 如果物品需要记录随机种子，则记录序号
local nRandomSeedRecord = 0;

-- 随机种子数	
local nRandomSeed = 0;

local strAlliedTask = ""; -- 类似任务奖励的索引
local nAlliedRow, nAlliedCol = 0,0;
local strAlliedType = "";
local strShowName = "";  -- 输出显示的任务名

local strTask = "";
local strText = "";

local nResult = 0;

local i=0;

	-- 异常处理
	if taskName=="" or taskName==nil then
		-- 写 LOG
		WriteTaskLog("非法的调用了发奖过程！");		
		return
	end;

	-- 如果非空，则表明是由索引奖励调用此过程来发奖
	if nAlliedTask~=nil and nAlliedTask~=0 then
		strShowName = TaskName(nAlliedTask);
	else
		strShowName = taskName;
	end;
	
	-- 异常处理
	if strShowName==nil then strShowName=""; end;

	-- 如果奖励的类型是金钱
	if strType==Award.Money then		
		nMoney = TaskAward(taskName, nRow, Award.MoneyNum_Row);
		
		if nMoney==nil or nMoney=="" then nMoney=0; end;
		
		Earn(nMoney);
		
		Msg2Player("您得到了<color=White>"..GetTaskText(strShowName).."<color>的奖励：<color=green>金钱"..nMoney.."<color>");
		CDebug:MessageOut(strShowName.."任务给予奖励为金钱："..nMoney);
	end;
	
	-- 如果奖励的类型是经验
	if strType==Award.Exp then
		nExp = TaskAward(taskName, nRow, Award.ExpNum_Row);
		AddOwnExp(nExp);
		
		Msg2Player("您得到了<color=White>"..GetTaskText(strShowName).."<color>的奖励：<color=green>经验"..nExp.."<color>");
		CDebug:MessageOut(strShowName.."任务给予奖励为经验："..nExp);
	end;

	-- 如果奖励的类型是物品
	if strType==Award.Goods then
	
		nGenre      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Genre_Row));
		nDetail     = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Detail_Row));
		nParticular = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Particular_Row));
		nLevel      = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_Level_Row));
		nGoodsFive  = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsFive_Row));
		nNum        = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_GoodsNum_Row));
		
		-- 奖励的物品文字
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		for i=1, nNum do
			AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
		end;
		
		Msg2Player("您得到了<color=White>"..GetTaskText(strShowName).."<color>的奖励：<color=green>物品"..strText..nNum.."个<color>");
		
		-- 写 LOG
		WriteTaskLog("在任务："..strShowName.."获得了物品："..strText);
		
		CDebug:MessageOut(strShowName.."任务给予奖励为物品，物品为："..strText);
	end;
		
	-- 如果奖励的类型是黄金装备
	if strType==Award.GoldItem then
	
		nQuality = tonumber(TaskAward(taskName, nRow, Award.Goods_Quality_Row));
		nRandomSeedRecord = TranItemNumber(TaskAward(taskName, nRow, Award.Goods_RandomSeed_Row));
		
		if nRandomSeedRecord~=-1 then
			nRandomSeed = GetTmpValue(taskName, TmpType.ItemSeed..nRandomSeedRecord);
			-- AddItemEx 指令需要将黄金序号 -1
			AddItemEx(4, nRandomSeed, 1, 0, nQuality - 1, 0, 0, 0, 0, 0);
			CDebug:MessageOut(strShowName.."任务给予奖励为黄金装备，编号为："..nQuality.." 随机种子为："..nRandomSeed);
		else
			AddGoldItem(0, nQuality);
		end;

		-- 奖励的物品文字
		strText     = TranEnableString(TaskAward(taskName, nRow, Award.AwardText_Row));
		
		Msg2Player("您得到了<color=White>"..GetTaskText(strShowName).."<color>的奖励：黄金装备：<color=Orange>"..strText.."<color>");
		
		-- 写 LOG
		WriteTaskLog("在任务："..strShowName.."获得了一件黄金装备："..nQuality);
		
		CDebug:MessageOut(strShowName.."任务给予奖励为黄金装备，编号为："..nQuality);
	end;
	
	-- 如果奖励类型是开始一个任务
	if strType==Award.Task then
		strTask = TaskAward(taskName, nRow, Award.AwardTask_Row);
		nResult = ApplyTask(strTask);
		CDebug:MessageOut(strShowName.."任务给予奖励为开始任务，名称为："..strTask.." ，开始结果为："..nResult);
		return 1;
	end;
	
	-- 如果奖励类型是产生一个随机任务卷轴
	if strType==Award.RandomTask then
		
		-- 选择一个第二层的随机任务
		nRandomTaskID = TaskNo(selectNextTask());
		
		if nRandomTaskID~=nil and nRandomTaskID~=0 then
			-- 生成一个任务卷轴
			nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
			SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
			
			-- 同步物品魔法属性
			SyncItem(nRandomItemIndex);

			Msg2Player("您得到了<color=White>"..GetTaskText(strShowName).."<color>的奖励：<color=green>任务卷轴一个！<color>");
			CDebug:MessageOut(strShowName.."任务给予奖励为一个任务卷轴，其任务编号为："..nRandomTaskID.." 索引为："..nRandomItemIndex);
		else
			CDebug:MessageOut(strShowName.."任务奖励任务卷轴失败！");
		end;
		
	end;
	
	
	-- 如果奖励类型是藏宝图
	if strType==Award.TreasureMap then
		-- 产生一张藏宝图
		CreateTreasureMap();
		
		Msg2Player("您得到了<color=White>"..GetTaskText(strShowName).."<color>的奖励：<color=green>藏宝图一个！<color>");
		
		-- 写 LOG
		WriteTaskLog("在任务："..strShowName.."获得了一张藏宝图。");
	end;
	
	
	-- 如果奖励类型是奖励索引
	if strType==Award.AlliedAwardIndex then

		-- 获取奖励索引名
		strAlliedTask = TaskAward(taskName, nRow, Award.AlliedAward_Row);
		
		CDebug:MessageOut(taskName.."的奖励类型为奖励索引："..strAlliedTask);
		
		-- 把自己本身转换成一个数字传进去
		PayAwardMain(strAlliedTask, TaskNo(taskName));
		
	end;
	
	return 0;

end;


-- 根据传入的数组来随机选取一个奖励发给玩家
-- 传入参数：taskName：任务名  aryAward{nRow, nRate}：奖励数组
-- 传入参数：nAlliedTask 可选参数，如果非空，则表明是由索引奖励来发奖
function PayAwardForArray(taskName, aryAward, nAlliedTask)

local strType = "";

local nAdd = 0;
local nResult = 0;
local nRandom = 0;
local nIsTaskStart = 0; -- 判断始是否有任务开始
local i=0;

local RATE_ADD = 100; -- 概率都乘 100 ，以防止出现小数

	-- 如果非空，则表明是由索引奖励调用此过程来发奖
	if nAlliedTask==nil then
		nAlliedTask = 0;
	end;

	for i=1, getn(aryAward) do
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
	end;
	
	nRandom = random(1, nAdd);
	
	CDebug:MessageOut(taskName.."奖励取得一个随机数："..nRandom);
	
	if nAdd~=10000 then -- 如果概率相加不到 10000 的容错处理
		print(taskName.."的奖励表格填写错误！");
		nRandom=1; 
	end;
	
	nAdd = 0;
	
	-- 把数组里面的东西发出去
	for i=1, getn(aryAward) do
		
		strType = TaskAward(taskName, aryAward[i][1], Award.AwardType_Row);
		nAdd = nAdd + aryAward[i][2]*RATE_ADD;
		
		if nAdd>=nRandom then
			CDebug:MessageOut(taskName.."奖励在数组中取得第 "..aryAward[i][1].."行");
			nResult = PayAward(taskName, aryAward[i][1], strType, nAlliedTask);
			
			if nResult==1 then
				nIsTaskStart = 1;
			end;
			
			break;
		end;
	end;
	
	return nIsTaskStart;
	
end;


-- 用于判断对话任务是否能完成
function CheckTalkCanFinish(taskName)

local nTalkNpc = 0;
local nOrder = 0;
local nFinish = 0;

	if GetTmpValue(taskName, TmpType.KillNpc) ~= nil then
		CDebug:MessageOut(taskName.." 判断对话任务是否可以完成，杀怪任务的临时变量不为空。");
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.KillNpc);	
	end;
	if GetTmpValue(taskName, TmpType.Collect) ~= nil then
		nOrder = nOrder + 1;
		nFinish = nFinish + GetTmpValue(taskName, TmpType.Collect);
	end;
	if GetTmpValue(taskName, TmpType.TalkNpc) ~= nil then
		nOrder = nOrder + 1;
		nTalkNpc = 1;
	end;
	
	if nOrder>1 then
		if nFinish + 1 == nOrder then
			CDebug:MessageOut(taskName.." 对话任务可以完成");
			return 1;
		else
			return nil;
		end;
	else
		return 1;
	end;

end;


-- 构造任务选择对话
function CreateTalkTask()

local nNpcIndex = GetLastDiagNpc();
local NpcName  = ""

local x, y, subworld = GetNpcPos(nNpcIndex);
local mapName = SubWorldName(subworld);

local aryTask = EnumTaskList();

local aryTaskText = {"你来做什么呢？"};

local i=0;

	if nNpcIndex==nil then return 0; end;

	if aryTask==nil then return 0; end;
	
	NpcName = GetNpcName(nNpcIndex);
	
	-- 台湾版需要转换过的 NPC NAME
	NpcName = NpcName2Replace(NpcName);
	
	for i=1, getn(aryTask) do
		if OnTaskNpcTalk(NpcName, mapName, aryTask[i])==1 then
			rawset(aryTaskText,
					getn(aryTaskText)+1,
					"我是来做"..GetTaskEventName(aryTask[i]).."的/#ShowTaskSay("..TaskNo(aryTask[i])..")");
		end;
	end;
	
	rawset(aryTaskText, getn(aryTaskText)+1, "继续原来的对话/NpcDialog");
	
	if getn(aryTaskText)>2 then
		SelectSay(aryTaskText);
		return 1;
	else
		return 0;
	end;

end;


-- 选择收集杀怪物品任务的物品，在每杀一次指定的怪时触发
function SelectCollectItemTask(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	local nItemRate = tonumber(GetTmpValue(taskName, "ItemRate"));
	
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
	local szText = "";
	local nRandom = 0;
	
	if nItemRate==0 or nItemRate==nil then return end;
	
	CDebug:MessageOut(taskName.." 得到杀怪掉落物品的概率："..nItemRate);
	
		if nRate~=nil or nRate~="" then
			nRandom = random(1, 100);
			if nRandom<=tonumber(nItemRate) then
				
				for i=1, nRow do
					strType = TaskEntity(taskName, i, Entity.TaskType_Row);
					if strType==Entity.CollectNpcItem then
						nGenre      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
						nDetail     = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
						nParticular = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
						nLevel      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
						nGoodsFive  = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
						szText      = TaskEntity(taskName, i, Entity.TaskText_Row);
					end;
				end;
				
				AddItem(nGenre, nDetail, nParticular, nLevel, nGoodsFive, 0, 0);
				Msg2Player("你得到了一个：<color=green>"..szText.."<color>！");
				
			end;
		end;
end;


-- 将一个传进来的物品索引转换成一个 STRING 的 KEY，以及返回等级和五行
function TranKey(nIndex)

local nGenre,nDetail,nParticular,nLevel,nGoodsFive,nLuck = GetItemProp(nIndex);
local nQuality = GetGlodEqIndex(nIndex);

local strKey = "";

	if nQuality==0 or nQuality<0 then
	
		strKey = tostring(nQuality)..","..
			     tostring(nGenre)..","..
			     tostring(nDetail)..","..
			     tostring(nParticular);
	
	else
		strKey = tostring(nQuality)..","..
			     tostring(0)..","..
			     tostring(0)..","..
			     tostring(0);	
	end;

	return strKey, nLevel, nGoodsFive;

end;


-- 转换一个物品的标识为数字，如果其为 n 或者是 nil 则返回 -1
function TranItemNumber(num)

	if num=="n" or num=="" or num==nil then
		return -1;
	end;
	
	if strfind(tostring(num), "/")~=nil then
		return tostring(num);
	end;
	
	return tonumber(num);

end;


-- 强制将一个变量转换成合法的字符串
function TranEnableString(strMain)

	if strMain==nil then
		return "";
	else
		return strMain;
	end;

end;


-- 枚举当前正在进行的任务，返回一个任务名数组
function EnumTaskList()

local aryTask = {}

-- 获取第一个任务名
local taskName = FirstTask();

	-- 如果当前没有任务则直接返回
	if taskName==nil then return nil; end;
	
	rawset(aryTask, getn(aryTask)+1, taskName);
	
	while (taskName~=nil) do
		taskName = NextTask();
		rawset(aryTask, getn(aryTask)+1, taskName);
	end;
	
	return aryTask;

end;


-- 同步任务系统所占用的所有变量
function SyncTaskSystemValus()

local nStart, nEnd = 2000, 2300; -- 开始和结束的范围
local i=0;

	for i=nStart, nEnd do
		SyncTaskValue(i);
	end;

end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog("[任务系统记录]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]"..strMain);
end;


function Task_Exit()

end;