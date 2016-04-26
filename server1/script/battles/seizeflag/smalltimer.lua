IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1_TIME) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1_TIME, t)
	
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
		AddGlobalCountNews(resultstr.."�ν�ս��֮����ģʽ����ʱ�䵽��ս����ʽ��ʼ��", 2);
		Msg2MSAll(MISSIONID, "�ν�ս����ʽ����ս���׶Σ���ʿ�ǣ���ѽ��");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- �ճ�����ˢ�¶Ի�NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>�ν�ս��֮����ģʽһ��������Ŀǰ�����뱨���׶Σ�����ս���뾡���������������ǰ���ν�ս������ʹ���ν�گ�鵽�ﱨ���㱨������սʱ�仹ʣ��"..RestMin.."�֡���ս�������ȼ���С��40����������"..BATTLES_JOINFEE.."������ս������ս����δ�����ޣ��Կɱ�������ս����";
			str2 ="<#>��սʱ�仹ʣ��"..RestMin.."��"
		else
			str1 = resultstr.."<#>�ν�ս��֮����ģʽһ��������Ŀǰ�����뱨���׶Σ�����ս���뾡���������������ǰ���ν�ս������ʹ���ν�گ�鵽�ﱨ���㱨������սʱ�仹ʣ��"..RestMin.."��"..RestSec.."�롣��ս�������ȼ���С��40����������"..BATTLES_JOINFEE.."������ս������ս����δ�����ޣ��Կɱ�������ս����";
			str2 = "<#>��սʱ�仹ʣ��"..RestMin.."��"..RestSec.."��"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --��ʽ��ս�ĵ�һ�δ���ʱ������ս��Npc�����ɹ�������
			sf_buildfightnpcdata()
		else
			--ÿһ���Ӳ���һ��Npc������ͨ�浱ǰ���������
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ����ս��Npc				
			end
			
			bt_pop2signmap()	--���ں�Ӫ��fight=0��������ͻر�����
			
			if (mod(t, 3 ) == 0) then
				msstr = "���棺��ǰ�ν�˫�����˧����Ϊ<color=yellow>"..BT_GetGameData(GAME_CAMP1).."��"..BT_GetGameData(GAME_CAMP2);
				Msg2MSAll(MISSIONID, msstr);
			end
		end

		if (gamemode == 1 and mod(t, 6) == 0) then
			sf_showflagpos()
		end
	end;


	--�������ģʽ�Ĳ�������� ����������ʽս��״̬���ܷ���
	if (gamemode == 2) then
		if (GetMissionV(MS_STATE) ~= 2) then
			return
		end;	
		if (mod(t - RUNGAME_TIME, 6) == 0)  then
			sf_createrandomflag()
		end
	end
end;

function sf_showflagpos()
	l_flagx1 , l_flagy1=  sf_getflagposinfo(1)
	l_flagx2,  l_flagy2 = sf_getflagposinfo(2)
	if (l_flagx1 ~= 0 or l_flagy1 ~= 0) then
		flagstr = "<color=0x00FFFF>ս�۱��棺��ǰ�η�˧����<color=yellow>"..l_flagx1..","..l_flagy1.."<color>����"
		Msg2MSAll(MISSIONID, flagstr)
	end
	if (l_flagx2 ~= 0 or l_flagy2 ~= 0) then
		flagstr = "<color=0x9BFF9B>ս�۱��棺��ǰ��˧����<color=yellow>"..l_flagx2..","..l_flagy2.."<color>����"
		Msg2MSAll(MISSIONID, flagstr)
	end			
end
