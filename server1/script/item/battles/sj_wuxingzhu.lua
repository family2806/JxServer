-- 宋金道具五行柱
-- 分 火柱、冰柱、毒柱、雷柱

Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine(nItemIdx)	-- 通过判断战场的等级和玩家的阵营来加NPC
	if (GetFightState() == 0) then
		Say("在非战斗状态下不能使用!", 0)
		return -1
	end;
	tbPK_MAP = {357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374} -- 单挑地图禁止使用号角
	for j = 1, getn(tbPK_MAP) do
		if ( nMapId == tbPK_MAP[j] ) then
			Msg2Player("在单斗区域不能使用该物品!");
			return -1
		end
	end

	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("该物品只能在宋金战场使用");
			return -1
		end
	end
	
	local szNpcName = "";
	local n_player_camp = GetCurCamp();
	
	if (n_player_camp == 1) then
		if (GetMissionV(MS_WUXINGZHUCNT_S) >= MAX_CALLWUXINGZHU) then
			Msg2Player("目前在战场的柱数已达上限，不能再使用了.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_S, GetMissionV(MS_WUXINGZHUCNT_S) + 1)
			szNpcName = "宋方 - 	";
		end
	elseif (n_player_camp == 2) then
		if (GetMissionV(MS_WUXINGZHUCNT_J) >= MAX_CALLWUXINGZHU) then
			Msg2Player("目前在战场的柱数已达上限，不能再使用了.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_J, GetMissionV(MS_WUXINGZHUCNT_J) + 1)
			szNpcName = "金方 -	";
		end
	end
	
	local n_level = check_pl_level(GetLevel);
	local _, _, n_part = GetItemProp(nItemIdx);
	local tb_npc_level = {50, 70, 90};
	local tb_npc_id = {	[1768] = {id = 1343, szname="火柱"},
						[1769] = {id = 1344, szname="冰柱"},
						[1770] = {id = 1345, szname="毒柱"},
						[1771] = {id = 1346, szname="雷柱"},
						[1772] = {id = 1347, szname="金柱"},
						};
	
	if (not n_level or not tb_npc_id[n_part]) then	--不存在的宋金等级 或者 道具无法和召唤NPC对应
		return -1;
	end
	
	local n_npcidex = AddNpc( tb_npc_id[n_part].id, tb_npc_level[n_level], SubWorldID2Idx(W), (X - 3) * 32, Y * 32, 1, szNpcName..tb_npc_id[n_part].szname, 0);
	SetNpcCurCamp(n_npcidex, n_player_camp);
	
end	

