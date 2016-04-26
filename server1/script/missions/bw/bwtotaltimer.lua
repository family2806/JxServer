Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()
	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end;
	
	local str1 = "";
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."˫��ͬʱ�뿪����<#>, �� <color=yellow>"..szCaptainName[1].."<color><#> ��<color=yellow>"..szCaptainName[2].."<color><#>��ƽ!";
	end;

	if (nGroup1PlayerCount == nGroup2PlayerCount) then 
		str1 = GetMissionS(CITYID).."��̨���<#>,��<color=yellow>"..szCaptainName[1].."<color=yellow> <#> �Ͷ�<color=yellow>"..szCaptainName[2].."<color=yellow> <#> ��ƽ"
	elseif (nGroup2PlayerCount > nGroup1PlayerCount) then
		str1 = GetMissionS(CITYID).."��̨���<#>,��<color=yellow>"..szCaptainName[2].."<color>���кܶ��˶��ڶ�<color=yellow>"..szCaptainName[1].."<color> <#> <color=yellow>"..szCaptainName[2].."<color>, ȡ������ʤ��!"
		bw_branchtask_win(2);
	elseif (nGroup1PlayerCount > nGroup2PlayerCount) then 
		str1 = GetMissionS(CITYID).."��̨���<#>,��<color=yellow>"..szCaptainName[1].."<color>���кܶ��˶��ڶ�<color=yellow>"..szCaptainName[2].."<color> <#> <color=yellow>"..szCaptainName[1].."<color>, ȡ������ʤ��!"
		bw_branchtask_win(1);
	end;
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	CloseMission(BW_MISSIONID);
	return
end;