IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\task\\system\\task_string.lua")

function main()
	GiveItemUI("�ް׽�װ��", "����Ҫ�޵İ׽�װ����ȥ", "repair_platina", "OnCancel", 1);
	return 1;
end

function repair_platina(nCount)

	if nCount ~= 1 then
		CreateTaskSay({"������Ʒ����������Ҫ��", "���ǶԲ����ҽ����°���/main", "���ǲ�����˼�����Ժ����./onCancel"});
		return
	end
	
	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);			--Ʒ��
	
	if (nQuality ~= 4) then
		CreateTaskSay({"�����Ҫ�޵İ׽�װ��.", "���ǶԲ����ҽ����°���/main", "���ǲ�����˼�����Ժ����./onCancel"});
		return
	end

	
	if (GetPlatinaLevel(nItemIndex) < 6) then
		CreateTaskSay({"ֻ����+6���ϵİ׽�װ��.", "���ǶԲ����ҽ����°���/main", "���ǲ�����˼�����Ժ����./onCancel"});
		return
	end
	
	if (GetCurDurability(nItemIndex) == GetMaxDurability(nItemIndex)) then
		CreateTaskSay({"��װ���������Ľ�ʵ���ˣ�����Ҫ������", "���ǶԲ����ҽ����°���/main", "���ǲ�����˼�����Ժ����./onCancel"});
		return
	end
		
	if (ConsumeItem(3, 1, 6, 1, 2163, 1) ~= 1) then	-- ɾ�������е���Ѫ��
		WriteLog("[��Ѫ���޸�Ŀǰ�Ľ�ʵ��]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\ɾ����Ѫ��ʧ��");
		return
	end
	
	Msg2Player("�޸ĳɹ�!");
	
	SetCurDurability(nItemIndex, GetMaxDurability(nItemIndex));
end