-- 炼金活动 含金盒
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("因为时间放久了所以含金盒坏了");
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"请整理背包！要1个空位！",  "可以了./Cancel",});
		return 1;
	end
	
	local tbAwardItem = 
	{
		szName="精炼钢", 
		tbProp={6,1, 2293, 1,0,0},
		nCount = 8,
		nExpiredTime=tbRefiningIron.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "使用含金盒");
	return 0;
end
