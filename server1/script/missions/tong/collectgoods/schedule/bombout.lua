Include([[\script\missions\tong\collectgoods\head.lua]]);

function bombout()
	local nOrder = GetMissionV(COLLG_MS_NEWSVALUE) - 1;
	local nOrgPlayer = PlayerIndex;
	local tabPlayer = {};
	local tab_Player = {};
	local i, j;
	local k = 1;
	
	for i = 1, COLLG_SMALLMAPCOUNT do
		nPCount = GetMSPlayerCount(COLLG_MISSIONID, i);
		if (nPCount <= 0) then
			break;
		end;
		tab_Player[i] = {};
		local idx = 0;
		for j = 1, nPCount do
			idx, pidx = GetNextPlayer(COLLG_MISSIONID, idx, i);
			if (pidx > 0) then
				tab_Player[i][j] = pidx;
				PlayerIndex = pidx;
				if (GetTask(COLLG_TK_BOMB_MARK) == -1) then
					tabPlayer[k] = pidx;
					k = k + 1;
				end;
			end;
			if (idx == 0) then
				break;
			end;
		end;
	end;
	
	for i = 1, getn(tabPlayer) do
		PlayerIndex = tabPlayer[i];
		bomb_out_pl(nOrder);
	end;
	
	makebomber(tab_Player, nOrder);
	PlayerIndex = nOrgPlayer;
end;

function bomb_out_pl(nOrder)--nOrder;第几次被炸到
    local nBeginMapID = GetMissionV(COLLG_MS_BEGINGMAPID);
	local nTotal = GetTask(COLLG_COUNT_ONETIME);--去掉箱子
	local nCaseCount = nTotal;
	local nMax = random(1, 5);
	if (nCaseCount > nMax) then
		nCaseCount = nMax;
	end;
	
	collg_settonormal();--设置成正常人；
	SetTask(COLLG_COUNT_ONETIME, nTotal - nCaseCount);
	SetTask(COLLG_TK_BOMB_MARK, nOrder);
	
	w, x, y = GetWorldPos();
	world = SubWorldID2Idx(w);
	for i = 1, nCaseCount do
		DropItem(world, x * 32, y * 32, -1, 6, 1, COLLG_GOODSIDX, 1, 0, 0, 0);
	end;
	go_other_place(nBeginMapID);
    AddSkillState(673, 20, 0, 30 * 18);
    AddSkillState(309, 10, 0, 30 * 18); --不受攻击
    
    local str = "被昆虫炸中, <color=yellow>晕眩30秒 <color>!";
    if (nCaseCount > 0) then
    	str = str.."失去 <color=yellow>"..nCaseCount.."<color> 货物袋, 目前还有<color=yellow>"..(nTotal - nCaseCount).."<color> 货物袋";
    end;
    SubWorld = world
    Msg2Player(str);
    local sstr = GetName().."被爆炸虫击晕30秒! 失去 "..nCaseCount.." 货物袋."
    Msg2MSGroup(COLLG_MISSIONID, "<color=yellow>"..GetName().."<color>爆炸虫<color=yellow>击晕30秒<color>! 失去 <color=yellow>"..nCaseCount.."<color> 货物袋.", GetTask(TK_GROUPID))
end;

--随机选取炸弹人
function makebomber(tab_Player, nOrder)
	local nOrgPlayer = PlayerIndex;
	local i, j, nPCount;

	local nPlayerCountInTeam;
	for i = 1, getn(tab_Player) do
		nPlayerCountInTeam = getn(tab_Player[i]);
		if (nPlayerCountInTeam > 1) then	--必须要有两个人以上的组才有炸弹人
			nSeed = random(1, nPlayerCountInTeam);
			PlayerIndex = tab_Player[i][nSeed];
			if (GetTask(COLLG_TK_BOMB_MARK) == nOrder) then--如果随机到的人是刚刚被爆炸的人，则换一个。
				if (nSeed == 1) then
					nSeed = 2;
				else
					nSeed = nSeed - 1;
				end;
				PlayerIndex = tab_Player[i][nSeed];
			end;
			
			collg_settobomber();
		end;
	end;
	PlayerIndex = nOrgPlayer;
end;


function go_other_place(nBeginMapID)  --随机传到起始点
	local nGroupId = GetTask(TK_GROUPID);
	
	local nMapId = nBeginMapID + nGroupId - 1;
	nMapId = mod(nMapId, COLLG_SMALLMAPCOUNT) + 1;
	if (nMapId >= 20 and nMapId <= 23) then
		nMapId = nMapId + 4;
	end;
	local szFile = [[\settings\maps\dragonboatfestival_06\elf_]]..nMapId..[[.txt]];
	local PosX, PosY = getadata(szFile);
	SetPos(floor(PosX / 32), floor(PosY / 32));
	SubWorld = OldSubWorld;
end;
