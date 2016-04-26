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
	tbDailog.szTitleMsg = "<#><npc>你好，大侠。你可以参加试炼，有本门的试炼卡了吗?"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog:AddOptEntry("是的，请大人带我进去.",enter_shiliantang)
	
	--弹出对话框
	tbDailog:Show()
end

function enter_shiliantang_callback(nPlayerIndex, tbDungeonData, bSaved)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
	if (tbDungeonData == nil) then
		if (PlayerFunLib:CheckItemInBag("return {tbProp={6,1,2317,-1,-1,0},}", 1, "本次选择非常重要，请出示试炼卡才能参加.") ~= 1) then
			return
		end
	end
	
	tbDungeonManager:OpenDungeon("试炼堂");
			
	PlayerIndex = nOldPlayer;
end
function enter_shiliantang()
	local tbDungeon = tbDungeonManager:GetMineDungeon("试炼堂", 1);
	if (tbDungeon == nil) then
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CheckExist", {925, GetName()},
			"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua", "enter_shiliantang_callback", {PlayerIndex});
	else
		tbDungeonManager:EnterDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end