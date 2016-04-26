--七大城市 服务器
--主城城主奖励

Include("\\script\\lib\\gb_taskfuncs.lua");		--gb_Task
Include("\\script\\misc\\league_cityinfo.lua")
TB_MAINCITY_CITYWAR_T = {
--[城市编号]={攻城星期，城市Map，城市名}
	{4, 1, "凤翔"},
	{2, 11, "成都"},
	{3, 162, "大理"},
	{6, 37, "汴京"},
	{5, 78, "襄阳"},
	{1, 80, "扬州"},
	{7, 176, "临安"},
}

TB_MAINCITY_AWARDARY = {
--g,d,p,l,s,luck, count, free
	[1] = {6,1,1339,1,1,1, 10, 10},
	[2] = {6,1,1340,1,1,1, 100, 50},
}

--GetCityOwner()
function maincity_award_entry()
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (GetTongMaster() ~= GetName() or GetCityOwner(city_id) ~= GetTongName()) then
		Say("<#>你不是<"..GetCityAreaName(city_id).."的太守府>, 不能领取奖励!", 0);
		return 0;
	end;
	
	Say("<#>领取给太守的奖励",
	3,
	"<#>领取城主礼包/take_maincity_award",
	"<#>领取城主礼品/take_maincity_award",
	"<#> 我们暂时不领/OnCancel");
end;

function take_maincity_award(nSel)
	local nlg_tsk = nSel + 1;
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (check_award_condition(city_id, nlg_tsk, 1) ~= 1) then
		return 0;
	end;
	
	local ncount = TB_MAINCITY_AWARDARY[nlg_tsk][8];
	local ncurcount = get_citybonus_task(city_id, nlg_tsk);
	if (CalcFreeItemCellCount() < ncount) then
		Say("<#>你的背包空间不足，请先整理!", 0);
		return 0;
	end;
	local ng, nd, np, nl, ns, nluck = TB_MAINCITY_AWARDARY[nlg_tsk][1],TB_MAINCITY_AWARDARY[nlg_tsk][2],TB_MAINCITY_AWARDARY[nlg_tsk][3],
																		TB_MAINCITY_AWARDARY[nlg_tsk][4],TB_MAINCITY_AWARDARY[nlg_tsk][5],TB_MAINCITY_AWARDARY[nlg_tsk][6];
	
	
	local szLogmsg = "";
	if (nlg_tsk == 1) then
		szLogmsg = "领取城主礼包";
	else
		szLogmsg = "城主礼品";
		if (ncurcount >= ncount) then
			szLogmsg = "领取第2层: "..szLogmsg;
		else
			szLogmsg = "领取第1层: "..szLogmsg;
		end;
	end;
	
	set_citybonus_task(city_id, nlg_tsk, ncount+ncurcount);
	for i = 1, ncount do
		AddItem(ng, nd, np, nl, ns, nluck);
	end;
	WriteLog("[奖励 server 7大城市\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t").."Name:"..GetName().." Account:"..GetAccount()..szLogmsg..ncount.."个");
	Say("<#>你"..szLogmsg..". 祝贺!", 0);
end;

function check_award_condition(city_id, nlg_tsk, show_talk)
	if (city_id > 7 or city_id < 1) then
		if (show_talk) then
			Say("<#>指定太守有差错，请和管理人员联系！", 0);
		end;
		return 0
	end;
	local nDeadline = get_maincity_deadline(city_id);
	
	local ncurweek = tonumber(GetLocalDate("%w"));
	if (ncurweek == 0) then
		ncurweek = 7;
	end;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == ncurweek and tonumber(GetLocalDate("%H%M")) >= 2000 and tonumber(GetLocalDate("%H%M")) < 2230) then
		Say("<#>处于攻城时间，城主不能领取奖励.", 0);
		return 0;
	end;
	local nTskDate = get_maincitybonus_date(city_id);
	if (nDeadline ~= nTskDate) then
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_BONUS, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_GIFT, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_DATE, nDeadline);
	end;
	local ntskvalue = get_citybonus_task(city_id, nlg_tsk);
	
	if (ntskvalue >= TB_MAINCITY_AWARDARY[nlg_tsk][7]) then
		if (show_talk) then
			Say("<#>你不是已经领取这周的奖励了吗?", 0);
		end;
		return 0;
	end;
	return 1;
end;

function get_maincity_deadline(city_id)
	local nServerTime = GetCurServerTime();
	local nCurWeek = tonumber(GetLocalDate("%w"));
	if (nCurWeek == 0) then
		nCurWeek = 7;
	end;
	local nCurDate = floor(FormatTime2Number(nServerTime) / 10000);
	local nCurTime = mod(FormatTime2Number(GetCurServerTime()) , 10000);
	local naddtime = 0;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == nCurWeek) then
		if (nCurTime < 2000) then
			return nCurDate;
		else
			naddtime = 7;
		end;
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] < nCurWeek) then
		naddtime = (7 - nCurWeek + TB_MAINCITY_CITYWAR_T[city_id][1]);
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] > nCurWeek) then
		naddtime = (TB_MAINCITY_CITYWAR_T[city_id][1] - nCurWeek);
	end;
	return floor(FormatTime2Number(nServerTime + naddtime * 24 * 60 * 60) / 10000)
end;

