-- ���� Npc�Ի�
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc�Ի�
function tbRefiningIron:NpcTalk()
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	local tbTaskSay = {"<dec><npc>��ڼ䣬��λ�������Ե�������������. �͵ȼ��ľ���������ͨ������ɺ�սʿ���Ȼ�õ���Ҳ���Ե��������. ���һ�Ե͵ȼ��������Եõ�1��ϸߵȼ��ľ����� ",};
	
	for i = 2,9 do
		tinsert(tbTaskSay, format("������ %d�������� /#tbRefiningIron:UpdataIron(%d)", i, i));
	end
	
	tinsert(tbTaskSay, "ȡ��/Cancel");
	CreateTaskSay(tbTaskSay);
end

-- ������
function tbRefiningIron:UpdataIron(nLevel)
	
	-- δ����
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	-- Bug
	if nLevel <= 1 or nLevel > 10 then
		return
	end	
	
	-- �����ռ�
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"��������!",  "������./Cancel",});
		return 
	end	
		
	-- ԭ�ϲ���
	if CalcItemCount(3, 6, 1, 2293, nLevel - 1) < 2 then
		CreateTaskSay({format("<dec><npc>��׼��2�� %d���ľ�����!",nLevel - 1),  "������./Cancel",});
		return
	end
	
	-- �۳�ʧ��
	if ConsumeItem(3, 2, 6, 1, 2293, nLevel - 1) ~= 1 then
		Msg2Player("�۳�������ʧ��");
		return
	end
	
	-- �ϳ�ʧ��
	if random(1, 100) > self.tbUpdataRate[nLevel] then
		local tbAwardItem = 
		{
			szName="������", 
			tbProp={6,1, 2293, nLevel - 1,0,0},
			nCount = 1,
			nExpiredTime=self.nCloseDate,
		};
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "�������ϳ�ʧ�ܣ��˻ؾ�����.");
		CreateTaskSay({"<dec><npc>���ϧ������ʧ��! �����´λ�ɹ���!",  "������./Cancel",});
		return	
	end
	
	-- �ϳɳɹ�
	local tbAwardItem = 
	{
		szName="������", 
		tbProp={6,1, 2293, nLevel,0,0},
		nCount = 1,
		nExpiredTime=self.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "�ϳɾ�����");
	
	-- ��Ʒ����ʾ
	if nLevel >= 7 then
		local szmsg = format("��ϲ���� %s �Ѿ��õ� %d��������. ϣ�����и��������!", GetName(), nLevel);
		local _, nTongId = GetTongName(); 
		if nTongId ~= 0 then
			Msg2Tong(nTongId, szmsg);
		end
		Msg2SubWorld(szmsg);
	end
	
end
