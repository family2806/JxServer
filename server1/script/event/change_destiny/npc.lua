IncludeLib("ITEM")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\change_destiny\\head.lua");

function main()
	return tbChangeDestiny:talk()
end

function callBack_giveZhenDan_sure(nCount)
	return tbChangeDestiny:giveZhenDan_sure(nCount)
end


-- 加载NPC
function tbChangeDestiny:addNpc() 

--	if tonumber(GetLocalDate("%Y%m%d")) > self.nCloseDate then
--		 return 
--	end
	
	for i=1,getn(self.tbNpcPos) do
		npcindex = AddNpc(self.nNpcResIdx, 1, SubWorldID2Idx(self.tbNpcPos[i][1]), self.tbNpcPos[i][2] * 32, self.tbNpcPos[i][3] * 32);
		if npcindex > 0 then
			SetNpcScript(npcindex, "\\script\\event\\change_destiny\\npc.lua");
		end
	end
	
end

-- 检查基本的参与条件
function tbChangeDestiny:checkBaseCondition()
	
--	if self:isCarryOn() ~= 1 then
--		CreateTaskSay({"<dec><npc>大侠来晚了一步，老夫正打算回乡种田了。", "真是遗憾啊，您老多多保重。/Cancel"});
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		CreateTaskSay({"<dec><npc>你功力不够深厚, 此逆天修行的方法不是那么容易修炼的.", "原来如此，多谢高人指点/Cancle"});
		return 0;
	end
	
	return 1;
end

-- NPC对话
function tbChangeDestiny:talk() 
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if self.bDeBug == 1 then
		Msg2Player("*************************")
		Msg2Player(format("DayGiveCount:%d  DayGiveDate:%d", self:getTask(self.nTask_ZhenDan_GiveCount), self:getTask(self.nTask_ZhenDan_GiveDate)));
		Msg2Player(format("TotalGive:%d  Receive:%d  Used:%d", self:getTask(self.nTask_ZhenDan_TotalCount), self:getTask(self.nTask_GaiMing_HasReceive), self:getTask(self.nTask_GaiMing_HasUsed)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Battle, self:getMissionInfo(self.nMissionID_Battle)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_NieShiChen, self:getMissionInfo(self.nMissionID_NieShiChen)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_WaterThief, self:getMissionInfo(self.nMissionID_WaterThief)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Killer, self:getMissionInfo(self.nMissionID_Killer)));
		Msg2Player(" ")
	end
	
	CreateTaskSay({
		"<dec><npc>你与我有缘, 老夫就不瞒你了. 我知道一个逆天修行的方法, 你有兴趣帮我找<color=green>180<color> 粒 <color=green>神农真丹<color> 并交予老夫. 我将将此业传授于你. 老夫只在这个把月, 你加快脚步", 
		"我已找到一些神农真丹, 请您拿着./#tbChangeDestiny:giveZhenDan()",
		"请问我搜集的真丹够吗?/#tbChangeDestiny:queryTotalCount()",
--		"请问如何得到神农真丹？/#tbChangeDestiny:zhenDanTask()",
		"我已完成了您的要求, 可以教我此方法了吗?/#tbChangeDestiny:awardGaiMingJue()",
		"可以了, 我试试看./Cancel",
		});
end

-- 上交神农真丹
function tbChangeDestiny:giveZhenDan()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>大侠已按我的要求完成了, 不必再搜集神农真丹了!", "可以了./Cancel"});
		return
	end
	
	if nGiveCount >= self.nLimit_DayGive then
		CreateTaskSay({format("<dec><npc>今日你交予了我 %d 神农真丹, 等明天再来吧.",self.nLimit_DayGive), "可以了./Cancel"});
		return 
	end
	
	GiveItemUI("上交神农真丹", format("每天只上交 %d 粒神农真丹, 今日大侠已上交了 %d 粒.", self.nLimit_DayGive, nGiveCount), "callBack_giveZhenDan_sure", "Cancel", 1);
end

-- 核实上交神农真丹
function tbChangeDestiny:giveZhenDan_sure(nCount)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if nCount <= 0 then
		CreateTaskSay({"<dec><npc>你耍我啊，老夫并未看到你上交任何物品.","He he./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= self.tbItem_ShenLongZhenDan[1] or d ~= self.tbItem_ShenLongZhenDan[2] or p ~= self.tbItem_ShenLongZhenDan[3]) then
			CreateTaskSay({"<dec><npc>大侠无需上交其他物品, 只需给我 <color=yellow> 神农真丹<color> 就够了.", "可以了./Cancel"});
			return 
		end
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	local nCanGive = self.nLimit_DayGive - nGiveCount;
	
	if nCount > nCanGive or nCanGive <= 0 then
		CreateTaskSay({format("<dec><npc>今日大侠只用交给我 %d 粒神农真丹就够了, 不需要再多了.", nCanGive), "可以了./Cancel"});
		return 
	end
	
	local nCanGive_Total = self.nLimit_TotalGive - nTotalCount;
	
	if nCount > nCanGive_Total or nCanGive_Total <= 0 then
		CreateTaskSay({format("<dec><npc>今日大侠只需交给我 %d神农真丹就达到了我的要求, 不需要更多.", nCanGive_Total), "可以了./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;

	nGiveCount  = nGiveCount  + nCount;
	nTotalCount = nTotalCount + nCount;
	
	self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
	self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	self:setTask(self.nTask_ZhenDan_TotalCount, nTotalCount);
	
	local szMsg = format("[ChangeDestiny]GiveZhenDan: %s give %d ZhenDan On %d. Now the DayCount is %s and TotalCount is %s.",GetName(), nCount, nGiveDate, nGiveCount, nTotalCount);
	WriteLog(szMsg);
	
	CreateTaskSay({format("<dec><npc>今日你已交予我 %d 粒神农真丹, 总共有 %d, 只要大侠不懈努力便可很快成功.", nGiveCount, nTotalCount), "我一会回来./Cancel"});
end

-- 查询缴纳了多少神农真丹
function tbChangeDestiny:queryTotalCount()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>恭喜大侠, 已经完成了老夫的要求!", "真的吗? 真不容易啊!/Cancel"});
		return
	else
		CreateTaskSay({format("<dec><npc>大侠已上交给老夫 %d 神农仙丹, 只需努力便定能如愿.", nTotalCount), "我会努力的!/Cancel"});
		return
	end
	
end

-- 发放逆天改命诀
function tbChangeDestiny:awardGaiMingJue()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nHasAward	  = self:getTask(self.nTask_GaiMing_HasReceive);
	
	if nTotalCount < self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>做人要诚实, 不能欺骗我.", "我只是开玩笑, 别当真!/Cancel"});
		return
	end
	
	if nHasAward ~= 0 then
		CreateTaskSay({"<dec><npc>老夫平生最后有贪污之心的小人, 难道是被你拿了?", "老夫教训的是, 晚辈知错了!/Cancel"});
		return
	end
	
	local free = FindFreeRoomByWH(1, 1)
	if (free ~= 1) then
		CreateTaskSay({"<dec><npc>背包空间不够, 请整理之后再回来.","可以了./Cancel"});
		return
	end
	
	local item = AddItem(self.tbItem_GaiMingJue[1],self.tbItem_GaiMingJue[2],self.tbItem_GaiMingJue[3],1,0,0)
	if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give GaiMingJue to %s", GetName()));
			CreateTaskSay({"<dec><npc>我感觉有点不妥, 如此绝物暂时不能交给别人.", "为什么?/Cancel"});
			return
	else
--			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)

			self:setTask(self.nTask_GaiMing_HasReceive, 1);
			WriteLog(format("[ChangeDestiny]Give GaiMingJue to %s", GetName()))
			CreateTaskSay({"<dec><npc>这是你的奖励! 从今往后要多加练功不要辜负我的一片苦心.", "多谢前辈!/Cancel"});
			return
	end
end

-- 神农真丹任务
function tbChangeDestiny:zhenDanTask()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>大侠已完成老夫的要求, 我不再需要神农真丹了.", "明白了!/Cancel"});
		return
	end
	
	CreateTaskSay({
		"<dec><npc>老夫年事已高, 有些想做的事情做不到了，大侠可否帮助老夫，如你愿意这神农真丹就作为谢礼.",
		"前辈严重了, 这是我该做的, 请您说吧！/#tbChangeDestiny:zhenDanTask_accepte()",
		"前辈交给的事情我都完成了./#tbChangeDestiny:zhenDanTask_delivery()",
		"在下明白了./Cancel",
		});
	
end

-- 神农真丹任务 接受任务
function tbChangeDestiny:zhenDanTask_accepte()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>我这有一些任务需要大侠协助一番.",
		format("大侠想接受宋金3000累积积分的任务./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Battle),
		format("大侠想接受打败聂弒尘的任务./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_NieShiChen),
		format("大侠想接受打败水贼头领的任务./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_WaterThief),
		format("大侠想接受打败四大杀手的任务./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Killer),
		"有的任务稍难，再给大侠一些时间准备./Cancel",
		});
end

-- 神农真丹任务 处理接受申请
function tbChangeDestiny:zhenDanTask_accepte_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期
	
	if nMissionStep ~= self.nStep_free then
		CreateTaskSay({format("<dec><npc>大侠已接受任务, 请努力完成任务. 大侠的任务目标是： <color=green>%s<color>, 搜集完<color=green>%d<color> 粒神农真丹!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "可以了./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>今日大侠已完成任务, 明天再来吧!", "可以了./Cancel"});
		return
	end
	
	self:setMissionInfo(nMissionID, self.nStep_accepted , nMissionDate);
	CreateTaskSay({format("<dec><npc>大侠的任务目标是:<color=green>%s<color>, 搜集完<color=green>%d<color> 神农真丹!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "我立即出发!/Cancel"});
	Msg2Player(self.tbMissionInfo[nMissionID][3]);
end

-- 神农真丹任务 交付任务
function tbChangeDestiny:zhenDanTask_delivery()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>大侠果真没有让我失望，你完成了哪个任务?",
		format("在下来交3000累积积分的任务./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Battle),
		format("在下来交打败聂弑尘的任务的任务./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_NieShiChen),
		format("在下来交打败水贼头领的任务./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_WaterThief),
		format("在下来交打败四大杀手的任务./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Killer),
		"大侠记错了，任务暂时还未完成./Cancel",
		});
end

-- 神农真丹任务 处理交付申请
function tbChangeDestiny:zhenDanTask_delivery_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- 当前日期
	
	if nMissionStep ~= self.nStep_completed then
		CreateTaskSay({"<dec><npc>我虽老但不健忘，你休想欺骗我", "晚辈知错了./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>大侠今日已完成了任务, 明日再来吧!", "可以了./Cancel"});
		return
	end
	
	local nFree = CalcFreeItemCellCount();
	local nAwardCount = self.tbMissionInfo[nMissionID][1];
	
	if (nFree < nAwardCount) then
		CreateTaskSay({"<dec><npc>背包空间不够, 请整理之后再回来.","可以了./Cancel"});
		return
	end
	
	for i=1,nAwardCount do
		local item = AddItem(self.tbItem_ShenLongZhenDan[1],self.tbItem_ShenLongZhenDan[2],self.tbItem_ShenLongZhenDan[3],1,0,0);
		if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give ShenLongZhenDan to %s", GetName()));
		else
			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)
			WriteLog(format("[ChangeDestiny]Give ShenLongZhenDan to %s", GetName()))
		end
	end
	 
	self:setMissionInfo(nMissionID, self.nStep_free , nDate);
	CreateTaskSay({"<dec><npc>这是给大侠的奖励!", "多谢前辈!/Cancel"});
end