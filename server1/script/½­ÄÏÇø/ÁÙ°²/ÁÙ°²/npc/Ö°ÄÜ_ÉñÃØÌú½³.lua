-- ���ܣ�����װ��
-- С�˶�� 2008.1.14

Include( "\\script\\task\\system\\task_string.lua" );

-- ����
Include("\\script\\global\\recoin_goldenequip.lua")
-- ������������
Include("\\script\\task\\equipex\\head.lua");
-- �׽�װ��
Include("\\script\\global\\platina_upgrade.lua")
--�����׽�װ��
--Include("\\script\\global\\recoin_platinaequip.lua")
--Include("\\script\\event\\reclaim_equip\\reclaim_equip.lua") --���հ���Ʒ
--��������װ��
Include("\\script\\event\\equip_publish\\jinwu\\refine_equip.lua")
Include("\\script\\misc\\itemexchangevalue\\itemexchangevalue.lua") -- �һ���������
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_lingpai.lua")	-- �һ���װ�����ƣ������ȣ�
Include("\\script\\activitysys\\npcdailog.lua")

--�������� - By DinhHQ
Include("\\script\\vng_feature\\trungluyen\\refine_equip.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<dec><npc>�벻��������������ô�ã����Ǳ����ҵ��ˣ��������Ϊ����<color=yellow>�׽�װ��<color>�����İɡ�"
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg , "<dec>", "")
	local aryDescribe =
	{
		--"����������������������ε�����/main_talk",		
		--"������������׽�װ��/platina_main",
		"����������������װ��/refine_jinwu",		
		--"�������������׽�װ��/recoin_platina_main",
		--Change request 04/06/2011,�ر�����׽�װ�� - Modified by DinhHQ - 20110605
		--"���������æ���һЩ�ƽ�װ��/split_entry",
		--"��������Ƭ�ϳ�һЩ�ƽ�װ��/compose_entry",
		--"���뻻��Ѫ��/exchange_tiexuedan",
		--"�������������Ӱ���ε�����/perfect_hongying_main",
		--"��������һЩ����Ĵ������/equipex_recycle_main",
		--"�������Ƭ������ͬ�ƽ�װ����������Ƭ/exchange_entry",
		"������װ����ȡ��������/exchange_olditem",
		"�����þ������任ȡװ������/exchange_lingpai",
		"���������ƻ�ȡװ��/exchange_lingpai2goldequip",
	}	
	
	--��������
	--tbDailog:AddOptEntry("����������������װ��", tbVNG_RefineEquip.ShowDialog, {tbVNG_RefineEquip})	
	
	for i = 1, getn(aryDescribe) do
		local _,_, szOpt, szFun = strfind(aryDescribe[i], "([^/]+)/([^/]+)")
		local fn = getglobal(szFun)
		if fn then
			tbDailog:AddOptEntry(szOpt, fn);	
		end
	end
	
	--�����Ի���
	tbDailog:Show()
	
-- ������������������񣬲���ѡ��
--	local nNextStatus = check_nexttask_status();
--	if (check_nexttask_condition() == 1) then
--		tinsert(aryDescribe, 2, "����������������İ�������/nexttask_talk");
--	end
--	tinsert(aryDescribe, 2, "�������ð�װ��/reclaimBindEquip_main");
	
end

function exchange_tiexuedan()
	if (CalcFreeItemCellCount() < 2) then
		Say("Ϊ������Ʒ�İ�ȫ��������2�����ϵĿո�", 0);
		return
	end
	GiveItemUI("����Ѫ��", "�������1�����ɻƽ�װ����������", "do_exchange_tiexuedan", "onCancel")
end

function do_exchange_tiexuedan(nCount)
	if nCount ~= 1 then
		CreateTaskSay({"������Ʒ����������Ҫ��", "�治����˼������������/exchange_tiexuedan", "�治����˼����һ�����./onCancel"});
		return
	end

	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);	--Ʒ��
	
	if (nQuality ~= 1 or GetGlodEqIndex(nItemIndex) > 140) then
		CreateTaskSay({"Ҫ������1�����ɻƽ�װ��", "�治����˼������������/exchange_tiexuedan", "�治����˼����һ�����./onCancel"});
		return
	end
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"����Ѫ��Error",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"������ɻƽ�װ��ʧ��:\t"..GetItemName(nCurItemIdx)));
	end
	
	
	for i = 1, 20 do
		AddItem(6, 1, 2163, 1, 1, 0);
	end
	Msg2Player("��ϲ��õ�20����Ѫ��!");
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"����Ѫ�� Success",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			format("�� %s �õ���Ѫ��", GetItemName(nItemIndex))));
end
