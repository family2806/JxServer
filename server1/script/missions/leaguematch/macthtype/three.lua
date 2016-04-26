Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============�������������===============

if (not tmp_process_data) then
	return
end

--ȫ���������������
WLLS_DATA = {
	
	name = "����������",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10223,
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
			ladder = 10224,
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
			{1, 1000},	--��1��
			{2, 800},	--��2��
			{3, 600},	--��3��
			{4, 500},	--��4��
			{8, 400},	--��5-8��
			{16, 200},	--��9-16��
			{32, 100},	--��17-32��
			{64, 50},	--��33-64��
			{128, 10},	--��65-128��
		}, {	--����
			{1, 1000},	--��1��
			{2, 800},	--��2��
			{3, 600},	--��3��
			{4, 500},	--��4��
			{8, 400},	--��5-8��
			{16, 200},	--��9-16��
			{32, 100},	--��17-32��
			{64, 50},	--��33-64��
			{128, 10},	--��65-128��
		}
	},
	
	max_member = 3,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"�˴�������������Ϊ <color=red>����������<color>",
		"�˴�������������Ϊ<color=red>����������<color>",
	},
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  �˴�"..str_des.."�� <color=red>����������<color>, �����ѡ������ӣ�Ҳ���Լ�������ս�ӡ��ڶӳ������������"..str_des.."���Ա�Ի���ѡ��������"..str_des.."������ѵ����Ӿ��У�ս�ӳ�Ա���Ϊ<color=red>3 ��<color>.",
				"���뽨��"..str_des.."���/wlls_want2create",
				"��ֻ����/OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Ŀǰ���ս��Ϊ<color=yellow>"..str_lgname.."<color><enter>"
		.. "ս�Ӷӳ�:"..join(wlls_get_mems(n_lid), "ս�ӳ�Ա:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>ע�⣺������������Ϊ<color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, ����������������뽨���µ�ս��.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>�����ѡ��<color=red>������������<color>����<color=red>�뿪����<color>.<enter><enter>"..
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
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(4,WLLS_DATA)
