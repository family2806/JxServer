Include("\\script\\missions\\citywar_city\\head.lua");

function OnTimer()
	WriteLog(GetLoop().."§Õn giê thi ®Êu. ");
	timestate = GetMissionV(MS_STATE);
	str = format("%s kÕt thóc thêi gian tranh ®o¹t!! HiÖn t¹i %d Long trô ®· håi phôc thuéc tİnh", GetGameCity(), MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "Phe phßng thñ "	;
		else 	
			str = str .. "Phe tÊn c«ng ";
		end;
	end;
	
	if (timestate == 2) then --¿ªÕ½ÖĞ
		nCount = CheckWin();
		if (nCount > MS_SYMBOLCOUNT / 2) then 
			str = format("×îÖÕPhe tÊn c«ng  %s: %s È¡µÃÍêÈ«Ê¤Àû! µÃµ½Í³ÖÎÈ¨%s?",str,GetGamerName(2),GetGameCity());
			AddGlobalNews(str);
			GameWin(2)
			return
		else
			str = format("×îÖÕPhe phßng thñ  %s: %s ÍêÈ«Ê¤Àû! ¼ÌĞøÎ¬³ÖÍ³ÖÎ%s?",str,GetGamerName(2),GetGameCity());
			AddGlobalNews(str);
			GameWin(1)
			return
		end;
	end;

	CloseMission(MISSIONID);
end;
