Include([[\script\missions\tong\tong_disciple\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
	
	StartMissionTimer(DIS_MISSIONID, DIS_RUNTIMERID, DIS_RUNINTERVER); --
	StartMissionTimer(DIS_MISSIONID, DIS_SMALLTIMERID, DIS_INTERVER);	--打开计时器
end;

function EndMission()
	local i;
	for i = 1, DIS_SMALLMAPCOUNT do
		if (GetMSPlayerCount(DIS_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	clearfairy();	--清除场地内所有的怪
	gameover(DIS_MAPID[2], DIS_MISSIONID);	--将所有玩家清除出地图
	strGlbNews = "招募弟子的人士已经回来了，各位年轻强壮的弟子让大家又想到了自己英勇的过去，也为帮会的未来而高兴."
	AddGlobalNews(strGlbNews);

	StopMissionTimer(DIS_MISSIONID, DIS_SMALLTIMERID);
	StopMissionTimer(DIS_MISSIONID, DIS_RUNTIMERID);
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 0);
	SetGlbValue(GLB_DIS_PHASE, 0); 
end;

function OnLeave()
	SetLogoutRV(0);
end

--排序函数(根据点击个数由多到少确定将一组成员的名次)；
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, DIS_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(DIS_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(DIS_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--采用一个冒泡排序
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--采用降序排序
				temptab = tabPlayer[j];
				tabPlayer[j] = tabPlayer[j - 1];
				tabPlayer[j - 1] = temptab;
			end;
		end;
	end;
	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", 招募到"..tabPlayer[i][2].."个"..DIS_MOUSENAME
		end
	end
	--排序后从前到后就是名次的先后
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(DIS_TK_RANK, i);
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("你排名第<color=yellow>"..i.."<color>, 可以来见<color=yellow>活动坊总管<color> 领奖!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
