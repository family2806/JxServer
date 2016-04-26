Include([[\script\missions\tong\tong_springfestival\head.lua]]);

-- LLG_ALLINONE_TODO_20070802
Include([[\script\item\springfestival2006\itemhead.lua]]);

ITEMNAME = "混沌蛊";
function main()
	tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (0 == itemuseplacecheck(2)) then
		return 1;
	end;
	local i;
	local nGroupId = GetTask(TK_GROUPID);
	nGroupId = festival_getgroupid(nGroupId);
	local OldPlayer = PlayerIndex;
	local nBeginMapID = GetMissionV(MS_SF_BEGINGMAPID);
	
	local tabPlayer = {};
	local szName = GetName();
	local idx = 0;
	local pidx;
	for i = 1, SF_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(SF_MISSIONID, idx, nGroupId);
		if (pidx > 0 and pidx ~= OldPlayer) then	--选择除玩家外的所有对手；
			tabPlayer[i] = pidx;
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local nCount = getn(tabPlayer);
	for i = 1, nCount do 
	    if (tabPlayer[i] > 0) then
	        PlayerIndex = tabPlayer[i];
	        festival_go_back(nBeginMapID)
			Msg2Player("<#><color=0xB5FDD7>"..szName.."<color> 使用<color=0xB5FDD7>"..ITEMNAME.."<color>, 使得各对手被转到其他区域.");
	    end;
	end;
	
	PlayerIndex = OldPlayer;
end;
