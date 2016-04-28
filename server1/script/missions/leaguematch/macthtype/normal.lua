--==============һ������������===============
/*
if (not WLLS_HEAD) then
	return
end
*/
-- �������򣬽�Ʒ��
function tmp_help_award(tbData, nLevel)
	local tbAward	= tbData.award_rank[nLevel]
	local str = " 1. m�t m�i k� t��ng th��ng : th�ng ph��ng ��t ���c "..(5*nLevel).." �i�m , c�ng "..(2*nLevel).." �i�m , b�/cha/ch�u ph��ng : 0 �i�m . m�i cu�c tranh t�i �em gia t�ng <color=red> ch�t kinh nghi�m t��ng <color>. th�ng b�i ��u c� t��ng �ng t��ng th��ng \n"
		.." 2. ��ng h�ng t��ng th��ng : sau khi cu�c tranh t�i k�t th�c , d�a theo chi�n ��i th�nh t�ch , ��ng h�ng th� <color=red> t� 1 ��n "..tbAward[getn(tbAward)][1].."<color>, th�nh vi�n c� th� ��t ���c ��ng h�ng t��ng th��ng ( vinh d� tr� gi� .\n"
		.." <t> ��ng h�ng t��ng th��ng : \n"
		.." ��ng h�ng t��ng th��ng "
	if (tbData.max_member ~= 1) then
		str	= str.."( chi�n ��i th�nh vi�n )"
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
		str = str.."\n"..strfill_left(format(" l�n %s ", szRank), 16)..tbAward[nAward][2].." vinh d� tr� gi� "
		nLastRank	= nRank + 1
	end

	return str
end

-- ��������
-- ��ʽ1��
--	{"B� m�n t�n ", "Tr� gi�p n�i dung ", 1/2(�޶�����ѡ)},
--	�޶���1��ֻ��Ե������ͣ�2��ֻ��Զ��ˣ�nil��ȫ������ͬ��
-- ��ʽ2��
--	{"B� m�n t�n ", function(����Tr� gi�p n�i dung �ĺ���), 1/2(�޶�����ѡ)},
-- ��ʽ3��
--	{
--		"B� m�n t�n ",
--		{
--			"������Tr� gi�p n�i dung ",
--			"�߼���Tr� gi�p n�i dung ",
--		},
--		1/2(�޶�����ѡ)
--	},
tmp_help = {
	{
		"<t> gi�i thi�u ",
		{
			" l�n n�y t�n t� li�n cu�c so t�i v� <color=red><s><color>, tham gia ng��i c�p b�c c�n t� <color=red>80-119<color>. nh� ch�i �i g�p <color=red> t�n t� s� gi� <color> ghi danh th�nh l�p chi�n ��i , sau �� ti�n v�o t�n t� li�n cu�c so t�i h�i tr��ng ti�n h�nh tranh t�i ",
			" l�n n�y v� l�m li�n cu�c so t�i v� <color=red><s><color>, tham gia ng��i c�p b�c c�n t� <color=red>120<color>. �i g�p <color=red> li�n cu�c so t�i s� gi� <color>, ghi danh th�nh l�p chi�n ��i , sau �� ti�n v�o v� l�m li�n cu�c so t�i h�i tr��ng ti�n h�nh tranh t�i ",
		}
	},
	{"Ghi danh tham gia tranh t�i tr�nh t� ", " � tranh t�i giai �o�n , nh� ch�i c� th� ghi danh tham gia b�t k� h�nh th�c ��ch tranh t�i ", 1},
	{"Ghi danh tham gia tranh t�i tr�nh t� ", "Ghi danh tham gia <s>, c�n th�nh l�p chi�n ��i . nh� ch�i c� th� l�a ch�n m�nh chi�n ��i , c�ng c� th� gia nh�p nh�ng chi�n ��i kh�c . ��i tr��ng c�ng h�n ng��i h�p th�nh ��i sau , �em c�ng quan vi�n ��i tho�i <t>, l�a ch�n <color=red> chi�n ��i <t> l�p t�c t�o th�nh chi�n ��i . th�nh vi�n s� l��ng nhi�u nh�t v� <color=red><d> ng��i <color><e>.", 2},
	{"R�i �i tranh t�i ��i ", " � <color=red> c�ch ngh� ng�i giai �o�n ��c ch�ng <color>, nh� ch�i c� th� t� �i tho�t kh�i chi�n ��i . � tranh t�i giai �o�n , n�u nh� ng��i chi�n ��i <color=red> ch�a t�i tranh t�i th�i �i�m <color>, nh� ch�i c� th� t� �i r�i �i chi�n ��i , n�u nh� �� so t�i th� kh�ng th� r�i �i . <color=yellow> r�i �i chi�n ��i sau , th� kh�ng th� d�n ��ng h�ng t��ng th��ng <color>. <color=yellow> r�i �i chi�n ��i sau , �em kh�ng th� tr� v� tranh t�i <color>.", 1},
	{"R�i �i tranh t�i ��i ", " � <color=red> c�ch ngh� ng�i giai �o�n ��c ch�ng <color>, nh� ch�i c� th� t� �i tho�t kh�i chi�n ��i . � tranh t�i giai �o�n , n�u nh� ng��i chi�n ��i <color=red> ch�a t�i tranh t�i th�i �i�m <color>, nh� ch�i c� th� t� �i r�i �i chi�n ��i , n�u nh� �� so t�i th� kh�ng th� r�i �i . <color=yellow> r�i �i chi�n ��i sau , th� kh�ng th� d�n ��ng h�ng t��ng th��ng <color>. n�u nh� ��i tr��ng r�i �i chi�n ��i , l� ��i tr��ng quy�n l�i �em chuy�n giao cho nh�ng ng��i kh�c . <color=yellow> n�u nh� chi�n ��i kh�ng ai li�u , �em t� ��ng gi�i t�n <color>. m�i l�n li�n cu�c so t�i k�t th�c , c�i n�o chi�n ��i kh�ng ph� h�p l�n sau tranh t�i li�n t� ��ng b� gi�i t�n ", 2},
	{"��u tr��ng l�n ", "M�i tu�n t� th� hai ��n th� n�m , t� <color=red>18: 00- 19: 00<color> khai tr��ng tranh t�i <color=yellow>4 tr�ng <color>. c�n s�t l�i 3 ng�y t� <color=red>18: 00-19: 00<color> c�ng <color=red>21: 00-22: 00<color> c� th� tranh t�i <color=yellow>8 tr�ng <color>. to�n b� tranh t�i giai �o�n <color=red>( m�i th�ng t� 8-28)<color> t�t c� tranh t�i <color=yellow>108 tr�ng <color>. tham gia chi�n ��i nhi�u nh�t tham gia <color=red>48 tr�ng <color> "},
	{"Tranh t�i l�u tr�nh ", "Chi�n ��i ��i vi�n �i c�ng <t> ��i tho�i ti�n v�o h�i tr��ng <t>, ti�p theo sau �� c�ng h�i tr��ng quan vi�n ��i tho�i , c�ng s� b� mang v�o trang b� khu v�c . ��n tranh t�i th�i gian , tham gia ��i vi�n �em t� ��ng b� ��a ng��i cu�c so t�i tr�ng . <color=red> c� th� t� do l�a ch�n v� kh� c�ng trang b� <color>."},
	{"Tranh t�i quy t�c ",	-- ����
[[    1. �ڱ���ʱ��, ��ܶ���������ʤ
    2. �ڱ���ʱ�� <color=red>���һ�߲�ʣһ����Ա�˾��Ǹ���<color> ����������
    3. �������������2�߳�Ա����һ���ģ�ϵͳ�����ж��Ǳ߱����еĴ�������Ϊ��ʤ�����������һ���ģ����Ǻ͡�
    4. ����ĶӲ���ʱ�����������Ǹ���, <color=red>ʣ�·�Ϊʤ����<color>
    5. �Ʒ�: ʤ��<pw> ��; ��<pt> ��; ���� 0 ��
    6. ������Աֻ��ʹ����ҩ�����ҩƷ
    7. <color=red>����10���ʼ����<color>; ����ʱ��Ϊ14��50�� 
    8. 2��������Ϣ��� <color=red>10 ����<color>. <color=red>׼��ʱ��<color> 5 ����
]], 1},
	{"Tranh t�i quy t�c ",	-- ����
[[    1. �ڱ���ʱ�� <color=red>�ı�ȫ������color> ��Ϊ����, ��������
    2. �ڱ���ʱ�� <color=red>���һ�߲�ʣһ����Ա�˾��Ǹ���<color> ����������
    3. ����ʱ����� <color=red>�ı�ʣ��ĳ�Ա���Ϊʤ��<color>. ��� <color=red>2������һ��<color> �򱻴������ٵ�һ��ȡʤ������Ϊ�͡�
    4. ����ĶӲ���ʱ�����������Ǹ���, <color=red>ʣ�·�Ϊʤ����<color>
    5. �Ʒ�: ʤ��<pw> ��; ��<pt> ��; ���� 0 ��
    6. ������Աֻ��ʹ����ҩ�����ҩƷ
    7. <color=red>����10���ʼ����<color>; ����ʱ��Ϊ14��50��
    8. ÿ������׼��ʱ��Ϊ <color=red>5 ����<color>
]], 2},
	{"��nh tr�ng s� l�n ",
[[��nh tr�ng s� l�n �����Ǳ��Է��ô��ӣ��������߱��������˴���

���㱻���д�������
    1. ÿ�����Է����У�Ѫ������
    2. ���Է��Ĵ��Ӵ��У�Ѫ������
    3. ���Է��������У�Ѫ������
    4. ���Է����У�Ѫ������
    5. �����Ϊʹ�ü��ܵ���Ѫ�����پͲ������뱻���д�����
]]
	},
	{"Ghi danh quy t�c ", "     <color=red>�i�������� <t><color>������Ϊ�������� <t>. ��������<color=red><pw><color> �i�m , c�ng <color=red><pt><color> ��; ���� <color=red>0<color> ��. ÿ��<t>����������<color=red>ս���ܻ���<color>����. �������һ����������<color=yellow>ʤ������<color> ���С����ʤ������һ����������<color=green> ÿ��ս�ӱ�����ʱ��<color> ���С������׶�<t> �󣬻��ֽ����¼���"},
	{"Hi�u r� nhi�u h�n t��ng t�nh ", tmp_help_award},
}

tmp_main = {	--officer���Ի�
	" giang h� phong ba lo�n kh�i , nh�ng l� , hay kh�ng v� c�ng th�i lai . khi m�t t�n t� anh h�ng xu�t hi�n th�i �i�m , c�ng l� m�t m�i l�ch s� b� t�i nh�p s� s�ch . ng��i n�o s� l� c�ng m�t ng�y h� ��ch m�i anh h�ng ��y ?",
	" v� �� tr�nh cho anh h�ng h�o ki�t l�i m�t l�n n�a ph�n tranh , ��c c� minh ch� c� h�nh tranh t�i ��n t�m ra nh�n t�i , ph�c v� qu�c gia ",
}

tmp_creat = " th�nh l�p chi�n ��i tham gia sau <s>, ng��i c� th� <color=red> m�nh l�m ��i tr��ng <color><enter>"
	.." th�nh l�p chi�n ��i sau , v� lu�n khi n�o , ng��i c�ng c� th� xin/m�i ng��i kh�c tham gia ho�c l� gia nh�p nh�ng kh�c ��i . m�i chi�n ��i nhi�u nh�t ch� c� th� <d> ng��i ( bao g�m ��i tr��ng ). <color=red> n�u nh� ch�a t�i tranh t�i th�i �i�m <color> c�ng <color=red> kh�ng t�i qu� b�t k� tr�ng l�n <color>, ng��i c� th� t�y � r�i �i chi�n ��i . ng��i x�c ��nh th�nh l�p m�nh chi�n ��i sao ? "

--====Functions====
--���ص�ǰ��ɫ���Բμӵı������ͣ�nilΪ���ܲ���
function tmp_player_type()
	local nLevel = wlls_player_level()
	return iif(nLevel > 0, nLevel, nil)
end

--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
function tmp_check_addmem(n_capidx, n_lid, n_mtype)
	if (n_mtype ~= wlls_player_type()) then
	 	return " th�t xin l�i , ��i trung ��i vi�n :"..GetName().." c�ng <color=red> tranh t�i lo�i h�nh <color> kh�ng ph� h�p , cho n�n , kh�ng th� v�o ng��i chi�n ��i !"
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
