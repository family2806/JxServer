--
Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\gb_taskfuncs.lua")

Include("\\script\\mission\\citywar_global\\ladder.lua")


TAB_NONE_CITYWAR = 
{
{{100414,100428},{70913,70930},{80317,80330},{81002,81016},{90402,90416},{91002,91016}}, --startsignup there is no-citywar dates in phase1, you can write oneday use {yymmdd}, or somedays "from to" use {yymmdd, yymmdd}
{{100414,100428},{70913,70930},{80317,80330},{81002,81016},{90402,90416},{91002,91006}}, --endsignup there is no-citywar dates in phase2, you can write oneday use {yymmdd}, or somedays use {yymmdd, yymmdd}
{{100414,100428},{70913,70930},{80317,80330},{81002,81016},{90402,90416},{91002,91006}}, --startarena there is no-citywar dates in phase3, you can write oneday use {yymmdd}, or somedays use {yymmdd, yymmdd}
{{100415,100428},{70914,71001},{80318,80331},{81003,81016},{90403,90416},{91003,91006}}, --startcitywar there is no-citywar dates in phase4, you can write oneday use {yymmdd}, or somedays use {yymmdd, yymmdd}
}

LGTSK_QINGTONGDING_COUNT = 1;	--报名竞投的 青铜鼎数量
LGTSK_CITYWAR_SIGNCOUNT = 2;	--当前竞投的次数

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;

TB_CITYWAR_ARRANGE = {
				{3,4,"凤翔"},--
				{1,2,"成都"},--
				{2,3,"大理},--
				{5,6,"汴京"},--
				{4,5,"襄阳"},--
				{0,1,"扬州 "},--
				{6,0,"临安"},--
			}

function cw_CanStart(nCityId, nPhase)
	local nowday = tonumber(date("%y%m%d"))
	local nBegin = 0
	local nEnd = 0 
	for i = 1, getn(TAB_NONE_CITYWAR[nPhase]) do
		if (getn(TAB_NONE_CITYWAR[nPhase][i]) >= 2) then 
			nBegin = TAB_NONE_CITYWAR[nPhase][i][1]
			nEnd = TAB_NONE_CITYWAR[nPhase][i][2]
		else
			nBegin = TAB_NONE_CITYWAR[nPhase][i][1]
			nEnd = TAB_NONE_CITYWAR[nPhase][i][1]
		end
		
		if (nowday >= nBegin and nowday <= nEnd) then 
			OutputMsg(format("CityWar(%d) Can Not Start In This Phase(%d)!!!", nCityId, nPhase));
			return 0
		end
	end
	return 1
end

--如果为nil或0，返回1，否则返回0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

--选择竞投鼎最多的帮会做为挑战者
--如果数量一样，则随机选一个
function GetRandomChallenger(szCityName)
	local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szCityName);
	local nmem = LG_GetMemberCount(nlid);
	local szMem = "";
	local tbMem = {};
	if (nmem == 0) then
		return nil;
	end;
	if (nmem == 1) then
		szMem = LG_GetMemberInfo(nlid, 0);
		if (not FALSE(szMem)) then
			return szMem;
		else
			return nil;
		end;
	end;
	
	for i = 0, nmem - 1 do
		szMem = LG_GetMemberInfo(nlid, i);
		ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szCityName, szMem, LGTSK_QINGTONGDING_COUNT);
		if (getn(tbMem) == 0) then
			tbMem[1] = {szMem, ncount};
		else
			if (ncount == tbMem[1][2]) then
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			elseif (ncount > tbMem[1][2]) then
				tbMem = {};
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			end;
		end;
	end;
	
	return tbMem[random(getn(tbMem))][1];
end;

function cw_startsignup_fun(nweek,ncan)
	if (tonumber(date("%w")) == nweek and cw_CanStart(ncan,1) == 1) then
		citywar_tbLadder:Reset();
		--报名开始，状态置一
		LG_ApplySetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[ncan][3], 1, 1);
		GlobalExecute(format("dw AddLocalNews([[报名攻城战%s已经开始，未占城且18级以上的帮会可以到各新手村攻城官处报名参加.]])",TB_CITYWAR_ARRANGE[ncan][3]));
		OutputMsg(format("攻城战 %s 已开始报名",TB_CITYWAR_ARRANGE[ncan][3]))
	end;
	
end
function cw_start_fun(nweek,ncan)
	if (tonumber(date("%w")) == nweek and cw_CanStart(ncan,4) == 1) then
			StartCityWar(ncan);
	end;
end

function cw_endsignup_fun(nweek,ncan)
	if (tonumber(date("%w")) == nweek and cw_CanStart(ncan,2) == 1) then
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[ncan][3]);
		szWarCityName = TB_CITYWAR_ARRANGE[ncan][3]
		if (FALSE(nlid)) then
			OutputMsg(format("攻城战 %s 没有帮会报名，这周万事太平.",szWarCityName));
			GlobalExecute(format("dw AddLocalNews([[攻城战 %s 没有帮会报名，这周万事太平]])",szWarCityName));
			return 0;
		end
		local szFirstTong = GetRandomChallenger(TB_CITYWAR_ARRANGE[ncan][3]);
		if (FALSE(szFirstTong)) then
			OutputMsg(format("攻城战 %s 没有帮会报名，这周万事太平.",szWarCityName));
			GlobalExecute(format("dw AddLocalNews([[攻城战 %s 没有帮会报名，这周万事太平]])",szWarCityName));
			return 0;
		end;
		
		if (GetCityOwner(ncan) == "" or GetCityOwner(ncan) == nil) then
			--GlobalExecute("dw AppointViceroy([[成都]],[["..szFirstTong.."]])");
			GlobalExecute(format("dwf \\script\\missions\\citywar_global\\citywar_function.lua citywar_appointviceroy([[%s]],[[%s]])",szWarCityName,szFirstTong));
			--GlobalExecute(format("dw AddLocalNews([[%s 帮会竞投成功，成为成都城区的新城主]])", szFirstTong));
			--OutputMsg(szFirstTong.."竞投成功，成为成都城区的城主。")
		else
			--GlobalExecute("dw AppointChallenger([[成都]],[["..szFirstTong.."]])");
			GlobalExecute(format("dwf \\script\\missions\\citywar_global\\citywar_function.lua citywar_appointchallenger([[%s]],[[%s]])",szWarCityName,szFirstTong));
			OutputMsg(format("%s 争夺令牌成功，成为挑战城帮会%s 在明天.",szFirstTong,szWarCityName))
			GlobalExecute(format("dw AddLocalNews([[帮会%s 争夺令牌成功，成为挑战城帮会%s]])", szFirstTong,szWarCityName));
		end;
	end;
	--报名结束，状态置零
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[ncan][3], 1, 0);
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
