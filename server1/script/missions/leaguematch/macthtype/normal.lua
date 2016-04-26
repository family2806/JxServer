--==============һ������������===============
/*
if (not WLLS_HEAD) then
	return
end
*/
-- �������򣬽�Ʒ��
function tmp_help_award(tbData, nLevel)
	local tbAward	= tbData.award_rank[nLevel]
	local str = "    1. �ۼƽ���: ʤ�����"..(5*nLevel).."��, ��"..(2*nLevel).." ��, ����: 0 ��. ÿ������������<color=red>�㾭�齱<color>. ʤ��������Ӧ����\n"
		.."    2. ��������: ���������󣬰���ս�ӳɼ�������<color=red> ��1��"..tbAward[getn(tbAward)][1].."<color>, ��Ա���Ի����������(����ֵ .\n"
		.."    <t>��������: \n"
		.."   ����    ����"
	if (tbData.max_member ~= 1) then
		str	= str.."(ս�ӳ�Ա)"
	end

	local nLastRank	= 1
	for nAward = 1, getn(tbAward) do
		local nRank	= tbAward[nAward][1]
		local szRank
		if (nLastRank == nRank) then
			szRank	= nRank
		else
			szRank	= nLastRank.."-"..nRank
		end
		str = str.."\n"..strfill_left(format("    �� %s ", szRank), 16)..tbAward[nAward][2].."����ֵ"
		nLastRank	= nRank + 1
	end

	return str
end

-- ��������
-- ��ʽ1��
--	{"��Ŀ����", "��������", 1/2(�޶�����ѡ)},
--	�޶���1��ֻ��Ե������ͣ�2��ֻ��Զ��ˣ�nil��ȫ������ͬ��
-- ��ʽ2��
--	{"��Ŀ����", function(���ذ������ݵĺ���), 1/2(�޶�����ѡ)},
-- ��ʽ3��
--	{
--		"��Ŀ����",
--		{
--			"��������������",
--			"�߼�����������",
--		},
--		1/2(�޶�����ѡ)
--	},
tmp_help = {
	{
		"<t>����",
		{
			"    �˴���������Ϊ <color=red><s><color>, �μ��˵ĵȼ���Ҫ�� <color=red>80-119<color>. ���ȥ��<color=red>����ʹ��<color>��������ս�ӣ�Ȼ��������������᳡���б���",
			"    �˴���������Ϊ <color=red><s><color>, �μ��˵ĵȼ���Ҫ�� <color=red>120<color>. ȥ��<color=red>����ʹ��<color>, ��������ս�ӣ�Ȼ��������������᳡���б���",
		}
	},
	{"�����μӱ�������", "    �ڱ����׶Σ���ҿ��Ա����μ��κ���ʽ�ı���", 1},
	{"�����μӱ�������", "�����μ� <s>, ��Ҫ����ս�ӡ���ҿ���ѡ���Լ���ս�ӣ�Ҳ���Լ�������ս�ӡ��ӳ���������Ӻ󣬽����Ա�Ի� <t>, ѡ�� <color=red>ս�� <t> �����γ�ս�ӡ���Ա�������Ϊ <color=red><d> ��<color><e>.", 2},
	{"�뿪������ ", "    �� <color=red>����Ϣ�׶δ�Լ<color>, ��ҿ�����������ս��. �ڱ����׶Σ�������ս��<color=red>δ������ʱ��<color>, ��ҿ��������뿪ս��, ����Ѿ������˾Ͳ����뿪. <color=yellow>�뿪ս�Ӻ󣬾Ͳ�������������<color>. <color=yellow>�뿪ս�Ӻ󣬽����ܷ��ر���<color>.", 1},
	{"�뿪������ ", "    ��<color=red>����Ϣ�׶δ�Լ<color>, ��ҿ�����������ս��. �ڱ����׶Σ�������ս��<color=red>δ������ʱ��<color>, ��ҿ��������뿪ս��, ����Ѿ������˾Ͳ����뿪. <color=yellow>�뿪ս�Ӻ󣬾Ͳ�������������<color>. ����ӳ��뿪ս�ӣ���ӳ�Ȩ����ת����������. <color=yellow>���ս��û���ˣ����Զ���ɢ<color>.ÿ�������������ĸ�ս�Ӳ������´α������Զ�����ɢ", 2},
	{"��������", "ÿ�ܴ���һ�����ģ��� <color=red>18: 00- 19: 00<color> ��ҵ����<color=yellow>4 ��<color>. ����3��� <color=red>18: 00-19: 00<color> �� <color=red>21: 00-22: 00<color> ���Ա��� <color=yellow>8 ��<color>. ���������׶�<color=red>(ÿ�´�8-28)<color> ���б���<color=yellow>108 ��<color>. �μ�ս�����μ�<color=red>48 ��<color> "},
	{"��������", "  ս�Ӷ�Աȥ��<t> �Ի�����᳡ <t>, Ȼ������ͻ᳡��Ա�Ի����ͻᱻ����װ�����򡣵�����ʱ�䣬�μӶ�Ա���Զ�����������. <color=red>��������ѡ��������װ��<color>."},
	{"��������",	-- ����
[[    1. �ڱ���ʱ��, ��ܶ���������ʤ
    2. �ڱ���ʱ�� <color=red>���һ�߲�ʣһ����Ա�˾��Ǹ���<color> ����������
    3. �������������2�߳�Ա����һ���ģ�ϵͳ�����ж��Ǳ߱����еĴ�������Ϊ��ʤ�����������һ���ģ����Ǻ͡�
    4. ����ĶӲ���ʱ�����������Ǹ���, <color=red>ʣ�·�Ϊʤ����<color>
    5. �Ʒ�: ʤ��<pw> ��; ��<pt> ��; ���� 0 ��
    6. ������Աֻ��ʹ����ҩ�����ҩƷ
    7. <color=red>����10���ʼ����<color>; ����ʱ��Ϊ14��50�� 
    8. 2��������Ϣ��� <color=red>10 ����<color>. <color=red>׼��ʱ��<color> 5 ����
]], 1},
	{"��������",	-- ����
[[    1. �ڱ���ʱ�� <color=red>�ı�ȫ������color> ��Ϊ����, ��������
    2. �ڱ���ʱ�� <color=red>���һ�߲�ʣһ����Ա�˾��Ǹ���<color> ����������
    3. ����ʱ����� <color=red>�ı�ʣ��ĳ�Ա���Ϊʤ��<color>. ��� <color=red>2������һ��<color> �򱻴������ٵ�һ��ȡʤ������Ϊ�͡�
    4. ����ĶӲ���ʱ�����������Ǹ���, <color=red>ʣ�·�Ϊʤ����<color>
    5. �Ʒ�: ʤ��<pw> ��; ��<pt> ��; ���� 0 ��
    6. ������Աֻ��ʹ����ҩ�����ҩƷ
    7. <color=red>����10���ʼ����<color>; ����ʱ��Ϊ14��50��
    8. ÿ������׼��ʱ��Ϊ <color=red>5 ����<color>
]], 2},
	{"���д���",
[[���д��������Ǳ��Է��ô��ӣ��������߱��������˴���

���㱻���д�������
    1. ÿ�����Է����У�Ѫ������
    2. ���Է��Ĵ��Ӵ��У�Ѫ������
    3. ���Է��������У�Ѫ������
    4. ���Է����У�Ѫ������
    5. �����Ϊʹ�ü��ܵ���Ѫ�����پͲ������뱻���д�����
]]
	},
	{"��������", "     <color=red>�i�������� <t><color>������Ϊ�������� <t>. ��������<color=red><pw><color>��, ��<color=red><pt><color> ��; ���� <color=red>0<color> ��. ÿ��<t>����������<color=red>ս���ܻ���<color>����. �������һ����������<color=yellow>ʤ������<color> ���С����ʤ������һ����������<color=green> ÿ��ս�ӱ�����ʱ��<color> ���С������׶�<t> �󣬻��ֽ����¼���"},
	{"�˽��������", tmp_help_award},
}

tmp_main = {	--officer���Ի�
	"�����粨���𣬵��ǣ���̩������һ������Ӣ�۳��ֵ�ʱ��Ҳ��һ���µ���ʷ������ʷ�ᡣ˭����ͬһ���µ���Ӣ����?",
	"Ϊ�˱���Ӣ�ۺ�����һ�η������������������˱������ҳ��˲ţ��������",
}

tmp_creat = "    ����ս�ӲμӺ�<s>, ����� <color=red>�Լ����ӳ�<color><enter>"
	.."   ����ս�Ӻ����ۺ�ʱ���㶼���������˲μӻ��߼��������ӡ�ÿ��ս�����ֻ��<d> �� (�����ӳ�). <color=red>���δ������ʱ��<color> Ҳ <color=red>δ�����κγ���<color>, ����������뿪ս�ӡ���ȷ�������Լ���ս����"

--====Functions====
--���ص�ǰ��ɫ���Բμӵı������ͣ�nilΪ���ܲ���
function tmp_player_type()
	local nLevel = wlls_player_level()
	return iif(nLevel > 0, nLevel, nil)
end

--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
function tmp_check_addmem(n_capidx, n_lid, n_mtype)
	if (n_mtype ~= wlls_player_type()) then
	 	return "�Բ��𣬶��ж�Ա:"..GetName().." �� <color=red>��������<color> �����ϣ����ԣ����ܽ������ս��!"
	end
end

function tmp_str(str, tbData)
	str	= gsub(str, "<s>", tbData.name)
	str	= gsub(str, "<d>", tbData.max_member)
	str	= gsub(str, "<e>", tbData.addmem_ex)
	return str
end

function tmp_process_data(tbData)
	-- Ĭ��ֵ
	if (not tbData.addmem_ex) then
		tbData.addmem_ex	= ""
	end
	if (not tbData.text_creat) then
		tbData.text_creat	= tmp_str(tmp_creat, tbData)
	end
	if (not tbData.player_type) then
		tbData.player_type	= tmp_player_type
	end
	if (not tbData.check_addmem) then
		tbData.check_addmem	= tmp_check_addmem
	end

	--������ͼ�����������ҵ�ĳһ��ͼ��Ӧ�ı������͡��������š��������ͣ�
	local tbMapIdx = {}
	for nMType, tbMType in tbData.match_type do
		for nGroup, tbGroup in tbMType.map do
			for i = 1, 3 do
				tbMapIdx[tbGroup[i]] = {nMType, nGroup, i}
			end
		end
	end
	tbData.map_index = tbMapIdx

	-- �����������
	local nCount = 0
	local nMultiple = iif(tbData.max_member == 1, 1, 2)
	local tbSpecialHelp	= tbData.help_msg	-- �ض�������Ϣ
	if (not tbSpecialHelp) then
		tbSpecialHelp	= {}
	end
	tbData.help_msg	= {}
	for _, tbTopic in tmp_help do
		local szTitle	= tmp_str(tbTopic[1], tbData)
		local varText, nLimit
		if (tbSpecialHelp[tbTopic[1]]) then	-- ���Զ��������Ϣ
			varText	= tbSpecialHelp[tbTopic[1]]
			nLimit	= nil
		else
			varText	= tbTopic[2]
			nLimit	= tbTopic[3]
		end
		if (not nLimit or nLimit == nMultiple) then
			nCount	= nCount + 1
			local szType	= type(varText)
			local tbText	= {"", ""}
			if (szType == "function") then
				tbText[1]	= varText(tbData, 1)
				tbText[2]	= varText(tbData, 2)
			elseif (szType == "table") then
				tbText[1]	= varText[1]
				tbText[2]	= varText[2]
			else
				tbText[1]	= tostring(varText)
				tbText[2]	= tbText[1]
			end

			tbData.help_msg[nCount]	= {}
			for nLevel = 1, 2 do
				tbText[nLevel]	= tmp_str(tbText[nLevel], tbData)
				tbText[nLevel]	= gsub(tbText[nLevel], "<t>", WLLS_LEVEL_DESC[nLevel])
				tbText[nLevel]	= gsub(tbText[nLevel], "<pw>", 5*nLevel)
				tbText[nLevel]	= gsub(tbText[nLevel], "<pt>", 2*nLevel)
				tbData.help_msg[nCount][nLevel]	= {
					gsub(szTitle, "<t>", WLLS_LEVEL_DESC[nLevel]),
					tbText[nLevel],
				}
			end
		end
	end

	-- ����Officer���Ի�����
	tbData.text_main[1]	= tmp_main[1]..tbData.text_main[1]
	tbData.text_main[2]	= tmp_main[2]..tbData.text_main[2]
end
