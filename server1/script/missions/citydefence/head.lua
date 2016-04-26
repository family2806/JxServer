----------------------------------------------------------------
--FileName:	head.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	周末活动：卫国战争之烽火连城
--			功能：活动头文件自定义函数
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
Include("\\script\\tong\\tong_award_head.lua");--帮会周目标贡献度by志山

function cloudopen_defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= FIRE_OPENDAY_SATURDAY and weekdate ~= FIRE_OPENDAY_SUNDAY) then
		return nil
	end
	return 1
end

------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end
------------------------------------------------------------------------------------------------
-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
-----------------------------------------------------------------------------------------------

--"123,234" -> 123 , 234,将一个字符串写成的坐标数据转化成两个数字变量
function bt_str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end
------------------------------------------------------------------------------------------------

--从坐标文件中随机获得一个坐标
function bt_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

--根据trapfile的文件的坐标集合表，产生所有的trap点，并关联scriptfile的脚本		
function bt_addtrap(trapfile, scriptfile)
	local count = GetTabFileHeight(trapfile);
	scriptid = FileName2Id(scriptfile);
	
	ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count - 1 do
		x = GetTabFileData(trapfile, i + 1, 1);
		y = GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile);
	end;
end;

--根据npcfile的文件的坐标集合表，产生所有的npc模板号为tnpcid的对话npc，并关联scriptfile的脚本		
function bt_adddiagnpc(npcfile, scriptfile, tnpcid, name)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	for i = 1, count - 1 do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			addcount = addcount + 1
		else
			print("error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	
function bt_add_a_diagnpc(scriptfile, tnpcid, x, y, name)
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y )
		end
		
		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
		else
			print("error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
		return npcidx
end


function cd_addfightnpc(npcfile, ss, ee, npcid, level, npcname, boss, npccamp, npcscript, boss4)
	local posx = 0
	local posy = 0
	local npcindex = 0
	local s_npcid = npcid
	for i = ss, ee do
		posx = GetTabFileData( npcfile, i + 1, 1 );
		posy = GetTabFileData( npcfile, i + 1, 2 );
		if (boss4 ~= nil) then
			s_npcid = npcid + random(0,1)
		end
		npcindex = AddNpc( s_npcid, level, SubWorld, posx, posy, 1, npcname, boss )
		if( npcindex > 0 ) then
			--SetNpcCurCamp( npcindex, npccamp )
			SetNpcDeathScript( npcindex, npcscript )
		end
	end
end


function cd_buildfightnpc()
	local npcfile = GetMissionS( MS_S_CMNPCFILE )
	local filehigh = GetTabFileHeight( npcfile ) - 1
--print(filehigh.."==filehigh")
	if ( filehigh <= 0 or filehigh == nil ) then
--		print("commonfile error ")
		return
	end
	local citycamp = GetMissionV( MS_CITYCAMP )
--print(citycamp.."==citycamp")
	local npccamp = 1
	local npcname = "宋军"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "金军"
	end
	local npccount_1 = floor( filehigh * 0.82 )		--1886
	local npccount_2 = floor( filehigh * 0.12 )		--276
	local npccount_3 = floor( filehigh * 0.06 )		--138
	
	cd_addfightnpc(npcfile, 1, npccount_1, tbTNPC_SOLDIER[npccamp][1], tbSOLDIER_LEVEL[1], npcname..tbSOLDIER_NAME[1], 0, npccamp, tbFILE_NPCDEATH[1])
	
	cd_addfightnpc(npcfile, npccount_1 + 1, npccount_1 + npccount_2, tbTNPC_SOLDIER[npccamp][2], tbSOLDIER_LEVEL[2], npcname..tbSOLDIER_NAME[2], 2, npccamp, tbFILE_NPCDEATH[2])

	cd_addfightnpc(npcfile, npccount_1 + npccount_2 + 1, npccount_1 + npccount_2 + npccount_3, tbTNPC_SOLDIER[npccamp][3], tbSOLDIER_LEVEL[3], npcname..tbSOLDIER_NAME[3], 1, npccamp, tbFILE_NPCDEATH[3])
	
end

function GameOver()
	local oldPlayerIndex = PlayerIndex
	local citycamp = GetMissionV(MS_CITYCAMP)
	local campname = ""
	if ( citycamp == 1 ) then
		campname = "宋军"
	else
		campname = "金军"
	end
	local isWin = 0;--记录是否胜利－－by志山
	if ( GetMissionV(MS_CITYDEFENCE) == 1 ) then
		isWin = 1;--by志山
		--胜利
		cd_awardall()
		AddGlobalNews("经过激烈的战斗, "..campname.."保城成功！所有参加的玩家都得到一瓶仙草露")
		Msg2MSAll( MISSIONID, "经过激烈的战斗, "..campname.."保城成功！所有参加的玩家都得到一瓶仙草露" )
		cd_writelog(date("%m-%d,%H:%M;")..campname.."守城成功，人数=="..GetMSPlayerCount(MISSIONID, 0))
	else
		--失败
		AddGlobalNews("经过激烈的战斗, "..campname.."在牺牲很大的情况下保住了城，但是城已被损毁得很严重.")
		Msg2MSAll( MISSIONID, "经过激烈的战斗, "..campname.."在牺牲很大的情况下保住了城，但是城已被损毁得很严重." )
		cd_writelog(date("%m-%d,%H:%M;")..campname.."守城失败，人数=="..GetMSPlayerCount(MISSIONID, 0)..";npc数量还有, "..tbSOLDIER_NAME[1]..":"..GetMissionV(MS_1RSTNPC_TCNT)..";"..tbSOLDIER_NAME[2]..":"..GetMissionV(MS_1RSTNPC_TCNT+1)..";"..tbSOLDIER_NAME[3]..":"..GetMissionV(MS_1RSTNPC_TCNT+2)..";"..tbSOLDIER_NAME[4]..":"..GetMissionV(MS_1RSTNPC_TCNT+3)..";"..tbSOLDIER_NAME[5]..":"..GetMissionV(MS_1RSTNPC_TCNT+4)..";")
	end
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
 		tongaward_citywar(isWin);--帮会周目标by志山
	 	PlayerIndex = tbPlayer[i];
	 	--citycamp = GetMissionV(MS_CITYCAMP);
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetDeathScript("");
		SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		SetRevPos(tbDEFENCE_SIGNMAP[citycamp], random(3))
		NewWorld(bt_getsignpos(citycamp))
	end;
	PlayerIndex = OldPlayerIndex
end

function cd_join(camp)
	LeaveTeam();
	local mapid, posx, posy = cd_getjoinpos(camp);
	NewWorld( mapid, posx, posy );
	AddMSPlayer(MISSIONID,camp);
	EnterChannel(PlayerIndex, GetMissionS(MS_S_CD_NAME))
	SetRevPos(tbDEFENCE_SIGNMAP[camp], 1)
--	SetCurCamp(camp);
	SetTaskTemp(200,1);
	SetLogoutRV(1);
	SetPunish(0);
	SetFightState(0);
	SetPKFlag(0);
	ForbidChangePK(1);
	SetTempRevPos(mapid, posx * 32, posy * 32);
	SetDeathScript( FILE_PLAYERDEATH );
end

function cd_awardall()		--守城成功发奖
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	for i = 1 , 600 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	oldPlayerIndex = PlayerIndex
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
		AddItem(6,1,71,1,0,0,0)
	end
	PlayerIndex = oldPlayerIndex
end

function bt_getsignpos(camp)
	if ( camp ~= 1 and camp ~= 2 ) then
		camp = 1;
	end;
	local a = random(getn(tbSIGNMAP_POS))
	
	return tbDEFENCE_SIGNMAP[camp], tbSIGNMAP_POS[a][1], tbSIGNMAP_POS[a][2]
end

function cd_getjoinpos(camp)
	local mapid = tbDEFENCE_MAPID[camp]
	local a = random( getn(tbREVIVAL_POS) )
	return mapid, tbREVIVAL_POS[a][1], tbREVIVAL_POS[a][2]
end


function OnCancel()
end

function cd_writelog(str)
	local szFileName = "Logs/citydefence_log_"..date("%m%d")..".log"
	local fu = openfile(szFileName, "a")
	write(fu, str.."\r\n")
	flush(fu)
	closefile(fu)
end