Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============ʦͽ˫�����������===============

if (not tmp_process_data) then
	return
end

--ȫ��ʦͽ˫�����������
WLLS_DATA = {
	
	name = "ʦͽ˫����",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10221,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10222,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--���н���������
			{1, 5000},	--��1��
			{2, 4000},	--��2��
			{3, 3500},	--��3��
			{4, 3000},	--��4��
			{8, 2000},	--��5-8��
			{16, 1500},	--��9-16��
			{32, 1000},	--��17-32��
			{64, 500},	--��33-64��
			{128, 250},	--��65-128��
		}, {	--����
			{1, 10000},	--��1��
			{2, 8000},	--��2��
			{3, 7000},	--��3��
			{4, 6000},	--��4��
			{8, 4000},	--��5-8��
			{16, 3000},	--��9-16��
			{32, 2000},	--��17-32��
			{64, 1000},	--��33-64��
			{128, 500},	--��65-128��
		}
	},
	
	max_member = 2,	--ÿ��ս�ӵ��������
	
	--�������֣���Ҫ�İ���������normal.lua�У�����ֻд����Ĳ��֣�
	help_msg = {
		["����������������"]	=
			{
				"    ��������Ϊ <color=red>ʦͽ˫����<color>. ���ȥ�� <color=red>�ܳ�ʹ��<color> ��������ս��, Ȼ�����ܳ������᳡��������. �ӳ�(ʦ���ȼ���Ҫ 80- 119, ��Ա(ͽ��) 50- 90",
				"    ��������Ϊ<color=red>ʦͽ˫����<color>. ���ȥ�� <color=red>�ܳ�ʹ��<color> ��������ս��, Ȼ�����ܳ������᳡��������. �ӳ�(ʦ���ȼ���Ҫ120 ����, ��Ա(ͽ��) 50- 90",
			},
		["������������"]	= "    ��ҿ����Լ�����ս�ӻ��߼�������ս�ӡ��ӳ���Ҫ��δ��ʦͽ�ܡ��ӳ�ȥ��<s> ��������",
		["�뿪������"]	= "    �� <color=red>����Ϣ�׶δ�Լ<color>, ��ҿ�����������ս�ӡ��������׶Σ�������ս��<color=red>δ������ʱ��<color>, ��ҿ��������뿪ս�ӣ�����Ѿ������˾Ͳ����뿪. <color=yellow>�뿪ս�Ӻ󣬾Ͳ�����������<color>. ����ӳ��뿪�ӣ�ս�Ӿͻᱻ��ɢ. <color=yellow>���ս��û�����ˣ����Զ���ɢ<color>. ÿ�������������ĸ�ս�Ӳ������´��������Զ�����ɢ",
	},
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"��������Ϊ<color=red>ʦͽ˫����<color>. ",
		"��������Ϊ<color=red>ʦͽ˫����<color>. ",
	},
	
	text_creat = "    �ڽ���ս�Ӳμ�ʦͽ˫�����������<color=red>�Լ��Ƕӳ�<color>.�����ʦ������Ҫ��<color=red> ʦ�����ӳ�<color>.<enter>"
		.."    <color=red>���δ������ʱ��<color> �Լ� <color=red>δ�ȹ��κ�һ��<color>, ������뿪ս�ӡ����ʦ���뿪ս�ӣ��Ǹ�����������ɢ����ȷ������ս������?",
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>    �˴�"..str_des.."�� <color=red>ʦͽ����<color>, �����ѡ����ս�ӣ�Ҳ���Լ�������ս��. �ӳ������Ա����δ��ʦ���ӡ��ӳ���ͽ���������Լ� "..str_des.."���Ա�Ի���ѡ����������"..str_des.."ѡ����Ѽ�����С���Ա�������Ϊ<color=red>2 ��<color>",
				"���뽨��"..str_des.."��/wlls_want2create",
				"��ֻ�ǿ���/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>���ս��ĿǰΪ <color=yellow>"..str_lgname.."<color><enter>"
		.. "ս�Ӷӳ�:"..join(wlls_get_mems(n_lid), "ս�ӳ�Ա:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>ע�⣺�¼���������Ϊ <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, ������������뽨���µ�ս��.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>  �����ѡ<color=red> ����������<color> ���� <color=red>�뿪������<color>.<enter><enter>"..
			"����ս�Ӳ���: ��<color=red>��Ϣʱ�������ʱ��<color>, ������������������, <color=red>����<color>, ѡ��ͬһ��ͬ�Ӽ��뱾��. <enter>"..
			"�뿪����: ��<color=red>��Ϣʱ��<color>,������뿪�����ӣ�������ʱ�������Ĳ��Ƕ�<color=red> δ������������<color>, ������뿪�����ӣ�����ѲμӾͲ����뿪���ӳ��ʸ񽫱�ת����������Ա <color=yellow>���û�г�Ա��ս�ӽ�����ɢ<color>."
			tb_option[getn(tb_option)+1] = "���ҵĶ��Ѽ�����������/wlls_want2addmember"
		else
			str = str.."<enter>  �����ѡ���뿪��.<enter><enter>"..
			"��ӣ��� <color=red>��Ϣʱ��<color>, ������뿪�����ӣ�������ʱ������Լ���������<color=red>δ�����ϴ�����<color>, ������뿪�����ӣ�������������Ͳ����뿪."
		end
		tb_option[getn(tb_option)+1] = "���/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "������ս��/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "��ֻ��·��/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
	check_addmem = function(n_capidx, n_lid, n_mtype)
		local n_oldidx = PlayerIndex
		PlayerIndex = n_capidx
		local n_lid = LG_GetLeagueObjByRole(1, GetName())	--ʦͽ��ϵս��
		local n_num = GetTask(1403)	--TKID_APPRENTICE_COUNT = 1403 --��ͽ������
		PlayerIndex = n_oldidx
		if (FALSE(n_lid) or n_num <= 0) then	
			return "�Բ���! ��δ�յ��ӣ�������������Ա�������."
		end
		if (n_lid ~= LG_GetLeagueObjByRole(1, GetName())) then
			return "�Բ���! "..GetName().."������ĵ��ӣ����ܼ������������."
		end
		if (GetLevel() > 90) then
			return "�Բ���! "..GetName().."����90����������Ϊͽ�ܼ���������."
		end
		if (GetLevel() < 50) then
			return "�Բ���! "..GetName().."����50�����ܼ���������."
		end
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(3,WLLS_DATA)
