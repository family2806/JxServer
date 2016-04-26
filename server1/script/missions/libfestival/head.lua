if (not __FESTIVAL_HEAD__) then
	__FESTIVAL_HEAD__ = 1;

function no()

end;

function festival_log(str)
	-- 如果是空值则不写入
	if (str == nil) then 
		return 
	end;
	
	WriteLog("["..FESTIVAL_SHREWMOUSE.."活动]"..GetLocalDate(" [%y 年 %m 月 %d 日  %H 时%M 分]").." [密码"..GetAccount().."] [人物:"..GetName().."]"..str);
end;

--游戏结束
function festival_gameover(nMapID, nMissionID)
	local OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nMapID);
	
	local pidx;
	local idx = 0;
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local i;
	for i = 1, 400 do
		idx, pidx = GetNextPlayer(nMissionID, idx, 0);
		if (pidx > 0) then
			tabPlayer[i] = pidx;
		end;
		
		if (0 == idx) then
			break;
		end;
		
	end;
	
	local nLoop = getn(tabPlayer);
	for i = 1, nLoop do
		PlayerIndex = tabPlayer[i];
		NewWorld(GetTask(TK_CO_LEAVERMAPID), GetTask(TK_CO_LEAVERPOSX), GetTask(TK_CO_LEAVERPOSY));
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldWorld;
end;


--检查该玩家是否仍在游戏中，成功返回PlayerIndex否则返回nil
function festival_check_pl(szPlayName)
	local nPlIdx = SearchPlayer(szPlayName)	--玩家是否在当前服务器
	if (nPlIdx > 0) then
		local nPlMsIdx = PIdx2MSDIdx(CO_MISSIONID, nPlIdx)	--玩家是否在指定Mission中
		if (nPlMsIdx > 0) then
			return nPlIdx
		end
	end
end

--排序函数(根据点击个数由多到少确定将一组成员的名次)；
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CO_MAPID[2]);
	
	
	local OldPlayer = PlayerIndex;
	local tabNormalPlayer = {};
	tabNormalPlayer = festival_sort(nGroupId);
	local tabMsg = {}
	local nMsgCount;
	tabMsg, nMsgCount = festival_getsz(tabMsg, 0, tabNormalPlayer, nGroupId);
	
	
	festival_broadcast(tabMsg, nMsgCount, tabNormalPlayer);
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

function festival_sort(nGroupId)
    local tabPlayer = {};
    local idx = 0;
	local pidx;
    local i;
	for i = 1, CO_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(CO_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(TK_CO_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--采用一个冒泡排序
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--采用降序排序
				temptab = tabPlayer[j];
				tabPlayer[j] = tabPlayer[j - 1];
				tabPlayer[j - 1] = temptab;
			end;
		end;
	end;
	return tabPlayer;
end;

function festival_go_other_place()  --随机传到起始点
    local nBeginMapID = GetMissionV(MS_CO_BEGINGMAPID);
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\elf_]]..nMapId..[[.txt]];
	local PosX, PosY = getadata(szFile);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

function festival_go_back(nBeginMapID)  --随机传到起始点
	local nGroupId = GetTask(TK_CO_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, CO_SMALLMAPCOUNT) + 1;
	local szFile = [[\settings\maps\]]..CO_MAPPOINTFLORDER..[[\player.txt]];
	local PosX, PosY = getadatatow(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;

--检察自己的状态
function festival_get_exptimes()
	local exp_time = GetTask(TK_CO_EXP_TIME)
	if (exp_time >= GetCurServerTime()) then
		return GetTask(TK_CO_EXP_BEISHU);
	else
		return 1;
	end
end

end;	--	end of __FESTIVAL_HEAD__
