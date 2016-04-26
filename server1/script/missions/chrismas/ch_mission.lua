Include([[\script\missions\chrismas\ch_head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_TIMERSTATE, 1);
	SetMissionS(MSS_MOUSENAME, "失落的礼物"); --刷出怪物的名字

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CH_MAPID[2]);
	
	StartMissionTimer(CH_MISSIONID, CH_RUNTIMERID, CH_RUNINTERVER); --
	StartMissionTimer(CH_MISSIONID, CH_SMALLTIMERID, CH_INTERVER);	--打开计时器
end;

function EndMission()
	local i;
	for i = 1, CH_SMALLMAPCOUNT do
		if (GetMSPlayerCount(CH_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	clearfairy();	--清除场地内所有的怪
	gameover();	--将所有玩家清除出地图
	strGlbNews = "各位已经返回了."
	AddGlobalNews(strGlbNews);

	StopMissionTimer(CH_MISSIONID, CH_SMALLTIMERID);
	StopMissionTimer(CH_MISSIONID, CH_RUNTIMERID);
end;

function OnLeave()
	SetLogoutRV(0);
end

--排序函数(根据点击个数由多到少确定将一组成员的名次)；
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CH_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, CH_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(CH_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(TK_COUNT_ONETIME);
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
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", 找到"..tabPlayer[i][2].."礼物"
		end
	end
	--排序后从前到后就是名次的先后
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_RANK, i);
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("你排名第<color=yellow>"..i.."<color>, 可以去见 <color=yellow>圣诞老人<color> 领奖!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
