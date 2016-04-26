-- �ļ�������dailog.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-17 11:00:21
--�����ĶԻ�
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\racegame\\ready\\ready.lua")
function racegame_SignUp_main(nStep)
	jiefang_0804_ResetTask()
	local tbSay = {}
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>��2008-06-11�յ�2008-7-13��24ʱ�������������ڸ����о����ļ�������ͷ30�������յ㲢�볡���ϰ�Ի����˽�����ź�Ľ���������μ�������?",
			"ǧ��һ�����Ҳ�������!/#racegame_SignUp_main(2)",
			"�˽���Ϣ/#racegame_SignUp_main(3)",
			"���ǲ�����˼�����Ժ����./OnCancel",	
		}
	elseif nStep == 2 then
		local nReadyMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState)
		local nMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.MissionState)
		--local nPlayerCount	= racegame_tbReadyMission:GetMSPlayerCount()
		
--		if nPlayerCount >= racegame_tbReadyMission.nPlayerCountLimit then
--			Say("�ⳡ������Ѿ��ﵽ���ޣ���μ���һ���ɣ�",0)
--			return 
--		end
		
		if GetLevel() < racegame_tbReadyMission.nLevelLimit then
			Say(format("�ȼ�����%s,���ܲμӻ.", racegame_tbReadyMission.nLevelLimit), 0 )
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
				"�����Ѿ������ˣ������Ѿ���ʼ��. ÿ�ܵı���ʱ��: <enter>��һ�����壬����10:00��11:00,����22:00��23:00<enter>������ʮ������������һ��; ���� 02:00��03:00,����10:00��11:00, ����14:00��15:00,����22:00�� 23:00<enter>������, ����10:00 �� 11:00, ����14:00 ��15:00, ����22:00��23:00.",
				"���ǲ�����˼�����Ժ����./OnCancel",	
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		elseif nReadyMissionState == 0 and nMissionState == 0 then
			tbSay = 
			{
				"������û��ʼ.ÿ�ܵı���ʱ��:<enter>��һ�����壬����10:00��11:00,����22:00��23:00<enter>������ʮ������������һ��; ���� 02:00��03:00,����10:00��11:00, ����14:00��15:00,����22:00�� 23:00<enter>������, ����10:00 �� 11:00, ����14:00 ��15:00, ����22:00��23:00.",
				"���ǲ�����˼�����Ժ����./OnCancel",
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		end
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>ÿ������15���ӣ�������1����׼��.�����μӺ���ҽ��ᱻ�͵�׼������������ʼ�� ��ѡ�־����ܻ�Ŀ�ĵء��ڱ��������У�����ָ������õĵ��ߣ�����Щ���߿��԰����Լ����ӱ����ٶȻ���ʹ�����˼��١�ͷ30�������յ㲢�볡���ϰ�Ի����˽�����ź�Ľ���",
			"���ǲ�����˼�����Ժ����./OnCancel",	
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
	local szMsg = format("����,���ⳡ������������  <color=yellow>%d<color>.",  nRankCount)
	
	Msg2MSAll(racegame_tbMission.nMissionId, format("<color=yellow>%s<color> ���ⳡ��������  <color=yellow>%d<color>.",GetName(),  nRankCount))
	Msg2Player(szMsg)
	if nRankCount >= 1 and nRankCount <= 10 then
		AddOwnExp(2000000)
		if random(1,100) <=50 then
			AddItem(4, 239, 1, 1, 0, 0)
			Msg2Player("���һ����ˮ��")
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