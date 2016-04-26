IncludeLib("BATTLE");
IncludeLib("TITLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\jianta\\head.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")



function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--显示与统计总积分
	BT_SetView(PL_KILLPLAYER);--杀玩家数目
	BT_SetView(PL_BEKILLED);--本玩家被杀次数
	BT_SetView(PL_MAXSERIESKILL);--连斩次数
	
	BT_SetGameData(GAME_CAMP1, 0) --设置当前宋方人数
	BT_SetGameData(GAME_CAMP2, 0) --设置当前金方人数

	subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
	
	--设置煌之章活动奖励倍数
	SetMissionV(MS_HUANGZHIZHANG, greatnight_huang_event(1))
	
	--获得地图相对应的设定文件名
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	

	--得到该地图有几个区域
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--随机从所有区域中抽取两个，作为双方的主区域
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)

	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);
	
	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--读取两个区域的大营内点坐标
	--从大营到后营时的坐标点
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--从后营到大营的坐标点
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
-------------------------------------------------------------------------
--读取箭塔的坐标
	local n_gamelvl			= BT_GetGameData(GAME_LEVEL);
	local tb_npclvl 		= {50, 75, 90};
	for i = 1, 5 do
		local str_jiantaname	= format("jianta_%d", i);
		local n_jiantaxy		= GetIniFileData(mapfile, "Jianta_All", str_jiantaname);
		local n_xpos, n_ypos	= bt_str2xydata(n_jiantaxy);
		local n_npcidx 			= AddNpc(1375, tb_npclvl[n_gamelvl], SubWorld, n_xpos * 32, n_ypos * 32, 1, "箭塔(中立)", 1);
		SetNpcCurCamp(n_npcidx, 5);
		SetNpcParam(n_npcidx, 1, i)
		SetMissionV(MS_TOWER_1 + i - 1, 5);	-- 设置每个塔的阵营
		SetNpcDeathScript(n_npcidx, tabFILE_NPCDEATH[7]);
	end
-------------------------------------------------------------------------
	
	--摆放Trap点
	--摆放双方后营的Trap点

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--摆放双方军营的trap点

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	

	--摆放对话类型Npc
	--军医的摆放
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "军需官(宋) ");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "军需官 (金) ");
	
	
	--帅旗的摆放
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--贮物箱的摆放
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32,y * 32);
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32, y * 32);
	
	
	StartMissionTimer(MISSIONID, 100, TIMER_2);
	--随机模式需要打开每X分钟触发一次的触发器，以产生新旗
	StartMissionTimer(MISSIONID, 99, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--允许报名了
	
	if (level == 1) then
		lvlstr = "初级区域"
	elseif (level == 2) then
		lvlstr = "中级区域"
	else
		lvlstr = "高级区域 "
	end
	
	RestMin, RestSec = GetMinAndSec(1800);
	local str1 = lvlstr.."箭塔形式的宋金战斗正非常紧张, 目前正处于报名阶段, 谁想参战，请快速到襄阳或者朱仙镇登记报名; 或者使用宋金诏书快速到报名处，报名时间还剩"..RestSec.."秒. 参加条件: 40级以上. 报名费3000 两";
	AddGlobalNews(str1);
	CreateChannel("宋方"..szGAME_GAMELEVEL[level].."箭塔", 9)
	CreateChannel("金方"..szGAME_GAMELEVEL[level].."箭塔", 10)

	BT_SetMissionName("箭塔")
	BT_SetMissionDesc("背景: 1160年, 金主完颜亮出军打入襄阳，战争无比激烈.<enter><enter><color=yellow>箭塔: 在战场只能打败敌方玩家才能为本方获得点数。哪一方的点数多久为胜利方。<enter>每个玩家不能在后营停留超过2分钟, 在战场将无NPC战斗.")

end

function RunMission()
	SetMissionV(MS_STATE,2);
	
	local idx = 0;
	local pidx = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1 , 500 do
		--此时为GM发布命令，正式打响战斗
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
 		if (pidx > 0) then
 			PlayerIndex = pidx;
 			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
 			PutMessage("敌军已开始行动!各位战士！冲啊!");
		end
		if (idx <= 0) then 
			break
		end
	end;
	PlayerIndex = oldPlayerIndex
end;

function EndMission()
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 99);
	StopMissionTimer(MISSIONID ,100);
	
	GameOver()
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("宋方"..szGAME_GAMELEVEL[level].."箭塔")
	DeleteChannel("金方"..szGAME_GAMELEVEL[level].."箭塔")


	SetGlbValue(GLB_BATTLESTATE, 0) --设置该全局变量为1，标志当前服务器正处于宋金战役阶段，此时襄阳或朱仙镇的出口点自动设在宋金战役的报名点，否则则设在原宋金战场地图
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--计算积分系数，重置积分
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "宋方"..szGAME_GAMELEVEL[level].."箭塔")
	else
		LeaveChannel(PlayerIndex, "金方"..szGAME_GAMELEVEL[level].."箭塔")
	end
	sf_onplayerleave()
	SyncTaskValue(700 + PL_BATTLEPOINT);--同步玩家的总积分给客户端，用于积分购买功能
	AddSkillState(656,30,0,0) --降玩家的速度
	AddSkillState(661,5,0,0) --清除玩家的称号技能数据
	
	Title_ActiveTitle(0);
	if (GetMissionV(MS_TIMER1) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end
	local nRecord = GetTask(PL_TOTALPOINT + 750);--by Liaozhishan
	local nBeiShu = greatnight_huang_event(1);
	if (nBeiShu > 0) then
		nRecord = floor(nRecord / nBeiShu);
	end;
	local nOffered = GetTask(2435);
	SetTask(2435, nRecord);
	if (nRecord > nOffered) then
		tongaward_battle(nRecord - nOffered);--
	end;
	ResetBonus()		--计算积分系数，重置积分
end;

