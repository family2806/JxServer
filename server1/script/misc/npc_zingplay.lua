-- ��ZingPlay��ý�Ʒ
-- ��ȡ����NPC������ZingPlayʹ��

Include("\\script\\task\\system\\task_string.lua");	-- �Ի�����ͷ�ļ�

-- COMMON ���� --
ZingPlay_Start_Date	= 20081018;		-- ���ʼʱ��
ZingPlay_End_Date	= 20081102;		-- ��ȡ����

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {"<dec><npc>��18-10-2008 �� 31-10-2008, �μ�zingplay��Ϸ������������ʿ������������Ҫ��ʱ��ȥzingplay��ҳ�ο�����������zingplayʹ����ȡzingplay����������콱ʱ�䵽 02-11-2008Ϊֹ."};
	
	if (n_date >= ZingPlay_Start_Date and n_date <= ZingPlay_End_Date) then
		tinsert(tb_Msg, "������zingplay���./take_zingplay_bag");
	end
	
	tinsert(tb_Msg, "�����Ի�/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end

function take_zingplay_bag()
	local ext_pointid = 4;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>���²�����ȡ�˴ν���.", "�����Ի�/OnCancel"});
		return 0;
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,1826,1,1,0);
	local szMsg = format("��� 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end
