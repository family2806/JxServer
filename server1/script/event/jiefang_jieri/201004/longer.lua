
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
	--�����Ի���
--����npcС����ְ�� - modified by DinhHQ - 20110427
--	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("������", FreedomEvent2010.LongerEventItemDlg, {FreedomEvent2010})
--	end
	
	tbDailog:Show()
end
