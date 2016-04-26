-------------------------------------------------------------------------
-- FileName		:	spreader.lua
-- Author		:	lailigao
-- CreateTime	:	2005-06-03 10:15:37
-- Desc			:	��Ϸ�ƹ�Աϵͳ
-- Include("\\script\\misc\\spreader\\spreader.lua")
---------------------------------------------------------------------------

IncludeLib("SPREADER")

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
Include("\\script\\shitu\\shitu_head.lua")
Include("\\script\\misc\\spreader\\head.lua")
Include("\\script\\misc\\spreader\\newaccount.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\misc\\rename\\rename_func.lua")
Include("\\script\\misc\\lostgolditem\\restore_goldeqitem.lua")		--��ȡ��ʧ�ƽ�װ��

function main()
	game_spreader()
end
function game_spreader()
	if (SWITCH_SPREADER ~= 1) then
		Talk(1, "", "<color=green>ͨ��<color>: �ù��ܲ��ܴ�!");
		return 0;
	end
	local szOp = 
	{
		"����cd-key �����˺�/gsp_input_cdkey",
		"��ý���! /gsp_phase_prize",
		-- "��ȡ�ƽ�ʦͽ��/gsp_accept_goldcard",
		"��ع���.../gsp_about",
		"�⳥��ռ�ǰ��/about_castellan_remedy",
		"������ȡ��/about_rename_role",
		"�����ȡ��/about_rename_tong",
		"��ת���µķ�����ʱ����Ҹ���/rename_role_tranfer",
		"˳��·��/gsp_cancel",
		"�ջ���ʧȥ�Ļƽ�װ��!/restore_golditem",
	};
	
	if (SYSCFG_REGION_VERSION	== SC_REGION_VER_CN) then -- ��½�汾
		Say("��ӭ����<color=green>ͨ��<color>, ��ʲô��Ҫ��������?", 7,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[8]);
	elseif (SYSCFG_REGION_VERSION	== SC_REGION_VER_VN) then -- Խ�ϰ汾
		Say("��ʲô��Ҫ��������?", 3,
			szOp[7],
			szOp[9],
			szOp[8]);
	else
		Say("��ʲô��Ҫ��������?", 1,
			szOp[8]);	
	end
end

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then
		Msg2Player("��δ��ȡ������Ľ�������������.");
		gsp_newaccount_gift_core();
		nValue = nValue + 1; -- �˲������ɲ���
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "���˺��Ѽ����������cd-key. ���ǣ�������첻���ƽ�ʦͽ��������ϵVinagame."
		Talk(1, "", "<color=green>Th�ng c�o<color>:"..szError);
		gsp_writeLog(szError);
		return -1;
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY_PAY) then
		szError = "���˺��Ѽ����������cd-key. лл���֧��"
		Talk(1, "", "<color=green>ͨ��<color>:"..szError);
		-- gsp_writeLog(szError);
		return -1;
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "������cd-key:");
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>ͨ��<color>, �뿴��ʽ��ҳ.");
end

function gsp_cancel()
end

-- ��ȡ�׶ν���
function gsp_phase_prize()
	local nValue = GetTask(GSP_TASKID_ROLEREINFO);
	if (GetByte(nValue, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "<color=green>ͨ��<color>: ��δʹ�� cd-key ������˺ţ������콱�������뿴��ҳ�ϵ���Ϣ.");
		return 0;
	end
	
	local nLevel = GetLevel();
	local nBonus = 0;
	local nPrizeLevel = 0;
	local nBit = 0;
	-----------------
	if (nLevel < 30) then
		Talk(1, "", "<color=green>ͨ��<color>: Ŀǰ��ĵȼ�Ϊ"..GetLevel().."����δ�콱.<enter>����ﵽ30, 40, 50, 80 �������콱������! <enter><enter><color=green>˵��<color>: ����ʹ��<color=yellow>�ƽ�ʦͽ��<color>.");
		return 0;
	end
	if (nLevel >= 30 and GetBit(nValue, GSP_TASKID_TAG_BIT_30BONUS) == 0) then
		nPrizeLevel = 30;
		nBit = GSP_TASKID_TAG_BIT_30BONUS;
		nBonus = 300000; -- 30W
	-----------------
	elseif (nLevel >= 40 and GetBit(nValue, GSP_TASKID_TAG_BIT_40BONUS) == 0) then
		nPrizeLevel = 40;
		nBit = GSP_TASKID_TAG_BIT_40BONUS;
		nBonus = 400000; -- 40W
	-----------------
	elseif (nLevel >= 50 and GetBit(nValue, GSP_TASKID_TAG_BIT_50BONUS) == 0) then
		nPrizeLevel = 50;
		nBit = GSP_TASKID_TAG_BIT_50BONUS;
		nBonus = 1000000; -- 100W
	end
	-----------------
	if (nBonus > 0) then
		Earn(nBonus);
	elseif (nLevel >= 80 and GetBit(nValue, GSP_TASKID_TAG_BIT_80BONUS) == 0) then
		nPrizeLevel = 80;
		nBit = GSP_TASKID_TAG_BIT_80BONUS;
		if (gsp_prize_skills90() == 0) then -- ѧ��90������ = 0:ѧϰʧ��
			nPrizeLevel = 0;
			nBit = 0;
		end
	end
	-----------------
	
	if (nPrizeLevel ~= 0) then
		print("Value:"..nValue)
		nValue = SetBit(nValue, nBit, 1); -- ������ȡ���
		print("Value:"..nValue)
		SetTask(GSP_TASKID_ROLEREINFO, nValue);
		Talk(1, "", "<color=green>ͨ��<color>: ����"..nPrizeLevel.."���׶εĽ�������Ŭ����Ŷ");
	else
		Talk(1, "", "<color=green>ͨ��<color>: �����콱������Ŷ!");
	end
end

-- CDKEY���������ش���
function gsp_cdkey_verify_result(nResult)

	local szMsg = 
	{
		"����������ʱ������ϵGM!",
		"cd-key ��Ч��������Ե�cd-key!",
		"cd-key ��ȷ���˺��Ѽ����ϲ����ͨ��!",
		"ʧ�ܣ��˺���ʹ��10��Сʱ�������ٵ�¼!",
		"ʧ�ܣ����˺��Ѽ�������ٵ�¼��!"
	};
	local nSel = 1;
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2;
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3;
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4;
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 5;
	end

	gsp_writeLog(szMsg[nSel].." result: "..nResult);
	Msg2Player(szMsg[nSel]);
	Talk(1, "", " [<color=green>ͨ��<color>]"..szMsg[nSel]);

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
		gsp_config_for_join();
	end
	
	return 1;
end

-- ����ϵͳ�����������Ϣ
function gsp_config_for_join()
	-- ����CDKEY����
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, GSP_ACCOUNT_TYPE_CDKEY - nValue);
	
	gsp_accept_goldcard();
end

-- ���ܻƽ�ʦͽ��
function gsp_accept_goldcard()
	-- ���ý�ɫ���� for spreader
	SetTask(GSP_TASKID_ROLEREINFO, 0); -- �����㣬���ޱ�Ҫ��
	local nTaskValue = 0;
	nTaskValue = SetByte(nTaskValue, GSP_TASKID_TAG_BYTE_ROLETYPE, GSP_TASKID_ROLETYPE_CDKEY);
	SetTask(GSP_TASKID_ROLEREINFO, nTaskValue);
	--print("GSP_TASKID_ROLEREINFO:"..nTaskValue);
	-- ������չ������
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1);
	
	-- �ͻƽ�ʦͽ������ǻƽ�ͽ��
	AddItem(6, 1, 441, 1, 0, 0); -- �ƽ�ʦͽ��
	SetTask(TKID_GOLD_APPRENTICE, 1); -- ��ǽ�ɫΪ�ƽ�ͽ��
	
	local szMsg = "���� <color=yellow>ʦͽ�ƽ𿨮�<color>! ��������ʦ�����ʦ�������úཱܶ��!"; 
	Msg2Player(szMsg);
	Talk(1, "", "<color=green>ͨ��<color>:"..szMsg);
	-- gsp_writeLog("��ûƽ�ʦͽ��");
end

------------------
-- 90������
SKILLS_90 = {
	{	{318,1},{319,1},{321,1}}, --����
	{	{322,1},{323,1},{325,1}}, --����
	{	{339,1},{302,1},{342,1},{351,0}}, --����
	{	{353,1},{355,1},{390,0}}, --�嶾
	{	{328,1},{380,1},{332,0}}, --����
	{	{336,1},{337,1}}, --����
	{	{357,1},{359,1}}, --ؤ��
	{	{361,1},{362,1},{391,0}}, --����
	{	{365,1},{368,1}}, --�䵱
	{	{372,1},{375,1},{394,0}}, --����
}

function gsp_prize_skills90()
	local faction = GetLastFactionNumber()
	if(faction ~= -1) then
		for i=1,getn(SKILLS_90[faction+1]) do
			-- û��ѧ�����ż��ϣ���������ԭ���ļ���
			if (HaveMagic(SKILLS_90[faction+1][i][1]) == -1) then
				AddMagic(SKILLS_90[faction+1][i][1],SKILLS_90[faction+1][i][2])
			end
		end
		Msg2Player("��ϲ���ѳ��� <color=green>ͨ�����ս<color>, ��������90������ ")
		AddGlobalNews("���һ��ף��"..GetName().."˳��ͨ��ͨ�����ս�����������ŵ�90������.")
		return 1;
	end
	Msg2Player("��δ�������ɣ���������90������!")
	Talk(1, "", "��δ�������ɣ���������90������!");
	return 0;
end

-- ����Ƿ���ԭռ�ǰ�Ჹ��
function check_castellan_remedy()
	if (GetBit(GetTask(TASKVALUE_BLEND), 3) == 1) then
		return 1;
	end
	return 0;
end

-- �����ԭռ�ǰ�Ჹ���������
function clear_castellan_remedy()
	local value = GetTask(TASKVALUE_BLEND)
	value = SetBit(value, 3, 0)
	SetTask(TASKVALUE_BLEND, value)
end

-- ԭռ�ǰ�Ჹ��
function about_castellan_remedy()
	if (check_castellan_remedy() == 1) then
		Say("<#> ���ڷ����ϰ�������ϵͳ����������Ȩ�ޡ����Ǽ�ʱ�⳥������������ʲô�⳥?",
			2,
			"<#> �������⳥/take_castellan_remedy",
			"<#> �Ժ������/cancel");
	else
		deny()
	end
end

-- ��ȡԭռ�ǰ�Ჹ��
function take_castellan_remedy()
	Say("<#> ÿ��ռ�ǰ�����⳥������60�����ش���(�ɰ�����ȡ) ��500000000 ��(ֱ�ӷ���������) . ��ȷ��װ���ϻ��п�λ��������������?",
		2,
		"<#> ����������/take_castellan_remedy2",
		"<#> �Ժ�������/cancel")
end

function take_castellan_remedy2()
	if (check_castellan_remedy() == 1) then
		for i = 1, 60 do
			AddItem(6, 1, 402, 0, 0, 0, 0)
		end
		local now = date("%Y-%m-%d %H:%M:%S")
		local name = GetName()
		WriteLog(now .. " �⳥��ռ�ǰ��" .. name .. "���60�����ش����")
		Msg2Player("<#> ���û��60�����ش����")

		tong, res = GetTong()
		if (res == 1 and tong ~= "") then
			local money = 500000000
			AddTongMoney(tong, money)
			WriteLog(now .. " �⳥��ռ�ǰ��" .. name .. "Ŀǰ���" .. tong .. "���60�����ش����")
			Msg2Player("<#> ��İ����" .. money .. " ��")
		end
		clear_castellan_remedy()
	end
end

-- ������Ҹ��Ľ�ɫ���Ի�
function about_rename_role()
	local strInfo = "<#> ���ã��������������������ҵ�������ͬ������ϵͳ�Ѱ���������������޸�֮ǰ�����֣����Լ���Ǹ����ֿ�������ע�⣬��ֻ��Ψһ��һ�λ����������С��.";
	local strError= "<#> �Բ����㲻�ܽ��дβ�����( ֻ�ܸ����������֣�������֣�ռ�ǰ���������) . ����ϵGM�˽�����";
	func_online_rename_role(strInfo, strError);
end

function rename_role_tranfer()
	local strInfo = "<#>��ֻ��Ψһ��һ�θ������ᣬ�����ȿ���ѡ���ھ���֮ǰ������ϸ����Ϣ!";
	local strError= "<#> �㲻��ִ�иò�����ֻ��ת���µķ��������˲��ܽ��С�����ϵ�������˽�����!";
	func_online_rename_role(strInfo, strError);
end

-- ���������İ����
function about_rename_tong()
	if (check_renametong() == 1) then
		Say("<#> ���ã��������������������ҵ�������ͬ������ϵͳ�Ѱ���������������޸�֮ǰ�����֣����Լ���Ǹ����ֿ�������ע�⣬��ֻ��Ψһ��һ�λ����������С��.",
			3,
			"<#> ��ѯ������Ƿ����/query_tongname",
			"<#>�����Լ����ڰ��İ����/change_tongname",
			"<#>�һ����´��������İ�/cancel")
			else
		deny()
	end
end

-- ��ѯ�����
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 20, "<#> ������Ҫ��ѯ�İ����");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- ���İ����
function change_tongname()
	Say("<#> ���岽�裺����NPC�ĶԻ�������Ҫ���ĵİ���������������ĳɹ���ϵͳ�������ĳɹ���ʾ������ϵͳ�´�ά���󣬸��������ڰ��İ�������������ʧ�ܣ����������½��������Ĳ��衣������������쳣���������ͷ���Ա��ϵ��", 
		2,
		"<#>��ʼ���İ����/change_tongname2",
		"<#>���ٿ���һ��/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 20, "<#> Xin nh�p t�n Bang h�i m�i v�o");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#>ֻ�а������ܸ��İ����")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#>�����޸ĳ���ͬ�İ����", 1, "<#>֪����/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny()
	Say("<#> �Բ����㲻�ܽ��иò���. ( ֻ�ܸı��������ƣ�������ƣ���������) .����ϵGM�˽�����",
		1,
		"<#> ֪����!/cancel")
end
