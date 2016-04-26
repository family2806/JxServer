-- 寻花打虎 黄金莲
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main(nItemIndex)
	return tbBeatTiger:OnUse(nItemIndex);
end

-- 使用
function tbBeatTiger:OnUse(nItemIndex)
	
	-- 活动结束
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if  nDate >= self.nFlowerDisappearDate then
		Msg2Player("莲花会变干因为存在时间太长");
		return 0;
	end
	
	-- 等级不够
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"各位的等级不够!",  "可以!/Cancel",});
		return 1;
	end 
	
	-- 没有充值
	if GetExtPoint(0) <= 0  then
		CreateTaskSay({"只有充值玩家才可以使用!",  "可以!/Cancel",});
		return 1;	
	end
	
	-- 超过使用限制
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"超过活动准许的经验领取界限",  "可以!/Cancel",});
		return 1;		
	end
	
	nUseCount = nUseCount + 1;
	self.tbTaskGroup:SetTask(self.nTaskID_UseCount, nUseCount);
	
	-- 发放经验
	local tbAwardItem = {nExp = self.nLimit_ExpAward};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "使用干莲花");
	return 0;
end
