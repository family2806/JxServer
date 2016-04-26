-- 凯旋鼓声 头文件
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc对话
function tbTriumphDrum:NpcTalk()
	
	if tbTriumphDrum:CheckCondition_BuyDrum() ~= 1 then
		CreateTaskSay({"各位没有权限买凯旋鼓!",  "可以了./Cancel",});
		return
	end
	
	if GetCash() < self.nLimit_Money then
		CreateTaskSay({"购买凯旋鼓需要304万两",  "可以了./Cancel",});
		return		
	end
	
	if Pay(self.nLimit_Money) ~= 1 then
		Msg2Player("扣除银两失败")
		return
	end
		
	local tbAwardItem = 
	{
		szName="凯旋鼓", 
		tbProp={6,1, 2309, 1,0,0},
		nCount = 1,
		nExpiredTime=60,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "购买凯旋鼓");
end
