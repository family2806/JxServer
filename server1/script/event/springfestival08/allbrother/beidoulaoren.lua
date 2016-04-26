Include("\\script\\event\\springfestival08\\allbrother\\event.lua");	-- 
Include("\\script\\event\\BeiDouChuanGong\\zhizuochuangongwan.lua");	-- 
Include("\\script\\event\\other\\xunmashu\\dialog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua");			-- 多重转生对话
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
	tbDailog.szTitleMsg = "大家好，我是北斗门的传人，不知各位要什么?";
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog:AddOptEntry("四海皆兄弟任务", allbrother_0801_main);
	tbDailog:AddOptEntry("练传功仙丹", BeiDouChuanGong_main, {1});
	tbDailog:AddOptEntry("寻找北斗长生术", beidou_translife_main);
	--暂闭技能TS 4 - Modified By DinhHQ - 20111102
	--tbDailog:AddOptEntry("我想学千秋战役", beidou_learn_specialskill);
	
	if tbXunMaShu0903:IsActDate() then
		tbDailog:AddOptEntry("活动 [神秘宝箱]", tbXunMaShu0903.DialogMain_Box, {tbXunMaShu0903});
		tbDailog:AddOptEntry("北斗驯马术", tbXunMaShu0903.DialogMain_Horse, {tbXunMaShu0903});
	end
	
	tbDailog:Show();
end