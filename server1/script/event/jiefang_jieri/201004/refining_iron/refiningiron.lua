-- ���� ������
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("��Ϊ�ڷ�ʱ����˺���л���");
		return 0;
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if nLevel <= 1 or nLevel > 10 then
		return 1;
	end	
	
	if CalcFreeItemCellCount() < 2 then
		CreateTaskSay({"��������!",  "������./Cancel",});
		return 1;
	end
	
	-- �ж��������
	if tbRefiningIron.tbTaskGroup:GetTask(tbRefiningIron.tbTaskLimit[nLevel][1]) >= tbRefiningIron.tbTaskLimit[nLevel][2] then
		CreateTaskSay({"�Ѿ�����������ʹ�õ�����!",  "������./Cancel",});
		return 1;
	end
	tbRefiningIron.tbTaskGroup:AddTask(tbRefiningIron.tbTaskLimit[nLevel][1], 1);

	-- ����Ʒ
	tbAwardTemplet:GiveAwardByList(tbRefiningIron.tbAward[nLevel], "ף��Խ�Ͻ�Ż��ʹ�þ�����");
	return 0;
end
