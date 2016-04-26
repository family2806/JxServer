Include("\\script\\missions\\bw\\bwhead.lua");
function OnDeath(Launcher)
	local curcamp = GetCurCamp();
	local i;
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();

	local PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder凶手
	local OrgPlayer  = PlayerIndex; --死者
	local DeathName = GetName();
	local str;

	local nLaunGroupID;
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		local LaunName = GetName();
		nLaunGroupID = GetCurCamp();
		if (nLaunGroupID == 2 or nLaunGroupID == 3) then
			str  = GetMissionS(CITYID).."<#> 擂台比赛上有很多人, <color=yellow>"..szCaptainName[nLaunGroupID - 1].."<color>队<color=yellow>"..LaunName.."<color><#>在比赛中打败了<color=yellow>"..szCaptainName[4 - nLaunGroupID].."<color> 队 <color=yellow>"..DeathName.."<color><#>.";
			Msg2MSAll(BW_MISSIONID, str);
		end
	end;
	
	PlayerIndex = OrgPlayer;
	if (nil ~= str) then
		DelMSPlayer(BW_MISSIONID, PlayerIndex);
	end;
	bw_all_death();
end;

function bw_all_death()
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	local str1 = "";
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> 在擂台比赛中双方都死了,"..szCaptainName[1].."<color><#> 和<color=yellow>"..szCaptainName[2].."<color><#> 平手!";
		bw_death_close(str1)
	elseif (nGroup2PlayerCount <= 0) then
		str1 = GetMissionS(CITYID).."擂台结果<#>, 队<color=yellow>"..szCaptainName[1].."<color>打败队<color=yellow>"..szCaptainName[2].."<color>, <#> <color=yellow>"..szCaptainName[1].."<color> 取得最终胜利!";
		bw_branchtask_win(1);
		bw_death_close(str1)
	elseif (nGroup1PlayerCount <= 0) then 
		str1 = GetMissionS(CITYID).."擂台结果<#>, 队 <color=yellow>"..szCaptainName[2].."<color> 打败队<color=yellow>"..szCaptainName[1].."<color>, <#> <color=yellow>"..szCaptainName[2].."<color>取得最终胜利!";
		bw_branchtask_win(2);
		bw_death_close(str1)
	end;
end;

function bw_death_close(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	CloseMission(BW_MISSIONID);
end;