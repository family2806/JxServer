
---------------------------------------------------------------------------------
--  �������������ļ������ַ���
---------------------------------------------------------------------------------

-- ��ٽű�
-- Li_Xin 2004-8-17
--Include( "\\script\\global\\����.lua" )

--TASKID_HOLIDAY_GIFT_DATE = 160;				-- �������ID of ������һ����ȡ��������ʱ��
--TASKTMPID_HOLIDAY_GIFT_DATE = 160;			-- ��ʱ�������ID of ������һ����ȡ��������ʱ��
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")	-- ���ǽ���
Include("\\script\\event\\superplayeract2007\\event.lua")----������һ
Include("\\script\\event\\great_night\\event.lua")	-- �Ի�֮ҹ
Include("\\script\\misc\\ex_goldequp_coin.lua");	-- �һ��ƽ�װ������
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua");
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\Npc.lua") -- ����


-- Խ��0904��Ż
--Include("\\script\\event\\jiefang_jieri\\200904\\zhanshenzhujiu\\jiu_hecheng.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\jinnangshijian\\jinnangshijian.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

Include("\\script\\event\\guoqing_jieri\\200908\\compose.lua")
Include("\\script\\event\\other\\jilixinwanjia\\200908\\npcdailog.lua")

-- Խ��0905���ջ
--Include("\\script\\event\\birthday_jieri\\200905\\npc\\npc_liguan_dailog.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_npc.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\activitysys\\npcfunlib.lua")

Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
Include("\\script\\vonghoa\\exchangitem\\exchangeitem.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua");--20100908 haint code function trao giai thdnb
Include("\\script\\baoruongthanbi\\dialogmain.lua")
Include("\\script\\vlkh\\vlkh1.lua")

--tinhpn 20101022: Event Thang 10
Include("\\script\\vng_event\\201010\\head.lua")
Include("\\script\\vng_event\\compensate.lua")
Include("\\script\\vng_event\\traogiai\\vldnb2010\\vlbnb.lua")

--[DinhHQ]
	--[20110107]:trao giai Phuong Anh Hao thang 12 2010
	Include("\\script\\vng_event\\traogiai\\pah_12_2010\\head.lua")
	--[20110124]:Vip account 2011
	Include("\\script\\vng_event\\vip_account_2011\\npc\\lequan.lua")
	--[20110216]:THDNB8
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_thdnb8_award.lua")
	--[20110225]: 8/3/2011
	Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\lequan.lua")
	--[20110311]: NPAH thang 02 2011
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_npah0211.lua")
	
	Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_main.lua")

function main()
	

	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
--[DinhHQ]
	--[20110107]:�콱��Ӣ������
	--	tbPAH122010_Head:addDialog(tbDailog)
	--[20110124]:Vip account 2011
	tbVNG_VipAcc2011_LeQuan:addDialog(tbDailog)
	--[20110216]:THDNB8
	tbVNG_THDNB8:AddDialog(tbDailog)
	--[20110225]: 8/3/2011
	tbVNGWD2011_LeQuan:AddDialog(tbDailog)
	--[20110311]: NPAH thang 02 2011
	tbVNG_NPAH0211:AddDialog(tbDailog)
	--���⻷VLMC2011 - Modified by DinhHQ - 20110523
	tbVLMC2011_Tittle:AddDialog(tbDailog)
	tbVngToolAward:AddDialog(tbDailog)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--�����Ի���
	tbDailog:AddOptEntry("�Ի�֮ҹ", onGreat_Night)
--	tbDailog:AddOptEntry("�μ����ر���", BRTB_Dialog_main)
--	tbDailog:AddOptEntry("�����ֵ�һ���սά", GetBonusVLDNB2010_main)
--	tbDailog:AddOptEntry("��ȡͭǮ", Compensate_main)
--	if (VH_ActiveDay()==1) then
--		tbDailog:AddOptEntry("������8�µ� event ��Ʒ", ExChangeItem_main)
--	end
	tbDailog:AddOptEntry("��Pass��", ResetBox.ShowDialog, {ResetBox})
	
	--tinhpn 20101022: Event Thang 10
--	if (Event201010:IsActive() == 1) then
--		tbDailog:AddOptEntry("�һ�10�µĻ��Ʒ", Event201010.ShowDialog, {Event201010}) 	
--	end
	
	if IsIPBonus() then
		tbDailog:AddOptEntry("����ʹ��CSM����", IpBonus)
	end
	
	--tinhpn 20100817: Online Award
--	if (OnlineAward_StartDate() ~= 0 and OnlineAward_Check_TransferLife() ~= 0) then
--		tbDailog:AddOptEntry("�μ� online �콱", OnlineAward); 
--	end
	
	local ncity = gb_GetTask("MAINCITYCFG", 1);
	local nCurMapID = SubWorldIdx2ID(SubWorld);
	if (ncity >= 1 and ncity <= 7 and nCurMapID == TB_MAINCITY_CITYWAR_T[ncity][2]) then
		tbDailog:AddOptEntry("��ȡ̫�ؽ�Ʒ", maincity_award_entry)	
	end
	if tbJILIWanJia0908:IsActDate() then
		tbDailog:AddOptEntry("�����ֻ", tbJILIWanJia0908.DailogMain, {tbJILIWanJia0908} )
	end
		
		
	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("սʿ������", FreedomEvent2010.LiGuanEventItemDlg, {FreedomEvent2010}) 	
	end
	
	if tbRefiningIron:CheckCondition() == 1 then
		tbDailog:AddOptEntry("�������", tbRefiningIron.NpcTalk, {tbRefiningIron}) 	
	end
	
	tbDailog:Show()
end

function jiefang0904_act()
	Say("���: ��������ף����ջ�ڼ䣬����С�����˸߲��ҵ���ףʤ����������μ���?", 6, 
			"������ȡ�����¼�/jf0904_getjinnangshijian",
			format("ʤ���ƻ/#tbJiefang0904_jiu:OnDailogMain()"),
			"�Ƕ�FanXiPan�/about_denggao",
			"����ǧ��/about_shuizei",
			"����ˮ������/about_shuizei",
			"��ֻ�ǿ���!/OnCancel");
end

Include([[\script\event\menglan_2006\menglan_2006.lua]]);
function v_menglanjie()
	Say("�Ҵ������ַ��ɸ�л��ף����!", 7, 
		"�Ұѽ������⻷���͸���/#v_mljaward(1)",
		"�Ұ�ľ�����⻷���͸���/#v_mljaward(2)",
		"�Ұ�ˮ�����⻷���͸���/#v_mljaward(3)",
		"�Ұѻ������⻷���͸���/#v_mljaward(4)",
		"�Ұ��������⻷���͸���/#v_mljaward(5)",
		"�Ұ������⻷���͸��㣬ÿ��ϵһ��./v_mljaward_all",
		"��ֻ�Ǻ���·����������!/OnCancel"
	);
end;

function v_mljaward(nIdx)
	if (CalcEquiproomItemCount(6,1,tab_NPCIdx[nIdx][1] + 5,-1) < 1) then
		Say("�㲻�����"..tab_NPCIdx[nIdx][2].."��? �����û�д�"..tab_NPCIdx[nIdx][2].."!", 1, "����ȥ׼��!/OnCancel")
		return
	end;
	
	local nCount = GetTask(tab_NPCIdx[nIdx][3]);
	if (nCount >= SIMGER_LIMIT) then
		Say("���Ѿ����͹�"..tab_NPCIdx[nIdx][2].."�ˣ����͵��İ�!", 0);
		return
	end;
	
	ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[nIdx][1] + 5, -1);
	SetTask(tab_NPCIdx[nIdx][3], nCount + 1);
	AddOwnExp(500000);
	Say("̫����ˣ��������ַ��ɺͶ�ü���������һ������.", 1, "��������./OnCancel");
	Msg2Player("��õ� <color=yellow>500000<color> �㾭��.");
end;

function v_mljaward_all()
	for i = 1, getn(tab_NPCIdx) do
		if (CalcEquiproomItemCount(6,1,tab_NPCIdx[i][1] + 5,-1) < 1) then
			Say("�㲻�����"..tab_NPCIdx[i][2].."��? �����û�д�"..tab_NPCIdx[i][2].."!", 1, "����ȥ׼��!/OnCancel")
			return
		end;
	end;
	
	local nCount = GetTask(TK_LOTUS_ALL);
	if (nCount >= TOGETHER_LIMIT) then
		Say("����лл�㣡����12������Ѿ����������.", 0);
		return
	end;
	
	for i = 1, getn(tab_NPCIdx) do
		ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[i][1] + 5, -1);
	end;
	SetTask(TK_LOTUS_ALL, nCount + 1);
	
	AddOwnExp(1000000);
	AddItem(6, 1, 1136, 1, 0, 0, 0); --��һ��������
	Say("̫����ˣ��������ַ��ɺͶ�ü���������һ������.", 1, "��������./OnCancel");
	Msg2Player("��õ�<color=yellow>1000000<color>�㾭���1��<color=yellow>���<color>");
end;

-- �����б�
aryHoliday = {	-- ����ʱ��, ���Ͻ���ʱ������������, �ظ�����Ʒ����ʾ�ı� 
				{ 20040822, onHoliday_QiXi, "������ô�ã�����2λ��ô��ȥ��԰�أ��������ʲô?" }
				-- ��������
			 };
	
function valentineGift()
	if (GetBit(GetTask(67),24) == 1) then
		if (GetBit(GetTask(1313),1) ~= 1) then
			SetTask(1313, SetBit(GetTask(1313), 1, 1))
			Talk(1, "", "<#>��������Щϲ����Ե���˵ĺ����ӣ���������Ҫ�͸������ˣ�ף��λ��ͷ���ϣ�")
			-- ��2����������ӡ����
			for i = 1, 2 do
				AddItem( 6, 1, 18, 1, 0, 0 ,0);
			end
			Msg2Player( "<#>��õ�����������ӡ��" );
			-- ��9�䡰õ�廨��
			for i = 1, 9 do
				AddItem( 6, 0, 20, 1, 0, 0 ,0);
			end	
			Msg2Player( "<#>��õ�9��õ��!" );
			-- 50��������Ҽ���1������ɽ��¶��
			if( GetLevel() >= 50 ) then
				AddItem(6, 1, 72, 1, 0, 0, 0);
				Msg2Player( "<#>��õ�һƿ��ɽ��¶" );
			end
		else
			Talk(1, "", "<#>�㲻���Ѿ���ȡ������?�ñ������ɣ�")
		end
	else
		Talk(1, "", "<#>�㻹û�н�飬����������")
	end
end		 	
---------------- ȡ�� ----------------------------------------
function OnCancel()
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. ": �˻�:" .. GetAccount() .. ", ����:" .. GetName() .. "," .. object);
end
