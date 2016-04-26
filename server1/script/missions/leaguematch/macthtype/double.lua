--==============˫�����������===============
Include("\\script\\missions\\leaguematch\\tb_head.lua")

if (not tmp_process_data) then
	return
end

--ȫ��˫�����������
WLLS_DATA = {

	name = "����˫����",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10196,
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
			ladder = 10197,
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
			{1, 2000},	--��1��
			{2, 1500},	--��2��
			{3, 1200},	--��3��
			{4, 1000},	--��4��
			{8, 800},	--��5-8��
			{16, 500},	--��9-16��
			{32, 300},	--��17-32��
			{64, 50},	--��33-64��
			{128, 10},	--��65-128��
		}, {	--����
			{1, 2000},	--��1��
			{2, 1500},	--��2��
			{3, 1200},	--��3��
			{4, 1000},	--��4��
			{8, 800},	--��5-8��
			{16, 500},	--��9-16��
			{32, 300},	--��17-32��
			{64, 50},	--��33-64��
			{128, 10},	--��65-128��
		}
	},
	
	max_member = 2,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"����������������Ϊ <color=red>����˫����<color>",
		"����������������Ϊ<color=red>����˫����<color>",
	},
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  �˴�"..str_des.."��<color=red>����˫����<color>. �������ѡ����������߼��������������顣�ӳ������������Ӻ�ȥ"..str_des.."���Ա�Ի���ѡ���������"..str_des.."ѡ����Ѿ��С������ӳ�Ա���<color=red>2 ��<color>",
				"���뽨��"..str_des.."��/wlls_want2create",
				"��ֻ�ǿ���/OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Ŀǰ���ս��Ϊ <color=yellow>"..str_lgname.."<color><enter>"
		.. "ս�Ӷӳ�:"..join(wlls_get_mems(n_lid), "ս�ӳ�Ա:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>ע�⣺�¼���������Ϊ<color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, ����¼��������뽨���µ�ս��.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>   �����ѡ�� <color=red> ����������<color> ���� <color=red>�뿪������<color>.<enter><enter>"..
			"������ӹ��̣���<color=red>��Ϣʱ��ͱ���ʱ��<color>, ����Ժ����������ӣ�ѡ����Ѽ��������.<enter>"..
			"�뿪�������飺��<color=red>��Ϣʱ��<color>, ������뿪�������飬�ڱ���ʱ�䣬�����ı�������<color=red> δ�������ڱ���<color>, ������뿪�������顣����ѲμӾͲ����뿪���ӳ��ʸ񽫻�ת����������Ա <color=yellow>���û�г�Ա��ս�ӽ�����ɢ<color>."
			tb_option[getn(tb_option)+1] = "���ҵĶ��Ѽ����������/wlls_want2addmember"
		else
			str = str.."<enter>       �����ѡ���뿪����.<enter><enter>"..
			"�뿪���飺�� <color=red>��Ϣʱ��<color>, ������뿪�������飬�ڱ���ʱ�������ı�������<color=red>δ�������ڱ���<color>, ��Ҳ�����뿪ս�ӡ�����Ѽ���������Ͳ����뿪ս��."
		end
		tb_option[getn(tb_option)+1] = "�뿪����/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "������ս��/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "��ֻ��·��/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(1, WLLS_DATA)
