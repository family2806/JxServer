IncludeLib("ITEM")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\change_destiny\\head.lua");

function main()
	return tbChangeDestiny:talk()
end

function callBack_giveZhenDan_sure(nCount)
	return tbChangeDestiny:giveZhenDan_sure(nCount)
end


-- ����NPC
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

-- �������Ĳ�������
function tbChangeDestiny:checkBaseCondition()
	
--	if self:isCarryOn() ~= 1 then
--		CreateTaskSay({"<dec><npc>����������һ�����Ϸ���������������ˡ�", "�����ź��������϶�ౣ�ء�/Cancel"});
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		CreateTaskSay({"<dec><npc>�㹦���������, ���������еķ���������ô����������.", "ԭ����ˣ���л����ָ��/Cancle"});
		return 0;
	end
	
	return 1;
end

-- NPC�Ի�
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
		"<dec><npc>��������Ե, �Ϸ�Ͳ�������. ��֪��һ���������еķ���, ������Ȥ������<color=green>180<color> �� <color=green>��ũ�浤<color> �������Ϸ�. �ҽ�����ҵ��������. �Ϸ�ֻ���������, ��ӿ�Ų�", 
		"�����ҵ�һЩ��ũ�浤, ��������./#tbChangeDestiny:giveZhenDan()",
		"�������Ѽ����浤����?/#tbChangeDestiny:queryTotalCount()",
--		"������εõ���ũ�浤��/#tbChangeDestiny:zhenDanTask()",
		"�������������Ҫ��, ���Խ��Ҵ˷�������?/#tbChangeDestiny:awardGaiMingJue()",
		"������, �����Կ�./Cancel",
		});
end

-- �Ͻ���ũ�浤
function tbChangeDestiny:giveZhenDan()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>�����Ѱ��ҵ�Ҫ�������, �������Ѽ���ũ�浤��!", "������./Cancel"});
		return
	end
	
	if nGiveCount >= self.nLimit_DayGive then
		CreateTaskSay({format("<dec><npc>�����㽻������ %d ��ũ�浤, ������������.",self.nLimit_DayGive), "������./Cancel"});
		return 
	end
	
	GiveItemUI("�Ͻ���ũ�浤", format("ÿ��ֻ�Ͻ� %d ����ũ�浤, ���մ������Ͻ��� %d ��.", self.nLimit_DayGive, nGiveCount), "callBack_giveZhenDan_sure", "Cancel", 1);
end

-- ��ʵ�Ͻ���ũ�浤
function tbChangeDestiny:giveZhenDan_sure(nCount)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if nCount <= 0 then
		CreateTaskSay({"<dec><npc>��ˣ�Ұ����Ϸ�δ�������Ͻ��κ���Ʒ.","He he./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= self.tbItem_ShenLongZhenDan[1] or d ~= self.tbItem_ShenLongZhenDan[2] or p ~= self.tbItem_ShenLongZhenDan[3]) then
			CreateTaskSay({"<dec><npc>���������Ͻ�������Ʒ, ֻ����� <color=yellow> ��ũ�浤<color> �͹���.", "������./Cancel"});
			return 
		end
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	local nCanGive = self.nLimit_DayGive - nGiveCount;
	
	if nCount > nCanGive or nCanGive <= 0 then
		CreateTaskSay({format("<dec><npc>���մ���ֻ�ý����� %d ����ũ�浤�͹���, ����Ҫ�ٶ���.", nCanGive), "������./Cancel"});
		return 
	end
	
	local nCanGive_Total = self.nLimit_TotalGive - nTotalCount;
	
	if nCount > nCanGive_Total or nCanGive_Total <= 0 then
		CreateTaskSay({format("<dec><npc>���մ���ֻ�轻���� %d��ũ�浤�ʹﵽ���ҵ�Ҫ��, ����Ҫ����.", nCanGive_Total), "������./Cancel"});
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
	
	CreateTaskSay({format("<dec><npc>�������ѽ����� %d ����ũ�浤, �ܹ��� %d, ֻҪ������иŬ����ɺܿ�ɹ�.", nGiveCount, nTotalCount), "��һ�����./Cancel"});
end

-- ��ѯ�����˶�����ũ�浤
function tbChangeDestiny:queryTotalCount()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>��ϲ����, �Ѿ�������Ϸ��Ҫ��!", "�����? �治���װ�!/Cancel"});
		return
	else
		CreateTaskSay({format("<dec><npc>�������Ͻ����Ϸ� %d ��ũ�ɵ�, ֻ��Ŭ���㶨����Ը.", nTotalCount), "�һ�Ŭ����!/Cancel"});
		return
	end
	
end

-- �������������
function tbChangeDestiny:awardGaiMingJue()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nHasAward	  = self:getTask(self.nTask_GaiMing_HasReceive);
	
	if nTotalCount < self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>����Ҫ��ʵ, ������ƭ��.", "��ֻ�ǿ���Ц, ����!/Cancel"});
		return
	end
	
	if nHasAward ~= 0 then
		CreateTaskSay({"<dec><npc>�Ϸ�ƽ�������̰��֮�ĵ�С��, �ѵ��Ǳ�������?", "�Ϸ��ѵ����, ��֪����!/Cancel"});
		return
	end
	
	local free = FindFreeRoomByWH(1, 1)
	if (free ~= 1) then
		CreateTaskSay({"<dec><npc>�����ռ䲻��, ������֮���ٻ���.","������./Cancel"});
		return
	end
	
	local item = AddItem(self.tbItem_GaiMingJue[1],self.tbItem_GaiMingJue[2],self.tbItem_GaiMingJue[3],1,0,0)
	if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give GaiMingJue to %s", GetName()));
			CreateTaskSay({"<dec><npc>�Ҹо��е㲻��, ��˾�����ʱ���ܽ�������.", "Ϊʲô?/Cancel"});
			return
	else
--			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)

			self:setTask(self.nTask_GaiMing_HasReceive, 1);
			WriteLog(format("[ChangeDestiny]Give GaiMingJue to %s", GetName()))
			CreateTaskSay({"<dec><npc>������Ľ���! �ӽ�����Ҫ���������Ҫ�����ҵ�һƬ����.", "��лǰ��!/Cancel"});
			return
	end
end

-- ��ũ�浤����
function tbChangeDestiny:zhenDanTask()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>����������Ϸ��Ҫ��, �Ҳ�����Ҫ��ũ�浤��.", "������!/Cancel"});
		return
	end
	
	CreateTaskSay({
		"<dec><npc>�Ϸ������Ѹ�, ��Щ�����������������ˣ������ɷ�����Ϸ�����Ը������ũ�浤����Ϊл��.",
		"ǰ��������, �����Ҹ�����, ����˵�ɣ�/#tbChangeDestiny:zhenDanTask_accepte()",
		"ǰ�������������Ҷ������./#tbChangeDestiny:zhenDanTask_delivery()",
		"����������./Cancel",
		});
	
end

-- ��ũ�浤���� ��������
function tbChangeDestiny:zhenDanTask_accepte()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>������һЩ������Ҫ����Э��һ��.",
		format("����������ν�3000�ۻ����ֵ�����./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Battle),
		format("��������ܴ����s��������./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_NieShiChen),
		format("��������ܴ��ˮ��ͷ�������./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_WaterThief),
		format("��������ܴ���Ĵ�ɱ�ֵ�����./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Killer),
		"�е��������ѣ��ٸ�����һЩʱ��׼��./Cancel",
		});
end

-- ��ũ�浤���� �����������
function tbChangeDestiny:zhenDanTask_accepte_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����
	
	if nMissionStep ~= self.nStep_free then
		CreateTaskSay({format("<dec><npc>�����ѽ�������, ��Ŭ���������. ����������Ŀ���ǣ� <color=green>%s<color>, �Ѽ���<color=green>%d<color> ����ũ�浤!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "������./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>���մ������������, ����������!", "������./Cancel"});
		return
	end
	
	self:setMissionInfo(nMissionID, self.nStep_accepted , nMissionDate);
	CreateTaskSay({format("<dec><npc>����������Ŀ����:<color=green>%s<color>, �Ѽ���<color=green>%d<color> ��ũ�浤!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "����������!/Cancel"});
	Msg2Player(self.tbMissionInfo[nMissionID][3]);
end

-- ��ũ�浤���� ��������
function tbChangeDestiny:zhenDanTask_delivery()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>��������û������ʧ������������ĸ�����?",
		format("��������3000�ۻ����ֵ�����./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Battle),
		format("�������������߱�������������./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_NieShiChen),
		format("�����������ˮ��ͷ�������./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_WaterThief),
		format("������������Ĵ�ɱ�ֵ�����./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Killer),
		"�����Ǵ��ˣ�������ʱ��δ���./Cancel",
		});
end

-- ��ũ�浤���� ����������
function tbChangeDestiny:zhenDanTask_delivery_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����
	
	if nMissionStep ~= self.nStep_completed then
		CreateTaskSay({"<dec><npc>�����ϵ�����������������ƭ��", "��֪����./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>�������������������, ����������!", "������./Cancel"});
		return
	end
	
	local nFree = CalcFreeItemCellCount();
	local nAwardCount = self.tbMissionInfo[nMissionID][1];
	
	if (nFree < nAwardCount) then
		CreateTaskSay({"<dec><npc>�����ռ䲻��, ������֮���ٻ���.","������./Cancel"});
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
	CreateTaskSay({"<dec><npc>���Ǹ������Ľ���!", "��лǰ��!/Cancel"});
end