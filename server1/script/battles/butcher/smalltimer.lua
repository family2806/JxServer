IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\butcher\\head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- ��Ż֮ǧ��Ӣ��
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\battles\\songjingtetan_position.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")


tbIndex = {}	-- ѡ�е������Index
tbPoint = {}	-- ��ǰ��ѡ������꼯��
tbNpc = 
{
	[1] = 
	{
		nNpcId = 1685,  --npc Id
		nLevel = 95,		-- �ȼ�
		--nSeries = 1,		-- ����
		bNoRevive = 1,			-- ������
		szName = "��̽",		-- ����
		nIsboss = 1,
		nCurCamp = 1,	--��Ӫ 1�� 2��
	},
	[2] = 
	{
		nNpcId = 1686,  --npc Id
		nLevel = 95,		-- �ȼ�
	--	nSeries = 1,		-- ����
		bNoRevive = 1,			-- ������
		szName = "��̽",		-- ����
		nIsboss = 1,
		nCurCamp = 2,	--��Ӫ 1�� 2��
	}
} 

function SelectPosition(nRandomCount)
	for i=1,4 do
		tbIndex[i] = random(1,nRandomCount)
		local bFlag = 1
		for j=1,i-1 do
			if tbIndex[j] == tbIndex[i] then
				bFlag = 0
				break
			end
		end
		if bFlag == 0 then
			i = i - 1
		end
	end
end

function AddTeTan(nNowTimeCount)
	if tbAppearTime[nNowTimeCount - RUNGAME_TIME] == 1 then
		local nrandomCount = 0
		-- �ж���ǰ��ͼ��Id
		local nNowMapId = BT_GetGameData(GAME_MAPID)
		if nNowMapId == 380 then
			tbPoint = tbPoint_map380
			nrandomCount = 10
		elseif nNowMapId == 383 then
			tbPoint = tbPoint_map383
			nrandomCount = 20
		else
			return
		end
		s_area = BT_GetGameData(GAME_CAMP1AREA) 	-- GAME_CAMP1AREA �� GAME_CAMP1AREA ��
		j_area = BT_GetGameData(GAME_CAMP2AREA)
		
		Msg2MSAll(MISSIONID, "�µ���̽�Ѿ�����ս���ˣ���ҿ���ж�!");
		
		SelectPosition(nrandomCount)
		local tbPosition_s = tbPoint[s_area]
		local tbPosition_j = tbPoint[j_area]
		
		for i=1,4 do
			local nIndex = tbIndex[i]
			tbNpc.szName = "��̽"
			basemission_CallNpc(tbNpc[1], nNowMapId, tbPosition_s[nIndex].x * 32, tbPosition_s[nIndex].y * 32)
			local msg = format("�����ν���̽: X = %d Y = %d",tbPosition_s[nIndex].x,tbPosition_s[nIndex].y)
			WriteLog(msg)
			tbNpc.szName = "��̽"
			basemission_CallNpc(tbNpc[2], nNowMapId, tbPosition_j[nIndex].x * 32, tbPosition_j[nIndex].y * 32)
			local msg = format("���ӽ����̽: X = %d Y = %d",tbPosition_j[nIndex].x,tbPosition_j[nIndex].y)
			WriteLog(msg)
		end
	end
end

-- 20s����һ��
function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1, t)
	
	--Storm �ӽ�������
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "����ս����"
	elseif (lsf_level == 2) then
		resultstr = "�м�ս����"
	elseif (lsf_level == 3) then
		resultstr = "�߼�ս����"
	end
	
	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."�ν�ս��֮ɱ¾ģʽ����ʱ�䵽��ս����ʽ��ʼ��", 2);
		Msg2MSAll(MISSIONID, "�ν�ս����ʽ����ս���׶Σ���ʿ�ǣ���ѽ��");
		WriteLog("butcher battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- �ճ�����ˢ�¶Ի�NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>�ν�ս��֮ɱ¾ģʽһ��������Ŀǰ�����뱨���׶Σ�����ս���뾡���������������ǰ���ν�ս������ʹ���ν�گ�鵽�ﱨ���㱨������սʱ�仹ʣ��"..RestMin.."�֡���ս�������ȼ���С��40������ս������ս����δ�����ޣ��Կɱ�������ս����";
			str2 = "<#>��սʱ�仹ʣ��"..RestMin.."��"
		else
			str1 = resultstr.."<#>�ν�ս��֮ɱ¾ģʽһ��������Ŀǰ�����뱨���׶Σ�����ս���뾡���������������ǰ���ν�ս������ʹ���ν�گ�鵽�ﱨ���㱨������սʱ�仹ʣ��"..RestMin.."��"..RestSec.."�롣��ս�������ȼ���С��40������ս������ս����δ�����ޣ��Կɱ�������ս����";
			str2 = "<#>��սʱ�仹ʣ��"..RestMin.."��"..RestSec.."��"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then
		AddTeTan(t)  -- �����ν���̽

		--�������ĳһ��Ӫ����������С������������������˶����Ӫֱ�ӻ�ʤ
		local group1count = GetMSPlayerCount(MISSIONID, 1)
		local group2count = GetMSPlayerCount(MISSIONID, 2)
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit()) then
			if (group1count > group2count) then
				SetMissionV(MS_MOSTDEATH, 1)
				CloseMission(MISSIONID)
			elseif (group1count < group2count) then
				SetMissionV(MS_MOSTDEATH, 2)
				CloseMission(MISSIONID)
			else
				SetMissionV(MS_MOSTDEATH, 0) 
				CloseMission(MISSIONID)
			end
			return
		end
		if (t > RUNGAME_TIME) then
			--ÿһ����ͨ�浱ǰ˫�����֣���npc
			if (mod(t, 3) == 0 ) then
			msstr = "���棺��ǰ�ν�˫���ܻ���Ϊ"..GetMissionV(MS_TOTALPOINT_S).."��"..GetMissionV(MS_TOTALPOINT_J);
				Msg2MSAll(MISSIONID, msstr)
			end
		
			but_pop2home( 1 )
			but_pop2home( 2 )
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end

end



