Include("\\script\\missions\\leaguematch\\tb_head.lua")
--============== th�y tr� hai ng��i cu�c so t�i �������===============

if (not tmp_process_data) then
	return
end

--ȫ�� th�y tr� hai ng��i cu�c so t�i �������
WLLS_DATA = {
	
	name = " th�y tr� hai ng��i cu�c so t�i ",
	
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
		[" gi�i thi�u v� l�m t�n t� li�n cu�c so t�i "]	=
			{
				"    ��������Ϊ <color=red> th�y tr� hai ng��i cu�c so t�i <color>. ���ȥ�� <color=red>�ܳ�ʹ��<color> ��������ս��, Ȼ�����ܳ������᳡��������. �ӳ�(ʦ���ȼ���Ҫ 80- 119, ��Ա(ͽ��) 50- 90",
				"    ��������Ϊ<color=red> th�y tr� hai ng��i cu�c so t�i <color>. ���ȥ�� <color=red>�ܳ�ʹ��<color> ��������ս��, Ȼ�����ܳ������᳡��������. �ӳ�(ʦ���ȼ���Ҫ120 ����, ��Ա(ͽ��) 50- 90",
			},
		[" th�nh l�p li�n t�i qu� tr�nh "]	= " nh� ch�i c� th� m�nh th�nh l�p chi�n ��i ho�c l� gia nh�p nh�ng chi�n ��i kh�c . ��i tr��ng c�n l� kh�ng xu�t s� �� �� . ��i tr��ng �i g�p <s> ghi danh li�n cu�c so t�i ",
		[" r�i �i li�n cu�c so t�i ��i "]	= " � <color=red> c�ch ngh� ng�i giai �o�n ��c ch�ng <color>, nh� ch�i c� th� t� �i tho�t kh�i chi�n ��i . � li�n cu�c so t�i giai �o�n , n�u nh� ng��i chi�n ��i <color=red> ch�a t�i li�n cu�c so t�i th�i �i�m <color>, nh� ch�i c� th� t� �i r�i �i chi�n ��i , n�u nh� �� li�n cu�c so t�i li�u th� kh�ng th� r�i �i . <color=yellow> r�i �i chi�n ��i sau , th� kh�ng th� d�n ��ng h�ng t��ng <color>. n�u nh� ��i tr��ng r�i �i ��i , chi�n ��i c�ng s� b� gi�i t�n . <color=yellow> n�u nh� chi�n ��i kh�ng c� ai li�u , li�n t� ��ng gi�i t�n <color>. m�i l�n ngay c� ��u k�t th�c , c�i n�o chi�n ��i kh�ng ph� h�p l�n sau li�n cu�c so t�i li�n t� ��ng b� gi�i t�n ",
	},
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"��������Ϊ<color=red> th�y tr� hai ng��i cu�c so t�i <color>. ",
		"��������Ϊ<color=red> th�y tr� hai ng��i cu�c so t�i <color>. ",
	},
	
	text_creat = "    �ڽ���ս�Ӳμ� th�y tr� hai ng��i cu�c so t�i �������<color=red>�Լ��Ƕӳ�<color>.�����ʦ������Ҫ��<color=red> ʦ�����ӳ�<color>.<enter>"
		.." <color=red> n�u nh� ch�a t�i li�n cu�c so t�i th�i gian <color> c�ng v�i <color=red> kh�ng so qua b�t k� m�t cu�c <color>, ng��i c� th� r�i �i chi�n ��i . n�u nh� s� ph� r�i �i chi�n ��i , c�i �� ��i l�p t�c b� gi�i t�n . ng��i x�c ��nh th�nh l�p chi�n ��i li�u sao ?",
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l�n n�y "..str_des.." khi <color=red> th�y tr� li�n cu�c so t�i <color>, ng��i c� th� l�a ch�n th�nh l�p chi�n ��i , c�ng c� th� gia nh�p nh�ng chi�n ��i kh�c . ��i tr��ng gia nh�p ��i vi�n c�n l� kh�ng xu�t s� �� t� . ��i tr��ng c�ng �� �� h�p th�nh ��i ho�n h�u , c�ng v�i "..str_des.." c�ng quan vi�n ��i tho�i , l�a ch�n li�n cu�c so t�i ��i ng� "..str_des.." l�a ch�n ��i h�u gia nh�p l� ���c . th�nh vi�n s� l��ng nhi�u nh�t v� <color=red>2 ng��i <color>",
				" ta mu�n th�nh l�p "..str_des.." ��i /wlls_want2create",
				" ta ch�ng qua l� xem m�t ch�t /OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> ng��i chi�n ��i tr��c m�t v� <color=yellow>"..str_lgname.."<color><enter>"
		.. " chi�n ��i ��i tr��ng :"..join(wlls_get_mems(n_lid), "Chi�n ��i th�nh vi�n :") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> ch� �  h� qu� li�n cu�c so t�i h�n ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u nh� mu�n li�n cu�c so t�i , xin/m�i th�nh l�p m�i chi�n ��i .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>  �����ѡ<color=red> ����������<color> ���� <color=red> r�i �i li�n cu�c so t�i ��i <color>.<enter><enter>"..
			" th�nh l�p chi�n ��i b��c : � <color=red> th�i gian ngh� ng�i c�ng li�n cu�c so t�i th�i gian <color>, c�ng c� th� thay v� h�n nh� ch�i h�p th�nh ��i , <color=red> kh�c ph�i <color>, l�a ch�n c�ng �� cho c�ng ��i gia nh�p v�n ��i . <enter>"..
			"�뿪����: ��<color=red>��Ϣʱ��<color>,����� r�i �i li�n cu�c so t�i ��i ��������ʱ�������Ĳ��Ƕ�<color=red> δ������������<color>, ����� r�i �i li�n cu�c so t�i ��i ������ѲμӾͲ����뿪���ӳ��ʸ񽫱�ת����������Ա <color=yellow>���û�г�Ա��ս�ӽ�����ɢ<color>."
			tb_option[getn(tb_option)+1] = "Th�m th�nh vi�n v�o ��i/wlls_want2addmember"
		else
			str = str.."<enter> ng��i c� th� l�a ch�n r�i �i ��i .<enter><enter>"..
			"��ӣ��� <color=red>��Ϣʱ��<color>, ����� r�i �i li�n cu�c so t�i ��i ��������ʱ������Լ���������<color=red>δ�����ϴ�����<color>, ����� r�i �i li�n cu�c so t�i ��i ��������������Ͳ����뿪."
		end
		tb_option[getn(tb_option)+1] = "Ta mu�n r�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t�nh h�nh thi ��u hi�n t�i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� �i ngang qua/OnCancel"
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
			return " th�t xin l�i ! ng��i kh�ng thu �� t� , kh�ng th� thay v� h�n ��i vi�n th�nh l�p h�p th�nh ��i ."
		end
		if (n_lid ~= LG_GetLeagueObjByRole(1, GetName())) then
			return " th�t xin l�i ! "..GetName().." kh�ng ph�i l� �� t� c�a ng��i , kh�ng th� gia nh�p ng��i li�n cu�c so t�i ��i ."
		end
		if (GetLevel() > 90) then
			return " th�t xin l�i ! "..GetName().." v��t qua 90 c�p , kh�ng th� l�m �� �� gia nh�p li�n cu�c so t�i ��i ."
		end
		if (GetLevel() < 50) then
			return " th�t xin l�i ! "..GetName().." kh�ng �� 50 , kh�ng th� gia nh�p li�n cu�c so t�i ��i ."
		end
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(3,WLLS_DATA)
