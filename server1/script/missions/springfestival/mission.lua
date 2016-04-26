Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\mission.lua]]);
STRGLOBALNEWS = "各位驱赶30岁人的英雄回来了.";

function initmission_add()

end;

function EndMission_add()
	local i;
	for i = 1, CO_SMALLMAPCOUNT do
		if (GetMSPlayerCount(CO_MISSIONID, i + CO_SMALLMAPCOUNT) > 0 or
		    GetMSPlayerCount(CO_MISSIONID, i) > 0) then
			groupsort(i);
			groupsort(i + CO_SMALLMAPCOUNT);
		end;
	end;
	festival_gameover(CO_MAPID[2], CO_MISSIONID);	--将所有玩家清除出地图
	AddGlobalNews(STRGLOBALNEWS);
	
	ClearMapObj(CO_MAPID[2]);
end;

function OnLeave()
end

function festival_getsz(tabMsg, nMsgCount, tabPlayer, nGroupId)
    local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	local i;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1];
		    tabMsg[i + nMsgCount] = "<color=orange>第"..i.." "..GetName()..", 找到"..CO_MOUSENAME..tabPlayer[i][2].."次";
		end
	end
	nMsgCount = getn(tabMsg);
	if (nMsgCount > 0) then
	    tabMsg[nMsgCount] = tabMsg[nMsgCount];
	end;
	return tabMsg, nMsgCount;
end;

function festival_broadcast(tabMsg, nMsgCount, tabPlayer)
    nCount = getn(tabPlayer);
    local i, j;
    --排序后从前到后就是名次的先后
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_CO_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
   	    	Msg2Player("你找到"..CO_MOUSENAME.."第<color=yellow>"..i.."<color> 次, 可以到 <color=yellow>衙门差役<color> 领奖!");
   	    else
   	    	Msg2Player("驱赶30岁人第<color=yellow>"..i.."<color> 次, 可以到 <color=yellow>衙门差役<color> 领奖!");
   	    end;
	end;
end;