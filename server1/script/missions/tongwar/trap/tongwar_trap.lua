Include("\\script\\missions\\tongwar\\match\\head.lua")

function main()
	oldSubWorld = SubWorld
	oldmapid = SubWorldIdx2ID(SubWorld)
	
	matchmap = tongwar_getmatchmap(oldmapid)
	mapidx = SubWorldID2Idx(matchmap)
	if (mapidx < 0) then
		return
	end
	LeaveTeam()
	SubWorld = mapidx

	if (GetMissionV(MS_STATE) == 0) then
		Say("武林第一帮比赛还未开始，请等一下", 0)
	elseif (GetMissionV(MS_STATE) == 1) then
		Say("我方目前正在集合准备进入战场，请大家安静，准备好精神!", 0)
	elseif (GetMissionV(MS_STATE) == 2) then
		if (tongwar_checkjoin(oldmapid)) then
			SubWorld = oldSubWorld
			return
		end
	end
	SubWorld = oldSubWorld
	SetPos(1619,3175)
end

function tongwar_checkjoin(mapid)
	if (tongwar_getdata(TONGWAR_RLTASK_KEYNUMBER) ~= GetMissionV(MS_KEYNUMBER)) then
		tongwar_cleartask()--settask(ms_keynumber)--settask(maxdeath)
	end
	local tongname = GetTongName()
	local lgid = LG_GetLeagueObjByRole(10, tongname)
	if (lgid == 0 or lgid == nil) then
		return
	end
	local cityname = LG_GetLeagueInfo(lgid)
	local camp = LG_GetLeagueTask(10, cityname, TONGWAR_LGTASK_CAMP)
	if (camp == 1) then
		if (cityname == GetMissionS(MS_S_CITYNAME_S)) then
			if (not tongwar_signerror(camp, cityname)) then
				return
			end
			return tongwar_signup(camp)
		else
			Say("你的联盟准备区不在这里, 快去武林盟主那选择正确的区域 ", 0)
		end
	elseif(camp == 2) then
		if (cityname == GetMissionS(MS_S_CITYNAME_J)) then
			if (not tongwar_signerror(camp, cityname)) then
				return
			end
			return tongwar_signup(camp)
		else
			Say("你的联盟准备区不在这里, 快去武林盟主那选择正确的区域", 0)
		end
	else
		print("don't know the map"..mapid.." is which camp")
	end
end

function tongwar_signerror(camp, cityname)
	--VLDNB 10 - 改变加入帮会的时间要求- Modified by DinhHQ - 20111017
	if (GetJoinTongTime() < 1440) then
		Say("加入帮会时间未够 <color=red>1 天<color>, 不能进比赛场.", 0)
		return
	end
	if (tongwar_getdata(TONGWAR_RLTASK_NDEATH) >= tongwar_getdata(TONGWAR_RLTASK_MAXDEATH)) then
		Say("死亡次数已超过"..tongwar_getdata(TONGWAR_RLTASK_MAXDEATH).." 次, 不能继续参加比赛!", 0)
		return
	end
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT) then
		Say("目前 ["..cityname.."] 参加人数超过"..MAX_MEMBERCOUNT.." 人, 暂时不能参加!", 0)
		return
	end
	return 1
end

function tongwar_signup(camp)
	if (tongwar_getdata(TONGWAR_RLTASK_KEYNUMBER) == GetMissionV(MS_KEYNUMBER)) then
		tongwar_setdata(TONGWAR_RLTASK_NDEATH, tongwar_getdata(TONGWAR_RLTASK_NDEATH) + 1)
	end
	BT_LeaveBattle()
	gametime = floor(GetMSRestTime(MISSIONID, 62) / 18);

	sf_mapid = SubWorldIdx2ID(SubWorld)
	if (camp == 1) then
		posx = GetMissionV(MS_HOMEIN_X1)
		posy = GetMissionV(MS_HOMEIN_Y1)
		EnterChannel(PlayerIndex, GetMissionS(MS_S_CITYNAME_S))
	else
		posx = GetMissionV(MS_HOMEIN_X2)
		posy = GetMissionV(MS_HOMEIN_Y2)
		EnterChannel(PlayerIndex, GetMissionS(MS_S_CITYNAME_J))
	end

	--BT_SetData(PL_PARAM1,0)
	--BT_SetData(PL_PARAM2,0)
	--Msg2Player("比赛进行中离场或下线，<color=yellow>敌方阵营将获得75分奖励")
	Msg2Player("在战斗区域，哪个联盟的人数<color=yellow>少于5人就算输了")
	SetRevPos(GetPlayerRev())	--设置重生点为原来城市的重生点
	NewWorld(sf_mapid, posx, posy);
	tongwar_setdata(TONGWAR_RLTASK_KEYNUMBER, GetMissionV(MS_KEYNUMBER))
	SetDeathType(-1)
	DisabledUseTownP(1)
	SetTempRevPos(sf_mapid, posx * 32, posy * 32);
	tongwar_setdata(TONGWAR_RLTASK_LASTDTIME, GetGameTime())
	AddMSPlayer(MISSIONID,camp);
	BT_UpdateMemberCount();
	SetCurCamp(camp);
	SetTaskTemp(200,1)
	SetFightState(0);
	SetLogoutRV(1);
	SetPunish(0);
	SetCreateTeam(0);
	SetPKFlag(1)
	ForbidChangePK(1);
	ForbidEnmity(1);
	
	BT_BroadView();
	BT_BroadAllLadder();
	BT_SetRestTime(gametime);
	BT_BroadGameData();
	BT_SortLadder();
	BT_BroadSelf()
	SetDeathScript("\\script\\missions\\tongwar\\match\\playerdeath.lua");
	bt_JudgePLAddTitle()
	return 1
end

function tongwar_cleartask()
	for i = TONGWAR_RLTASK_POINT, TONGWAR_RLTASK_MAXSERIESKILL do
		tongwar_setdata(i, 0)
	end
	tongwar_setdata(TV_SERIESKILL_REALY, 0)
	tongwar_setdata(TONGWAR_RLTASK_MAXDEATH, 10)
	BT_LeaveBattle() -- 清除玩家客户端当前的排名数据
	BT_ClearPlayerData()

end

function tongwar_getmatchcamp(mapid)
	for i = 1, getn(tbTONGWARMAP) do
		if (mapid == tbTONGWARMAP[i][1] or mapid == tbTONGWARMAP[i][2] or mapid == tbTONGWARMAP[i][3]) then
			camp = i
			break
		end
	end
	return camp
end
