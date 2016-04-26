-- 炼金活动 Npc对话
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc对话
function tbRefiningIron:NpcTalk()
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	local tbTaskSay = {"<dec><npc>活动期间，各位大侠可以到这升级精炼铁. 低等级的精炼铁可以通过风陵渡和战士服等活动得到，也可以到奇珍阁购买. 配成一对低等级的铁可以得到1块较高等级的精炼铁 ",};
	
	for i = 2,9 do
		tinsert(tbTaskSay, format("我想炼 %d级精炼铁 /#tbRefiningIron:UpdataIron(%d)", i, i));
	end
	
	tinsert(tbTaskSay, "取消/Cancel");
	CreateTaskSay(tbTaskSay);
end

-- 升级铁
function tbRefiningIron:UpdataIron(nLevel)
	
	-- 未举行
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	-- Bug
	if nLevel <= 1 or nLevel > 10 then
		return
	end	
	
	-- 背包空间
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"请整理背包!",  "可以了./Cancel",});
		return 
	end	
		
	-- 原料不足
	if CalcItemCount(3, 6, 1, 2293, nLevel - 1) < 2 then
		CreateTaskSay({format("<dec><npc>请准备2块 %d级的精炼铁!",nLevel - 1),  "可以了./Cancel",});
		return
	end
	
	-- 扣除失败
	if ConsumeItem(3, 2, 6, 1, 2293, nLevel - 1) ~= 1 then
		Msg2Player("扣除精炼铁失败");
		return
	end
	
	-- 合成失败
	if random(1, 100) > self.tbUpdataRate[nLevel] then
		local tbAwardItem = 
		{
			szName="精炼铁", 
			tbProp={6,1, 2293, nLevel - 1,0,0},
			nCount = 1,
			nExpiredTime=self.nCloseDate,
		};
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "精炼铁合成失败，退回精炼铁.");
		CreateTaskSay({"<dec><npc>真可惜，炼铁失败! 我想下次会成功的!",  "可以了./Cancel",});
		return	
	end
	
	-- 合成成功
	local tbAwardItem = 
	{
		szName="精炼铁", 
		tbProp={6,1, 2293, nLevel,0,0},
		nCount = 1,
		nExpiredTime=self.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "合成精炼铁");
	
	-- 高品质提示
	if nLevel >= 7 then
		local szmsg = format("恭喜高手 %s 已经得到 %d级精炼铁. 希望你有更多的幸运!", GetName(), nLevel);
		local _, nTongId = GetTongName(); 
		if nTongId ~= 0 then
			Msg2Tong(nTongId, szmsg);
		end
		Msg2SubWorld(szmsg);
	end
	
end
