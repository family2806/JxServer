Include("\\script\\missions\\citywar_city\\head.lua");

function OnTimer()
	WriteLog(GetLoop().."到战斗时间了. ");
	timestate = GetMissionV(MS_STATE);
	str = format("%s争夺时间结束!!现在%d 弄猪已经恢复属性", GetGameCity(), MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "防守方"	;
		else 	
			str = str .. "进攻方";
		end;
	end;
	
	if (timestate == 2) then --开战中
		nCount = CheckWin();
		if (nCount > MS_SYMBOLCOUNT / 2) then 
			str = format("最终进攻方 %s: %s 取得完全胜利! 得到统治权%s?",str,GetGamerName(2),GetGameCity());
			AddGlobalNews(str);
			GameWin(2)
			return
		else
			str = format("最终防守方 %s: %s 完全胜利! 继续维持统治%s?",str,GetGamerName(2),GetGameCity());
			AddGlobalNews(str);
			GameWin(1)
			return
		end;
	end;

	CloseMission(MISSIONID);
end;
