Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")

function main()	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>��ã�����������Բμ��������б��ŵ�����������?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog:AddOptEntry("�ǵģ�����˴��ҽ�ȥ.",enter_shiliantang)
	
	--�����Ի���
	tbDailog:Show()
end

function enter_shiliantang_callback(nPlayerIndex, tbDungeonData, bSaved)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	if (tbDungeonData == nil) then
		if (PlayerFunLib:CheckItemInBag("return {tbProp={6,1,2317,-1,-1,0},}", 1, "����ѡ��ǳ���Ҫ�����ʾ���������ܲμ�.") ~= 1) then
			return
		end
	end
	
	tbDungeonManager:OpenDungeon("������");
			
	PlayerIndex = nOldPlayer;
end
function enter_shiliantang()
	local tbDungeon = tbDungeonManager:GetMineDungeon("������", 1);
	if (tbDungeon == nil) then
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CheckExist", {925, GetName()},
			"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua", "enter_shiliantang_callback", {PlayerIndex});
	else
		tbDungeonManager:EnterDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end