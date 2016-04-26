IncludeLib("FILESYS")
IncludeLib("RELAYLADDER")
IncludeLib("TITLE")
IncludeLib("ITEM")
Include( "\\script\\missions\\freshman_match\\freshman_data.lua" )
Include( "\\script\\missions\\freshman_match\\freshman_info.lua" )

function transtoplace()

	if (GetLastFactionNumber() == -1) then
		Say("武林盟主有令：只有十大门派的人才能参加武林大会，你无门无派，不能参加。加入十大门派后才能参加比赛!", 0)
		return
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--少林
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--天王
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--唐门
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--五毒
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--峨嵋
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--翠烟
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--丐帮
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--天忍
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--武当
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--昆仑
		end
		Msg2Player( "你已进入武林新秀赛场" )
	end
end

--排行榜ID要改----------------------------------------------------------
function checkmap(flag)
	local mapid = SubWorldIdx2ID(SubWorld)
	local ladder = 0
	if (mapid == 397 or mapid == 396) then
		mapname = "少林 "
		ladder = 10131
	elseif (mapid == 399 or mapid == 398) then
		mapname = "天王"
		ladder = 10132
	elseif (mapid == 401 or mapid == 400) then
		mapname = "唐门"
		ladder = 10133
	elseif (mapid == 403 or mapid == 402) then
		mapname = "五毒"
		ladder = 10134
	elseif (mapid == 405 or mapid == 404) then
		mapname = "峨眉 " 
		ladder = 10135
	elseif (mapid == 407 or mapid == 406) then
		mapname = "翠烟"
		ladder = 10136
	elseif (mapid == 409 or mapid == 408) then
		mapname = "丐帮"
		ladder = 10137
	elseif (mapid == 411 or mapid == 410) then
		mapname = "天忍"
		ladder = 10138
	elseif (mapid == 413 or mapid == 412) then
		mapname = "武当"
		ladder = 10139
	elseif (mapid == 415 or mapid == 414) then
		mapname = "昆仑"
		ladder = 10140
	end
	if (flag == 1) then
		return mapname
	elseif(flag == 2) then
		return ladder
	end
end
---------排行榜ID要改----------------------------------------------------

function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 1
	end
	return nil
end

function AddAword(level, result)
	local awardpro = {}
	local fac = 1

	if ( level >= 50 and level <=59 ) then
		fac = 1
	elseif ( level >= 60 and level <= 69 ) then
		fac = 1.3
	elseif ( level >= 70 and level <= 79 ) then
		fac = 1.8
	elseif ( level >= 80 ) then
		fac = 3.8
	end
	aword = (700 + ( level * 4 - 150 ) / 5 * 100 ) * result * fac
	AddOwnExp(aword)
	
	if( result ~= 60 )then
		return
	end
	for i = 1, getn(CP_AWARD_ITEM) do
		awardpro[i] = CP_AWARD_ITEM[i][3]
	end
	numth = randByProbability(awardpro)
	if (getn(CP_AWARD_ITEM[numth][2]) == 6 ) then
		AddItem(CP_AWARD_ITEM[numth][2][1], CP_AWARD_ITEM[numth][2][2], CP_AWARD_ITEM[numth][2][3], CP_AWARD_ITEM[numth][2][4], CP_AWARD_ITEM[numth][2][5], CP_AWARD_ITEM[numth][2][6])
	else
		AddEventItem(CP_AWARD_ITEM[numth][2][2])
	end
	Msg2Player("你获得一个"..CP_AWARD_ITEM[numth][1])
end

function randByProbability(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 1009 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end


------------------TaskValue 的操作	BEGIN-----------------------------------------------
-- 设置任务状态
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_gettask(nTaskID)
	return GetTask(nTaskID)
end
------------------TaskValue 的操作	END-----------------------------------------------

------------------Ini文件的操作	BEGIN---------------------------------------------------
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
	return TabFile_GetRowCount(mapfile) - 1
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row + 1, col))
	end
end
--------------------Ini文件的操作	END--------------------------------------------

------------文件的操作	BEGIN--------------------------------------------------
-- 打开一个文件
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--获得文件中的szSection的key的值
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--设置文件中的szSection的key值为szValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end
----------------文件的操作	END--------------------------------------------------------------------


function Sort_Point(array)
	local orgindex = PlayerIndex
	local point_1 = 0
	local point_2 = 0
	local wincount_1 = 0
	local wincount_2 = 0
	local winrate_1 = 0
	local winrate_2 = 0
	for i = 1, getn(array) do
		for j = getn(array), 2, -1 do
			PlayerIndex = array[j]
			point_1 = nt_gettask(CP_TASKID_ROUND)
			wincount_1 = nt_gettask(CP_TASKID_WIN)
			if (point_1 == 0 or wincount_1 == 0) then
				winrate_1 = 0
			else
				winrate_1 = wincount_1/point_1
			end
			
			PlayerIndex = array[j - 1]
			point_2 = nt_gettask(CP_TASKID_ROUND)
			wincount_2 = nt_gettask(CP_TASKID_WIN)
			if (point_2 == 0 or wincount_2 == 0) then
				winrate_2 = 0
			else
				winrate_2 = wincount_2/point_2
			end
			
			if (winrate_1 > winrate_2) then
				a = array[j]
				array[j] = array[j - 1]
				array[j - 1] = a
			end
		end
	end
	PlayerIndex = orgindex
	return array
end


function WL_set_pl_state()
	LeaveTeam()		--离开队伍
	SetCreateTeam(0);	--禁止组队
	SetTaskTemp(200, 1)		--禁止更换阵营
	SetLogoutRV(1);		--断线与死亡为一个重生点
	SetFightState(0)	--非战斗状态
	SetPKFlag(2)	--屠杀模式
	ForbidChangePK(1);	--禁止更换PK模式
	SetPunish(0);	--无死亡惩罚
	DisabledStall(1)	--禁止摆摊
	ForbitTrade(1);		--禁止交易
	DisabledUseTownP(1)	--限制其在准备席和比赛用地内使用回城符
end

function WL_clear_pl_state()

	camp = GetCamp();
	SetCurCamp(camp);	--临时阵营与真实阵营一致
	SetCreateTeam(1);	--允许组队
	DisabledStall(0);	--允许摆摊
	SetTaskTemp(200, 0);	--允许更换帮派阵营
	SetFightState(0);	--置为非战斗状态
	SetPunish(1);	--有死亡惩罚
	ForbidChangePK(0);	--允许改变战斗模式
	SetPKFlag(0);	--战斗模式置为练功
	ForbitTrade(0);		--允许交易
	SetDeathScript("");--设置死亡脚本为空
	RestoreOwnFeature();
end


function OnCancel()
end
