Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============���˫�����������===============

if (not tmp_process_data) then
	return
end

--ȫ�����˫�����������
WLLS_DATA = {
	
	name = "song ��u nam n�",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10248,
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
			ladder = 10249,
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
			{1, 1500},	--��1��
			{2, 1200},	--��2��
			{3, 1000},	--��3��
			{4, 800},	--��4��
			{8, 500},	--��5-8��
			{16, 300},	--��9-16��
			{32, 200},	--��17-32��
			{64, 50},	--��33-64��
			{128, 10},	--��65-128��
		}, {	--����
			{1, 1500},	--��1��
			{2, 1200},	--��2��
			{3, 1000},	--��3��
			{4, 800},	--��4��
			{8, 500},	--��5-8��
			{16, 300},	--��9-16��
			{32, 200},	--��17-32��
			{64, 50},	--��33-64��
			{128, 10},	--��65-128��
		}
	},
	
	max_member = 2,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		" l�n n�y t�n t� li�n cu�c so t�i t��ng s� nam n� hai ng��i cu�c so t�i m� th�c , m�i ng��i c� th� t� do th�nh l�p chi�n ��i , c� g�ng luy�n t�p ph�i h�p ",
		" l�n n�y t�n t� li�n cu�c so t�i t��ng s� nam n� hai ng��i cu�c so t�i m� th�c , m�i ng��i c� th� t� do th�nh l�p chi�n ��i , c� g�ng luy�n t�p ph�i h�p ",
	},
	
	addmem_ex	= ", y�u c�u <color=red> nam n� <color>",	--�齨ս�Ӷ���Ҫ�󣨿�ѡ��

	--====Functions====
	
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l�n n�y "..str_des.." tham gia <color=red> nam n� hai ng��i cu�c so t�i <color>. ng��i c� th� m�nh th�nh l�p chi�n ��i , c�ng c� th� tham gia ng��i kh�c ��ch chi�n ��i . � ��i tr��ng c�ng h�n ng��i h�p th�nh ��i sau , �em "..str_des.." c�ng quan vi�n ��i tho�i , l�a ch�n tranh t�i ��i ng� "..str_des.." l�p t�c t�o th�nh chi�n ��i . th�nh vi�n s� l��ng nhi�u nh�t v� <color=red>2 ng��i <color=red>, c�n kh�c ph�i .",
				"Ta mu�n t�o "..str_des.." ��i/wlls_want2create",
				"Ta ch� �i ngang qua/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> ng��i chi�n ��i tr��c m�t v� <color=yellow>"..str_lgname.."<color><enter>"
		.. " chi�n ��i ��i tr��ng :"..join(wlls_get_mems(n_lid), "Chi�n ��i th�nh vi�n :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> ch� �  h� qu� tranh t�i h�n ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u nh� mu�n tranh t�i , xin/m�i th�nh l�p m�i chi�n ��i .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng��i c� th� ch�n <color=red> gia nh�p nh�ng kh�c ��i <color> ho�c l� <color=red> r�i �i tranh t�i ��i <color>.<enter><enter>"..
			" th�nh l�p chi�n ��i b��c : � <color=red> th�i gian ngh� ng�i c�ng tranh t�i th�i gian <color>, c�ng c� th� thay v� h�n nh� ch�i h�p th�nh ��i , <color=red> kh�c ph�i <color>, l�a ch�n c�ng �� cho c�ng ��i gia nh�p v�n ��i . <enter>"..
			" r�i �i tranh t�i : � <color=red> th�i gian ngh� ng�i <color>, ng��i c� th� r�i �i tranh t�i ��i , � tranh t�i th�i gian n�u nh� ng��i kh�ng ph�i l� ��i <color=red> kh�ng gia nh�p th��ng k� tranh t�i <color>, ng��i c� th� r�i �i tranh t�i ��i , n�u nh� �� tham gia th� kh�ng th� r�i �i . ��i tr��ng t� c�ch �em b� chuy�n giao cho nh�ng ��i vi�n kh�c <color=yellow> n�u nh� kh�ng c� th�nh vi�n , chi�n ��i �em b� gi�i t�n <color>."
			tb_option[getn(tb_option)+1] = "Th�m th�nh vi�n v�o ��i/wlls_want2addmember"
		else
			str = str.."<enter> ng��i c� th� l�a ch�n r�i �i ��i .<enter><enter>"..
			" c�ch ��i  � <color=red> th�i gian ngh� ng�i <color>, ng��i c� th� r�i �i tranh t�i ��i , � tranh t�i th�i gian n�u nh� m�nh ��ch tranh t�i ��i <color=red> kh�ng gia nh�p l�n tr��c tranh t�i <color>, ng��i c� th� r�i �i tranh t�i ��i , n�u nh� gia nh�p tranh t�i th� kh�ng th� r�i �i ."
		end
		tb_option[getn(tb_option)+1] = "Ta mu�n r�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t�nh h�nh thi ��u hi�n t�i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� �i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
	check_addmem = function(nCapIdx, nLGID, nMType)
		print(nMType, wlls_player_type())
		if (nMType ~= wlls_player_type()) then
		 	return " th�t xin l�i , ��i v�i b�n trong ��i vi�n :"..GetName().." c�ng <color=red> tham gia tranh t�i lo�i h�nh <color> ng��i chi�n ��i kh�ng h�p , cho n�n , kh�ng th� v�o ng��i chi�n ��i !"
		end
		local nOldIdx = PlayerIndex
		PlayerIndex = nCapIdx
		local nSex	= GetSex()
		PlayerIndex = nOldIdx
		if (nSex == GetSex()) then
			return " l�n n�y t� v� d�a theo nam n� nam n� hai ng��i cu�c so t�i m� th�c , ng��i mu�n t�m m�t kh�c ph�i !"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(7,WLLS_DATA)
