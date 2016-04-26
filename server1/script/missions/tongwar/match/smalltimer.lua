Include("\\script\\missions\\tongwar\\match\\head.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1, t)
	

	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		RunMission(MISSIONID)
		AddGlobalNews("'���ֵ�һ�� '"..GetMissionS(MS_S_CITYNAME_S).." ��"..GetMissionS(MS_S_CITYNAME_J).." - ������ʼ.");
		WriteLog("tongwar is entering fight state.")
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str2 = "�뿪սʱ�仹ʣ:"..RestMin.."��"
		else
			str2 = "�뿪սʱ�仹ʣ:"..RestMin.."��"..RestSec.." ��"
		end
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t > RUNGAME_TIME) then
		if (t >= RUNGAME_TIME + 15) then
			--�������ĳһ��Ӫ����������С������������������˶����Ӫֱ�ӻ�ʤ
			local group1count = GetMSPlayerCount(MISSIONID, 1)
			local group2count = GetMSPlayerCount(MISSIONID, 2)
			if (group1count < MIN_MEMBERCOUNT or group2count < MIN_MEMBERCOUNT) then
				if ( group1count < MIN_MEMBERCOUNT and group2count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 0)
				elseif(group1count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 2)
				elseif(group2count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 1)
				end
				CloseMission(MISSIONID)
				return
			end
		end

		--ÿһ����ͨ�浱ǰ˫�����֣���npc
		if (mod(t, 3) == 0 ) then
			msstr = "������Ŀǰ�������ܷ�"..GetMissionS(MS_S_CITYNAME_S).."������"..GetMissionS(MS_S_CITYNAME_J).." Ϊ<color=yellow>"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
		end
		if (mod(t, 30) == 0) then
			RestTime = floor(GetMSRestTime(MISSIONID, 62) / 18)
			RestMin, RestSec = GetMinAndSec(RestTime);
			if (RestSec == 0) then
				str2 = "����ʣ��ʱ��:"..RestMin.."��"
			else
				str2 = "����ʣ��ʱ��:"..RestMin.."��"..RestSec.." gi�y"
			end
			Msg2MSAll(MISSIONID,"<color=blue>"..str2.."<color>");		--֪ͨ������ҿ�սʣ��ʱ��
		end
		but_pop2home( 1 )
		but_pop2home( 2 )
	end

end



