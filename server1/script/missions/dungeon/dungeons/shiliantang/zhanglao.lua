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
	tbDailog.szTitleMsg = "<#><npc>VŞ ®¹i hiÖp thËt lµ ®a lÔ. §· cã trong ng­êi ®· cã thİ luyÖn thiÕp ch¾c h¼n ngoµi giang hå còng lµ mét vŞ anh hïng hµo kiÖt. Mét lóc n÷a thİ luyÖn ®­êng sÏ më, trong lóc chê ®îi ®Ó ta gi¶i thİch cho ng­¬i luËt ë trong thİ luyÖn ®­êng nµy."
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	local tbDungeon = tbDungeonManager:GetMineDungeon("Thİ LuyÖn §­êng", 1);
	
	tbDailog:AddOptEntry("Xin tr­ëng l·o chØ d¹y.",readRule);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() ~= 1) then
		tbDailog:AddOptEntry("Ta muèn ®æi 1 c¬ héi triÖu tËp cung tiÔn thñ",buyChance);
	end

	tbDailog:AddOptEntry("§Õn nhËn triÖu tËp phï",getCallItem);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() == 1) then
		tbDailog:AddOptEntry("Bá qua b­íc chuÈn bŞ",skipPrepareTime);
	end
	
	tbDailog:AddOptEntry("Xem thµnh tİch cña ®ît nµy",queryKillCount);
	tbDailog:AddOptEntry("Xem nhËn ®­îc bao nhiªu huy ch­¬ng",queryMedalCount);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() == 1) then
		tbDailog:AddOptEntry("Ta ®Õn nhËn phÇn th­ëng",getAward);
	end

	tbDailog:AddOptEntry("ÎÒÏëÀë¿ªThİ LuyÖn §­êng",leave);
	
	--µ¯³ö¶Ô»°¿ò
	tbDailog:Show()
end

function buyChance()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Thİ LuyÖn §­êng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:BuyChance();
	end
end

function getAward()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Thİ LuyÖn §­êng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:GetAward();
	end
end

function leave()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Thİ LuyÖn §­êng", 1);
	if (tbDungeon ~= nil) then
		tbDungeonManager:LeaveDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end

function getCallItem()
	if (CalcEquiproomItemCount(6,1,2315,-1) >= 1) then
		Talk(1,"","Ng­¬i ®· cã triÖu tËp phï råi.");
		return
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") == 1) then
		PlayerFunLib:GetItem("return {tbProp={6,1,2315,1,0,0},}",1,"ÁìÈ¡Thİ LuyÖn §­êngÕÙ»½·û")
	end
end

function skipPrepareTime()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Thİ LuyÖn §­êng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:SkipPrepare();
	end
end

function queryMedalCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Thİ LuyÖn §­êng", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("Ä¿Ç°¸óÏÂÓĞ <color=green>%d<color> Thİ LuyÖn §­êngÑ«ÕÂ.", tbDungeon:GetMedal()));
	end
end

function queryKillCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Thİ LuyÖn §­êng", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("Ng­¬i ®· ®¸nh lïi ®­îc <color=green>%d<color> tªn thİch kh¸ch", tbDungeon:GetKillCount()));
	end
end

function readRule()
	local szTitle =  "<npc>§¹i hiÖp cã thÓ xem tr­íc quang c¶nh cña bæn ®­êng, mét lóc n÷a sÏ xuÊt hiÖn hµng lo¹t thİch kh¸ch xuÊt hiÖn. ViÖc cña ng­¬i lµ ®iÒu binh ®Ó phßng thñ. Bæn ®­êng cã 10 n¬i Èn giÊu c¬ quan, c¸c h¹ chØ cÇn ®Õn gÇn n¬i cÇn gäi cung tiÔn thñ ®Ó gäi sù trî gióp, mçi lÇn më 1 c¬ quan cÇn 100 ®iÓm tinh lùc vµ 5 huy hiÖu thİ luyÖn. Ng­¬i vÉn cã thÓ ®iÒu phèi ®Õn vŞ trİ kh¸c ®Ó ph¸t huy hÕt t¸c dông, mçi lÇn ®iÒu phèi mÊt 2 huy ch­¬ng thİ luyÖn. HÇu hÕt mçi thİch kh¸ch ®Òu cã huy ch­¬ng thİ luyÖn, ®¸nh b¹i cã c¬ may nhËn ®­îc. Sau 100 tªn thİch kh¸ch xuÊt hiÖn vÒ sau, cµng ®¸nh b¹i cµng nhiÒu th× phÇn th­ëng cµng hÊp dÉn, l·o phu còng sÏ chuÈn bŞ phÇn th­ëng hÊp dÉn h¬n. <enter>§¶ b¹i 1-49 thİch kh¸ch nhËn ®­îc méc chÕ b¶o h¹p <enter>§¶ b¹i 50-69 thİch kh¸ch nhËn ®­îc ®ång chÕ b¶o h¹p <enter>§¶ b¹i 70-89 thİch kh¸c nhËn ®­îc ng©n chÕ b¶o h¹p <enter>§¶ b¹i 90-99 thİch kh¸ch nhËn ®­îc hoµng kim b¶o h¹p <enter>§¶ b¹i 100 thİch kh¸ch trë lªn cã thÓ nhËn ®­îc huyÒn thiÕt b¶o h¹p <enter>Cßn vÒ b¶o h¹p ch­a nh÷ng phÇn th­ëng g× th× xem vËn may cña c¸c h¹ ®ã."
	local tbOpt = {}
	tinsert(tbOpt, {"§a ta tr­ëng l·o chØ d¹y."})
	CreateNewSayEx(szTitle, tbOpt);
end


function OnExit()

end;
