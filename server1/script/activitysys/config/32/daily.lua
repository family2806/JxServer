Include("\\script\\activitysys\\config\\32\\head.lua")
Include("\\script\\activitysys\\config\\32\\variables.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
Include("\\script\\activitysys\\config\\32\\gatherdailytask.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
Include("\\script\\lib\\log.lua")
--·çÔÆÁîÅÆ-¼ÇÂ¼ÎäÁÖÃËÖ÷ÈÎÎñÍê³É´ÎÊı- Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")

function pActivity:IsOpen()
	return 1;
end

function pActivity:Init()
	%tbKillDailyTask:Init();
	%tbGatherDailyTask:Init();
	%tbTalkDailyTask:Init();
end

function pActivity:AcceptKillTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbKillDailyTask:AcceptTask();
end

function pActivity:AcceptTalkTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbTalkDailyTask:AcceptTask();
end

function pActivity:AcceptGatherTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbGatherDailyTask:AcceptTask();
end

function pActivity:CompletKillTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbKillDailyTask:CompleteTask() == 1) then
		--·çÔÆÁîÅÆ-¼ÇÂ¼ÎäÁÖÃËÖ÷ÈÎÎñÍê³É´ÎÊı- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "KillTask");
		--¸ü¸ÄÃ¿ÈÕNhiÖm vô S¸t qu¸i ½±Àø- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Hoµn thµnh nhiÖm vô hµng ngµy(%s) nhËn ®­îc %d c¸i %s", "NhiÖm vô S¸t qu¸i ", 15000000, "kinh nghiÖm "));
		Talk(1,"",format("%s, Ng­¬i qu¶ lµ mét vŞ ®¹i hiÖp. §©y lµ mãn quµ nhá ta tÆng cho ng­¬i, mong h·y nhËn lÊy. Ngµy mai gÆp l¹i nhĞ.", GetSex() == 1 and "ChŞ " or "Ca Ca"));
		
	end
end

function pActivity:CompletTalkTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbTalkDailyTask:CompleteTask() == 1) then
		--·çÔÆÁîÅÆ-¼ÇÂ¼ÎäÁÖÃËÖ÷ÈÎÎñÍê³É´ÎÊı- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "TalkTask");
		--¸ü¸ÄÃ¿ÈÕNhiÖm vô §èi tho¹i ½±Àø- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Hoµn thµnh nhiÖm vô hµng ngµy(%s) nhËn ®­îc %d c¸i %s", "NhiÖm vô §èi tho¹i ", 15000000, "kinh nghiÖm "));
		Talk(1,"",format("%s, Ng­¬i qu¶ lµ mét vŞ ®¹i hiÖp. §©y lµ mãn quµ nhá ta tÆng cho ng­¬i, mong h·y nhËn lÊy. Ngµy mai gÆp l¹i nhĞ.", GetSex() == 1 and "ChŞ " or "Ca Ca"));
		
	end
end

function pActivity:CompletGatherTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbGatherDailyTask:CompleteTask() == 1) then
		--·çÔÆÁîÅÆ-¼ÇÂ¼ÎäÁÖÃËÖ÷ÈÎÎñÍê³É´ÎÊı- Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "GatherTask");
		--¸ü¸ÄÃ¿ÈÕNhiÖm vô thu thËp½±Àø- Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 10000000}, format("Hoµn thµnh nhiÖm vô hµng ngµy(%s) nhËn ®­îc %d c¸i %s", "NhiÖm vô thu thËp", 10000000, "kinh nghiÖm "));
		Talk(1,"",format("%s, Ng­¬i qu¶ lµ mét vŞ ®¹i hiÖp. §©y lµ mãn quµ nhá ta tÆng cho ng­¬i, mong h·y nhËn lÊy. Ngµy mai gÆp l¹i nhĞ.", GetSex() == 1 and "ChŞ " or "Ca Ca"));
		
	end
end

function pActivity:TalkToNpc()
	%tbTalkDailyTask:TalkToNpc();
end