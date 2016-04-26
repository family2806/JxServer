IncludeLib("ITEM")
Include("\\script\\tong\\tong_header.lua");

MAX_FACTION_TICKET = 5
--0少林，1天王，2唐门，3五毒，4峨嵋，5翠烟，6丐帮，7天忍，8武当，9昆仑，-1白名
TAB_TICKETINFO = 
{
{"少林门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,407,1}, 11},
{"天王门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,408,1}, 12},
{"唐门门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,409,1}, 13},
{"五毒门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,410,1}, 14},
{"峨眉门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,411,1}, 15},
{"翠烟门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,412,1}, 16},
{"丐帮门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,413,1}, 17},
{"天忍门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,414,1}, 18},
{"武当门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,415,1}, 19},
{"昆仑门派比赛", MAX_FACTION_TICKET, "比赛门派名单", 1, "wl_get", {6,1,416,1}, 20},

{"双斗", 5, "Song u", 2, "wl_getdoubleticket", {6,1,417,1}, 21},
{"五行斗", 3, "五行斗", 10, "wl_getfiveticket",{6,1,418,1}, 22},
{"十全斗", 2, "十全斗", 20, "wl_gettenticket",{6,1,419,1}, 23},
{"十六斗", 2, "十六斗", 32, "wl_getsixteenticket",{6,1,420,1}, 24},
};



function FALSE(nValue)
	if (nValue == 0 or nValue == nil) then
		return 1
	else
		return nil
	end
end

--记录当前玩家（领队）目前已经领了各类比赛的多少张票了？
TK_WL_TICKET_FACTION1 = 1603;
TK_WL_TICKET_FIVE = TK_WL_TICKET_FACTION1 + 10;
TK_WL_TICKET_TEN = TK_WL_TICKET_FIVE + 1;
TK_WL_TICKET_SIXTEEN = TK_WL_TICKET_TEN + 1;

MAX_TICKETCOUNT = 1
function ticket()
	Say("  本官可以帮什么?", 2, "我想领取今日斗场的票/wl_gettickets", "不需要/OnCancel")
end

function wl_gettickets()
	if (wl_checkzoneleader() == 0) then
		return
	end
	local tickettab ={};
	tickettab[1] = "今日门派斗场的票/wl_getfactionsticket";
	for i = 1, getn(TAB_TICKETINFO) - 10  do 
		tickettab[ getn( tickettab ) + 1 ] = TAB_TICKETINFO[10 + i  ][1].."/"..TAB_TICKETINFO[10 + i ][5]
	end
	
	tickettab[getn(tickettab)+ 1] = "我想想/OnCancel"--"获取比赛入场券有什么用处/wl_tickethelp";
	Say("您想领取那个门派的比赛入场券?", getn(tickettab), tickettab);
end

--获取十个门派的某个门票总入口函数
function wl_getfactionsticket()
	local tabticket={};
	for i = 1, 10 do 
		tabticket[i] = TAB_TICKETINFO[i][1].."/#wl_getticket("..i..")"
	end
	tabticket[getn(tabticket)+ 1] = "让我想想!/OnCancel";
	Say(" 您想领取那个门派的比赛入场券?", getn(tabticket), tabticket);
end

--获取某个门派的门票
function wl_getticket( matchtype)
	if (wl_checkzoneleader(matchtype) == 0) then
		return
	end

	local zoneid = wl_zonename2zoneid(GetTong())
	
	local lid = 0;
	if (matchtype <= 10) then
		lid = LG_GetLeagueObj(matchtype + 10, GetTong().."比赛门派名单"..matchtype.."_"..	TAB_TICKETINFO[1][2])
	else
		lid = LG_GetLeagueObj(matchtype + 10, GetTong()..TAB_TICKETINFO[matchtype][3]..TAB_TICKETINFO[matchtype][2])
	end
	if (lid > 0) then
		Say("对不起，参加该比赛的人数已购，不能领取参加资格了。详细情况可以看区域报名人数名单.", 0);
		return
	end
	
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("对不起!".."该项最大的参加资格票数为"..TAB_TICKETINFO[matchtype][2]..", 您已领取该项参赛资格票了。不能再领取了!",0)
		return
	end
--	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("武林大会官员：对不起！该项赛你能领取的最大资格票数量是"..MAX_TICKETCOUNT..",您已经领完该项赛的资格票了，不能再领了。",0)
--		return
--	end
	
	local tabticketinfo = {};
	for i = 1, TAB_TICKETINFO[matchtype][2] - usedcount do 
		tabticketinfo[i] = "我想先领"..i.."打开/#wl_suregetticket("..matchtype..","..i..")"
	end
	tabticketinfo[getn(tabticketinfo)+ 1] = "我想一想/OnCancel"
--	tabticketinfo[1]= "我要先领"..MAX_TICKETCOUNT.."张/#wl_suregetticket("..matchtype..","..MAX_TICKETCOUNT..")"
--	tabticketinfo[getn(tabticketinfo)+1] = "我下次再领吧/OnCancel";
	Say("您目前还有"..(TAB_TICKETINFO[matchtype][2] - usedcount).."打开"..TAB_TICKETINFO[matchtype][1].."参赛资格票，您想现在领吗？", getn(tabticketinfo), tabticketinfo)
--	Say("武林大会官员：你可以领取<color=yellow> "..MAX_TICKETCOUNT.." <color>张"..TAB_TICKETINFO[matchtype][1].."资格票，你要现在领取吗？", getn(tabticketinfo), tabticketinfo)
end

--确定要拿几张某种类型的门票
function wl_suregetticket(matchtype, count)
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("对不起!".."该项赛你能领取的最大资格票数量是"..TAB_TICKETINFO[matchtype][2]..", 您已领取该项参赛资格票了。不能再领取了!",0)
		return
	end
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("武林大会官员：对不起！".."该项赛你能领取的最大资格票数量是<color=yellow> "..MAX_TICKETCOUNT.." <color>,您已经领完该项赛的资格票了，不能再领了。",0)
--		return
--	end
	
	local zoneid = wl_zonename2zoneid(GetTong())
	if (zoneid == 0) then
		return
	end
	for i= 1 ,count do 
		nItemIndex = AddItem(TAB_TICKETINFO[matchtype][6][1], TAB_TICKETINFO[matchtype][6][2], TAB_TICKETINFO[matchtype][6][3], 1, 0,0,0)
		ITEM_SetItemExParam(nItemIndex, 1, zoneid)
		ITEM_SetItemExParam(nItemIndex, 2, matchtype)
	end
	SetTask(TK_WL_TICKET_FACTION1 + matchtype - 1 , usedcount + count)
end

--获得双人赛的门票
function wl_getdoubleticket()
	wl_getticket(11)
end

--获得五人赛的门票
function wl_getfiveticket()
	wl_getticket(12)
end

--获得十人赛的门票
function wl_gettenticket()
	wl_getticket(13)
end

--获得十六人赛的门票
function wl_getsixteenticket()
	wl_getticket(14)
end


function wl_checkzoneleader( matchtype )
--	do return 1 end
	local mon, day, hour = wl_checkfetchtime()
	local openmon, openday = wl_getmatchopenday(1)
	if ( (openmon >= mon and openday > day) or hour < 18 ) then
		if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
			Say("需是区域帮主或者长老才行!", 0)
			return 0
		end

		local zoneid = wl_zonename2zoneid(GetTong());
		if (zoneid == 0) then
			Say("对不起，需是比赛区域的帮主才能领取!",0)
			return 0
		end
		return 1
	end
	if ( hour >= 18 ) then
		if( not matchtype ) then
			return 1
		end
		
		local nMon = 0
		local nDay = 0;
		if (matchtype > 10) then
			nMon ,nDay = wl_getmatchopenday(matchtype)
		end
		
		if ( matchtype > 0 and matchtype <= 10 ) then
			local nMon1, nDay1 = wl_getmatchopenday(1)
			local nMon2, nDay2 = wl_getmatchopenday(15)
			if ( (nMon1 == mon and nDay1 == day) or ( nMon2 == mon and nDay2 == day ) ) then
				return 1
			end
		elseif ( nMon == mon and nDay == day ) then
		
			return 1
		else
			Say("今天为开赛"..TAB_TICKETINFO[matchtype][3]..", 您不能领取该比赛的入场券.", 0)
			return 0
		end
	end
	Say("现在不是领取比赛票时间!", 0)
	return 0
end


function wl_checkfetchtime(  )
--	local nTime = GetCurServerTime()
--	local nDate = FormatTime2Number(nTime)
	local nDate = date("%y%m%d%H%M")
	local year = floor( nDate / 100000000 )
	local mon = mod( floor( nDate / 1000000 ), 100 )
	local day = mod( floor( nDate / 10000 ), 100 )
	local hour = mod( floor( nDate / 100 ), 100 )
	return mon, day, hour
end

function wl_getmatchopenday(matchtype)
	if (TAB_SCHEDULE[matchtype] == nil) then
		return 0,0
	end
	local nMon = floor( TAB_SCHEDULE[matchtype] / 100 )
	local nDay = mod( TAB_SCHEDULE[matchtype] , 100 )
	return nMon, nDay
end

TAB_SCHEDULE = 
{
--	{循环赛开始时间，结束时间, 轮次,间隔时间, 响应函数},{32强赛开始时间,32强赛比赛结束时间, 轮次, 间隔时间, 响应函数},{最终决赛开始时间,结束时间，软次,间隔时间,响应函数}
[1] = 0712,
[11] = 0714,
[12] = 0715,
[13] = 0716,
[14] = 0717,
[15] = 0713
}

function wl_zonename2zoneid(zonename)
	for i=1, getn(TAB_ZONEINFO) do
		if (TAB_ZONEINFO[i] == zonename) then
			return i
		end
	end
	return 0
end



TAB_ZONEINFO = {
"1-1",
"1-2",
"1-3",
"2-1",
"2-2",
"2-3",
"3-1",
"3-2",
"3-3",
"4-1",
"4-2",
"4-3",
"5-1",
"5-2",
"6-1",
"6-2",
"6-3",
"7-1",
"7-2",
"7-3",
"8-1",
"8-2",
"9-1",
"9-2",
"10-1",
"10-2",
"11-1",
"11-2",
"11-3",
"12-1",
"12-2",
"13-1",
"13-2",
"14-1",
"15-1",
"16-1",
"17-1",
"18-1",
"19-1",
"20-1",
"20-2",
"22-1",

}

function OnCancel()
end