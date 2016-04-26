IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
Include("\\script\\battles\\boss\\bossset.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- ��Ż֮ǧ��Ӣ��

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1, t)
	
	--Storm �ӽ�������
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "��������"
	elseif (lsf_level == 2) then
		resultstr = "�м����� "
	elseif (lsf_level == 3) then
		resultstr = "�߼�����"
	end
	
	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."�ν�ս��BOSS����ʱ����ʽ�ѵ�, ��������ʿ�μ�ս��!", 2);
		Msg2MSAll(MISSIONID, "�ν���ʽ��ս! ��λսʿ���尡!");
		WriteLog("boss battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>BOSS��ʽ���ν�ս�������Ž��У����������ڱ����׶Σ���λ������ʿ��μӣ��뵽�����������������ս������ʹ���ν�گ�鱨������սʱ�仹��:"..RestMin.."���ӡ��μ��������ȼ�������40��,������Ϊ100000������ս�������Ȼû�е�������ޣ���Ȼ���Լ������뱨��";
			str2 = "<#> ����ʱ�仹ʣ"..RestMin.."����"
		else
			str1 = resultstr.."<#>BOSS��ʽ���ν�ս�������Ž��У����������ڱ����׶Σ���λ������ʿ��μӣ��뵽�����������������ս������ʹ���ν�گ�鱨������սʱ�仹��:"..RestMin.."����"..RestSec.."��. �μ��������ȼ�������40��,������Ϊ100000������ս�������Ȼû�е�������ޣ���Ȼ���Լ������뱨��";
			str2 = "<#> ����ʱ�仹ʣ"..RestMin.."��"..RestSec.."��y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then
		
		if (t == RUNGAME_TIME) then --��ʽ��ս�ĵ�һ�δ���ʱ������ս��Npc�����ɹ�������
			sf_buildfightnpcdata()
		else
			--����ս���Сʱ��˫��ɱ��BOSS����С��һ������Ԫ˧
			if (t == BOSS_TIME) then
				if (GetMissionV(MS_KILLBOSSCOUNT_S) < GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(1);
					SetMissionV(MS_MARSHAL, 1);
				elseif(GetMissionV(MS_KILLBOSSCOUNT_S) > GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(2);
					SetMissionV(MS_MARSHAL, 2);
				elseif(GetMissionV(MS_KILLBOSSCOUNT_S) == GetMissionV(MS_KILLBOSSCOUNT_J)) then
					BattleBoss_AddBigBoss(1);
					BattleBoss_AddBigBoss(2);
					SetMissionV(MS_MARSHAL, 3);
				end
			end

			if (t == VANISHGAME_TIME) then	--�����20����ʱ����һ����Ԫ˧����
				mar = GetMissionV(MS_MARSHAL)
				if (mar == 1) then
					BattleBoss_AddBigBoss(2);
				elseif (mar == 2) then
					BattleBoss_AddBigBoss(1);
				end
			end
			
			-- ����ȫ��СBOSS
			for i = 1,getn(tbCOMMONBOSSTIME_ALL) do
				if (t == tbCOMMONBOSSTIME_ALL[i]) then
					BattleBoss_AddAllCommonBoss();
					break
				end
			end
			
			-- ������·СBOSS
			for i = 1,getn(tbCOMMONBOSSTIME_SOME) do
				if (t == tbCOMMONBOSSTIME_SOME[i]) then
					BattleBoss_AddSomeCommonBoss();
					break
				end
			end
			
			bt_pop2signmap()	--���ں�Ӫ��fight=0��������ͻر�����
			
			--ÿһ����ͨ�浱ǰ˫�����֣���npc
			if (mod(t, 3) == 0 ) then
				sf_callfightnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ����ս��Npc				
				msstr = format("֪ͨ: ����˫�����ν��Ϊ<color=yellow>%d:%d<color>, �ν�˫������boss������Ϊ<color=yellow>%d:%d<color>", GetMissionV(MS_TOTALPOINT_S), GetMissionV(MS_TOTALPOINT_J), GetMissionV(MS_KILLBOSSCOUNT_S), GetMissionV(MS_KILLBOSSCOUNT_J));
				Msg2MSAll(MISSIONID, msstr)
			end
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end
end

function sf_callfightnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
	
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
end
