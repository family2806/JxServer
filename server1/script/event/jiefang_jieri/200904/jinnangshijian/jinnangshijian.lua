Include("\\script\\lib\\awardtemplet.lua");

function jf0904_getjinnangshijian()
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jinnangsj) >= 1) then
		Say("���Ѿ���ȡ�˽����¼�.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("���: �����ռ䲻�������������λ������1��!", 0);
		return
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("�����ļ��𲻹�50������δ��ֵ����޷���ȡ�����¼�.", 0);
		return
	end
	
	local nIndex = AddItem(6, 1, 1833, 1, 0, 0);
	ITEM_SetExpiredTime(nIndex, jf0904_item_expiredtime);
	SyncItem(nIndex);
	Say("���: ����ȡ!", 0);
	SetTask(jf0904_TSK_jinnangsj, 1);
end