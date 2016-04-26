Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\schedule\fairy_smalltimer.lua]]);

function ontimer_add(nTimeNo)
	if (4 == nTimeNo) then
	    festival_nianshou();
	    festival_affiche();
	end;

	if (nTimeNo < 4) then --15秒什么事情都不作
	    return
	end;

	local nIndex = mod(nTimeNo, 3);--进行0, 1, 2之间转换0－清除怪，1刷怪
	if (1 == nIndex) then		--	刷怪
		ClearMapObj(CO_MAPID[2]);
		festival_putfairy();
		return
	elseif (0 == nIndex) then	--	清除怪
		festival_change_to_gift();
		festival_clearfairy();
		return
	elseif (2 == nIndex) then	--	清除怪
		festival_nianshou();
		festival_givedaoju();
		return
	end;
end;

function festival_affiche()
    local i;
    local nCount = CO_SMALLMAPCOUNT * 2;
    for i = 1, CO_SMALLMAPCOUNT do
        Msg2MSGroup(CO_MISSIONID, "你需要用3种道具中的一种 '<color=yellow>圆炮<color>', '<color=yellow> 鼠夹<color>', '<color=yellow>升天炮仗<color>'."..CO_ANIMALNAME.."!", i);
    end;
    
    for i = CO_SMALLMAPCOUNT + 1, nCount do
        Msg2MSGroup(CO_MISSIONID, "目前是 "..CO_ANIMALNAME.."需要找'<color=yellow>"..CO_MOUSENAME.."<color>' 才能领奖!", i);
    end;
end;
--	初始化位置列表
function festival_putfairy()
	local i, j;
	local OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CO_MAPID[2])
	local scriptfile = [[\script\missions\springfestival\npcs\festival_shrewmouse.lua]];
	
	local nBeginID = GetMissionV(MS_CO_BEGINGMAPID) + 1;
	local nLoopLimit = nBeginID + GetMissionV(MS_CO_GAMECOUNT) - 1;
	
	for i = nBeginID, nLoopLimit do
	    if (i > CO_SMALLMAPCOUNT) then
	        j = mod(i, CO_SMALLMAPCOUNT);
	    else
	        j = i;
	    end;
		nNPCCount = random(CO_MOUSECOUNT_MIN, CO_MOUSECOUNT_MAX);
		local PosFile = format("\\settings\\maps\\"..CO_MAPPOINTFLORDER.."\\elf_%d.txt", j);
		PosTab = getndata(PosFile, nNPCCount)

		tabadddiagnpc(PosTab, scriptfile, CO_NPCID, CO_MOUSENAME)
	end;
	SubWorld = OldWorld;
end;


--清除圣诞精灵
function festival_clearfairy()
	local OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CO_MAPID[2]);
	ClearMapNpcWithName(CO_MAPID[2], CO_MOUSENAME);     --将所有的年兽清除
	SubWorld = OldWorld;
end;
function festival_nianshou()
    local i;
    for i = 1, CO_SMALLMAPCOUNT do
        if (GetMSPlayerCount(CO_MISSIONID, i) > 0) then
            local tabPlayers = {};
            tabPlayers = festival_getman(i);
            festival_make_nianshou(i, tabPlayers);
        end;
    end;
end;
--函数判断游戏中是否还有适当数量的年兽，返回nil则年兽不进行变化
function festival_getman(nGroupID)
    local nPlayerCount = GetMSPlayerCount(CO_MISSIONID, nGroupID);
    local nNianshouCount = GetMSPlayerCount(CO_MISSIONID, nGroupID + CO_SMALLMAPCOUNT);

    local tabPlayers = {};
    local tabPlayersOne = {};
    local i;
    local idx, pidx;
    for i = 1, 2 do
        idx, pidx = GetNextPlayer(CO_MISSIONID, idx, nGroupID);
		
		if (pidx > 0) then
			tabPlayers[i] = pidx;
		end;
		
		if (idx == 0) then
			break;
		end;
    end;
    if (getn(tabPlayers) > 0) then
        tabPlayersOne[1] = tabPlayers[1];
    end;
    
    if (2 == nNianshouCount) then   --如果两个年兽都在
        return nil;
    elseif (1 == nNianshouCount) then   --如果只有一个年兽在，判断人数，加一个年兽
        if (nPlayerCount >= 5) then
            return tabPlayersOne;
        end;
    elseif (0 == nNianshouCount) then   --如果年兽都跑光了
        if (nPlayerCount >= 6) then
            return tabPlayers;
        else
            return tabPlayersOne;
        end;
    else
        return nil;
    end;
end;

function festival_make_nianshou(nGroupID, tabPlayers)
    if ("table" ~= type(tabPlayers)) then
        return
    end;
    local nPlayerCount = getn(tabPlayers);
    if (0 == nPlayerCount) then
        return
    end;
    local i;
    local nOldPlayer = PlayerIndex;
    for i = 1, nPlayerCount do
        PlayerIndex = tabPlayers[i];
        DelMSPlayer(CO_MISSIONID, nGroupID);
        AddMSPlayer(CO_MISSIONID, nGroupID + CO_SMALLMAPCOUNT);
        SetTask(TK_CO_GROUPID, nGroupID + CO_SMALLMAPCOUNT);
        ChangeOwnFeature(0,0,0);  --变成摇旗人
        SetCurCamp(2);  --变成绿色
    end;
    PlayerIndex = nOldPlayer;
end;

--将没有点掉的走失的孩子变成礼包
function festival_change_to_gift()
    local i;
    local x, y, subworld, npcidx;
    local npcidxtab = GetMapNpcWithName(CO_MAPID[2], CO_MOUSENAME);
    local nNPCCount = getn(npcidxtab);
    local nItemIdx = -1;
    for i = 1, nNPCCount do
        x, y, subworld = GetNpcPos(npcidxtab[i]);
        nItemIdx = DropItem(subworld, x, y, -1, 6, 1, 1050, 1, 0, 0, 0);
        if (2 >= 1) then
            SetSpecItemParam(nItemIdx, 1, 1); --1表示真的，2表示假的
            SetSpecItemParam(nItemIdx, 2, 1); --只让一个玩家拣
        end;
    end;
end;

festival_tab_nianshou = 
{
    --{nItmeID, nItemCount},
    {1035,	0.05	},
    {1036,	0.05	},
    {1037,	0.05	},
    {1038,	0.05	},
    {1039,	0.2	},
    {1040,	0.025	},
    {1041,	0.2	},
    {1042,	0.2	},
    {1043,	0.1	},
    {1044,	0.025	},
    {1045,	0.05	},
}

festival_tab_normal = 
{
    --{nItmeID, nItemCount},
    {1046, 0.7},
    {1047, 0.15},
    {1048, 0.15},
}

--把道具给玩家们
function festival_givedaoju()
    local nOldPlayer = PlayerIndex;
    local i, j, nGroupID;
    local idx, pidx;
    idx = 0;
    local nCount = CO_SMALLMAPCOUNT * 2;
    for i = 1, nCount do
        if (GetMSPlayerCount(CO_MISSIONID, i) > 0) then
            idx = 0;
            for j = 1, 400 do
                idx, pidx = GetNextPlayer(CO_MISSIONID, idx, i);
        		if (pidx > 0) then
        		    PlayerIndex = pidx;
        		    nGroupID = GetTask(TK_CO_GROUPID);
        		    if (nGroupID <= CO_SMALLMAPCOUNT) then
        		        festival_give_Item(festival_tab_normal, 3);
        		    else
        		        festival_give_Item(festival_tab_nianshou, 3); 
        		    end;
        		end;
        		
        		if (idx == 0) then
        			break;
        		end;
    		end;
        end;
    end;
    PlayerIndex = nOldPlayer;
end;

function festival_give_Item(tabItem, nTotal) --普通玩家发道具
    if (0 == getn(tabItem)) then
        return
    end;
    
    local i, j;
    nTableCount = getn(tabItem);
    local nItemCount;
    local nItemID;
    for i = 1, nTableCount do
        nItemID = tabItem[i][1];
        nItemCount = tabItem[i][2] * nTotal;
        local nItemCount1 = nItemCount - floor(nItemCount);
        local nSeed = random(1, 100);
        if (nSeed <= nItemCount1 * 100) then
            nItemCount = ceil(nItemCount);
        else
            nItemCount = floor(nItemCount);
        end;
        for j = 1, nItemCount do
            AddItem(6, 1, nItemID, 1, 0, 0, 0);
        end;
    end;
end;
