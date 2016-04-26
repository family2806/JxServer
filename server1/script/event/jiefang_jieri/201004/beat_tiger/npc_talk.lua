-- 寻花打虎 留香
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main()
	return tbBeatTiger:NpcTalk();
end

-- Npc对话
function tbBeatTiger:NpcTalk()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end

	local tbTaskSay = {format("<dec><npc>活动期间，诸位大侠只须打倒我身边的血色老虎并且在 %d秒来找到我就可以得到1枝干莲花, 此活动每天进行两场, 每个玩家每场只能参与1次.", self.nLimit_AwardTime),};
	tinsert(tbTaskSay, "得到干莲花/#tbBeatTiger:Award()");
	tinsert(tbTaskSay, "可以!/Cancel");
	CreateTaskSay(tbTaskSay);
end

-- 领取黄金莲
function tbBeatTiger:Award()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end
	
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"<dec><npc>各位已经领取的经验已达最高值，不能再领取了",  "可以了./Cancel",});
		return 	
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		CreateTaskSay({"<dec><npc>请在那层活动中领奖励",  "可以了./Cancel",});
		return
	end	

	local tbPlayerInfo = self.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	if tbPlayerInfo == nil then
		CreateTaskSay({"<dec><npc>各位还未打败杀血老虎","可以了./Cancel",});
		return	
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate == tbPlayerInfo.nAwardDate then
		CreateTaskSay({"<dec><npc>各位已经领取此层的奖励",  "可以了./Cancel",});
		return 			
	end
	
	local nCurTime = GetCurServerTime();
	local nFieldStartTime = self.nValue_tbPlayerInfo[nFieldId].nStartTime;
	local nFieldCloseTime = self.nValue_tbPlayerInfo[nFieldId].nCloseTime;
	local nFieldMaxTime = ((floor(nFieldCloseTime/100) - floor(nFieldStartTime/100) - 1)*60 + mod(nFieldCloseTime, 100) + (60 - mod(nFieldStartTime, 100)) ) * 60;
	
	if nCurTime - tbPlayerInfo.nkillTime > nFieldMaxTime then
		CreateTaskSay({"<dec><npc>各位不是在这层打败杀血老虎的",  "可以了./Cancel",});
		return			
	end	
	
	if nCurTime - tbPlayerInfo.nkillTime > self.nLimit_AwardTime then
		CreateTaskSay({"<dec><npc>已经过了领奖时间，请继续打白老虎","可以了./Cancel",});
		return			
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"请整理背包!",  "可以了./Cancel",});
		return 
	end	
	
	-- 发放奖励
	tbPlayerInfo.nAwardDate = nDate;
	
	local tbAwardItem = 
	{
		szName="干莲花", 
		tbProp={6,1, 2310, 1,0,0},
		nCount = 1,
		nExpiredTime=self.nFlowerDisappearDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "发放干莲花");
end
