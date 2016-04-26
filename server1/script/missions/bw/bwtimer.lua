Include("\\script\\missions\\bw\\bwhead.lua");

szCaptainName = {};
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);
	
	szCaptainName = bw_getcaptains(); --获取两队队长的名字；

	if (timestate == 1) then 	--报名阶段
		local str1 = ReportMemberState(V);
		bw_noticecaptainkey(str1);
	elseif (timestate == 2) then --开战了
		ReportBattle(V);
	elseif (timestate == 3) then  --战斗结束了
		Msg2MSAll(BW_MISSIONID, "战斗结束!");
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		StopMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID);
	end;
end;

function ReportMemberState(V)
	--在报名期间，系统定期通知玩家当前的报名情况

	if (V == GO_TIME) then
		bw_begin_compete();
	end;
	
	RestMin = floor((GO_TIME - V) / 3);
	RestSec = mod((GO_TIME - V),3) * 20;
	local str1;

	if (RestMin > 0) and (RestSec == 0) then
		str1 = "上擂台比赛时间<#> 还有: <color=yellow>"..RestMin.."<color><#> 分，请尽快入场."
		Msg2MSAll(BW_MISSIONID, str1);
		if ((GO_TIME - V) == 3) then 
			str1 = GetMissionS(CITYID).."上擂台比赛时间<#> 只还有<color=yellow>1<color> 分, 请尽快入场."
			--AddGlobalCountNews(str1)
		end
	elseif (RestMin == 0) then
		str1 = "上擂台比赛时长<#> 还有: <color=yellow>" ..RestSec.. "<color><#>分."
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
			str = "各下属于战队<color=yellow> "..GetMissionS(CITYID).."<color> <#>属于队<color=yellow> "..nCount.."<color>比赛和<color=yellow> "..nCount.."<color>, <#> 入场序号<color=yellow> ["..nKey.."]<color>.告诉自己的队友入场.";
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
		str1 = GetMissionS(CITYID).."<#> 擂台比赛时间到了，队<color=yellow>"..szCaptainName[1].."<#> <color> 和队<color=yellow>"..szCaptainName[2].."<#> <color>入场时间不对，取消比赛";
		Msg2MSAll(BW_MISSIONID,str1)
		--AddGlobalCountNews(str1);
		SetMissionV(MS_STATE,3);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#>擂台比赛时间到了，队<color=yellow>"..szCaptainName[1].."<#> <color>入场时间不对，队<color=yellow>"..szCaptainName[2].."<#> <color>可以视为胜利!"
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(2);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#>擂台比赛时间到了，队<color=yellow>"..szCaptainName[2].."<#> <color>入场时间不对，队<color=yellow>"..szCaptainName[1].."<#> <color>可以视为胜利!";
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(1);
		CloseMission(BW_MISSIONID);
		return
	end;
		
	Msg2MSAll(BW_MISSIONID, "入场时间中断，比赛正式开始!");
	str = GetMissionS(CITYID).."擂台<#> <color=yellow>"..szCaptainName[1].."<color> <#>和color=yellow>"..szCaptainName[2].."<color> <#>入场时间中断，比赛正式开始!";
	--AddGlobalCountNews(str);
	RunMission(BW_MISSIONID);
	return
end;

function ReportBattle(V)
	bw_checkwinner();	--战斗进行过程中，系统定期通知各方的阵亡情况
	gametime = (floor(GetMSRestTime(BW_MISSIONID,BW_TOTALTIME_ID)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(BW_MISSIONID, "擂台比赛阶段<#>: 双方比赛。时间还有<color=yellow>"..RestSec.."<color><#> 秒.");
	elseif (RestSec == 0) then
		Msg2MSAll(BW_MISSIONID, "擂台比赛阶段<#>:双方比赛。时间还有<color=yellow>"..RestMin.."<color><#> 分.");
	else
		Msg2MSAll(BW_MISSIONID, "擂台比赛阶段<#>:双方比赛。时间还有<color=yellow>"..RestMin.."<color><#> 分<color=yellow>"..RestSec.."<color><#> 秒.");
	end;
end;

function bw_checkwinner()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."双方同时离开赛场<#>, 队 <color=yellow>"..szCaptainName[1].."<color> <#> 和<color=yellow>"..szCaptainName[2].."<color> <#> 打平!";
		bw_all_gone(str1)
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."擂台结果<#>, 队 <color=yellow>"..szCaptainName[2].."<color> <#>打败了队<color=yellow>"..szCaptainName[1].."<color> <#>, 取得最终胜利!"
		bw_all_gone(str1)
		return
	end;
	
	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."擂台结果<#>, 队 <color=yellow>"..szCaptainName[1].."<color> <#> 打败队<color=yellow>"..szCaptainName[2].."<color> <#>, 取得最终胜利!"
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