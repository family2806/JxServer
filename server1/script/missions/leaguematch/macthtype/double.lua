--==============˫�����������===============
Include("\\script\\missions\\leaguematch\\tb_head.lua")

if (not tmp_process_data) then
	return
end

--ȫ��˫�����������
WLLS_DATA = {

	name = "song ��u t� do",
	
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
		"����������������Ϊ <color=red>song ��u t� do<color>",
		"����������������Ϊ<color=red>song ��u t� do<color>",
	},
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> "..str_des.."��<color=red>song ��u t� do<color>. �������ѡ����������߼��������������顣�ӳ������������Ӻ�ȥ"..str_des.." ��i tho�i v�i quan vi�n li�n ��u �� ��ng k� "..str_des.." nh�m. 1 ��i t�i �a <color=red>2 ng��i<color>",
				"Ta mu�n l�p "..str_des.." ��i/wlls_want2create",
				"Kh�ng c�n/OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Chi�n ��i <color=yellow>"..str_lgname.."<color><enter>"
		.. "��i tr��ng:"..join(wlls_get_mems(n_lid), "th�nh vi�n:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>   <color=yellow>Li�n ��u gi�i h�n b�i <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, h�y t�o ra m�t chi�n ��i.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng��i c� th� l�a ch�n <color=red> gia nh�p nh�ng kh�c ��i <color> ho�c l� <color=red> r�i �i tranh t�i ��i <color>.<enter><enter>"..
			" Th�nh l�p h�p th�nh ��i qu� tr�nh , � <color=red> th�i gian ngh� ng�i c�ng tranh t�i th�i gian <color>, ng��i c� th� c�ng nh�ng kh�c nh� ch�i h�p th�nh ��i , l�a ch�n ��i h�u gia nh�p tranh t�i ��i .<enter>"..
			" R�i �i tranh t�i ��i ng�  � <color=red> th�i gian ngh� ng�i <color>, ng��i c� th� r�i �i tranh t�i ��i ng� , � tranh t�i th�i gian , n�u nh� ng��i tranh t�i ��i ng� <color=red> kh�ng gia nh�p th��ng k� tranh t�i <color>, ng��i c� th� r�i �i tranh t�i ��i ng� . n�u nh� �� tham gia th� kh�ng th� r�i �i . ��i tr��ng t� c�ch s� chuy�n giao cho th�nh vi�n kh�c <color=yellow> n�u nh� kh�ng c� th�nh vi�n , chi�n ��i �em b� gi�i t�n <color>."
			tb_option[getn(tb_option)+1] = "Th�m th�nh vi�n v�o ��i/wlls_want2addmember"
		else
			str = str.."<enter>       B�n c� th� ch�n �� r�i kh�i ��i.<enter><enter>"..
			"Ra kh�i ��i: Trong th�i gian <color=red>ngh�<color>, b�n c� th� r�i kh�i ��i. Trong th�i gian thi ��u, n�u b�n kh�ng <color=red>li�n ��u<color>, c� th� r�i kh�i ��i."
		end
		tb_option[getn(tb_option)+1] = "Ta mu�n r�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t�nh h�nh thi ��u hi�n t�i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� �i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(1, WLLS_DATA)
