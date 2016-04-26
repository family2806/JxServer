-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..


Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc_death.lua")

---- 启动比赛开始定时器
function YDBZ_start_match_timer()
	-- 1分钟后启动比赛任务
	--broadcast("炎帝宝藏任务已经开始，各路好手已经进入炎帝宝藏中,竞争马上开始了。");
	StartMissionTimer(YDBZ_MISSION_MATCH, YDBZ_TIMER_MATCH, YDBZ_LIMIT_SIGNUP * 18);
end

-- 开始报名
function YDBZ_start_signup()
	-- 设置为准备状态
	SetMissionV(YDBZ_VARV_STATE, 3);
	SetMissionV(YDBZ_STATE_SIGN,0)
	SetMissionV(YDBZ_TEAM_COUNT,0)
	SetMissionV(YDBZ_TEAM_SUM,0)
	for i=1,3 do 
		SetMissionV(YDBZ_NPC_COUNT[i],0)
		SetMissionV(YDBZ_NPC_WAY[i],0)
	end
	SetMissionV(YDBZ_NPC_BOSS_COUNT,0)
		
--	SetMissionV(YDBZ_VARV_BOARD_TIMER, 0);
--	SetMissionS(YDBZ_VARS_TEAM_NAME, "");
end

function InitMission()
	YDBZ_close_match()
	--print("开始比赛地图mission")
	YDBZ_start_signup();
	YDBZ_start_match_timer();
	for i=1,getn(YDBZ_mapfile_trap) do
		for x =1,YDBZ_mapfile_trap[1][3] do 
			local mapfile = YDBZ_mapfile_trap[i][1].."trap"..x..".txt"
			--print(mapfile,scriptfile)
			YDBZ_bt_addZhangai(mapfile)
		end
		local mapfile = YDBZ_mapfile_trap[i][1].."trapenter.txt"
		local scriptfile = YDBZ_mapfile_trap[i][2].."trapenter.lua"
		YDBZ_bt_addtrap(mapfile,scriptfile)
	end

end

function EndMission()
	SetMissionV(YDBZ_VARV_STATE, 0);
	for i=1,3 do 
		SetMissionV(YDBZ_NPC_COUNT[i],0)
		SetMissionV(YDBZ_NPC_WAY[i],0)
	end
	SetMissionV(YDBZ_NPC_BOSS_COUNT,0)
	StopMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_MATCH)
	YDBZ_close_match();

end

-- 玩家退出
function OnLeave(index)

	local oldplayindex = PlayerIndex
	PlayerIndex = index
	local oldworld = SubWorld
	local world = GetMissionV(YDBZ_SIGNUP_WORLD);
	local pos_x = GetMissionV(YDBZ_SIGNUP_POSX);
	local pos_y = GetMissionV(YDBZ_SIGNUP_POSY); 

	local nteams = YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,2)
	local szstr = format("<color=yellow>%s<color> 离开炎帝宝藏地图.",GetName())

	SetTempRevPos(world,pos_x*32,pos_y*32)
	Msg2MSAll(YDBZ_MISSION_MATCH,str);
	Msg2Player(szstr)
	YDBZ_restore(PlayerIndex,YDBZ_MISSION_MATCH,nteams)
	SubWorld = oldworld

	if GetMSPlayerCount(YDBZ_MISSION_MATCH,nteams) == 0 then
		local pname = GetMissionS(YDBZ_TEAM_NAME[nteams])
		--broadcast(format("%s的队伍，在炎帝宝藏中不小心全部阵亡了。",nteams))
		Msg2MSAll(YDBZ_MISSION_MATCH,format("组队全部人<color=yellow>%s<color> 在炎帝宝藏中阵亡了.",pname))
		SetMissionS(YDBZ_TEAM_NAME[nteams],"")
		local nteamscount = GetMissionV(YDBZ_TEAM_COUNT)
		--print(nteamscount,SubWorld)
		SetMissionV(YDBZ_TEAM_COUNT,(nteamscount-1))
	end
	if GetMSPlayerCount(YDBZ_MISSION_MATCH,0) == 0 then
		CloseMission(YDBZ_MISSION_MATCH)
		return
	end
	if GetMissionV(YDBZ_TEAM_COUNT) == 1 and (GetMissionV(YDBZ_STATE_SIGN) == 1 or GetMissionV(YDBZ_STATE_SIGN) == 2) then

		local x = 1781 * 32
		local y = 3563 * 32 

		YDBZ_add_final_npc(SubWorld,x,y)
		Msg2MSAll(YDBZ_MISSION_MATCH,"<color=yellow>梁眉儿<color> 在炎帝宝藏最深处已被召唤出")
		SetMissionV(YDBZ_STATE_SIGN,3)
	end

	PlayerIndex = oldplayindex;
end
