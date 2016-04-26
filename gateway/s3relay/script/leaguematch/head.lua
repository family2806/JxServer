Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\lib\\common.lua")

--Realy Global Value--
RLGLB_WLLS_PHASE	= 121	--比赛当前所处阶段
RLGLB_WLLS_SEASONID	= 122	--当前赛季编号
RLGLB_WLLS_MATCHID	= 123	--当前比赛编号
RLGLB_WLLS_SVRCOUNT	= 123	-- +i 某准备场当前人数(124~143)

--LG Task ID--
WLLS_LGTASK_MTYPE	= 11--比赛类型
WLLS_LGTASK_LAST	= 1	--所参加的最后一场比赛编号（进入准备场就算）	
WLLS_LGTASK_SVRID	= 2 --所参加的最后一场比赛服务器
WLLS_LGTASK_MSCAMP	= 3 --所参加的最后一场比赛MS阵营
WLLS_LGTASK_POINT	= 4	--战队获得积分
WLLS_LGTASK_RANK	= 5	--战队排名
WLLS_LGTASK_WIN		= 6	--胜利次数
WLLS_LGTASK_TIE		= 7	--平局次数
WLLS_LGTASK_TOTAL	= 8	--参赛次数（失败次数 = TOTAL - WIN - TIE）
WLLS_LGTASK_JOIN	= 9	--已经进入准备场的人数
WLLS_LGTASK_TIME	= 10--战斗时间总计
WLLS_LGTASK_STYPE	= 12--组建时的联赛模式
WLLS_LGTASK_EMY1	= 13	--最后的一场比赛遇到的对手（战队名String2ID）
WLLS_LGTASK_EMY2	= 14	--倒数第二场比赛遇到的对手
WLLS_LGTASK_EMY3	= 15	--倒数第三场比赛遇到的对手
WLLS_LGTASK_TOTAL_EX= 16	--扩展参加次数
WLLS_LGTASK_USE_LingQi_COUNT= 17	--扩展参加次数

WLLS_LGMTASK_JOB	= 1	--职位:0、队员；1、队长
WLLS_LGMTASK_STATE	= 2	--战队成员状态：0、在场外；1、进入准备场
WLLS_LGMTASK_ADDSID	= 3	--在哪个赛季加入了本战队
WLLS_LGMTASK_WIN	= 4	--需要补加的胜利次数
WLLS_LGMTASK_TIE	= 5	--需要补加的平局次数
WLLS_LGMTASK_TOTAL	= 6	--需要补加的参赛次数
WLLS_LGMTASK_OVER	= 7	--在哪个赛季级发生越级

--Const Value--
WLLS_LGTYPE	= 5	--战队类型

WLLS_MAX_COUNT	= 200	--每个准备场最多容纳多少战队

WLLS_MATCHTIME	= 15	--每场比赛的时间（分钟）

WLLS_LEVEL_DESC = {"武林联赛", "武林联赛"}
WLLS_LingQi_PerCOUNT = 4
WLLS_TYPE = {
	{
		name = "双人赛",	-- 联赛类型名称
		max_member = 2,		-- 战队最大成员数
		ladder = 10196,		-- 排名起始ID
		mtypes = 2,			-- 该联赛类型中的战队类型数目（即是最终排行榜数量）
		groups = 8,			-- 同类型的战队可以被分配到多少套不同的场地
	},
	{
		name = "单人赛",
		max_member = 1,
		ladder = 10201,
		mtypes = 20,
		groups = 1,
	},
	{
		name = "师徒双人赛",
		max_member = 2,
		ladder = 10221,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "三人赛",
		max_member = 3,
		ladder = 10223,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "自由单人赛",
		max_member = 1,
		ladder = 10235,
		mtypes = 2,
		groups = 8,
	},
	{
		name = "双人赛（同系）",
		max_member = 2,
		ladder = 10238,
		mtypes = 10,
		groups = 1,
	},
	{
		name = "双人赛",
		max_member = 2,
		ladder = 10248,
		mtypes = 2,
		groups = 8,
	},
}

--如果为nil或0，返回1，否则返回0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

--清除指定的战队所有信息
function wlls_lg_clear_one(n_lid)
	_M("wlls_lg_clear_one", n_lid)
	local str_lgname, _, n_membercount = LG_GetLeagueInfo(n_lid)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_LAST, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_POINT, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_RANK, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_WIN, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TIE, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TOTAL, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_JOIN, 0)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_TIME, 0)
	--清除每个成员战队信息
	for i = 0, n_membercount-1 do 
		local str_playername = LG_GetMemberInfo(n_lid, i)
		wlls_SetMemberTask(str_lgname, str_playername, WLLS_LGMTASK_STATE, 0)
	end	
end

--安全str
function wlls_safestr(str)
	return '"'..safestr(str)..'"'
end

function wlls_getlginfo(str_lgname)
	local n_lid = LG_GetLeagueObj(WLLS_LGTYPE, str_lgname)
	if FALSE(n_lid) then return str_lgname.."\t" end
	local str = ""
	for i = 0, LG_GetMemberCount(n_lid)-1 do
		local str_pl = LG_GetMemberInfo(n_lid, i)
		local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_pl, WLLS_LGMTASK_JOB)
		if n_job == 1 then
			str = str_pl..str
		else
			str = str.." "..str_pl
		end
	end
	return  str_lgname.."\t"..str
end

function wlls_SetLeagueTask(str_lgname, n_taskid, n_value)
	local n_oldv = LG_GetLeagueTask(WLLS_LGTYPE, str_lgname, n_taskid)
	if (n_oldv == n_value) then return end
	LG_ApplySetLeagueTask(WLLS_LGTYPE, str_lgname, n_taskid, n_value)
end

function wlls_SetMemberTask(str_lgname, str_plname, n_taskid, n_value)
	local n_oldv = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, n_taskid)
	if (n_oldv == n_value) then return end
	LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, n_taskid, n_value)
end

--检查参赛次数
function wlls_CheckMatchCount(n_leagueid, n_sid)
	
	if FALSE(n_leagueid) or WLLS_SEASON_TB[n_sid] == nil then
		return 
	end
	
	 if (LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_TOTAL) >= WLLS_SEASON_TB[n_sid][4]) then	--参赛次数达到限制
		
		if LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_TOTAL_EX) >= LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_USE_LingQi_COUNT) * WLLS_LingQi_PerCOUNT then
			return
		end
	end
	
	return 1
end

function _M(...)
	--local str = "+++DEBUG["..date("%H:%M:%S").."]: "..join(arg)
	--OutputMsg(str)
end
