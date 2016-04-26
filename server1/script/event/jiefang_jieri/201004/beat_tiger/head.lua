-- 寻花打虎 头文件
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")

function OnTime()
	return tbBeatTiger:OnTime();
end

tbBeatTiger = 
{
	nStartDate = 20100426,				-- 开始日期（前包）
	nCloseDate = 20100531, 				-- 结束日期（后闭）
	nFlowerDisappearDate = 20100607,	-- 莲花消失日期（不含）
	
	nTaskGroupId = 9,					-- 任务变量组
	nCurrentVersion = 1,				-- 版本号
	nTaskID_UseCount = 1,				-- 任务变量:使用黄金莲次数
	
	nLimit_Level = 50,					-- 等级限制
	nLimit_UseCount = 70,				-- 黄金莲使用次数限制
	nLimit_ExpAward = 20000000,			-- 经验奖励
	nLimit_AwardTime = 300,				-- 领奖时间限制
	
	nNpc_Talk_ID = 309,					-- 留香模版ID
	nNpc_Talk_Pos = {37, 1576, 3255},	-- 留香位置
	nNpc_Tiger_ID = 1549,				-- 老虎ID
	nNpc_Tiger_Level = 90,				-- 老虎等级
	nNpc_Tiger_Pos = {37, 1570, 3269},	-- 老虎位置
	
	nValue_NpcIndex_Talk = nil,			-- 留香的NpcIndex
	nValue_NpcIndex_Tiger = nil,		-- 老虎的NpcIndex
	
	nValue_tbPlayerInfo = 				-- 玩家打虎情况
	{
		-- 第一场
		[1] = 
		{
			nStartTime =  801,
			nCloseTime = 1502,
			tbPlayer = {},
		},
		
		-- 第二场
		[2] = 
		{
			nStartTime = 1600,
			nCloseTime = 2400,
			tbPlayer = {},
		},
	},
}

tbBeatTiger.tbTaskGroup = TaskManager:Create(tbBeatTiger.nTaskGroupId, tbBeatTiger.nCurrentVersion);

-- 活动是否举行
function tbBeatTiger:IsCarryOn()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate < self.nStartDate or nDate >= self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- 获得活动场次
function tbBeatTiger:GetFieldId()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return 0;
	end
	
	local nTime = tonumber(GetLocalDate("%H%M"));
	for i = 1, getn(self.nValue_tbPlayerInfo) do
		if self.nValue_tbPlayerInfo[i].nStartTime < nTime and nTime < self.nValue_tbPlayerInfo[i].nCloseTime then
			return i;
		end
	end
	
	return 0;
end

-- 加载Npc
function tbBeatTiger:AddNpc()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end
	
	self.nValue_NpcIndex_Talk = AddNpc(self.nNpc_Talk_ID, 1, SubWorldID2Idx(self.nNpc_Talk_Pos[1]), self.nNpc_Talk_Pos[2]*32, self.nNpc_Talk_Pos[3]*32, 0, "留香");
	SetNpcScript(self.nValue_NpcIndex_Talk, "\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\npc_talk.lua");
	
	self.nValue_NpcIndex_Tiger = AddNpc(self.nNpc_Tiger_ID, self.nNpc_Tiger_Level, SubWorldID2Idx(self.nNpc_Tiger_Pos[1]), self.nNpc_Tiger_Pos[2]*32, self.nNpc_Tiger_Pos[3]*32, 0, "杀血老虎", 1);
	SetNpcDeathScript(self.nValue_NpcIndex_Tiger, "\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\npc_tiger.lua");
	
	-- 定时器设置为下个整点
	local nMin = tonumber(GetLocalDate("%M"));
	local nSec = tonumber(GetLocalDate("%S"));
	local nLastHour =  (60 - nMin - 1) * 60 + (60 - nSec) + 5*60;	-- 延后5分钟
	AddTimer(nLastHour * 18, "OnTime", 0);
end

-- 定时器
function tbBeatTiger:OnTime()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		
		if self.nValue_NpcIndex_Talk ~= nil then
			DelNpc(self.nValue_NpcIndex_Talk);
			self.nValue_NpcIndex_Talk = nil;
		end
		
		if self.nValue_NpcIndex_Tiger ~= nil then
			DelNpc(self.nValue_NpcIndex_Tiger);
			self.nValue_NpcIndex_Tiger = nil;
		end		

		return 0, 0;
	end
	
	return 60*60*18, 0;
end

