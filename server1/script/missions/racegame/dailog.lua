-- 文件名　：dailog.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-17 11:00:21
--报名的对话
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\racegame\\ready\\ready.lua")
function racegame_SignUp_main(nStep)
	jiefang_0804_ResetTask()
	local tbSay = {}
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>从2008-06-11日到2008-7-13日24时，武林盟主将在各城市举行四级比赛，头30个到达终点并与场地老板对话的人将获得优厚的奖励，你想参加这个活动吗?",
			"千年一遇，我不会错过的!/#racegame_SignUp_main(2)",
			"了解活动信息/#racegame_SignUp_main(3)",
			"真是不好意思，我稍后就来./OnCancel",	
		}
	elseif nStep == 2 then
		local nReadyMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState)
		local nMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.MissionState)
		--local nPlayerCount	= racegame_tbReadyMission:GetMSPlayerCount()
		
--		if nPlayerCount >= racegame_tbReadyMission.nPlayerCountLimit then
--			Say("这场活动人数已经达到上限，你参加下一场吧！",0)
--			return 
--		end
		
		if GetLevel() < racegame_tbReadyMission.nLevelLimit then
			Say(format("等级不够%s,不能参加活动.", racegame_tbReadyMission.nLevelLimit), 0 )
			return 
		end
		
		
		if nReadyMissionState == 1 then
			
			local w = GetWorldPos()
			SetTask(jiefang_0804_TSK_MapId, w)			
			local nRandId = random(1, getn(racegame_tbReadyMission.tbWaitPos) )
			return NewWorld(racegame_tbReadyMission.nMapId, racegame_tbReadyMission.tbWaitPos[nRandId][1], racegame_tbReadyMission.tbWaitPos[nRandId][2])
		elseif (nReadyMissionState == 0 and nMissionState ~= 0) or nReadyMissionState == 3 then
			tbSay = 
			{
				"大侠已经来晚了，比赛已经开始了. 每周的比赛时间: <enter>周一到周五，早上10:00到11:00,下午22:00到23:00<enter>四月三十日周六和五月一日; 早上 02:00到03:00,早上10:00到11:00, 下午14:00到15:00,晚上22:00到 23:00<enter>星期天, 早上10:00 到 11:00, 中午14:00 到15:00, 晚上22:00到23:00.",
				"真是不好意思，我稍后就来./OnCancel",	
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		elseif nReadyMissionState == 0 and nMissionState == 0 then
			tbSay = 
			{
				"比赛还没开始.每周的比赛时间:<enter>周一到周五，早上10:00到11:00,下午22:00到23:00<enter>四月三十日周六和五月一日; 早上 02:00到03:00,早上10:00到11:00, 下午14:00到15:00,晚上22:00到 23:00<enter>星期天, 早上10:00 到 11:00, 中午14:00 到15:00, 晚上22:00到23:00.",
				"真是不好意思，我稍后就来./OnCancel",
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		end
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>每场比赛15分钟，其中有1分钟准备.报名参加后，玩家将会被送到准备区。比赛开始后， 各选手尽快跑回目的地。在比赛过程中，会出现各种有用的道具，用这些道具可以帮助自己增加奔跑速度或者使其他人减速。头30个到达终点并与场地老板对话的人将获得优厚的奖励",
			"真是不好意思，我稍后就来./OnCancel",	
		}
		
	end
	CreateTaskSay(tbSay)
end



function racegame_Award_main()
	jiefang_0804_ResetTask()
	local nAwardState = GetTask(jiefang_0804_TSK_AwardState)
	local nPlayerMapId = GetTask(jiefang_0804_TSK_MapId)
	if nPlayerMapId == 0 then
		nPlayerMapId = 520
	end
	if nAwardState == 1 then
		return NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
	end
	local nRankCount = racegame_tbMission:GetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER)
	nRankCount = nRankCount + 1
	racegame_tbMission:SetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER, nRankCount)
	local szMsg = format("哈哈,在这场比赛大侠排名  <color=yellow>%d<color>.",  nRankCount)
	
	Msg2MSAll(racegame_tbMission.nMissionId, format("<color=yellow>%s<color> 在这场比赛排名  <color=yellow>%d<color>.",GetName(),  nRankCount))
	Msg2Player(szMsg)
	if nRankCount >= 1 and nRankCount <= 10 then
		AddOwnExp(2000000)
		if random(1,100) <=50 then
			AddItem(4, 239, 1, 1, 0, 0)
			Msg2Player("获得一块紫水晶")
		end
	elseif nRankCount >= 11 and nRankCount <= 20 then
		AddOwnExp(1000000)
	elseif nRankCount >= 21 and nRankCount <= 30 then
		AddOwnExp(500000)
	end 
	
	SetTask(jiefang_0804_TSK_AwardState, 1)
	if nRankCount >= 30 then
		racegame_tbMission:CloseGame();
	end
	
	NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
end

function OnCancel()
end