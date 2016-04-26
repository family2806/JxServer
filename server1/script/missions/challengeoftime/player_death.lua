-- description	: 玩家死亡
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\missions\\challengeoftime\\include.lua")

function OnDeath(index)
	-- 修改玩家人数
	local count = GetMSPlayerCount(MISSION_MATCH) - 1;
	if (count < 0) then
		count = 0;
	end
	SetMissionV(VARV_PLAYER_COUNT, count);

	if (GetMissionV(VARV_NPC_COUNT) ~= 0) then
		-- 是否队长阵亡
		local name = GetMissionS(VARS_TEAM_NAME);
		if (name == GetName()) then
			broadcast(name .. "队伍队长阵亡!");
		end
		
		-- 是否全军覆灭
		if (count == 0) then
			broadcast(name .. "全军覆灭!");
		end
	end
	DelMSPlayer(MISSION_MATCH, 1);
	-- 在mission内通告玩家死亡
	Msg2MSAll(MISSION_MATCH, GetName() .. "不幸阵亡!");	
	SetLogoutRV(0)	
	NewWorld(11,3207,4978)
	-- 传送回报名地点
	-- local world = GetMissionV(VARV_SIGNUP_WORLD);
	-- local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	-- local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	-- NewWorld(world, pos_x, pos_y);
	-- -- DEBUG
	-- print(format("%s在龙舟比赛中死亡，被踢回(%d,%d,%d)位置", GetName(), world, pos_x, pos_y));
end
