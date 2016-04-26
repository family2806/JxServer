-- 凯旋鼓
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\drum_npc.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\global\\judgeoffline_limit.lua");
IncludeLib("TONG");

function main(nItemIndex)
	return tbTriumphDrum:OnUse(nItemIndex);
end

-- 使用
function tbTriumphDrum:OnUse(nItemIndex)
	
	-- 活动结束
	if tbTriumphDrum:IsCarryOn() ~= 1 then
		Msg2Player("因为摆放时间过长所以凯旋鼓坏了");
		return 0;
	end
	
	-- 等级不够
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"各位的等级不够！",  "可以了./Cancel",});
		return 1;
	end 
	
	-- 没有帮会
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		CreateTaskSay({"各位还未加入帮会!",  "可以了./Cancel",});
		return 1;
	end
	
	-- 没有职位
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		CreateTaskSay({"大侠不是帮主或者长老!",  "可以了./Cancel",});
		return 1;
	end
	
	-- 战斗状态
	if GetFightState() == 1 then
		CreateTaskSay({"请在非战斗区使用!",  "可以了./Cancel",});
		return 1;
	end
	
	-- 限制区域
	if offlineCheckPermitRegion() ~= 1 then
		CreateTaskSay({"请在人少的地区使用!",  "可以了./Cancel",});
		return 1;
	end	
	
	-- 非使用时间
	local nTime = tonumber(GetLocalDate("%H%M"));
	if nTime < self.nStartTime or nTime > self.nCloseTime then
		CreateTaskSay({"请在活动时间使用!",  "可以了./Cancel",});
		return 1;
	end
	
	-- 本帮今天使用过
	local nTask_LastUseDay = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay);
	local nTask_BeUsed = TONG_GetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed);
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	
	if nCurDay ~= nTask_LastUseDay then 
		nTask_LastUseDay = nCurDay;
		nTask_BeUsed = 0;
	end
	
	if nTask_BeUsed >= self.nLimit_DayUse then
		CreateTaskSay({"已经过了允许使用的界限",  "可以了./Cancel",});
		return 1;		
	end
	
	nTask_BeUsed = nTask_BeUsed + 1;
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_LastUseDay, nTask_LastUseDay);
	TONG_ApplySetTaskValue(nTongId, TONGTSK_TriumphDrum_BeUsed, nTask_BeUsed);
	
	-- 出现鼓
	tbDrumNpc:New(szTongName, nTongId);
	return 0;
end
