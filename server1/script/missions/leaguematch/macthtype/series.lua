Include("\\script\\missions\\leaguematch\\tb_head.lua")
--============== c�ng h� hai ng��i cu�c so t�i �������===============

-- LLG_ALLINONE_TODO_20070802

if (not tmp_process_data) then
	return
end

--ȫ�� c�ng h� hai ng��i cu�c so t�i �������
local nTmpLadderBase	= 10238
WLLS_DATA = {
	
	name = " c�ng h� hai ng��i cu�c so t�i ",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = " kim h� ",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = " m�c h� ",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = " th�y h� ",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = " h�a h� ",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = " th� h� ",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = " kim h� ",
			level = 2,
			ladder = nTmpLadderBase + 5,
			map = {{540, 570, 541, ""}},
		},
		{
			name = " m�c h� ",
			level = 2,
			ladder = nTmpLadderBase + 6,
			map = {{542, 571, 543, ""}},
		},
		{
			name = " th�y h� ",
			level = 2,
			ladder = nTmpLadderBase + 7,
			map = {{544, 572, 545, ""}},
		},
		{
			name = " h�a h� ",
			level = 2,
			ladder = nTmpLadderBase + 8,
			map = {{546, 573, 547, ""}},
		},
		{
			name = " th� h� ",
			level = 2,
			ladder = nTmpLadderBase + 9,
			map = {{548, 574, 549, ""}},
		},
	},
	
	award_rank = {
		{	--���н���������
			{1, 4000},	--��1��
			{2, 3000},	--��2��
			{3, 2500},	--��3��
			{4, 2000},	--��4��
			{8, 1500},	--��5-8��
			{16, 1250},	--��9-16��
			{32, 1000},	--��17-32��
			{64, 750},	--��33-64��
			{128, 500},	--��65-128��
			{256, 250},	--��129-256��
		}, {	--����
			{1, 8000},	--��1��
			{2, 6000},	--��2��
			{3, 5000},	--��3��
			{4, 4000},	--��4��
			{8, 3000},	--��5-8��
			{16, 2500},	--��9-16��
			{32, 2000},	--��17-32��
			{64, 1500},	--��33-64��
			{128, 1000},	--��65-128��
			{256, 500},	--��129-256��
		}
	},
	
	max_member = 2,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		" l�n n�y tranh t�i v� c�ng h� hai ng��i cu�c so t�i ",
		" l�n n�y tranh t�i v� c�ng h� hai ng��i cu�c so t�i ",
	},
	
	addmem_ex	= ", c�n l� nh� ch�i <color=red> c�ng h� <color> c�ng nhau ",	--�齨ս�Ӷ���Ҫ�󣨿�ѡ��

	--====Functions====
	--���ص�ǰ��ɫ���Բμӵı������ͣ�nilΪ���ܲ���
	player_type = function()
		local nLevel = wlls_player_level()
		if (nLevel <= 0) then
			return nil
		end
		local nSeries = GetSeries() + 1
		if (nSeries <= 0) then
			wlls_error_log("GetSeries() = "..(nSeries - 1))
			return nil
		end
		return (nLevel - 1) * 5 + nSeries
	end,
	
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l�n n�y "..str_des.." v� <color=red> c�ng h� hai ng��i cu�c so t�i <color>. ng��i c� th� l�a ch�n th�nh l�p h�p th�nh ��i , c�ng c� th� gia nh�p nh�ng chi�n ��i kh�c , sau �� , ��i tr��ng �i c�ng "..str_des.." quan vi�n ��i tho�i , l�a ch�n tranh t�i ��i "..str_des.." m�i chi�n ��i th�nh vi�n v� <color=red>2 ng��i <color> c�n l� c�ng h� ",
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
			str = str .. "<enter> <color=yellow> ch� �  h� k� tranh t�i h�n ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u nh� mu�n h� k� tranh t�i , xin/m�i th�nh l�p m�i chi�n ��i .<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter> ng��i c� th� l�a ch�n <color=red> gia nh�p k� tha ��i ng� <color> ho�c l� <color=red> r�i �i tranh t�i <color>.<enter><enter>"..
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
		if (nMType ~= wlls_player_type()) then
		 	return wlls_npcname().." th�t xin l�i , ��i b�n trong th�nh vi�n :"..GetName().."<color=red> c�p b�c <color> ho�c l� <color=red> ng� h�nh <color> hai ��i kh�ng h�p l� , kh�ng th� th�nh l�p chi�n ��i !"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(6,WLLS_DATA)
