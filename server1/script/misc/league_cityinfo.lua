--------------------------------------------------------------------
-- 使用社团结构来记录城市的信息 (记录在社团的任务变量上)
-- 每个城市采用一个社团组织(League)
-- 数据组织：
--	.社团类型(LeagueType)：全局唯一标识，注意不要重用
--	.社团名称(LeagueName)：城市ID(字符串)
--	.社团成员(LeagueMember)：一个，任意，目前不需要的数据
--------------------------------------------------------------------

IncludeLib("LEAGUE")

LEAGUETYPE_CITYINFO			= 4	-- 社团ID(城市信息)，全局唯一的标识
CITYINFO_LEAGUEJOB			= 1 -- 职位，随意，不需要的数据
CITYINFO_LEAGUETASK_BONUS	= 1	-- 城市信息的奖励记录(任务变量)
CITYINFO_LEAGUETASK_GIFT	= 2	-- 城市信息的奖励记录(任务变量)
CITYINFO_LEAGUETASK_DATE	= 3	-- 城市信息的奖励记录(任务变量)

CITYINFO_GLBVALUEID = {840, 841, 842, 843, 844, 845, 846}
---------------------------------------------------------------
function cityID2LeagueName(nCityID)
	return tostring(nCityID)
end

function debug_print(str)
	print(str)
end

------------------
-- 创建城市信息记录
function buildCityInfoLeague(nCityID)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- 此城市的记录不存在，创建之
		leagueObj = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()

		LG_SetLeagueInfo(leagueObj, LEAGUETYPE_CITYINFO, strLeagueName)
		LGM_SetMemberInfo(memberObj, strLeagueName, LEAGUEJOB_MASTER, LEAGUETYPE_CITYINFO, strLeagueName)
		LG_AddMemberToObj(leagueObj, memberObj)

		LG_ApplyAddLeague(leagueObj, "\\script\\misc\\league_cityinfo.lua", "OnBuildCityLeague")
	end
end

-- 回调
function OnBuildCityLeague(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		debug_print("CityLeague Build Fail: "..szLeagueName)
	end
	print("CityLeague Build OK: "..szLeagueName)
end

-- 因任务变量的操作，须向Relay申请，Relay返回后才会修改成功
-- 因此为防止gameserver出现涮的现象，对此操作设置状态锁
-- cityinfo_option_lock = {0, 0, 0, 0, 0, 0, 0};
function OnSetCityLeagueTask(nLeagueType, szLeagueName, szMemberName, bSucceed)

	-- cityinfo_option_lock[tonumber(szLeagueName)] = 0
	SetGlbValue(CITYINFO_GLBVALUEID[tonumber(szLeagueName)], 0)
end

-----------------------------------------------------------------------------
-- 此函数将在autoexec上调用
function buildAllCityInfoLeague()
	for i = 1 , 7 do
		buildCityInfoLeague(i)
		SetGlbValue(CITYINFO_GLBVALUEID[i], 0)
	end
	debug_print("CityLeague Build...")
end

-- 设置得城市奖励的时间(格式：20051018) - 年月日
function set_citybonus_date(nCityID, nDate)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- 此城市的记录不存在，创建之
		debug_print("CityInfoLeague Not Found: "..nCityID)
		return 0
	end
	
	-- 上锁，在回调中清除
	--cityinfo_option_lock[nCityID] = 1 
	SetGlbValue(CITYINFO_GLBVALUEID[nCityID], 1)
	
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_BONUS, nDate,
							"\\script\\misc\\league_cityinfo.lua", "OnSetCityLeagueTask")	
end

-- 获取上次得服务器主城市奖励的时间(格式：51018) - 年月日
function get_maincitybonus_date(nCityID)
	local nDate = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("注意：还未执行命令"..nCityID)
		nDate = get_maincity_deadline(nCityID);--tonumber(date("%y%m%d"))
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID)
		nDate = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_DATE)
	end
	
	return nDate
end

-- 获取上次得城市奖励的时间(格式：20051018) - 年月日
function get_citybonus_date(nCityID)
	local nDate = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("注意：回调还未执行！"..nCityID)
		nDate = tonumber(date("%Y%m%d"))
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID)
		nDate = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_BONUS)
	end
	
	return nDate
end


function get_citybonus_task(nCityID, nTsk)
	local nValue = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("注意：还未执行命令"..nCityID)
		nValue = 100;	--奖励的最大值
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID);
		nValue = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, nTsk);
	end;
	return nValue;
end;

function set_citybonus_task(nCityID, nTsk, nValue)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- 此城市的记录不存在，创建之
		debug_print("CityInfoLeague Not Found: "..nCityID)
		return 0
	end
	
	-- 上锁，在回调中清除
	--cityinfo_option_lock[nCityID] = 1 
	SetGlbValue(CITYINFO_GLBVALUEID[nCityID], 1)
	
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, nTsk, nValue,
							"\\script\\misc\\league_cityinfo.lua", "OnSetCityLeagueTask")	
end;