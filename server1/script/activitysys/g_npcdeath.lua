

-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 
-- 文件用途：全局NPC死亡都会掉该脚本的OnGlobalNpcDeath函数
-- 创建者　：ZERO.SYS
-- 创建时间：2009-09-28 17:57:03

-- ======================================================
--默认全局PlayerIndex为物品所有者, PlayerIndex
--nNpcIndex 死亡的npc的NpcIndex
--nAttackerIndex 最后一击者 的PlayerIndex，, 
IncludeLib("NPCINFO")
Include("\\script\\lib\\string.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\missions\\boss\\bigboss.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
--tinhpn 20100706: Vo Lam Minh Chu
Include("\\script\\bonusvlmc\\killmonster.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function OnGlobalNpcDeath(nNpcIndex, nAttackerIndex)
	if PlayerIndex and PlayerIndex > 0 then
		--PlayerEvent:OnEvent("OnKillNpc", nNpcIndex, nAttackerIndex)

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
		EventSys:GetType("NpcDeath"):OnEvent(szNpcName, nNpcIndex, nAttackerIndex)
		
		local nTeamSize = GetTeamSize()
		if nTeamSize > 0 then
			for i=1, nTeamSize do
				local nPlayerIndex = GetTeamMember(i)
				lib:DoFunByPlayer(nPlayerIndex, tbKillMonster.KillMonster, tbKillMonster, nNpcIndex)
				--tinhpn 20100706: VLMC
				lib:DoFunByPlayer(nPlayerIndex, VLMC.KillMonster, VLMC, nNpcIndex)
			end
		else
			tbKillMonster:KillMonster(nNpcIndex)
			--tinhpn 20100706: VLMC
			VLMC:KillMonster(nNpcIndex)
		end
		tbKillDailyTask:OnKillMonster(nNpcIndex)		
		G_ACTIVITY:OnMessage("NpcOnDeath", nNpcIndex)
		G_TASK:OnMessage("翠烟", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("峨眉", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("唐门", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("丐帮", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("五毒", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("天忍", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("少林", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("武当", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("天王", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("昆仑", nNpcIndex, "KillNpc")
		DynamicExecute("\\script\\missions\\tianchimijing\\floor4\\bossdeath.lua", "OnDeath", nNpcIndex, PlayerIndex)
		-- 闯关调整 2011.03.03
		DynamicExecute("\\script\\missions\\challengeoftime\\chuangguang30.lua", "ChuangGuan30:OnNpcDeath", nNpcIndex, PlayerIndex)
		-- 转生4怪物死亡掉落霹雳弹
		DynamicExecute("\\script\\task\\metempsychosis\\npcdeath_translife_4.lua", "OnNpcDeath", nNpcIndex, PlayerIndex)
		
		-- 炼金活动掉落
		if NpcFunLib:CheckBoatBoss(nNpcIndex) == 1 and tbRefiningIron:IsCarryOn() == 1 then
			tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, {tbProp={6,1, 2293, 1,0,0,},nExpiredTime=tbRefiningIron.nCloseDate,}, "水贼首领炼金活动掉落", 1)
		end
		
		if (DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\main.lua", "FreedomEvent2010:IsActive1") == 1) then
			DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\soldier\\main.lua", "Soldier2010:MonsterDrop", nNpcIndex, PlayerIndex);
		end
		-- 活跃度世界十大boss
		DynamicExecute("\\script\\huoyuedu\\worldtop10.lua", "checkworldtop10", nNpcIndex, PlayerIndex)
	end
end
