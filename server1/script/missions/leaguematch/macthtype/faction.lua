Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============���ɵ������������===============

if (not tmp_process_data) then
	return
end

--ȫ�����ɵ������������
local nTmpLadderBase	= 10201
WLLS_DATA = {
	
	name = " Tranh t�i m�n ph�i danh s�ch ",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = " Thi�u L�m ",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = " Thi�n v��ng ",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = " ���ng m�n ",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = " Ng� ��c ",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = " Nga Mi ",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = " th�y y�n ",
			level = 1,
			ladder = nTmpLadderBase + 5,
			map = {{406, 565, 407, ""}},
		},
		{
			name = " C�i Bang ",
			level = 1,
			ladder = nTmpLadderBase + 6,
			map = {{408, 566, 409, ""}},
		},
		{
			name = " thi�n nh�n ",
			level = 1,
			ladder = nTmpLadderBase + 7,
			map = {{410, 567, 411, ""}},
		},
		{
			name = " V� �ang ",
			level = 1,
			ladder = nTmpLadderBase + 8,
			map = {{412, 568, 413, ""}},
		},
		{
			name = " C�n L�n ",
			level = 1,
			ladder = nTmpLadderBase + 9,
			map = {{414, 569, 415, ""}},
		},
		{
			name = " Thi�u L�m ",
			level = 2,
			ladder = nTmpLadderBase + 10,
			map = {{540, 570, 541, ""}},
		},
		{
			name = " Thi�n v��ng ",
			level = 2,
			ladder = nTmpLadderBase + 11,
			map = {{542, 571, 543, ""}},
		},
		{
			name = " ���ng m�n ",
			level = 2,
			ladder = nTmpLadderBase + 12,
			map = {{544, 572, 545, ""}},
		},
		{
			name = " Ng� ��c ",
			level = 2,
			ladder = nTmpLadderBase + 13,
			map = {{546, 573, 547, ""}},
		},
		{
			name = " Nga Mi ",
			level = 2,
			ladder = nTmpLadderBase + 14,
			map = {{548, 574, 549, ""}},
		},
		{
			name = " th�y y�n ",
			level = 2,
			ladder = nTmpLadderBase + 15,
			map = {{550, 575, 551, ""}},
		},
		{
			name = " C�i Bang ",
			level = 2,
			ladder = nTmpLadderBase + 16,
			map = {{552, 576, 553, ""}},
		},
		{
			name = " thi�n nh�n ",
			level = 2,
			ladder = nTmpLadderBase + 17,
			map = {{554, 577, 555, ""}},
		},
		{
			name = " V� �ang ",
			level = 2,
			ladder = nTmpLadderBase + 18,
			map = {{556, 578, 557, ""}},
		},
		{
			name = " C�n L�n ",
			level = 2,
			ladder = nTmpLadderBase + 19,
			map = {{558, 579, 559, ""}},
		},
	},
	
	award_rank = {
		{	--���н���������
			{1, 1500},	--��1��
			{2, 1000},	--��2��
			{3, 800},	--��3��
			{4, 600},	--��4��
			{8, 400},	--��5-8��
			{16, 300},	--��9-16��
			{32, 250},	--��17-32��
			{64, 200},	--��33-64��
			{128, 150},	--��65-128��
		}, {	--����
			{1, 3000},	--��1��
			{2, 2000},	--��2��
			{3, 1600},	--��3��
			{4, 1200},	--��4��
			{8, 800},	--��5-8��
			{16, 600},	--��9-16��
			{32, 500},	--��17-32��
			{64, 400},	--��33-64��
			{128, 300},	--��65-128��
		}
	},
	
	max_member = 1,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		" V� l�m li�n ��u ��n ��u m�n ph�i, l�a ch�n m�n ph�i c�a ng��i. ",
		" V� l�m li�n ��u ��n ��u m�n ph�i, l�a ch�n m�n ph�i c�a ng��i. ",
	},
	
	--====Functions====
	--���ص�ǰ��ɫ���Բμӵı������ͣ�nilΪ���ܲ���
	player_type = function()
		local n_level = wlls_player_level()
		if (n_level <= 0) then
			return nil
		end
		local n_fact = GetLastFactionNumber() + 1
		if (n_fact <= 0) then
			wlls_descript("<enter> ��y l� l�c c�c m�n ph�i tranh t�i, ng��i kh�ng m�n kh�ng ph�i kh�ng th� tham gia .")
			return nil
		end
		return (n_level - 1) * 10 + n_fact
	end,
	
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter> l�n n�y "..str_des.." b�i v� <color=red> m�n ph�i �an ��u <color>, n�u nh� ng��i l�n ��u ti�n tham gia tranh t�i , h� th�ng �em v� ng��i x�y m�t chi�n ��i .")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter> tr��c m�t ng��i chi�n ��i v� <color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter> <color=yellow> ch� �  h� qu� tranh t�i h�n ch� v� <color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u nh� mu�n h� qu� tranh t�i , xin/m�i th�nh l�p m�i chi�n ��i .<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter> � <color=red> th�i gian ngh� ng�i b�n trong <color> ho�c l� <color=red> kh�ng gia nh�p th��ng k� tranh t�i <color>, ng��i c� th� r�i �i chi�n ��i , chi�n ��i �em t� ��ng gi�i t�n <color>."
		tb_option[getn(tb_option)+1] = "Ta mu�n r�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem t�nh h�nh thi ��u hi�n t�i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� �i ngang qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(2,WLLS_DATA)
