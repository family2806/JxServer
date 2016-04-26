Include("\\script\\missions\\bw\\bwhead.lua");

szCaptainName = {};
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);
	
	szCaptainName = bw_getcaptains(); --��ȡ���Ӷӳ������֣�

	if (timestate == 1) then 	--�����׶�
		local str1 = ReportMemberState(V);
		bw_noticecaptainkey(str1);
	elseif (timestate == 2) then --��ս��
		ReportBattle(V);
	elseif (timestate == 3) then  --ս��������
		Msg2MSAll(BW_MISSIONID, "ս������!");
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		StopMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������

	if (V == GO_TIME) then
		bw_begin_compete();
	end;
	
	RestMin = floor((GO_TIME - V) / 3);
	RestSec = mod((GO_TIME - V),3) * 20;
	local str1;

	if (RestMin > 0) and (RestSec == 0) then
		str1 = "����̨����ʱ��<#> ����: <color=yellow>"..RestMin.."<color><#> �֣��뾡���볡."
		Msg2MSAll(BW_MISSIONID, str1);
		if ((GO_TIME - V) == 3) then 
			str1 = GetMissionS(CITYID).."����̨����ʱ��<#> ֻ����<color=yellow>1<color> ��, �뾡���볡."
			--AddGlobalCountNews(str1)
		end
	elseif (RestMin == 0) then
		str1 = "����̨����ʱ��<#> ����: <color=yellow>" ..RestSec.. "<color><#>��."
		Msg2MSAll(BW_MISSIONID, str1);
	end;
	return str1;
end;

function bw_noticecaptainkey(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	local masteridx, szName, nKey, str;
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
			szName = GetMissionS(MSS_CAPTAIN[i]);
			nKey = GetMissionV(MS_TEAMKEY[i]);
			nCount = GetMissionV(MS_MAXMEMBERCOUNT);
			str = "��������ս��<color=yellow> "..GetMissionS(CITYID).."<color> <#>���ڶ�<color=yellow> "..nCount.."<color>������<color=yellow> "..nCount.."<color>, <#> �볡���<color=yellow> ["..nKey.."]<color>.�����Լ��Ķ����볡.";
			Msg2Player(str);
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_begin_compete()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0  and nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> ��̨����ʱ�䵽�ˣ���<color=yellow>"..szCaptainName[1].."<#> <color> �Ͷ�<color=yellow>"..szCaptainName[2].."<#> <color>�볡ʱ�䲻�ԣ�ȡ������";
		Msg2MSAll(BW_MISSIONID,str1)
		--AddGlobalCountNews(str1);
		SetMissionV(MS_STATE,3);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#>��̨����ʱ�䵽�ˣ���<color=yellow>"..szCaptainName[1].."<#> <color>�볡ʱ�䲻�ԣ���<color=yellow>"..szCaptainName[2].."<#> <color>������Ϊʤ��!"
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(2);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#>��̨����ʱ�䵽�ˣ���<color=yellow>"..szCaptainName[2].."<#> <color>�볡ʱ�䲻�ԣ���<color=yellow>"..szCaptainName[1].."<#> <color>������Ϊʤ��!";
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(1);
		CloseMission(BW_MISSIONID);
		return
	end;
		
	Msg2MSAll(BW_MISSIONID, "�볡ʱ���жϣ�������ʽ��ʼ!");
	str = GetMissionS(CITYID).."��̨<#> <color=yellow>"..szCaptainName[1].."<color> <#>��color=yellow>"..szCaptainName[2].."<color> <#>�볡ʱ���жϣ�������ʽ��ʼ!";
	--AddGlobalCountNews(str);
	RunMission(BW_MISSIONID);
	return
end;

function ReportBattle(V)
	bw_checkwinner();	--ս�����й����У�ϵͳ����֪ͨ�������������
	gametime = (floor(GetMSRestTime(BW_MISSIONID,BW_TOTALTIME_ID)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(BW_MISSIONID, "��̨�����׶�<#>: ˫��������ʱ�仹��<color=yellow>"..RestSec.."<color><#> ��.");
	elseif (RestSec == 0) then
		Msg2MSAll(BW_MISSIONID, "��̨�����׶�<#>:˫��������ʱ�仹��<color=yellow>"..RestMin.."<color><#> ��.");
	else
		Msg2MSAll(BW_MISSIONID, "��̨�����׶�<#>:˫��������ʱ�仹��<color=yellow>"..RestMin.."<color><#> ��<color=yellow>"..RestSec.."<color><#> ��.");
	end;
end;

function bw_checkwinner()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."˫��ͬʱ�뿪����<#>, �� <color=yellow>"..szCaptainName[1].."<color> <#> ��<color=yellow>"..szCaptainName[2].."<color> <#> ��ƽ!";
		bw_all_gone(str1)
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."��̨���<#>, �� <color=yellow>"..szCaptainName[2].."<color> <#>����˶�<color=yellow>"..szCaptainName[1].."<color> <#>, ȡ������ʤ��!"
		bw_all_gone(str1)
		return
	end;
	
	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."��̨���<#>, �� <color=yellow>"..szCaptainName[1].."<color> <#> ��ܶ�<color=yellow>"..szCaptainName[2].."<color> <#>, ȡ������ʤ��!"
		bw_all_gone(str1)
		return
	end;
end;

function bw_noticecaptainnews(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_all_gone(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	bw_noticecaptainnews(str1);
	CloseMission(BW_MISSIONID);
end;