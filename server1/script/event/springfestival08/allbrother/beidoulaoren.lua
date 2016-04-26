Include("\\script\\event\\springfestival08\\allbrother\\event.lua");	-- 
Include("\\script\\event\\BeiDouChuanGong\\zhizuochuangongwan.lua");	-- 
Include("\\script\\event\\other\\xunmashu\\dialog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua");			-- ����ת���Ի�
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\translife_4_ex.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName);
	end
	
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "��Һã����Ǳ����ŵĴ��ˣ���֪��λҪʲô?";
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog:AddOptEntry("�ĺ����ֵ�����", allbrother_0801_main);
	tbDailog:AddOptEntry("�������ɵ�", BeiDouChuanGong_main, {1});
	tbDailog:AddOptEntry("Ѱ�ұ���������", beidou_translife_main);
	--�ݱռ���TS 4 - Modified By DinhHQ - 20111102
	--tbDailog:AddOptEntry("����ѧǧ��ս��", beidou_learn_specialskill);
	
	if tbXunMaShu0903:IsActDate() then
		tbDailog:AddOptEntry("� [���ر���]", tbXunMaShu0903.DialogMain_Box, {tbXunMaShu0903});
		tbDailog:AddOptEntry("����ѱ����", tbXunMaShu0903.DialogMain_Horse, {tbXunMaShu0903});
	end
	
	tbDailog:Show();
end