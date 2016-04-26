Include("\\script\\missions\\tongwar\\match\\head.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i , 0)
	end
	for i = 1, 10 do
		SetMissionS(i, "")
	end


	bt_setnormaltask2type()		--这个有用
	BT_SetView(PL_TOTALPOINT);--显示与统计总积分
	BT_SetView(PL_KILLPLAYER);--杀玩家数目
	BT_SetView(PL_BEKILLED);--本玩家被杀次数
	BT_SetView(PL_MAXSERIESKILL);--连斩次数
	
--	BT_SetGameData(GAME_CAMP1, 0) --设置当前宋方人数
--	BT_SetGameData(GAME_CAMP2, 0) --设置当前金方人数

	subworldid = SubWorldIdx2ID(SubWorld)
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
	
	
	--获得地图相对应的设定文件名
	local mapfile = GetMapInfoFile(subworldid)

	--得到该地图有几个区域
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("tongwar error! "..subworldid.." areacount <= 1");
		return
	end
	
	--随机从所有区域中抽取两个，作为双方的主区域
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)

	SetMissionV(MS_CAMP1AREA, s_area)
	SetMissionV(MS_CAMP2AREA, j_area)
	
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
	

	--摆放对话类型Npc
	--军医的摆放
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "军需官 (宋) ");


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
	
	
	StartMissionTimer(MISSIONID, 62, TIMER_2);
	--随机模式需要打开每X分钟触发一次的触发器，以产生新旗
	StartMissionTimer(MISSIONID, 61, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--允许报名了
	SetMissionV(MS_KEYNUMBER, random(1000000+tonumber(date("%y%m%d"))))
	
	local str = "武林第一帮正在准备阶段。在今日参战名单的帮会快点去武林盟主处进入准备区域。"
	AddGlobalNews(str);

	BT_SetMissionName("第一战帮")

end

function RunMission()
	CreateChannel(GetMissionS(MS_S_CITYNAME_S), 9)
	CreateChannel(GetMissionS(MS_S_CITYNAME_J), 10)
	SetMissionV(MS_STATE,2);
end;

function EndMission()
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 61);
	StopMissionTimer(MISSIONID ,62);
	
	SetMissionV(MS_STATE, 3)
	
	GameOver()
	DeleteChannel(GetMissionS(MS_S_CITYNAME_S))
	DeleteChannel(GetMissionS(MS_S_CITYNAME_J))
	
	ClearMapNpc(SubWorldIdx2ID(SubWorld));	
	ClearMapTrap(SubWorldIdx2ID(SubWorld)); 
	ClearMapObj(SubWorldIdx2ID(SubWorld));

	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	for i = 1, 10 do
		SetMissionS(i, "")
	end
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
end;

function OnLeave(RoleIndex)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = RoleIndex;
	SetFightState(0)
	SetLogoutRV(1)
	ForbidChangePK(0);
	SetPKFlag(0)
	SetPunish(1)
	ForbidEnmity(0)
	DisabledUseTownP(0)
	BT_LeaveBattle()
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, GetMissionS(MS_S_CITYNAME_S))
	else
		LeaveChannel(PlayerIndex, GetMissionS(MS_S_CITYNAME_J))
	end
	sf_onplayerleave()
	AddSkillState(661,5,0,0) --清除玩家的称号技能数据
	
	Title_ActiveTitle(0);
	if (GetMissionV(MS_TIMER1) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end	
	SetCurCamp(GetCamp())
	PlayerIndex = oldPlayerIndex
end;

