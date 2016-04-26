----------------------------------------------------------------
--FileName:	mission.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	周末活动：卫国战争之烽火连城
--			功能1：InitMission初始化Mission
--			功能2：RunMission启动Mission
--			功能3：EndMission结束Mission
--			功能4：OnLeave离开Mission时调用
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
function InitMission()
	for i = 1, 100 do
		SetMissionV(i, 0);
	end;

	for i = 1, 10 do
		SetMissionS(i, "");
	end;

	local mapid = SubWorldIdx2ID(SubWorld)
	local citycamp = 0
	if ( mapid == tbDEFENCE_MAPID[1] ) then
		citycamp = 1;
		cd_name = "宋方守城"
	elseif ( mapid == tbDEFENCE_MAPID[2] ) then
		citycamp = 2;
		cd_name = "金方守城"
	else
		print("defencecity open map error mpaid == "..mapid)
		return
	end

	SetMissionV( MS_CITYCAMP, citycamp )
	SetMissionV( MS_MISSIONID, MISSIONID )
	SetMissionV( MS_RANDKEY, random(1000000) )
	SetMissionS( MS_S_CD_NAME, cd_name)

	ClearMapNpc(mapid);
--	ClearMapTrap(mapid);
	ClearMapObj(mapid);

	--获得地图相对应的设定文件名
	local mapfile = GetMapInfoFile(mapid)
	local citysection = "MapInfo"

-------------------------------------------------------------------------
--读取两个区域的大营内点坐标

	--野外到大营的坐标点
	homeoutxy = GetIniFileData(mapfile, citysection , "homeout1")

	x,y = bt_str2xydata(homeoutxy)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

	homeoutxy = GetIniFileData(mapfile, citysection , "homeout2")
	x,y = bt_str2xydata(homeoutxy)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))

	homeoutxy = GetIniFileData(mapfile, citysection , "homeout3")
	x,y = bt_str2xydata(homeoutxy)
	SetMissionV(MS_HOMEOUT_X3, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y3, floor(y/32))

	--大营到野外的坐标点
	centerposxy = GetIniFileData(mapfile, citysection , "centerpos1")
	x,y = bt_str2xydata(centerposxy)
	SetMissionV(MS_CENTER_X1, floor(x/32))
	SetMissionV(MS_CENTER_Y1, floor(y/32))
	
	centerposxy = GetIniFileData(mapfile, citysection , "centerpos2")
	x,y = bt_str2xydata(centerposxy)
	SetMissionV(MS_CENTER_X2, floor(x/32))
	SetMissionV(MS_CENTER_Y2, floor(y/32))
	
	centerposxy = GetIniFileData(mapfile, citysection , "centerpos3")
	x,y = bt_str2xydata(centerposxy)
	SetMissionV(MS_CENTER_X3, floor(x/32))
	SetMissionV(MS_CENTER_Y3, floor(y/32))

	commonnpcfile = GetIniFileData(mapfile, citysection , "commonnpc")
	SetMissionS( MS_S_CMNPCFILE, commonnpcfile )

	juniorbossfile = GetIniFileData(mapfile, citysection , "juniorboss")
	SetMissionS( MS_S_JRNPCFILE, juniorbossfile )

	seniorbossfile = GetIniFileData(mapfile, citysection , "seniorboss")
	SetMissionS( MS_S_SRNPCFILE, seniorbossfile )
	
-------------------------------------------------------------------------

	--摆放Trap点
	--大营到野外的trap点
	centertrapfile = GetIniFileData(mapfile, citysection, "home2centertrap1");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP1)
	centertrapfile = GetIniFileData(mapfile, citysection, "home2centertrap2");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP2)
	centertrapfile = GetIniFileData(mapfile, citysection, "home2centertrap3");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP3)


	--摆放对话类型Npc	
	if (citycamp == 1) then
		campname = "宋军";
		tnpc_doctor = TNPC_DOCTOR1
		file_doctor = FILE_DOCTOR1
		tnpc_symbol = TNPC_SYMBOL1

	else
		campname = "金军";
		tnpc_doctor = TNPC_DOCTOR2
		file_doctor = FILE_DOCTOR2
		tnpc_symbol = TNPC_SYMBOL2

	end
	
	--军医的摆放
	doctorxy = GetIniFileData(mapfile, citysection, "doctornpc1");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(file_doctor, tnpc_doctor, x * 32 ,y * 32 , campname.."军需官");

	doctorxy = GetIniFileData(mapfile, citysection, "doctornpc2");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(file_doctor, tnpc_doctor, x * 32 ,y * 32 , campname.."军需官");


	--帅旗的摆放
--	symbolnpcfile = GetIniFileData(mapfile, citysection, "symbolnpc");
--	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, tnpc_symbol, "");
	
	
	--贮物箱的摆放
	depositxy = GetIniFileData(mapfile, citysection, "depositobj1");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_BOX, TNPC_DEPOSIT, x * 32,y * 32);

	depositxy = GetIniFileData(mapfile, citysection, "depositobj2");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_BOX, TNPC_DEPOSIT, x * 32,y * 32);

	
	--车夫的摆放
	chefuxy = GetIniFileData(mapfile, citysection, "chefu");
	x,y = bt_str2xydata(chefuxy)
	bt_add_a_diagnpc( FILE_CD_TRANSER, TNPC_CHEFU, x * 32,y * 32, campname.."车夫");
	

	--启动定时器
	StartMissionTimer(MISSIONID, SMALLTIMERID, SMALL_TIME);
	StartMissionTimer(MISSIONID, TOTALTIMERID, TOTAL_TIME);

	SetMissionV(MS_STATE,1);--允许报名了
	SetMissionV( MS_1RSTNPC_TCNT, FIRE_1RSTNPC_COUNT )
	SetMissionV( MS_1RSTNPC_TCNT + 1, FIRE_2CNDNPC_COUNT )
	SetMissionV( MS_1RSTNPC_TCNT + 2, FIRE_3RDNPC_COUNT )
	SetMissionV( MS_1RSTNPC_TCNT + 3, FIRE_4THNPC_COUNT )
	SetMissionV( MS_1RSTNPC_TCNT + 4, FIRE_5THNPC_COUNT )
	
	if (citycamp == 1) then
		CreateChannel(cd_name, 9)
	else
		CreateChannel(cd_name, 10)
	end
	RestMin, RestSec = GetMinAndSec(1800);
	local szMsg = "卫国烽火连城"..cd_name.."活动开始接受报名，"..tbDEFENCE_ANNOUNCE[citycamp].."参战条件: 等级不低于"..CD_LEVEL_LIMIT.."级"
	AddGlobalNews(szMsg)
	WriteLog("卫国烽火连城"..cd_name.."\t 进入报名阶段\t 版图 d\t"..mapid.."\t 时间\t"..date("%H:%M"))
	
end

function RunMission()
	SetMissionV( MS_STATE, 2 )
end

function JoinMission(RoleIndex, Camp)
	local oldPlayerIndex = PlayerIndex;
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	cd_join(Camp);
	PlayerIndex = oldPlayerIndex;
end;

function EndMission()
	StopMissionTimer(MISSIONID, 21);
	StopMissionTimer(MISSIONID ,22);
	
	GameOver();
	
	DeleteChannel(GetMissionS(MS_S_CD_NAME))
	
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	for i = 1, 10 do
		SetMissionS(i, "")
	end
end

function OnLeave(RoleIndex)
	local oldPlayerIndex = PlayerIndex
	PlayerIndex = RoleIndex
	LeaveTeam();
	SetCurCamp(GetCamp())
	LeaveChannel(PlayerIndex, GetMissionS(MS_S_CD_NAME))
	-- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0);
	RestoreOwnFeature();
	SetTaskTemp(200,0);
	SetPunish(0);
	SetFightState(0);
	DisabledUseTownP(0);
	SetDeathScript("")
	PlayerIndex = oldPlayerIndex
end