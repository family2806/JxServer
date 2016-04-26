-- 奇珍阁打包物品
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
IncludeLib("ITEM")
function main(nItemIndex)

	local G,D,P,nLevel = GetItemProp(nItemIndex);
--	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex);
--	local nLeftTime = nExPiredTime - GetCurServerTime();
--	if nExPiredTime ~= 0 and nLeftTime <= 60 then
--		Msg2Player("物品已过使用期")
--		return 0;
--	end
--	nLeftTime = floor((nLeftTime)/60);
	
	if (G ~= 6) then
		return 1;
	end
	
	if CalcFreeItemCellCount() < 6 then
		CreateTaskSay({"请安排一下装备，记得留下6个以上空位",  "可以了./Cancel",});
		return 1;
	end
	
	-- 岳王剑
	if P == 2340 then
		local tbAwardItem = {tbProp={4,195,1,1,0,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return 0;
	end	
	
	-- 血战令旗
	if P == 2401 then
		local tbAwardItem = {tbProp={6,1,2212,1,0,0},nExpiredTime=nLeftTime,}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return 0;
	end	
	
	
	-- 杀手锏 节日礼服
	if P == 2335 or P == 2336 or P == 2337 or P == 2338 or P == 2339 then
		SelectSeries(P)
		return 1;
	end
	
	-- 奔宵
	if P == 2333 then
		local tbAwardItem = {tbProp={0,10,6,1,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return 0;
	end

	-- 飞云
	if P == 2396 then
		local tbAwardItem = {tbProp={0,10,8,1,5,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return 0;
	end
end
	
-- 选择五行
function SelectSeries(nP)
	
	local tbTaskSay = {"<dec>请选择五行",
						format("金/#GetSeries(%d, %d)", nP, 0),
						format("木/#GetSeries(%d, %d)", nP, 1),
						format("水 /#GetSeries(%d, %d)", nP, 2),
						format("火/#GetSeries(%d, %d)", nP, 3),
						format("土/#GetSeries(%d, %d)", nP, 4),
					  };
					  
	CreateTaskSay(tbTaskSay);
end

function GetSeries(nP, nSeries)
	
	if ConsumeItem(3, 1, 6, 1, nP, 1) ~= 1 then
		Msg2Player("扣除道具失败")
		return
	end
	
	-- 清绝衣
	if nP == 2335 then
		local tbAwardItem = {tbProp={0,2,28,3,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return
	end	
	
	-- 冰晶裙
	if nP == 2336 then
		local tbAwardItem = {tbProp={0,2,28,6,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return
	end	
		
	-- 惊天甲
	if nP == 2337 then
		local tbAwardItem = {tbProp={0,2,28,2,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return
	end	
		
	-- 泣地裙
	if nP == 2338 then
		local tbAwardItem = {tbProp={0,2,28,5,nSeries,0}}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return
	end	
		
	-- 杀手锏
	if nP == 2339 then
		local tbAwardItem = {tbProp={6,1,400,90,nSeries,0}, nCount = 2}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "打开在奇珍阁买的物品");
		return
	end	
end
