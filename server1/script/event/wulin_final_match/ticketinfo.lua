IncludeLib("ITEM")
Include("\\script\\tong\\tong_header.lua");

MAX_FACTION_TICKET = 5
--0���֣�1������2���ţ�3�嶾��4���ң�5���̣�6ؤ�7���̣�8�䵱��9���أ�-1����
TAB_TICKETINFO = 
{
{"�������ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,407,1}, 11},
{"�������ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,408,1}, 12},
{"�������ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,409,1}, 13},
{"�嶾���ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,410,1}, 14},
{"��ü���ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,411,1}, 15},
{"�������ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,412,1}, 16},
{"ؤ�����ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,413,1}, 17},
{"�������ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,414,1}, 18},
{"�䵱���ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,415,1}, 19},
{"�������ɱ���", MAX_FACTION_TICKET, "������������", 1, "wl_get", {6,1,416,1}, 20},

{"˫��", 5, "Song ��u", 2, "wl_getdoubleticket", {6,1,417,1}, 21},
{"���ж�", 3, "���ж�", 10, "wl_getfiveticket",{6,1,418,1}, 22},
{"ʮȫ��", 2, "ʮȫ��", 20, "wl_gettenticket",{6,1,419,1}, 23},
{"ʮ����", 2, "ʮ����", 32, "wl_getsixteenticket",{6,1,420,1}, 24},
};



function FALSE(nValue)
	if (nValue == 0 or nValue == nil) then
		return 1
	else
		return nil
	end
end

--��¼��ǰ��ң���ӣ�Ŀǰ�Ѿ����˸�������Ķ�����Ʊ�ˣ�
TK_WL_TICKET_FACTION1 = 1603;
TK_WL_TICKET_FIVE = TK_WL_TICKET_FACTION1 + 10;
TK_WL_TICKET_TEN = TK_WL_TICKET_FIVE + 1;
TK_WL_TICKET_SIXTEEN = TK_WL_TICKET_TEN + 1;

MAX_TICKETCOUNT = 1
function ticket()
	Say("  ���ٿ��԰�ʲô?", 2, "������ȡ���ն�����Ʊ/wl_gettickets", "����Ҫ/OnCancel")
end

function wl_gettickets()
	if (wl_checkzoneleader() == 0) then
		return
	end
	local tickettab ={};
	tickettab[1] = "�������ɶ�����Ʊ/wl_getfactionsticket";
	for i = 1, getn(TAB_TICKETINFO) - 10  do 
		tickettab[ getn( tickettab ) + 1 ] = TAB_TICKETINFO[10 + i  ][1].."/"..TAB_TICKETINFO[10 + i ][5]
	end
	
	tickettab[getn(tickettab)+ 1] = "������/OnCancel"--"��ȡ�����볡ȯ��ʲô�ô�/wl_tickethelp";
	Say("������ȡ�Ǹ����ɵı����볡ȯ?", getn(tickettab), tickettab);
end

--��ȡʮ�����ɵ�ĳ����Ʊ����ں���
function wl_getfactionsticket()
	local tabticket={};
	for i = 1, 10 do 
		tabticket[i] = TAB_TICKETINFO[i][1].."/#wl_getticket("..i..")"
	end
	tabticket[getn(tabticket)+ 1] = "��������!/OnCancel";
	Say(" ������ȡ�Ǹ����ɵı����볡ȯ?", getn(tabticket), tabticket);
end

--��ȡĳ�����ɵ���Ʊ
function wl_getticket( matchtype)
	if (wl_checkzoneleader(matchtype) == 0) then
		return
	end

	local zoneid = wl_zonename2zoneid(GetTong())
	
	local lid = 0;
	if (matchtype <= 10) then
		lid = LG_GetLeagueObj(matchtype + 10, GetTong().."������������"..matchtype.."_"..	TAB_TICKETINFO[1][2])
	else
		lid = LG_GetLeagueObj(matchtype + 10, GetTong()..TAB_TICKETINFO[matchtype][3]..TAB_TICKETINFO[matchtype][2])
	end
	if (lid > 0) then
		Say("�Բ��𣬲μӸñ����������ѹ���������ȡ�μ��ʸ��ˡ���ϸ������Կ���������������.", 0);
		return
	end
	
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("�Բ���!".."�������Ĳμ��ʸ�Ʊ��Ϊ"..TAB_TICKETINFO[matchtype][2]..", ������ȡ��������ʸ�Ʊ�ˡ���������ȡ��!",0)
		return
	end
--	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("���ִ���Ա���Բ��𣡸�����������ȡ������ʸ�Ʊ������"..MAX_TICKETCOUNT..",���Ѿ�������������ʸ�Ʊ�ˣ����������ˡ�",0)
--		return
--	end
	
	local tabticketinfo = {};
	for i = 1, TAB_TICKETINFO[matchtype][2] - usedcount do 
		tabticketinfo[i] = "��������"..i.."��/#wl_suregetticket("..matchtype..","..i..")"
	end
	tabticketinfo[getn(tabticketinfo)+ 1] = "����һ��/OnCancel"
--	tabticketinfo[1]= "��Ҫ����"..MAX_TICKETCOUNT.."��/#wl_suregetticket("..matchtype..","..MAX_TICKETCOUNT..")"
--	tabticketinfo[getn(tabticketinfo)+1] = "���´������/OnCancel";
	Say("��Ŀǰ����"..(TAB_TICKETINFO[matchtype][2] - usedcount).."��"..TAB_TICKETINFO[matchtype][1].."�����ʸ�Ʊ��������������", getn(tabticketinfo), tabticketinfo)
--	Say("���ִ���Ա���������ȡ<color=yellow> "..MAX_TICKETCOUNT.." <color>��"..TAB_TICKETINFO[matchtype][1].."�ʸ�Ʊ����Ҫ������ȡ��", getn(tabticketinfo), tabticketinfo)
end

--ȷ��Ҫ�ü���ĳ�����͵���Ʊ
function wl_suregetticket(matchtype, count)
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("�Բ���!".."������������ȡ������ʸ�Ʊ������"..TAB_TICKETINFO[matchtype][2]..", ������ȡ��������ʸ�Ʊ�ˡ���������ȡ��!",0)
		return
	end
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("���ִ���Ա���Բ���".."������������ȡ������ʸ�Ʊ������<color=yellow> "..MAX_TICKETCOUNT.." <color>,���Ѿ�������������ʸ�Ʊ�ˣ����������ˡ�",0)
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

--���˫��������Ʊ
function wl_getdoubleticket()
	wl_getticket(11)
end

--�������������Ʊ
function wl_getfiveticket()
	wl_getticket(12)
end

--���ʮ��������Ʊ
function wl_gettenticket()
	wl_getticket(13)
end

--���ʮ����������Ʊ
function wl_getsixteenticket()
	wl_getticket(14)
end


function wl_checkzoneleader( matchtype )
--	do return 1 end
	local mon, day, hour = wl_checkfetchtime()
	local openmon, openday = wl_getmatchopenday(1)
	if ( (openmon >= mon and openday > day) or hour < 18 ) then
		if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
			Say("��������������߳��ϲ���!", 0)
			return 0
		end

		local zoneid = wl_zonename2zoneid(GetTong());
		if (zoneid == 0) then
			Say("�Բ������Ǳ�������İ���������ȡ!",0)
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
			Say("����Ϊ����"..TAB_TICKETINFO[matchtype][3]..", ��������ȡ�ñ������볡ȯ.", 0)
			return 0
		end
	end
	Say("���ڲ�����ȡ����Ʊʱ��!", 0)
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
--	{ѭ������ʼʱ�䣬����ʱ��, �ִ�,���ʱ��, ��Ӧ����},{32ǿ����ʼʱ��,32ǿ����������ʱ��, �ִ�, ���ʱ��, ��Ӧ����},{���վ�����ʼʱ��,����ʱ�䣬���,���ʱ��,��Ӧ����}
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