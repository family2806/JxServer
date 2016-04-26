-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - JxWeb��ͨʹ��
-- �ļ�������npc_jxweb.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-04-13 15:24:37

-- ======================================================
IncludeLib("ITEM");
Include("\\script\\event\\other\\jxweb_npc\\jxweb_head.lua");		-- ͷ�ļ�

function main()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local tb_Msg = {};
	
	if (n_date >= JxWeb_Start_Date and n_date <= JxWeb_End_Date) then
		tb_Msg = {"<dec><npc>".."����������JX Web��Open Beta�����λ�����Ͽ���뵽JX Web����������ȡ�ܶ������˵Ľ�����."};
		tinsert(tb_Msg, "�������ֻ/jxweb_take_bag_1");
		tinsert(tb_Msg, "����TOP�����/jxweb_other_dec");
	else
		jxweb_other_dec()
		return 0;
	end
	
	tinsert(tb_Msg, "�����Ի�/OnCancel");
	
	CreateTaskSay(tb_Msg);
end

function OnCancel()
end


function jxweb_take_bag_1()
	CreateTaskSay({"<dec><npc>".."{{��������}�:��01-05-2009��24:00 22-05-2009. �ڴ��ڼ䣬֮ǰһ�����1���ռ��������ڵڶ����10h-24h������ȡ{{���ĵ�}}.", 
					format("�õ�%s/jxweb_take_bag_2", "���ĵ�"), 
					"�����Ի�/OnCancel"});
end

function jxweb_take_bag_2()
	local ext_pointid = 5;
	local ext_value = GetExtPoint(ext_pointid);
	
	if (ext_value ~= 1) then
		CreateTaskSay({"<dec><npc>��λ��β����콱.", "�����Ի�/OnCancel"});
		return 0;
	end
	
	if (CalcFreeItemCellCount() < 2) then
		Talk(1, "", "����Ҫ��2����λ.");
		return
	end
	
	PayExtPoint(ext_pointid, 1);
	
	local nIdx = AddItem(6,1,2023,1,1,0);
	ITEM_SetExpiredTime(nIdx, JxWeb_Item_Expire_Date);
	SyncItem(nIdx);
	SetItemBindState(nIdx, -2);
	
	local szMsg = format("�ռ��� 1 %s",GetItemName(nIdx))
	
	Msg2Player(szMsg);
	CreateTaskSay({"<dec><npc>"..szMsg, "��лʦ�� ".."/OnCancel"});
	
	WriteLog(format("%s\tName:%s\tAccount:%s\t%s",
			GetLocalDate("%Y-%m-%d_%X"),
			GetName(),
			GetAccount(),
			szMsg	));
end


function jxweb_other_dec()
	CreateTaskSay({"<dec><npc>".."{{���ٵ�TOP����}}�:��01-05-2009��24:00 22-05-2009. ���ٵ���ߵ�ǰ10��������ȡ���˵Ľ�Ʒ.", 
					"�����Ի�/OnCancel"});
end
