Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============�������������===============

if (not tmp_process_data) then
	return
end

--ȫ���������������
WLLS_DATA = {
	
	name = " t� do ba ng��i cu�c so t�i ",
	
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
		" l�n n�y v� l�m t�n t� li�n cu�c so t�i v� <color=red> t� do ba ng��i cu�c so t�i <color>",
		" l�n n�y v� l�m t�n t� li�n cu�c so t�i v� <color=red> t� do ba ng��i cu�c so t�i <color>",
	},
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l�n n�y "..str_des.." � <color=red> t� do ba ng��i cu�c so t�i <color>, ng��i c� th� l�a ch�n th�nh l�p h�p th�nh ��i , c�ng c� th� gia nh�p nh�ng chi�n ��i kh�c . � ��i tr��ng c�ng nh� ch�i h�p th�nh ��i ho�n h�u , "..str_des.." c�ng quan vi�n ��i tho�i , l�a ch�n li�n cu�c so t�i ��i "..str_des.." gia nh�p ��i h�u ��n v�n ��i l� ���c , chi�n ��i th�nh vi�n nhi�u nh�t v� <color=red>3 ng��i <color>.",
				" ta mu�n th�nh l�p "..str_des.." h�p th�nh ��i /wlls_want2create",
				" ta ch� nh�n m�t ch�t /OnCancel")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> tr��c m�t ng��i chi�n ��i v� <color=yellow>"..str_lgname.."<color><enter>"
		.. " chi�n ��i ��i tr��ng :"..join(wlls_get_mems(n_lid), "Chi�n ��i th�nh vi�n :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> ch� �  h� k� li�n cu�c so t�i h�n ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u nh� mu�n h� k� li�n cu�c so t�i , xin/m�i th�nh l�p m�i chi�n ��i .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng��i c� th� l�a ch�n <color=red> gia nh�p nh�ng kh�c ��i ng� <color> ho�c l� <color=red> r�i �i li�n cu�c so t�i <color>.<enter><enter>"..
			" th�nh l�p chi�n ��i b��c : � <color=red> th�i gian ngh� ng�i c�ng li�n cu�c so t�i th�i gian <color>, c�ng c� th� thay v� h�n nh� ch�i h�p th�nh ��i , <color=red> kh�c ph�i <color>, l�a ch�n c�ng �� cho c�ng ��i gia nh�p v�n ��i . <enter>"..
			" r�i �i li�n cu�c so t�i : � <color=red> th�i gian ngh� ng�i <color>, ng��i c� th� r�i �i li�n cu�c so t�i ��i , � li�n cu�c so t�i th�i gian n�u nh� ng��i kh�ng ph�i l� ��i <color=red> kh�ng gia nh�p th��ng k� li�n cu�c so t�i <color>, ng��i c� th� r�i �i li�n cu�c so t�i ��i , n�u nh� �� tham gia th� kh�ng th� r�i �i . ��i tr��ng t� c�ch �em b� chuy�n giao cho nh�ng ��i vi�n kh�c <color=yellow> n�u nh� kh�ng c� th�nh vi�n , chi�n ��i �em b� gi�i t�n <color>."
			tb_option[getn(tb_option)+1] = "Th�m th�nh vi�n v�o ��i/wlls_want2addmember"
		else
			str = str.."<enter> ng��i c� th� l�a ch�n r�i �i ��i .<enter><enter>"..
			" c�ch ��i  � <color=red> th�i gian ngh� ng�i <color>, ng��i c� th� r�i �i li�n cu�c so t�i ��i , � li�n cu�c so t�i th�i gian n�u nh� m�nh ��ch li�n cu�c so t�i ��i <color=red> kh�ng gia nh�p l�n tr��c li�n cu�c so t�i <color>, ng��i c� th� r�i �i li�n cu�c so t�i ��i , n�u nh� gia nh�p li�n cu�c so t�i th� kh�ng th� r�i �i ."
		end
		tb_option[getn(tb_option)+1] = "Ta mu�n r�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t�nh h�nh thi ��u hi�n t�i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� �i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(4,WLLS_DATA)
