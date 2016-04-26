DTMISSIONID = 14
function BT2DTFight(orgmissionid,Player1, Player2)
	print("battlewd:"..SubWorld)
	local MS_ORGWORLDINDEX = 3		--来时世界地图的INDEX
	local MS_ORGMISSION = 4		--来时世界的MISSION	
	local MS_ORGMAPID = 5			--来时世界的MAPID
	local MS_LEVEL = 	6			--世界的等级
	local MS_ORGBACK_X1 = 7		--退出单挑后的重生点
	local MS_ORGBACK_Y1 =	8		
	local MS_ORGBACK_X2 = 9
	local MS_ORGBACK_Y2 = 10
	local MS_DTWORLDINDEX = 12		--单挑世界地图的INDEX
	local MS_DTMISSION = 13			--单挑世界的MISSION

	local MS_PL_INDEX_1 = 14
	local MS_PL_CURCAMP_1 = 15
	local MS_PL_INDEX_2 = 17
	local MS_PL_CURCAMP_2 = 18

	local mapid = dt_getfightmap();						--得到单挑地图id
	local mapindex = SubWorldID2Idx(mapid)		--得到地图号mapid的索引
	if (mapindex < 0) then
		print("error!单挑地图不在本服务器上，请运营官检查");
		return
	end;

	--查看地图是否被占用；
	if (dt_CheckMap(mapindex) == 0) then
		return
	end;
	
	local orgsubworld = SubWorld;---这里是当前地图的索引号
	local orgPlayerIndex = PlayerIndex	
	local orgmapid = SubWorldIdx2ID(SubWorld)	
	local orggamelevel = BT_GetGameData(GAME_LEVEL)
	local orghomeinx1 = GetMissionV(MS_HOMEIN_X1)
	local orghomeiny1 = GetMissionV(MS_HOMEIN_Y1)
	local orghomeinx2 = GetMissionV(MS_HOMEIN_X2)
	local orghomeiny2 = GetMissionV(MS_HOMEIN_Y2)
	
	SubWorld = mapindex	
	----符合条件初始化单挑mission
	OpenMission(DTMISSIONID)
	
	--保存当前世界的信息于单挑mission里	
	SetMissionV(MS_ORGWORLDINDEX,orgsubworld)
	SetMissionV(MS_ORGMISSION,orgmissionid)
	SetMissionV(MS_ORGMAPID,orgmapid)
	SetMissionV(MS_LEVEL,orggamelevle)
	SetMissionV(MS_ORGBACK_X1,orghomeinx1)
	SetMissionV(MS_ORGBACK_Y1,orghomeiny1)
	SetMissionV(MS_ORGBACK_X2,orghomeinx2)
	SetMissionV(MS_ORGBACK_Y2,orghomeiny2)
	SetMissionV(MS_DTWORLDINDEX , SubWorld)
	SetMissionV(MS_DTMISSION , DTMISSIONID)
	
	PlayerIndex = Player1
	SetMissionV(MS_PL_INDEX_1,PlayerIndex)
	SetMissionS(1,GetName())
	SetMissionV(MS_PL_CURCAMP_1,GetCurCamp())
	
	PlayerIndex = Player2
	SetMissionV(MS_PL_INDEX_2,PlayerIndex)
	SetMissionS(2,GetName())
	SetMissionV(MS_PL_CURCAMP_2,GetCurCamp())
	
----将单挑双方加入到单挑地图中
	dt_EnterMap(mapindex,Player1)
	dt_EnterMap(mapindex,Player2)
	
	RunMission(DTMISSIONID)
	
	SubWorld = orgsubworld				--还原当前地图的index
	PlayerIndex = orgPlayerIndex		--还原当前PlayerIndex
end


--------将player加入到指定index地图中
function dt_EnterMap(newworldindex,pindex)
	local MS_ORGWORLDINDEX = 3		--来时世界地图的INDEX
	print("enter1wd:"..SubWorld)
	
	SubWorld = newworldindex;
	PlayerIndex = pindex
	local orgworldidx = GetMissionV(MS_ORGWORLDINDEX)
	if (GetCurCamp() == 1) then 
		local newworldid = SubWorldIdx2ID(newworldindex)
		
		SubWorld = orgworldidx;
		print("enter2wd:"..SubWorld)
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))	
		
		enterpos = GetIniFileData(mapfile, "Area_SingleFight", "SinglePos1");
		x1,y1 = bt_str2xydata(enterpos)	
		
		SubWorld = newworldindex;
		NewWorld(newworldid, floor(x1/32),floor(y1/32))	
		print("newworld"..newworldid.." "..x1.." "..y1)
		AddMSPlayer(DTMISSIONID,1)
		SetCurCamp(1);
		local str2 = "<#>宋方"..GetName().."进入了单挑战场";
	else
		local newworldid =	 SubWorldIdx2ID(newworldindex)
		
		SubWorld = orgworldidx;
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))		
		enterpos = GetIniFileData(mapfile, "Area_SingleFight", "SinglePos2");
		x1,y1 = bt_str2xydata(enterpos)	
		
		SubWorld = newworldindex;
		NewWorld(newworldid, floor(x1/32),floor( y1/32))
		print("newworld"..newworldid.." "..x1.." "..y1)
		AddMSPlayer(DTMISSIONID, 2)
		SetCurCamp(2);
		
		local str2 = "<#>金方"..GetName().."进入了单挑战场";
	end;
	local str1 = "您进入单挑战场，您将有3分钟时间与对手决一生死。如若您获得胜利会得到一定的积分奖励，您与您的对手将被送回宋金战场各自的后营。如若失败或时间结束，则不会得到任何奖励和惩罚而返回宋金战场各自的后营。"
	Talk(1,"",str1.."<enter>    <color=red>战  斗  开  始！")
	Msg2Player(str2);
	
	SubWorld = orgworldidx
	Msg2MSAll(GetMissionV(MS_ORGMISSION),str2)
	
	SubWorld = newworldindex
	SetPKFlag(1)
	SetDeathScript("\\script\\battles\\singlefight\\dt_death.lua");
end;

--------通过当前战役等级等级得到相应等级的单挑地图id
function dt_getfightmap()
	local lel=BT_GetGameData(GAME_LEVEL);
	if ( lel < 0 ) then
		print("error:")
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	return tonumber(GetIniFileData(mapfile, "Area_SingleFight", "SingleFightMap"..lel)) 	
end;

--------查看单挑地图有没有被占用，能不能使用。return 0--不能；return  1--能;
function dt_CheckMap(index)
	orgworld = SubWorld;
	SubWorld = index;
	count = GetMSPlayerCount(DTMISSIONID, 0)
	if (count > 0 ) then 
		SubWorld = orgworld
		return 0
	else
		SubWorld = orgworld
		return 1
	end
	SubWorld = orgworld
end;
