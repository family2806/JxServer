-- 炼金活动 精炼铁
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("因为摆放时间久了含金盒坏了");
		return 0;
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if nLevel <= 1 or nLevel > 10 then
		return 1;
	end	
	
	if CalcFreeItemCellCount() < 2 then
		CreateTaskSay({"请整理背包!",  "可以了./Cancel",});
		return 1;
	end
	
	-- 判断任务变量
	if tbRefiningIron.tbTaskGroup:GetTask(tbRefiningIron.tbTaskLimit[nLevel][1]) >= tbRefiningIron.tbTaskLimit[nLevel][2] then
		CreateTaskSay({"已经超过了允许使用的数量!",  "可以了./Cancel",});
		return 1;
	end
	tbRefiningIron.tbTaskGroup:AddTask(tbRefiningIron.tbTaskLimit[nLevel][1], 1);

	-- 发奖品
	tbAwardTemplet:GiveAwardByList(tbRefiningIron.tbAward[nLevel], "祝贺越南解放活动，使用精炼铁");
	return 0;
end
