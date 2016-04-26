-- 逆天改命活动 头文件
Include("\\script\\task\\metempsychosis\\task_func.lua");

tbChangeDestiny = 
{
	bDeBug		= 0,							-- 是否DeBug版本
	nStartDate	= 20090828,						-- 活动开始日期
	nCloseDate	= 20091011, 					-- 活动结束日期
	nNpcResIdx	= 1446,							-- 活动NPC的模版ID
	
	nLimit_DayGive = 6,							-- 一天最多上交6个
	nLimit_TotalGive = 180,						-- 总共需要上交180个
	nLimit_AddSkill = 1,						-- 最大技能点的提升幅度
	nLimit_TransTimes = 1,						-- 第几次转生
	nLimit_TransLowerBound = 160,				-- 转生等级下界
	nLimit_TransUpperBound = 179,				-- 转生等级上界
	nLimit_NieShiChen = 1038,					-- 高级闯关聂弑尘的ID
	
	tbItem_ShenLongZhenDan = {6,1,2113},		-- 神农真丹
	tbItem_GaiMingJue = 	 {6,1,2114},		-- 逆天改命诀
	
	tbNpcPos = 
	{
		{11,  3134, 4985},						-- 成都
		{1,   1621, 3144},						-- 凤翔
		{37,  1817, 3084},						-- 汴京
		{176, 1495, 2971},						-- 临安
		{162, 1581, 3235},						-- 大理
		{78,  1519, 3214},						-- 襄阳
		{80,  1723, 2973},						-- 扬州
	},
	
	nStep_free = 0,								-- 空闲中
	nStep_accepted = 1,							-- 已经接受任务
	nStep_completed = 2,						-- 已经完成任务
	nStep_partiallyCompleted_1 = 3,
	nStep_partiallyCompleted_2 = 4,
	nStep_partiallyCompleted_3 = 5,

	
	nMissionID_Battle = 0,						-- 任务:宋金战场
	nMissionID_NieShiChen = 1,					-- 任务:聂弑尘
	nMissionID_WaterThief = 2,					-- 任务:水贼
	nMissionID_Killer = 3,						-- 任务:杀手
	
	tbMissionInfo = 
	{
		[0] = {3,	"在一场高级宋金中获得3000累积积分",				"您已领取在神农老者3000宋金累积积分的任务",	},
		[1] = {1,	"在高级过关任务中打败了聂弑尘",						"您已接受在神农老者打败聂弑尘的任务",			},
		[2] = {2,	"在风陵渡打败了水贼首领.",							"您已接受在神农老者打败水贼首领的任务.",		},
		[3] = {3,	"4次打败90级杀手的任务(在聂弒尘处领任务)",	"您已领取在神农老者打败4大杀手的任务",		},
	},
	
	nPlayerTask	= {2622, 2623, 2624, 2626, 2627, 2628},	-- 活动任务变量
	
	nTask_ZhenDan_GiveDate		= 1,			-- 上次上交真丹日期
	nTask_ZhenDan_GiveCount		= 2,			-- 上次上交真丹累积个数
	nTask_ZhenDan_TotalCount	= 3,			-- 总共上交真丹个数
	nTask_GaiMing_HasReceive	= 4,			-- 是否领取过改命诀
	nTask_GaiMing_HasUsed	 	= 5,			-- 是否使用过改命诀
	nTask_MissionStart			= 6,			-- 任务位开始记号
	nTask_Step_Battle			= 6,			-- 任务完成步骤（宋金战场）
	nTask_Date_Battle			= 7,			-- 任务完成日期（宋金战场）
	nTask_Step_NieShiChen		= 8,			-- 任务完成步骤（聂弑尘）
	nTask_Date_NieShiChen		= 9,			-- 任务完成日期（聂弑尘）
	nTask_Step_WaterThief 		= 10,			-- 任务完成步骤（水贼）
	nTask_Date_WaterThief		= 11,			-- 任务完成日期（水贼）
	nTask_Step_Killer			= 12,			-- 任务完成步骤（杀手）
	nTask_Date_Killer			= 13,			-- 任务完成日期（杀手）
	
	tbTask = 
	{
		{1, 0,  24},							-- nTask_ZhenDan_GiveDate
		{1, 24, 8 },							-- nTask_ZhenDan_GiveCount
		{2, 0,  16},							-- nTask_ZhenDan_TotalCount
		{2, 16, 8 },							-- nTask_GaiMing_HasReceive
		{2, 24, 8 },							-- nTask_GaiMing_HasUsed
		{3, 0, 	8 },							-- nTask_Step_Battle
		{3, 8, 	24},							-- nTask_Date_Battle
		{4, 0, 	8 },							-- nTask_Step_NieShiChen
		{4, 8, 	24},							-- nTask_Date_NieShiChen
		{5, 0,  8 },							-- nTask_Step_WaterThief
		{5, 8, 	24},							-- nTask_Date_WaterThief
		{6, 0,  8 },							-- nTask_Step_Killer
		{6, 8, 	24},							-- nTask_Date_Killer
	},
	-- 任务变量对照表 1:大任务变量值 2:开始的Bit位(0-31) 3:要设置的Bit数量(1-32)
}


-- 活动是否举行
function tbChangeDestiny:isCarryOn()
	
	if self.bDeBug == 1 then
		return 1;
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if nDate < self.nStartDate or nDate > self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- 玩家能否参与活动
function tbChangeDestiny:canJoin()
	
	if self.bDeBug == 1 then
		return 1;
	end
	
	if ST_IsTransLife() ~= 1 then
		return 0;
	end
	
	local nTransLevel = zhuansheng_get_gre(self.nLimit_TransTimes);
	if nTransLevel < self.nLimit_TransLowerBound or nTransLevel > self.nLimit_TransUpperBound then
		return 0;
	end
	
	return 1;
end

-- 设置任务变量
function tbChangeDestiny:setTask(nTaskIdx, nValue)
	local tbTaskInfo = self.tbTask[nTaskIdx];
	return SetBitTask(self.nPlayerTask[tbTaskInfo[1]], tbTaskInfo[2], tbTaskInfo[3], nValue)
end

-- 获取任务变量
function tbChangeDestiny:getTask(nTaskIdx)
	local tbTaskInfo = self.tbTask[nTaskIdx];
	return GetBitTask(self.nPlayerTask[tbTaskInfo[1]], tbTaskInfo[2], tbTaskInfo[3])	
end

-- 获取任务的相关信息
function tbChangeDestiny:getMissionInfo(nMissionID)
	
	local nMissionID_Step = self.nTask_MissionStart + nMissionID * 2;
	local nMissionID_Date = nMissionID_Step + 1;
	
	local nMissionStep = self:getTask(nMissionID_Step);
	local nMissionDate = self:getTask(nMissionID_Date);
	
	return nMissionStep, nMissionDate;
end

-- 设置任务的相关信息
function tbChangeDestiny:setMissionInfo(nMissionID, nMissionStep, nMissionDate)
	
	local nMissionID_Step = self.nTask_MissionStart + nMissionID * 2;
	local nMissionID_Date = nMissionID_Step + 1;
	
	self:setTask(nMissionID_Step, nMissionStep);
	self:setTask(nMissionID_Date, nMissionDate);
	
end