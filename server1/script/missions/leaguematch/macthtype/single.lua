Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============��ϵ������������===============

if (not tmp_process_data) then
	return
end

--ȫ����ϵ������������
WLLS_DATA = {
	
	name = " ��n ��u t� do ",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10235,
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
			ladder = 10236,
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
			{2, 1000},	--��2��
			{3, 800},	--��3��
			{4, 500},	--��4��
			{8, 400},	--��5-8��
			{16, 300},	--��9-16��
			{32, 200},	--��17-32��
			{64, 100},	--��33-64��
			{128, 50},	--��65-128��
			{256, 20},	--��129-256��
			{512, 10},	--��257-512��
		}, {	--����
			{1, 2000},	--��1��
			{2, 1000},	--��2��
			{3, 800},	--��3��
			{4, 500},	--��4��
			{8, 400},	--��5-8��
			{16, 300},	--��9-16��
			{32, 200},	--��17-32��
			{64, 100},	--��33-64��
			{128, 50},--��65-128��
			{256, 20},--��129-256��
			{512, 10},	--��257-512��
		}
	},
	
	max_member = 1,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"�˴��� ��n ��u t� do ����λ����Ŭ����ϰ���ȸ����һ��",
		"�˴��� ��n ��u t� do ����λ����Ŭ����ϰ���ȸ����һ��",
	},
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l�n n�y "..str_des.."Ϊ<color=red> ��n ��u t� do <color>, ����Ҫ����ս�ӣ�ϵͳ����¼��ĵ�һ�α���")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> L�n n�y  <color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow>H�y li�n ��u h�n ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u nh� mu�n h�y li�n ��u , xin m�i th�nh l�p m�i chi�n ��i .<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter><color=red> t�m th�i �ang trong th�i gian ngh� ng�i <color> ho�c l� <color=red> kh�ng tham gia cu�c tranh t�i <color>, ng��i c� th� r�i kh�i chi�n ��i, chi�n ��i t� ��ng gi�i t�n <color>."
		tb_option[getn(tb_option)+1] = "Ta mu�n r�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t�nh h�nh thi ��u hi�n t�i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� �i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
	check_addmem = function(n_capidx, n_lid, n_mtype)
		return " kh�ng th� tham gia li�n ��u !"
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(5,WLLS_DATA)
