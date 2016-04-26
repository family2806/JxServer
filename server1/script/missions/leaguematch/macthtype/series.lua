Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============ͬϵ˫�����������===============

-- LLG_ALLINONE_TODO_20070802

if (not tmp_process_data) then
	return
end

--ȫ��ͬϵ˫�����������
local nTmpLadderBase	= 10238
WLLS_DATA = {
	
	name = "ͬϵ˫����",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "��ϵ",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "ľϵ",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "ˮϵ",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "��ϵ",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "��ϵ",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "��ϵ",
			level = 2,
			ladder = nTmpLadderBase + 5,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "ľϵ",
			level = 2,
			ladder = nTmpLadderBase + 6,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "ˮϵ",
			level = 2,
			ladder = nTmpLadderBase + 7,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "��ϵ",
			level = 2,
			ladder = nTmpLadderBase + 8,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "��ϵ",
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
		"���α���Ϊͬϵ˫����",
		"���α���Ϊͬϵ˫����",
	},
	
	addmem_ex	= ", ��Ҫ�����<color=red>ͬϵ<color> һ��",	--�齨ս�Ӷ���Ҫ�󣨿�ѡ��

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
			wlls_descript("<enter>  �˴�"..str_des.." Ϊ<color=red>ͬϵ˫����<color>. �����ѡ������ӣ�Ҳ���Լ�������ս�ӣ�Ȼ�󣬶ӳ�ȥ�� "..str_des.."��Ա�Ի���ѡ�������"..str_des.."ÿ��ս�ӳ�ԱΪ <color=red>2 ��<color> ��Ҫ��ͬϵ",
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
			str = str .. "<enter>   <color=yellow>ע�⣺���ڱ�������Ϊ<color><color=red>"..WLLS_TAB[n_next].name.."<color><color=yellow>, ��������ڱ������뽨���µ�ս��.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>�����ѡ��<color=red>������������<color>����<color=red>�뿪����<color>.<enter><enter>"..
			"����ս�Ӳ���: ��<color=red>��Ϣʱ��ͱ���ʱ��<color>, ������������������, <color=red>����<color>, ѡ��ͬһ��ͬ�Ӽ��뱾��. <enter>"..
			"�뿪����: ��<color=red>��Ϣʱ��<color>,������뿪�����ӣ��ڱ���ʱ�������Ĳ��Ƕ�<color=red> δ�������ڱ���<color>, ������뿪�����ӣ�����ѲμӾͲ����뿪���ӳ��ʸ񽫱�ת����������Ա <color=yellow>���û�г�Ա��ս�ӽ�����ɢ<color>."
			tb_option[getn(tb_option)+1] = "���ҵĶ��Ѽ����������/wlls_want2addmember"
		else
			str = str.."<enter>  �����ѡ���뿪��.<enter><enter>"..
			"��ӣ��� <color=red>��Ϣʱ��<color>, ������뿪�����ӣ��ڱ���ʱ������Լ��ı�����<color=red>δ�����ϴα���<color>, ������뿪�����ӣ������������Ͳ����뿪."
		end
		tb_option[getn(tb_option)+1] = "���/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "������ս��/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "��ֻ��·��/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
	check_addmem = function(nCapIdx, nLGID, nMType)
		if (nMType ~= wlls_player_type()) then
		 	return wlls_npcname().."�Բ��𣬶��ڳ�Ա:"..GetName().."<color=red>�ȼ�<color> ���� <color=red>����<color>���Ӳ��������ܳ���ս��!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(6,WLLS_DATA)
