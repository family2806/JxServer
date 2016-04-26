Include("\\script\\event\\tongwar\\headinfo.lua")
Include("\\script\\event\\tongwar\\tongwar_signup.lua")
Include("\\script\\task\\random\\treasure_head.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\dailogsys\\dailogsay.lua")
IL("TONG");
_TONGWAR_CITYOWNER = {}


--如果为nil或0，返回1，否则返回0
function FALSE(value)
	if (value == 0 or value == nil or value == "") then
		return 1
	else
		return nil
	end
end

--创建7城主的临时联盟
function tongwar_create()
	if (getn(_TONGWAR_CITYOWNER) ~= 0 and _TONGWAR_CITYOWNER[1][3] == get_tongwar_season()) then
		return
	end
	local nseason = get_tongwar_season();
	local n_lid = LG_GetFirstLeague(TONGWAR_LGTYPE)
--	if (FALSE(n_lid)) then
--		return
--	end
	for i = 1, 7 do
		_TONGWAR_CITYOWNER[i] = {}
		_TONGWAR_CITYOWNER[i][1] = TONGWAR_CITY[i]
		_TONGWAR_CITYOWNER[i][2] = tongwar_getmember(TONGWAR_CITY[i])
		_TONGWAR_CITYOWNER[1][3] = nseason;
	end
end

--获得某个城市的联盟 返回table
function tongwar_getmember(s_lname)
	local tb_member = {}
	local n_lid = LG_GetLeagueObj(TONGWAR_LGTYPE, s_lname)
	local n_count = LG_GetMemberCount(n_lid)
	for i = 0, (n_count - 1) do
		local tongname, n_job = LG_GetMemberInfo(n_lid, i)
		tb_member[getn(tb_member) + 1] = {tongname, n_job}
	end
	return tb_member
end

--比赛结束后，给7城主按积分及静积分排名次
_TONGWAR_ARRRANK = {};
_TONGWAR_ROLELADDER = {};
function tongwar_bigger(lg1, lg2)
	if (lg1[2] == lg2[2]) then
		return lg1[3] > lg2[3];
	end;
	return lg1[2] > lg2[2];
end;

function tongwar_cityrank()
--对战绩作排序
	for i = 1, 7 do
		_TONGWAR_ARRRANK[i] = {};
		_TONGWAR_ARRRANK[i][1] = _TONGWAR_CITYOWNER[i][1];
		_TONGWAR_ARRRANK[i][2] = LG_GetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_CITYOWNER[i][1], TONGWAR_LGTASK_RESULT);
		_TONGWAR_ARRRANK[i][3] = LG_GetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_CITYOWNER[i][1], TONGWAR_LGTASK_POINT);
		_TONGWAR_ARRRANK[i][4] = LG_GetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_CITYOWNER[i][1], TONGWAR_LGTASK_TONGID);
	end;
	sort(_TONGWAR_ARRRANK, tongwar_bigger);
	for i = 1, 7 do
		LG_ApplySetLeagueTask(TONGWAR_LGTYPE, _TONGWAR_ARRRANK[i][1], TONGWAR_LGTASK_RANK, i, "", "");
	end;
--	gb_SetTask("TONGWAR_STATION", 1, _TONGWAR_ARRRANK[1][4]);
end;

function get_tongwar_phase()
	return gb_GetTask("TONGWAR_STATION", 2);
end;

function tongWar_SelectCity(strCityName, strCityTongName)
	if tongWar_CanSelectCity() ~= 1 then
		return
	end
	if get_tongwar_phase() ~= 1 then
		return
	end
	
	nseason = get_tongwar_season()
	if (FALSE(LG_GetLeagueObj(TONGWAR_LGTYPE, strCityName))) then
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
		
		
	end
end

function tongWar_CanSelectCity()
	local szTongName = GetTongName();
	
	if szTongName == nil or szTongName == "" then
		return
	end
	
	if (GetTongFigure() ~= TONG_MASTER) then --判断是否是帮主
		return
	end
	--如果已经有战队了肯定不用选城市
	if not FALSE(LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName)	) then 
		return
	end
	local tb = {}
	for i = 1, 7 do
		if GetCityOwner(i) == szTongName then --没战队且是占城帮会
			return 1
		end
	end
end

function tongWar_ShowSelectCityMenu()
	local szTongName = GetTongName();
	
	if szTongName == nil or szTongName == "" then
		return
	end
	
	if (GetTongFigure() ~= TONG_MASTER) then --判断是否是帮主
		return
	end
	local tb = {}
	for i = 1, 7 do
		local strCityName = GetCityAreaName(i)
		local strCityTongName = GetCityOwner(i)
		tb[strCityTongName] = tb[strCityTongName] or {}
		tinsert(tb[strCityTongName], strCityName)
	end
	local tbCity = tb[szTongName]
	if tbCity then
		local szTitle = "选择想代表参加比赛的城市，如果贵帮占的城市多1个只能代表一个城市参加第一帮"
		local tbOpt = {}
		for i=1, getn(tbCity) do
			
			tinsert(tbOpt, {tbCity[i], tongWar_SelectCity, { tbCity[i], szTongName}})
		end
		CreateNewSayEx(szTitle, tbOpt)
	end
	
end

function tongWar_AddSelectCityOpt(tbOpt)
	
	if tongWar_CanSelectCity() then
		tinsert(tbOpt, 2, "选择需要代表参加比赛的城市/tongWar_ShowSelectCityMenu")
	end
	
end

function tongWar_Start()
	tongwar_create()
	if (getn(_TONGWAR_CITYOWNER) == 0) then
		CreateTaskSay({"<dec><npc>武林盟主号令：在七大城市和联盟帮占城的帮会可以进入专属区域争夺财物，来分出哪个帮会成为武林第一帮。第一帮将回到丰厚奖励已经高贵的名号。","结束对话/OnCancel"});
		return 
	end;
	
	tongwar_clear_rlpoint();
	
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local szContent = {"<dec><npc>武林第一帮财物争夺即将开始。目前，各帮帮主可以与其他占城帮主联盟起来比赛。比赛一旦开始就不能改变联盟了。"};
	if (get_tongwar_phase() == 1) then	--组队
		
		
		tongWar_AddSelectCityOpt(szContent)
		
		
		tinsert(szContent, "同盟加入帮会联盟/tongwar_onjoin");
		tinsert(szContent, "占城帮会在各城市/tongwar_cityowner");
		
	elseif (get_tongwar_phase() == 2) then	-- 比赛期间
		
		tinsert(szContent, "我想参加比赛/tongwar_want2signup");
		tinsert(szContent, "看占城帮会联盟成绩/tongwar_rank");
		tinsert(szContent, "占城帮会在各城市/tongwar_cityowner");
		
	elseif (get_tongwar_phase() == 3) then	--奖励时间
		
		if (getn(_TONGWAR_ARRRANK) == 0) then
			tongwar_cityrank();
		end;
		tinsert(szContent,"领取武林第一帮名号/tongwar_title_talk");
		tinsert(szContent, "领取武林第一帮获得奖励/tongwar_aword_talk");
		tinsert(szContent, "看占城帮会排名榜/tongwar_query");
		tinsert(szContent, "占城帮会在各城市/tongwar_cityowner");
	end;
							
	tinsert(szContent, "武林第一帮活动/tongwar_detail");
	tinsert(szContent, "结束对话/OnCancel");
	
	CreateTaskSay(szContent);
end

function tongwar_title_talk() --领取天下第一帮的称号
	if (GetByte(GetTask(TONGWAR_RLTASK_AWARD),1) == get_tongwar_season()) then --帮主称号永久绑定
		Msg2Player("您获得称号<color=red>武林第一帮<color> 了.")
		CreateTaskSay({"<dec><npc>已领取称号<color=red>武林第一帮<color> 了.", "结束对话/OnCancel"});
		return
	end;        
	
	local szTongName = GetTong();
	if (FALSE(szTongName)) then
		CreateTaskSay({"<dec><npc>不够条件领取称号<color=red>武林第一帮<color>.", "结束对话/OnCancel"});
		return
	end;           
	
	local nLeagueID = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName);
	if (FALSE(nLeagueID)) then
		CreateTaskSay({"<dec><npc>不够条件领取称号<color=red>武林第一帮<color>.", "结束对话/OnCancel"});
		return
	end;
	
	local szLeagueName = LG_GetLeagueInfo(nLeagueID);
	
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1] or FALSE(tongwar_check_ownerright())) then
		CreateTaskSay({"<dec><npc>只有排名第一的占城帮成员才能获得该称号.", "结束对话/OnCancel"});
		return
	end;
	
	tongwar_title_award(szLeagueName);
end;

function tongwar_title_award(szlgname)
	SetTask(TONGWAR_RLTASK_AWARD, SetByte(GetTask(TONGWAR_RLTASK_AWARD), 1, get_tongwar_season()));
	if (GetTongMaster() == GetName() and LG_GetLeagueTask(TONGWAR_LGTYPE, szlgname, TONGWAR_LGTASK_MSTITLE) < 1) then
		Msg2Player("获得称号<color=green>武林盟主<color>");
		CreateTaskSay({"<dec><npc>恭喜您获得称号<color=yellow>武林盟主<color>.", "结束对话/OnCancel"});
		tongwar_addtitle(105);--帮主光环
		tongwar_award_log("获得武林盟主称号");
		LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, szlgname, TONGWAR_LGTASK_MSTITLE, 1);
	else
		Msg2Player("获得称号<color=green>武林第一帮<color>");
		CreateTaskSay({"<dec><npc>恭喜您获得 <color=yellow>武林第一帮称号<color>.", "结束对话/OnCancel"});
		tongwar_addtitle(106);--帮众光环
		tongwar_award_log("获得武林第一帮称号");
	end;
end;

function tongwar_addtitle(n_title)
	local nDate	= tonumber(GetLocalDate("%m%d"));
	local nDay	= mod(nDate,100)
	local nMon	= floor(nDate/100)
	nMon	= nMon + floor((nDay + 30)/30);
	nDay = mod((nDay + 30),30);
	local nTime	= mod(FormatTime2Number(GetCurServerTime()+30*24*60*60), 100000000)--nMon * 1000000 + nDay * 10000	-- 

	Title_AddTitle(n_title, 2, nTime);
	Title_ActiveTitle(n_title);
	SetTask(1122, n_title)
end;

function tongwar_query()
	local szmsg = "<dec><npc>武林第一帮决赛已结束，结果如下: \n"
	for i = 1, 7 do
		szmsg = format("%s -  <color=red>%d<color>: <color=yellow>占城帮总分是%s: %d  比赛分: %d<color>  <enter>",
												szmsg, i, _TONGWAR_ARRRANK[i][1], _TONGWAR_ARRRANK[i][2], _TONGWAR_ARRRANK[i][3]);
	end;
	CreateTaskSay({szmsg, "结束对话/OnCancel"});
end;

function OnCancel()
end

function tongwar_cityowner()
	local tb_Opp = {"<dec><npc>帮会占七大城市已分出，请选择想要看的城市信息:"};
	tb_Opp[getn(tb_Opp) + 1] = "今天对手是哪个帮会联盟/tongwar_enemy";
	for i=1,7 do
		tb_Opp[getn(tb_Opp) + 1] = format("占城帮会%s/#tongwar_cityowner_qur(%d)",
																			TONGWAR_CITY[i],i);
	end
	tb_Opp[getn(tb_Opp) + 1] = "返回/tongWar_Start";

	CreateTaskSay(tb_Opp);
end

function tongwar_cityowner_qur(nSel)
	local cityname = _TONGWAR_CITYOWNER[nSel][1];
	local tb_citymember = _TONGWAR_CITYOWNER[nSel][2];
	local n_lid = LG_GetLeagueObj(TONGWAR_LGTYPE, cityname);
	
	if (FALSE(n_lid)) then
		local szmsg = format("<dec><npc>城%s 没有帮会联盟参加武林第一帮财物争夺比赛.", cityname);
		CreateTaskSay({szmsg, "返回/tongwar_cityowner", "放弃/OnCancel"});
		return
	end;
	
	local n_count = LG_GetMemberCount(n_lid);
	if (getn(tb_citymember) ~= n_count) then	--成员在TempTable中，访问时如果确认
																						--成员数不是最新，则刷新下
		_TONGWAR_CITYOWNER[nSel][2] = tongwar_getmember(TONGWAR_CITY[nSel])
		tb_citymember = _TONGWAR_CITYOWNER[nSel][2]
	end
	
	local cityowner = ""
	local citymember = ""
	for i = 1, getn(tb_citymember) do
		if (tb_citymember[i][2] == 1) then
			cityowner = tb_citymember[i][1]
		else
			citymember = format("%s\n    <color=yellow>%s<color>", 
														citymember, tb_citymember[i][1]);
		end
	end
	local szmsg = "";
	if (cityowner == "") then
		szmsg = format("<dec><npc>城%s 没有帮会联盟参加武林第一帮财物争夺比赛.", cityname);
		CreateTaskSay({szmsg, "返回/tongwar_cityowner", "放弃/OnCancel"});
		return 
	elseif (citymember == "") then
		szmsg = format("<dec><npc>占城帮会%s 是 <color=red>%s<color>, 有联盟为\n  <没有>", 
															cityname, cityowner);
	else
		szmsg = format("<dec><npc>占城帮会%s 是 <color=red>%s<color>, 有联盟为 %s", 
															cityname, cityowner, citymember);
	end
	
	local nResult = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_RESULT);	--总积分
	local nPoint = LG_GetLeagueTask(n_lid, TONGWAR_LGTASK_POINT);		--净积分
	szmsg = format("%s\n 联盟总分: <color=yellow>%d<color><enter>   总分为 <color=yellow>%d<color>", szmsg, nResult, nPoint);
	CreateTaskSay({szmsg, "返回/tongwar_cityowner", "放弃/OnCancel"});
end

function tongwar_onjoin()
	if (FALSE(tongwar_check_ownerright(1))) then
		CreateTaskSay({"<dec><npc>只有<color=red>占城帮帮主<color> 才能成立帮会联盟.",
										 "结束对话/OnCancel"});
		return
	end;
	CreateTaskSay({"<dec><npc>占城帮帮主可以与不占城帮的帮主组队结盟，想成立联盟吗?",
					 				"请允许加入帮会联盟/tongwar_want2join",
					  			"结束对话/OnCancel"});
end

--判断是不是占城帮的帮主
function tongwar_check_ownerright(bmaster)
	local tongname = GetTongName();
	if (bmaster) then
		-- LLG_ALLINONE_TODO_20070802
		if (GetTongFigure() ~= TONG_MASTER) then --判断是否是帮主
			return nil
		end;
	end;
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (not FALSE(n_lid)) then
		local leaguename = LG_GetLeagueInfo(n_lid)
		if (LG_GetMemberTask(TONGWAR_LGTYPE, leaguename, tongname, TONGWAR_LGMTASK_JOB) == 1) then
			return n_lid
		end
	end

	return nil
end

function tongwar_want2join()
	if (GetTeamSize() <= 1) then
		CreateTaskSay({"<dec><npc>真是遗憾，组队为空，不能结为联盟!",
										 "结束对话/OnCancel"});
		return
	end;
	
	if (IsCaptain() ~= 1) then
		CreateTaskSay({"<dec><npc>只有<color=red>组长<color> 才能与其他帮会的帮主结为联盟.", "结束对话/OnCancel"});
		return
	end;
	
	local tb_teammember = tongwar_check_team();
	if (tb_teammember == nil) then
		return
	end
	
	local szmsg = format("想接纳%d 以下帮会进入联盟吗?",getn(tb_teammember))
	for i=1,getn(tb_teammember) do
		szmsg = format("%s\n<color=yellow>%s<color>",szmsg,tb_teammember[i]);
	end
	CreateTaskSay({szmsg, "想/tongwar_sure2join", "不需要!/OnCancel"});
end

function tongwar_sure2join()
	local tb_teammember, tb_rolename, teamtongid = tongwar_check_team();
	if (tb_teammember == nil) then
		return
	end
	local tongname, mytongid = GetTongName();
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	if (FALSE(n_lid)) then
		return
	end
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local ncityid = TONGWAR_CITYID[str_lgname];
	if (FALSE(ncityid)) then
		print(format("Error!!! CityName(leaguename) Wrong!!%s",str_lgname))
		return
	end;
	for i = 1, getn(tb_teammember) do
		--队友帮会名，队友名，战队名，队长名，队长帮会ID
		--local szParam = tb_teammember[i].." "..tb_rolename[i].." "..str_lgname.." "..GetName()
		local szParam = tostring(teamtongid[i]).." "..tb_rolename[i].." "..ncityid.." "..GetName().." "..mytongid;
		LG_ApplyDoScript(0, "", tb_teammember[i], "\\script\\event\\tongwar\\event.lua", "tongwar_add", szParam , "", "")
	end
end

--检查组对队友是否符合加入联盟的条件
--符合 返回 tab1(帮会名),tab2(帮主名),tab3(帮会id)
--不满足 返回 nil
function tongwar_check_team()
	local teammember = {};
	local tongmaster = {};
	local teamtongid = {};
	local str_capname = GetName();
	local str_captong = GetTongName();
	local teamsize = GetTeamSize();
	local n_capidx = PlayerIndex;
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i);
		local membername = GetName();
		local tongname, tongid = GetTongName();
		local szmsg = "";
		
		if (FALSE(tongid)) then
			PlayerIndex = n_capidx;
			szmsg = format("<dec><npc>成员%s 在队里不是帮会成员，不能加入联盟.",
											 membername);
			CreateTaskSay({szmsg, "结束对话/OnCancel"});
			return
		end;
		
		if (GetTongFigure() ~= TONG_MASTER) then
			PlayerIndex = n_capidx;
			szmsg = format("<dec><npc>对方不是帮主，不能接入联盟.",
											 tongname, membername, tongname);
			CreateTaskSay({szmsg, "结束对话/OnCancel"});
			return
		end
		
		--避免重复加入队员
		if (not FALSE(LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname))) then
			if (LG_GetLeagueObjByRole(TONGWAR_LGTYPE, str_captong) == LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)) then
				szmsg = format("<dec><npc>帮会%s 是%s 已加入联盟了.",
													membername, tongname);
			else
		 		szmsg = format("<dec><npc>帮会 %s 是%s 已加入其他联盟，不能加入您的帮会联盟了!",
													membername, tongname);
			end;
		 	PlayerIndex = n_capidx;
		 	CreateTaskSay({szmsg, "结束对话/OnCancel"});
		 	return 
		end
		teammember[i-1] = tongname;
		tongmaster[i-1] = membername;
		teamtongid[i-1] = tongid;
	end
	PlayerIndex = n_capidx
	return teammember, tongmaster, teamtongid
end

function tongwar_calendar()
	local str = "<dec><npc>"
	for i = 1, getn(TONGWAR_CALENDAR) do
		str = format("%s\n%s",str,TONGWAR_CALENDAR[i]);
	end
	CreateTaskSay({str, "结束对话/OnCancel"});
end

function tongwar_detail()
--VLDNB 11 - 更改通知- Modified by DinhHQ - 20120507
	CreateTaskSay({format("<dec><npc>从<color=green>%s <color>到<color=green>%s<color>, 除了<color=green>18/05/2012<color>,每天是一场比赛外(比赛日晚上的准备时间从<color=green>08: 00~08: 29<color>, 比赛时间为<color=green>08:30~09:30<color>), 每天有3场同时的比赛，同时将有一个帮会没有比赛。玫瑰帮会与联盟一起占领城市将一起和<color=green>6<color>其他城市与联盟比赛.","16/05/2012", "23/05/2012"), 
		"查看占城帮会比赛日程/tongwar_calendar", "返回/tongWar_Start", "我知道了!/OnCancel"});
end;

function tongwar_join()
	
end;

function tongwar_enemy()
	local szmsg = ""
	local szTongName = GetTongName();
	if ("" == szTongName) then
		CreateTaskSay({"<dec><npc>未加入帮会就不能参加比赛.", "返回tongwar_cityowner", "结束对话/OnCancel"});
		return
	end;
	local HostLeagueID = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName);
	if (0 == HostLeagueID) then
		CreateTaskSay({"<dec><npc>您的帮会为加入任何联盟，没有权参加比赛!", "Tr?v?tongwar_cityowner", "我知道了!/OnCancel"});
		return
	end;
	
	local szHostcityName = LG_GetLeagueInfo(HostLeagueID);
	local szHostTongNames = tongwar_getnamestr(HostLeagueID);
	--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
	local nDate = tonumber(GetLocalDate("%d"));
	if (nDate ~= 16 and nDate ~= 17 and nDate ~= 19 and nDate ~= 20 and nDate ~= 21 and nDate ~= 22 and nDate ~= 23) then
		szmsg = format("<dec><npc>今天是%d,不比赛.", nDate);
		CreateTaskSay({szmsg, "返回tongwar_cityowner", "我知道了!/OnCancel"});
		return
	end;
	
	local szGuestCityName = tongwar_getenemycity(szHostcityName, nDate);
	if (nil == szGuestCityName) then
		szmsg = format("<dec><npc>今天是%d,不比赛.", nDate);
		CreateTaskSay({szmsg, "返回tongwar_cityowner", "我知道了!/OnCancel"});
		return
	end;
	
	local GuestLeagueID = LG_GetLeagueObj(TONGWAR_LGTYPE, szGuestCityName);
	local szGuestTongNames = ""
	if not FALSE(GuestLeagueID) then 
		szGuestTongNames = tongwar_getnamestr(GuestLeagueID);
	end
	szmsg = format("<dec><npc>我的联盟 (占城帮 %s): %s <enter>    今天的对手(占城帮%s):  %s", 
										szHostcityName, szHostTongNames,
										szGuestCityName, szGuestTongNames);
	CreateTaskSay({szmsg, "返回tongwar_cityowner", "我知道了!/OnCancel"});
end;

--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
TAB_CITYNAME = {"襄阳", "汴京", "凤翔", "扬州", "临安", "成都", "大理"};
TAB_CALENDAR = {
	[16] = {5, 4, 0, 2, 1, 7, 6},
	[17] = {4, 3, 2, 1, 7, 0, 5},
	[19] = {3, 0, 1, 7, 6, 5, 4},
	[20] = {2, 1, 7, 6, 0, 4, 3},
	[21] = {0, 7, 6, 5, 4, 3, 2},
	[22] = {7, 6, 5, 0, 3, 2, 1},
	[23] = {6, 5, 4, 3, 2, 1, 0}
};

function tongwar_getenemycity(szCityName, nDate)
	local i;
	local nCount = getn(TAB_CITYNAME);
	local nPos = 0;
	for i = 1, nCount do
		if (szCityName == TAB_CITYNAME[i]) then
			nPos = i;
			break;
		end;
	end;
	
	if (0 == nPos) then
		return nil;
	end;

	local nEnemyCityIdx = TAB_CALENDAR[nDate][nPos];
	if (nEnemyCityIdx == 0) then
		return nil;
	end;
	return TAB_CITYNAME[nEnemyCityIdx];
end;

function tongwar_querycityrecord(szCityName)
	local LeagueID = LG_GetLeagueObj(TONGWAR_LGTYPE, szCityName);
	local nResult = LG_GetLeagueTask(LeagueID, TONGWAR_LGTASK_RESULT);
	local nPoint = LG_GetLeagueTask(LeagueID, TONGWAR_LGTASK_POINT);
	local szmsg = format("<dec><npc>占城帮联盟总分%s: <color=yellow>%d<color><enter>   战斗总分达: <color=yellow>%d<color>",
												 szCityName, nResult, nPoint);
	CreateTaskSay({szmsg, "返回tongwar_rank", "我知道了!/OnCancel"});
end;

function tongwar_getnamestr(LeagueID)	--得到一个城市占领帮会名字的列表；
	local nCount = LG_GetMemberCount(LeagueID);
	local szLeagueName = LG_GetLeagueInfo(LeagueID);
	local i;
	local szNames = "";
	local szTongName = "";
	local nMemberTask = 0;
	for i = 0, nCount - 1 do
		szTongName = LG_GetMemberInfo(LeagueID, i);
		if (LG_GetMemberTask(TONGWAR_LGTYPE, szLeagueName, szTongName, TONGWAR_LGMTASK_JOB) == 1) then
			szNames = "<enter>    <color=red>"..szTongName.."<color>"..szNames;
		else
			szNames = szNames.."<enter>    <color=red>"..szTongName.."<color>";
		end;
	end;
	return szNames;
end;


function tongwar_rank()
	local szTongName = GetTongName();
	if ("" == szTongName) then
		CreateTaskSay({"<dec><npc>未加入帮会，不能参加比赛.", 
											"结束对话/OnCancel"});
		return
	end;
	
	local HostLeagueID = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, szTongName);
	if (FALSE(HostLeagueID)) then
		CreateTaskSay({"<dec><npc>您的帮会未加入任何联盟，不能参加比赛!", 
											"结束对话OnCancel"});
		return
	end;
	
	local szHostcityName = LG_GetLeagueInfo(HostLeagueID);
	local nResult = LG_GetLeagueTask(HostLeagueID, TONGWAR_LGTASK_RESULT);	--总积分
	local nPoint = LG_GetLeagueTask(HostLeagueID, TONGWAR_LGTASK_POINT);		--净积分
	local nPlayerRecord = GetTask(TONGWAR_RLTASK_TOTALPOINT);
	local tab_auerycity = {};
	tab_auerycity[1] = format("<dec><npc>联盟总分 %s: <color=yellow>%d<color><enter>            战斗总分达: <color=yellow>%d<color><enter>     个人战斗分: <color=yellow>%d<color><enter>Xem th祅h th輈h li猲 minh kh竎",
										szHostcityName, nResult, nPoint, nPlayerRecord);
	
	for i = 1, getn(TAB_CITYNAME) do
		local cityname = TAB_CITYNAME[i];
		if (szHostcityName ~= cityname) then
			tab_auerycity[getn(tab_auerycity) + 1] = format("看联盟成绩%s/#tongwar_querycityrecord([[%s]])", cityname, cityname);
		end;
	end;
	tab_auerycity[getn(tab_auerycity) + 1] ="返回tongWar_Start"
	tab_auerycity[getn(tab_auerycity) + 1] ="结束对话/OnCancel"
	
	CreateTaskSay(tab_auerycity);
end;

function tongwar_aword_talk()	--这个后期来作
	if (FALSE(tongwar_check_ownerright(1))) then
		CreateTaskSay({"<dec><npc>只有占城帮主才能领奖", "我知道了!/OnCancel"});
		return
	end;
	
	local tongname = GetTongName()
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	local leaguename = LG_GetLeagueInfo(n_lid)
	
	local nRank = LG_GetLeagueTask(TONGWAR_LGTYPE, leaguename, TONGWAR_LGTASK_RANK);
	if (nRank > 7 or nRank < 1) then
		print("rank wrong")
		return
	end;
	
	local szDescribe = "";
	local arr_Remain = {};
	local isFinished = 1;
	for i = 1, getn(TAB_AWORD_GOOD) do
		arr_Remain[i] = TAB_AWORD_GOOD[i][2][nRank] - LG_GetLeagueTask(TONGWAR_LGTYPE, leaguename, LG_TASK_AWORD[i]);
		if (arr_Remain[i] > 0) then 
			szDescribe = format("%s<enter>%s: <color=yellow>%d<color>",
						szDescribe, TAB_AWORD_GOOD[i][1].szName,arr_Remain[i])
			isFinished = 0; 
		end;
	end;
	if (isFinished == 1) then
		CreateTaskSay({"<dec><npc>已领完奖了", "结束对话/OnCancel"});
		return
	end;
	
	
	local tab_AwordItem = {};
	tab_AwordItem = tongwar_getaworditem(nRank, arr_Remain); --生成奖励物品的选项
	if (getn(tab_AwordItem) == 0) then
		--Describe(WULINMENG_NPC.."联盟", 1, "我知道了/OnCancel");
		print("tab_AwordItem wrong!")
		return
	end;
	tinsert(tab_AwordItem, 1, format("<dec><npc>武林第一帮奖励还有%s<enter>. 在领之前需要<color=red>整理装备<color>, 你想领什么奖励?",szDescribe))
	CreateTaskSay(tab_AwordItem);
end

--
function tongwar_awordtalk_descript(szDescribe, nRemain, szItemName)
	if (nRemain > 0) then
		szDescribe = szDescribe.."<color=yellow>"..nRemain.."<color>"..szItemName;
	end;
	return szDescribe;
end;

function tongwar_getaworditem(nRank, arr_Remain)	--生成选择奖励选项
	local tab_AwordItem = {};
	
	for i = 1,getn(arr_Remain) do
		if (arr_Remain[i] > 0) then
			tinsert(tab_AwordItem, format("领取 %s",TAB_AWORD_GOOD[i][1].szName)..format("/#tongwar_aword(%d, %d)",i,nRank));
		end;
	end
	tinsert(tab_AwordItem, "我知道了!/OnCancel");
	return tab_AwordItem;
end;

function tongwar_aword(nItemType, nRank)
	if (GetTaskTemp(PL_TEMPTASK_SECURITY) == 1) then--防止刷
		return
	end;
	SetTaskTemp(PL_TEMPTASK_SECURITY, 1);
	
	if (FALSE(tongwar_check_ownerright())) then
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0)
		CreateTaskSay({"<dec><npc>只有占城帮主才能领奖!", "我知道了!/OnCancel"});
		return
	end;
	
	if (nRank < 1 or nRank > 7) then --排名检查
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0)
		return
	end;
	
	local tongname = GetTongName()
	local n_lid = LG_GetLeagueObjByRole(TONGWAR_LGTYPE, tongname)
	local leaguename = LG_GetLeagueInfo(n_lid)
	local nTotal = TAB_AWORD_GOOD[nItemType][2][nRank];
	local nAwordedCount = LG_GetLeagueTask(TONGWAR_LGTYPE, leaguename, LG_TASK_AWORD[nItemType]); --已经奖励的数量
	local nRemainCount = nTotal - nAwordedCount;

	local nFreeItemCount = CalcFreeItemCellCount();--包裹空隙检查
	local nMaxAwordCount = 60;
	if (nItemType == 2 or nItemType == 3) then
		nMaxAwordCount = 10;
	end;
	local nGiveCount = nRemainCount;
	if (nRemainCount > nMaxAwordCount) then
		nGiveCount = nMaxAwordCount;
	end;
	
	if (nFreeItemCount < nGiveCount and nFreeItemCount < nRemainCount) then
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0);
		CreateTaskSay({"<dec><npc>装备不足空位!", "我知道了!/OnCancel"});
		return
	end;

	local nResult = LG_ApplyAppendLeagueTask(TONGWAR_LGTYPE, leaguename, LG_TASK_AWORD[nItemType], nGiveCount, "", "");
	local str = "";
	if (nResult == 1) then
		str = format("帮 %s - 帮主%s 领取%d %s",tongname,GetName(),nGiveCount,TAB_AWORD_GOOD[nItemType][1].szName);
		tongwar_award_log(str);
		Msg2Player(str);
		
		local nItemID;
		local nowdate = tonumber(GetLocalDate("%y%m%d"))
		tbAwardTemplet:GiveAwardByList(TAB_AWORD_GOOD[nItemType][1],"TongWar_Award",nGiveCount);
--		for i = 1, nGiveCount do
--			nItemID = AddItem(TAB_AWORD_GOOD[nItemType][1][1], TAB_AWORD_GOOD[nItemType][1][2], TAB_AWORD_GOOD[nItemType][1][3], 0, 0, 0, 0);
--			if (nItemType == 1) then
--				SetSpecItemParam(nItemID, 1, nowdate)
--				SyncItem(nItemID)
--			elseif (nItemType == 3) then
--				local nExp = 20e8;
--				SetSpecItemParam(nItemID, 1, mod(nExp, 1e8))
--				SetSpecItemParam(nItemID, 2, nExp / 1e8)
--				SyncItem(nItemID)
--			end;
--			
--		end;
		Msg2Player(format(" 和%d %s",(nRemainCount - nGiveCount),TAB_AWORD_GOOD[nItemType][1].szName));
		SetTaskTemp(PL_TEMPTASK_SECURITY, 0);
		return
	end;
	CreateTaskSay({"<dec><npc>领奖失败，请再试一下!", "我知道了!/OnCancel"});
	tongwar_award_log(str.."不成功，请重试!")
	SetTaskTemp(PL_TEMPTASK_SECURITY, 0);
end;

--写入奖励日志
function tongwar_award_log(str)
	WriteLog("[TONGWAR_AWARD]"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..str)
end

--返回当前赛季阶段，1-报名，2-比赛，3-奖励
function tongwar_checkinphase()
	local nphase = gb_GetTask("TONGWAR_STATION", 2);
	return nphase;
end

--返回但前赛季ID
function get_tongwar_season()
	local nseason = gb_GetTask("TONGWAR_STATION", 3);
	return nseason;
end;

--清除上一赛季个人积分
function tongwar_clear_rlpoint()
	local nmyseason = GetByte(GetTask(TONGWAR_RLTASK_AWARD), 4);
	local ncurseaon = get_tongwar_season();
	if (nmyseason ~= ncurseaon) then
		SetTask(TONGWAR_RLTASK_AWARD, SetByte(GetTask(TONGWAR_RLTASK_AWARD), 4, ncurseaon));
		SetTask(TONGWAR_RLTASK_TOTALPOINT, 0);
	end;
end;
