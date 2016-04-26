Include("\\script\\event\\tongwar\\event.lua");

TONGWAR_NAME = "武林第一帮"
LEAGUE_NUMBER = 7
TONGWAR_STATETIME = 2000
TONGWAR_ENDTIME = 2130

-- 第一名帮会帮主登记自己的队友League
ONETONG_LGTYPE		=	541;
ONETONG_ACC_LGTYPE	=	542;

TONGWAR_SEASON_TB = {
--  ID = {年月,报名开始日,报名结束日（即比赛开始日），比赛结束日，奖励领取开始日，奖励领取结束日}
--	[1] = {0706, 14, 18, 30, 70701, 70705},
--	[2] = {0709, 14, 18, 30, 71001, 71006},
--	[3] = {0803, 18, 18, 30, 80331, 80406},
--	[4] = {0810, 3,  4,  16, 81017, 81022},
--	[5]	= {0904, 3,  4,	 16, 90417, 90422},
--	[6] = {0910, 3,  4,	 16, 91017, 91022},
--	[7] = {1004, 15, 16, 28, 100429, 100502},
--  ID = {[1]报名开始日,[2]比赛起,	[3]比赛止,	[4]奖励起,	[5]奖励止}
	[1] = {101030, 		101101,		101108,		101109,		101113},
	--Season 2 - VLDNB 2011 - Modified by DinhHQ - 20110510
	--phase 1: 20110514
	--phase 2: 20110514 - 20110521
	--phase 3: 20110522 - 20110529
	[2] = {110514, 		110514,		110521,		110522,		110529},
	--Season 3 - VLDNB 10 - Modified by DinhHQ - 20111013
	--phase 1: 20111022
	--phase 2: 20111022 - 20111030
	--phase 3: 20111031 - 20111107
	[3] = {111022, 		111022,		111029,		111030,		111106},
	--Season 4 - VLDNB 11 - Modified by DinhHQ - 20120507
	[4] = {120512, 		120512,		120523,		120524,		120530},
}
SCHEDULE_TABLE = {	-- 比赛日程
	{
		"16",	-- 2009年10月4日
		{5, 7}, 	-- 临安 VS 襄阳
		{4, 6}, 	-- 汴京 VS 扬州
		{2, 3}		-- 成都 VS 大理
	},
	{
		"17",	-- 2009年10月6日
		{1, 4},		-- 凤翔 VS 汴京
		{5, 6},		-- 襄阳 VS 扬州
		{3, 7}		-- 临安 VS 大理
	},
	{
		"19",	-- 2009年10月8日
		{2, 7},		-- 成都 VS 临安
		{1, 5},		-- 凤翔 VS 襄阳
		{6, 3}		-- 扬州 VS 大理
	},
	{
		"20",	-- 2009年10月10日
		{4, 5},		-- 汴京 VS 襄阳
		{2, 6},		-- 成都 VS 扬州
		{1, 3}		-- 凤翔 VS 大理
	},
	{
		"21",	-- 2009年10月12日
		{1, 2},		-- 凤翔 VS 成都
		{6, 7},		-- 临安 VS 扬州
		{3, 4}		-- 汴京 VS 大理
	},
	{
		"22",	-- 2009年10月14日
		{2, 4},		-- 成都 VS 汴京 
		{1, 7},		-- 凤翔 VS 临安
		{3, 5}		-- 襄阳 VS 大理
	},
	{
		"23",	-- 2009年10月16日
		{4, 7},		-- 汴京 VS 临安
		{2, 5},		-- 成都 VS 襄阳
		{1, 6}		-- 凤翔 VS 扬州
	}
}

function TaskShedule()
	TaskName(TONGWAR_NAME)
	OutputMsg(TONGWAR_NAME)
	local nhour = GetNextHour();
	TaskTime(nhour, 0)		-- 首次任务于下一个整点开始

	TaskInterval(30)	-- 30分钟一次
	TaskCountLimit(0)	--无限次触发任务
end

function TaskContent()
	
	local task_month = tonumber(date("%y%m"));
	local task_date = tonumber(date("%d"));
	local task_time = tonumber(date("%H%M"));
	local task_ymd = task_month *100 + task_date;
	
	
	
	local nseason = tongwar_GetCurSeason(task_ymd)
	
	
	OutputMsg(format("现在的赛季为%s", nseason))
	if (nseason == 0) then		--没有安排当月赛程
		set_tongwar_phase(0);
		--OutputMsg("season "..task_month.." cannot be found in schedule, quit task."..nseason)
		return 0;
	end;
	
	
	
	if (task_ymd > TONGWAR_SEASON_TB[nseason][5]) then	--当前赛季的奖励时间已过，任务不再继续
		set_tongwar_phase(0);
		--OutputMsg("season "..task_month.." cannot be found in schedule, quit task.")
		return 0;
	end;
	
	--是赛程中 22日 0点左右 则删除上月战队信息，重新读取占城邦会
	--此时，会清除排行榜信息
	--VLDNB2011 Set sign up time from 00h 20110514 to 18h 20110514 - Modified by DinhHQ 20110510
	if ((task_ymd == TONGWAR_SEASON_TB[nseason][1]) and (task_time < 1800)) then
		if (tongwar_initmatch(nseason) == 1) then
			return 1;
		end
	end
	
	if (task_ymd >= TONGWAR_SEASON_TB[nseason][2] and task_ymd <= TONGWAR_SEASON_TB[nseason][3]) then
		if (task_ymd == TONGWAR_SEASON_TB[nseason][2] and task_time < 1800) then
			return
		else
			set_tongwar_phase(2);--当前阶段为2,比赛日进行中
		end
	elseif (task_ymd >= TONGWAR_SEASON_TB[nseason][4] and task_ymd <= TONGWAR_SEASON_TB[nseason][5]) then
		set_tongwar_phase(3);--当前阶段为3,奖励发放中
	end;
	
	local team1, team2, team3	-- Table类型，Table[2] = {联盟1, 联盟2}
	local strGlExe = ""
	for i = 1, LEAGUE_NUMBER do
		if (tostring(task_date) == SCHEDULE_TABLE[i][1]) then
			team1 = SCHEDULE_TABLE[i][2]
			team2 = SCHEDULE_TABLE[i][3]
			team3 = SCHEDULE_TABLE[i][4]
		end
	end
	
	if (not team1) or (not team2) or (not team3) then	-- 日期不在日程表里，退出
		OutputMsg("date "..task_date.." cannot be found in schedule, quit task.")
		return
	end
	if (task_time >= (TONGWAR_STATETIME - 5) and task_time <= (TONGWAR_STATETIME + 5)) then	-- 比赛开始
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		OutputMsg(TONGWAR_NAME.."starting.")
		for i = 1, getn(TONGWAR_CITY) do
			local szcityname = TONGWAR_CITY[i];
			LG_ApplySetLeagueTask(TONGWAR_LGTYPE, szcityname, TONGWAR_LGTASK_CAMP, 0)
			LG_ApplySetLeagueTask(TONGWAR_LGTYPE, szcityname, TONGWAR_LGTASK_MAP, 0)
		end;
		local ground1, ground2, ground3 = random_ground()	-- 随机分配比赛场地
		-- 传递9个参数，分别是第一场比赛的联盟队伍双方阵营、场地，第二场比赛的联盟队伍双方阵营、场地，第三场比赛的联盟队伍双方阵营、场地
		strGlExe = format("dw tongwar_start(%d, %d, %d, %d, %d, %d, %d, %d, %d)", team1[1], team1[2], ground1, team2[1], team2[2], ground2, team3[1], team3[2], ground3)
		GlobalExecute(strGlExe)
		OutputMsg(strGlExe);
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		return
	end
	if (task_time >= (TONGWAR_ENDTIME - 5) and task_time <= (TONGWAR_ENDTIME + 5)) then	-- 比赛结束
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		strGlExe = "dw tongwar_start(0)"	-- 参数为0表示比赛结束
		GlobalExecute(strGlExe)
		OutputMsg(TONGWAR_NAME.."overed.")
		OutputMsg(strGlExe);
		OutputMsg("-------------------TONGWAR MSG---------------------------")
		return
	end
	--OutputMsg(task_time.." "..task_date.." "..task_month)
end

function random_ground()	-- 随机分配三个赛场，无重复。赛场编号1、2、3
	local grd = {}
	grd[1] = random(1, 3)
	repeat
		grd[2] = random(1, 3)
	until (grd[2] ~= grd[1])
	repeat
		grd[3] = random(1, 3)
	until (grd[3] ~= grd[1]) and (grd[3] ~= grd[2])
	return	grd[1], grd[2], grd[3]
end

function GetNextHour()
	local nh = tonumber(date("%H")) + 1;
	if (nh >= 24) then
		nh = 0;
	end;
	return nh;
end;

function tongwar_GetTong()
	local tb = {}
	for i = 1, 7 do
		local strCityName = GetCityAreaName(i)
		local strCityTongName = GetCityOwner(i)
		tb[strCityTongName] = tb[strCityTongName] or {}
		tinsert(tb[strCityTongName], strCityName)
	end
	return tb
end

function tongwar_GetCurSeason(nDate)
	
	for i, tb in TONGWAR_SEASON_TB do
		if (nDate >= TONGWAR_SEASON_TB[i][1] and nDate <= TONGWAR_SEASON_TB[i][5]) then
			OutputMsg(format("%d<=%d<=%d ->%d",TONGWAR_SEASON_TB[i][1],nDate,TONGWAR_SEASON_TB[i][5], i));
			return i;
		end;
	end;
	OutputMsg(format("%d ->%d",nDate,0));
	return 0;
end
function tongwar_initmatch(nseason)
	if (gb_GetTask("TONGWAR_STATION", 3) == nseason) then
		OutputMsg("gb_GetTask(TONGWAR_STATION, 3) == nseason)")
		return 0;
	end;
	local szlogfile = LOGFILE..date("%y%m").."\\tongwar.log"
	
	--新一季第一帮，删除旧战队
	tongwar_delete_oldleague(TONGWAR_LGTYPE, nseason);
	
	-- 删除旧第一帮帮主等级的队友
	tongwar_delete_oldleague(ONETONG_LGTYPE);
	tongwar_delete_oldleague(ONETONG_ACC_LGTYPE);
	
	
	local tbTongSet = tongwar_GetTong()
	
	for strCityTongName, tbCity in tbTongSet do
		
		if getn(tbCity) == 1 and strCityTongName ~= nil and strCityTongName ~= "" then
			local strCityName = tbCity[1]
			 
			if FALSE(LG_GetLeagueObj(TONGWAR_LGTYPE, strCityName)) then
				local nLeagueID = LG_CreateLeagueObj()
				LG_SetLeagueInfo(nLeagueID, TONGWAR_LGTYPE, strCityName)
				LG_ApplyAddLeague(nLeagueID, "", "")
				LG_FreeLeagueObj(nLeagueID)
				LG_ApplySetLeagueTask(TONGWAR_LGTYPE, strCityName, TONGWAR_LGTASK_SEASON, nseason);
				
				if (not FALSE(strCityTongName))then
					nMemberID = LGM_CreateMemberObj()
					--设置社团成员的信息(角色名、职位、社团类型、社团名称)
					LGM_SetMemberInfo(nMemberID, strCityTongName, 1, TONGWAR_LGTYPE, strCityName)
					LGM_ApplyAddMember(nMemberID, "", "")
					LGM_FreeMemberObj(nMemberID)
					LG_ApplySetMemberTask(TONGWAR_LGTYPE, strCityName, strCityTongName, TONGWAR_LGMTASK_JOB, 1)
				end
				WriteStringToFile(szlogfile, strCityName.."\t"..strCityTongName.."\n")
				OutputMsg("参加武林第一帮的帮会已经确定!!");
			end
			
		end
	end

	
	for i = 10225, 10234 do		--清除排行榜信息;具体内容查看 ui\树型排名主题.ini
		Ladder_ClearLadder(i);
	end;
	--"TONGWAR_STATION"	1，车资半价的帮会id
	--					2，天下第一帮赛季
	 gb_SetTask("TONGWAR_STATION", 2,1)	--当前阶段为1,新开天下第一帮
	 gb_SetTask("TONGWAR_STATION", 3,nseason)	--
	 return 1;
end;


function set_tongwar_phase(nphase)
	if (gb_GetTask("TONGWAR_STATION", 2) ~= nphase) then
		gb_SetTask("TONGWAR_STATION", 2,nphase)	--当前阶段为0,没有第一帮比赛
		OutputMsg("Set TongWar Phase "..nphase)
	end;
end;

function tongwar_delete_oldleague(nlgtype, nseason)
	local n_lid = LG_GetFirstLeague(nlgtype);
	while (not FALSE(n_lid)) do 
		local n_rmlid = n_lid;
		n_lid = LG_GetNextLeague(nlgtype, n_lid);
		if (not nseason or LG_GetLeagueTask(n_rmlid, TONGWAR_LGTASK_SEASON) ~= nseason) then
			local str_lgname = LG_GetLeagueInfo(n_rmlid);
			LG_ApplyRemoveLeague(nlgtype, str_lgname);
		end;
	end
end
	

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
