IL ("AI")
ai_time = 0
ai_totaltime = 0

AI_ATTACKTIME = 10
ai_doing = 0;

AI_RESPONSETIME = 10;

ai_missnpctab={};
ai_misscounttab={};

ai_freestate = 0
ai_sleepstate = 1
ai_attackstate = 2
ai_gohomestate = 3
ai_lastnpc = 0
ai_lastblood = 100

AI_ASSISTSKILLTIME = 1 * 60 * 18 / AI_RESPONSETIME/30;
AI_REPORTTIME = 2 * 60 * 18 / AI_RESPONSETIME;
ai_eatsleep = 4;

function main()
	ai_totaltime = ai_totaltime + 1
	--设置AI反应时间
	SetAITime(AI_RESPONSETIME);
	--设置视野范围、有效范围
	SetVisionRadius(600);
	SetActiveRange(2000);


	--通知剩余时间
	if ( mod(ai_totaltime,  AI_REPORTTIME) == 0 ) then 
		Sys_Msg2Player("自动打怪时间还有".. floor(AI_GetRestTime() / (60 * 18)).."分钟" );
	end

	--每隔一定时间执行一次右键技能，比如辅助技能
	if (mod(ai_totaltime, AI_ASSISTSKILLTIME) == 0) then
		DoAttack(GetRightSkill(), GetSelfIndex())
		--SetActiveSkill(GetLeftSkill())
		--str = "Assist Skill"
		--NpcChat(1,str)
		return
	end
	
	str = tostring(AI_GetRestTime());--tostring(ai_totaltime);
	ai_syncnpc();
	
	if (ai_doing == ai_sleepstate) then
		ai_sleep()
		NpcChat(1, str);
		return
	end
	
	if (ai_eatsleep > 0) then
		ai_eatsleep = ai_eatsleep - 1;
	end
	
	nBloodNow = AI_GetLifePercent()
--	if (nBloodNow > 90) then
--		SetActiveSkill(GetRightSkill())
--	else
--		SetActiveSkill(GetLeftSkill())
--	end

	--快死亡了就回城
	if (nBloodNow < 30) then
		ReturnCity()
		count=1
		Sys_Msg2Player("因血不够了回城了!!")
	--血不够就补血
	elseif (nBloodNow < 75) then 
		if (ai_eatsleep <= 0) then 
			if (HaveMagic("慈航普渡") > 0) then
				DoAttack(93, GetSelfIndex())
				ai_eatsleep = 8
			elseif (Eat(1) == 0) then
				ReturnCity()
				home_state = 0;
				count=1
				Sys_Msg2Player("回城了!!")
			end
			ai_eatsleep = 8;
		end
	end		

	--内不够的时候就喝内
	if (AI_GetManaPercent() < 40) then
		if (ai_eatsleep <= 0) then 
			Eat(2)
			ai_eatsleep = 8;
		end
	end

	--注意保持在自已的活动范围内
	if (KeepActiveRange() == 1) then 
		str = str.."KeepActiveRange";
		NpcChat(1, str)
		TargetIndex = 0;
		SetTarget(0)
		return
	end
	
	if (TargetIndex == 0) then 
		ai_doing = ai_freestate
		if (ai_lastnpc > 0) then
			ai_delmissnpc(ai_lastnpc)
			ai_lastnpc = 0	
		end
	end	
	
	--如果闲置状态时，就找怪打
	if (ai_doing == ai_freestate) then
		TargetIndex = ai_getgoodnpc()
		SetTarget(TargetIndex)
		if (TargetIndex > 0) then 
			ai_doing = ai_attackstate
			str = str..":Attack"..GetCNpcId(TargetIndex)
			SetActiveSkill(GetLeftSkill())
			ai_lastblood = AI_GetLifePercent(TargetIndex)
			ai_time = AI_ATTACKTIME
			ai_attack()
		else
			str = str..":Sit"
			Sit()
		end
	elseif (ai_doing == ai_attackstate) then 
		ai_attack()
	end
	
	NpcChat(1, str);
end;

function ai_attack()
	ai_time = ai_time - 1;
	if (ai_time <= 0) then 
		
		if (ai_lastblood > AI_GetLifePercent(TargetIndex)) then
			ai_lastblood = AI_GetLifePercent(TargetIndex)
			ai_time =  AI_ATTACKTIME
			str = str.. "continue";
			return 
		end
		ai_time = 0
		ai_addmissnpc(GetCNpcId(TargetIndex))
		ai_doing = ai_freestate
		return
	end
	SetActiveSkill(GetLeftSkill())
	FollowAttack(TargetIndex)
	ai_lastnpc = GetCNpcId(TargetIndex)
	str = str .. ":FollowAttack"..GetCNpcId(TargetIndex)
end

function ai_sleep()
	ai_time = ai_time - 1;
	if (ai_time <= 0) then 
		ai_doing = ai_freestate
	end
	str = str .. ":sleep"
end

function ai_free()
	ai_time = ai_time - 1;
	str = str ..":free"
end;

function ai_syncnpc()
for i = 1, getn(ai_missnpctab) do 
	nIndex = AI_SearchNpcID(ai_missnpctab[i])
	if (nIndex > 0) then
		NpcChat(nIndex, tostring(ai_misscounttab[i]))
	end
end
end

function ai_getgoodnpc()
	nMinMiss = 99999999;
	nMinIndex = 0;
	for i = 1, 10 do 
		nNpc = GetNextNpc(i)
		if (nNpc <=  0) then
			break
		end
		
		lmisscount = ai_getmissnpccount(GetCNpcId(nNpc))
		if (lmisscount == 0) then
			return nNpc
		end
		if (lmisscount < nMinMiss) then 
			nMinMiss = lmisscount
			nMinIndex = nNpc
		end
	end;
	
	return nMinIndex
end;

function ai_addmissnpc(npcid)
	nIndex = ai_findmissnpc(npcid);
	
	if (nIndex > 0) then 
		ai_misscounttab[nIndex] = ai_misscounttab[nIndex] + 1
	else	
		ai_missnpctab[getn(ai_missnpctab) + 1] = npcid;
		ai_misscounttab[getn(ai_misscounttab) + 1] = 1;
	end
end

function ai_getmissnpccount(npcid)
	nIndex = ai_findmissnpc(npcid)
	if (nIndex > 0) then
		return ai_misscounttab[nIndex];
	end
		return 0
end;

function ai_delmissnpc(npcid)
	nIndex = ai_findmissnpc(npcid);
	if (nIndex > 0) then 
		ai_misscounttab[nIndex] = 0
	end
end;

function ai_findmissnpc(npcid)
	for i = 1, getn(ai_missnpctab) do 
		if (npcid == ai_missnpctab[i]) then
			return i
		end
	end;
	return 0
end;

