-- ���� �����
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("��Ϊʱ��ž������Ժ���л���");
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"����������Ҫ1����λ��",  "������./Cancel",});
		return 1;
	end
	
	local tbAwardItem = 
	{
		szName="������", 
		tbProp={6,1, 2293, 1,0,0},
		nCount = 8,
		nExpiredTime=tbRefiningIron.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "ʹ�ú����");
	return 0;
end
