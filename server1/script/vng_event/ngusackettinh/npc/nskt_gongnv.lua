Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\ngusackettinh\\npc\\nskt_compose_item.lua")

tbNSKT_gongnv = {}

function tbNSKT_gongnv:addDialog(tbDialog)
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	if ((nCurDay >= tbNSKT_head.nStartDay) and (nCurDay < tbNSKT_head.nItemExpiredTime)) then
		tbDialog:AddOptEntry("��ʽᾧ�",tbNSKT_gongnv.main,{tbNSKT_gongnv})
	end			
end

function tbNSKT_gongnv:main()	
	local tbMainDialog = 	self:createDiaglog()
	tbMainDialog.szTitleMsg = "���쵽�ˣ���ȴ��δ׼��ʲô��Ŀǰ������Ҫһ��������װ��ʥ��ҹ�����������ң��ҽ���������"
	if (tbNSKT_head:isActive() == 1)then
		tbMainDialog:AddOptEntry("���ܻ", tbNSKT_gongnv.description, {tbNSKT_gongnv})
		tbMainDialog:AddOptEntry("�ϳɽᾧ", tbNSKT_gongnv.crystalCompose, {tbNSKT_gongnv})
	end	
	tbMainDialog:AddOptEntry("�����ǻ", tbNSKT_gongnv.luckyStarActivity, {tbNSKT_gongnv})
	tbMainDialog:AddOptEntry("������", tbNSKT_gongnv.horseAward, {tbNSKT_gongnv})
	tbMainDialog:Show()			
end

function tbNSKT_gongnv:description()	
	local tbDescDialog =	self:createDiaglog()
	tbDescDialog.szTitleMsg = "ʥ���쵽�ˣ������æ��׼����Ϊʲô�㻹�������ȥ��ҳ�����μӵ���ʽ��"
	tbDescDialog:AddOptEntry("����", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbDescDialog:Show()
end

function tbNSKT_gongnv:crystalCompose()
	local tbComposeDialog =	self:createDiaglog()
	tbComposeDialog.szTitleMsg = "�ᾧ��Ư����������кܶྪϲ"
	tbComposeDialog:AddOptEntry("��ɫ�ᾧ", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"��ɫ�ᾧ"})
	tbComposeDialog:AddOptEntry("��ɫ�ᾧ", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"��ɫ�ᾧ"})
	tbComposeDialog:AddOptEntry("��ɫ�ᾧ", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"��ɫ�ᾧ"})
	tbComposeDialog:AddOptEntry("����", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbComposeDialog:Show()	
end

function tbNSKT_gongnv:luckyStarActivity()
	local tbStarActDialog =	self:createDiaglog()
	tbStarActDialog.szTitleMsg = "ʥ��������Ư�������͸�����?"
	tbStarActDialog:AddOptEntry("��", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"����"})
	tbStarActDialog:AddOptEntry("����", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbStarActDialog:Show()	
end

function tbNSKT_gongnv:horseAward()
	local tbHorseAwardDialog =	self:createDiaglog()
	tbHorseAwardDialog.szTitleMsg = "��2�л�ȡ����ʽ<enter>ʹ������6���µķ���: <color=red>60<color> ����<enter>��ʹ�����޷���: <color=red>200<color> ����"	
	tbHorseAwardDialog:AddOptEntry("����ʹ�����޷���", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"����"})
	tbHorseAwardDialog:AddOptEntry("����ʹ�����޷���", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"��ʹ�����޷���"})
	tbHorseAwardDialog:AddOptEntry("����", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbHorseAwardDialog:Show()		
end

function tbNSKT_gongnv:createDiaglog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbNSKT_gongnv:onCancel()
end