Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\mission.lua]]);
STRGLOBALNEWS = "��λ����30���˵�Ӣ�ۻ�����.";

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
	festival_gameover(CO_MAPID[2], CO_MISSIONID);	--����������������ͼ
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
		    tabMsg[i + nMsgCount] = "<color=orange>��"..i.." "..GetName()..", �ҵ�"..CO_MOUSENAME..tabPlayer[i][2].."��";
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
    --������ǰ����������ε��Ⱥ�
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_CO_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
   	    	Msg2Player("���ҵ�"..CO_MOUSENAME.."��<color=yellow>"..i.."<color> ��, ���Ե� <color=yellow>���Ų���<color> �콱!");
   	    else
   	    	Msg2Player("����30���˵�<color=yellow>"..i.."<color> ��, ���Ե� <color=yellow>���Ų���<color> �콱!");
   	    end;
	end;
end;