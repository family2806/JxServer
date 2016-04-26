-- �������� ͷ�ļ�
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc�Ի�
function tbTriumphDrum:NpcTalk()
	
	if tbTriumphDrum:CheckCondition_BuyDrum() ~= 1 then
		CreateTaskSay({"��λû��Ȩ��������!",  "������./Cancel",});
		return
	end
	
	if GetCash() < self.nLimit_Money then
		CreateTaskSay({"����������Ҫ304����",  "������./Cancel",});
		return		
	end
	
	if Pay(self.nLimit_Money) ~= 1 then
		Msg2Player("�۳�����ʧ��")
		return
	end
		
	local tbAwardItem = 
	{
		szName="������", 
		tbProp={6,1, 2309, 1,0,0},
		nCount = 1,
		nExpiredTime=60,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "��������");
end
