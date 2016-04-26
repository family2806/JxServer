-- Ѱ���� ����
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main()
	return tbBeatTiger:NpcTalk();
end

-- Npc�Ի�
function tbBeatTiger:NpcTalk()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end

	local tbTaskSay = {format("<dec><npc>��ڼ䣬��λ����ֻ�������ߵ�Ѫɫ�ϻ������� %d�����ҵ��ҾͿ��Եõ�1֦������, �˻ÿ���������, ÿ�����ÿ��ֻ�ܲ���1��.", self.nLimit_AwardTime),};
	tinsert(tbTaskSay, "�õ�������/#tbBeatTiger:Award()");
	tinsert(tbTaskSay, "����!/Cancel");
	CreateTaskSay(tbTaskSay);
end

-- ��ȡ�ƽ���
function tbBeatTiger:Award()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end
	
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"<dec><npc>��λ�Ѿ���ȡ�ľ����Ѵ����ֵ����������ȡ��",  "������./Cancel",});
		return 	
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		CreateTaskSay({"<dec><npc>�����ǲ����콱��",  "������./Cancel",});
		return
	end	

	local tbPlayerInfo = self.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	if tbPlayerInfo == nil then
		CreateTaskSay({"<dec><npc>��λ��δ���ɱѪ�ϻ�","������./Cancel",});
		return	
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate == tbPlayerInfo.nAwardDate then
		CreateTaskSay({"<dec><npc>��λ�Ѿ���ȡ�˲�Ľ���",  "������./Cancel",});
		return 			
	end
	
	local nCurTime = GetCurServerTime();
	local nFieldStartTime = self.nValue_tbPlayerInfo[nFieldId].nStartTime;
	local nFieldCloseTime = self.nValue_tbPlayerInfo[nFieldId].nCloseTime;
	local nFieldMaxTime = ((floor(nFieldCloseTime/100) - floor(nFieldStartTime/100) - 1)*60 + mod(nFieldCloseTime, 100) + (60 - mod(nFieldStartTime, 100)) ) * 60;
	
	if nCurTime - tbPlayerInfo.nkillTime > nFieldMaxTime then
		CreateTaskSay({"<dec><npc>��λ�����������ɱѪ�ϻ���",  "������./Cancel",});
		return			
	end	
	
	if nCurTime - tbPlayerInfo.nkillTime > self.nLimit_AwardTime then
		CreateTaskSay({"<dec><npc>�Ѿ������콱ʱ�䣬���������ϻ�","������./Cancel",});
		return			
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"��������!",  "������./Cancel",});
		return 
	end	
	
	-- ���Ž���
	tbPlayerInfo.nAwardDate = nDate;
	
	local tbAwardItem = 
	{
		szName="������", 
		tbProp={6,1, 2310, 1,0,0},
		nCount = 1,
		nExpiredTime=self.nFlowerDisappearDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "���Ÿ�����");
end
