-- Ѱ���� �ƽ���
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main(nItemIndex)
	return tbBeatTiger:OnUse(nItemIndex);
end

-- ʹ��
function tbBeatTiger:OnUse(nItemIndex)
	
	-- �����
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if  nDate >= self.nFlowerDisappearDate then
		Msg2Player("����������Ϊ����ʱ��̫��");
		return 0;
	end
	
	-- �ȼ�����
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"��λ�ĵȼ�����!",  "����!/Cancel",});
		return 1;
	end 
	
	-- û�г�ֵ
	if GetExtPoint(0) <= 0  then
		CreateTaskSay({"ֻ�г�ֵ��Ҳſ���ʹ��!",  "����!/Cancel",});
		return 1;	
	end
	
	-- ����ʹ������
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"�����׼��ľ�����ȡ����",  "����!/Cancel",});
		return 1;		
	end
	
	nUseCount = nUseCount + 1;
	self.tbTaskGroup:SetTask(self.nTaskID_UseCount, nUseCount);
	
	-- ���ž���
	local tbAwardItem = {nExp = self.nLimit_ExpAward};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "ʹ�ø�����");
	return 0;
end
