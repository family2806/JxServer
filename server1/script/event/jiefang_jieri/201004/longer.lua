
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua");



function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--弹出对话框
--开启npc小龙的职能 - modified by DinhHQ - 20110427
--	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("换道具", FreedomEvent2010.LongerEventItemDlg, {FreedomEvent2010})
--	end
	
	tbDailog:Show()
end
