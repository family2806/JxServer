--====Task Value====--
STORM_TASKID_BASE	= 1661-1	--TaskID起始值

STORM_TASKID_DAY			= STORM_TASKID_BASE+1	--上一次触发本系统的天数（2005年1月1日起的第几天）
STORM_TASKID_DAY_POINT		= STORM_TASKID_BASE+2	--当日总积分
STORM_TASKID_DAY_LASTPOINT	= STORM_TASKID_BASE+3	--昨日总积分
STORM_TASKID_DAY_AWARD		= STORM_TASKID_BASE+4	--是否已领取每日奖励（1、是，0、否）
STORM_TASKID_DAY_LASTAWARD	= STORM_TASKID_BASE+5	--是否已领取昨日奖励（1、是，0、否）

STORM_TASKID_WEEK			= STORM_TASKID_BASE+6	--上一次触发本系统的周数（2005年1月1日起的第几周）
STORM_TASKID_WEEK_POINT		= STORM_TASKID_BASE+7	--本周总积分
STORM_TASKID_WEEK_LASTPOINT	= STORM_TASKID_BASE+8	--上周总积分
STORM_TASKID_WEEK_AWARD		= STORM_TASKID_BASE+9	--是否已领取每周奖励（1、是，0、否）

STORM_TASKID_MONTH			= STORM_TASKID_BASE+11	--上一次触发本系统的月数（2005年1月1日起的第几月）
STORM_TASKID_MONTH_POINT	= STORM_TASKID_BASE+12	--本月总积分
STORM_TASKID_MONTH_LASTPOINT= STORM_TASKID_BASE+13	--上月总积分
STORM_TASKID_MONTH_AWARD	= STORM_TASKID_BASE+14	--是否已领取每月奖励（1、是，0、否）

STORM_TASKID_GAMEID_SS		= STORM_TASKID_BASE+16	--当前杀手试炼的GameID，用于判断是不是同一场比赛
STORM_TASKID_GAMES			= STORM_TASKID_BASE+17	--今天参加过的活动总数，同一个活动多次参加只记一次
STORM_TASKID_DATE			= STORM_TASKID_BASE+18	--最后一次触发本系统的日期，用于任务面板显示
STORM_TASKID_LETTER			= STORM_TASKID_BASE+19	--是否领取过信
STORM_TASKID_TIPS			= STORM_TASKID_BASE+20	--LogIn时提示过的次数

--每个活动的TaskValue（TaskID数组的角标）
STORM_TASKIDX_START		= 1	--活动开始的时间（场次）
STORM_TASKIDX_TRYCOUNT	= 2	--活动进行过的次数
STORM_TASKIDX_POINTCUR	= 3	--活动的当前风暴积分
STORM_TASKIDX_POINTEX	= 4	--活动的当前风暴积分奖励分（时间奖励/参与奖励）
STORM_TASKIDX_POINTMAX	= 5	--活动的当日最高风暴积分纪录
STORM_TASKIDX_EXTRA		= 6	--计算积分用到的额外变量（当前原始分/活动初始分）
STORM_TASKIDX_MODE		= 7	--所参加的活动的详细模式/级别

--====时间相关====--
--从2005年起的每年天数计数起始值
TB_STORM_DAYS = {}
TB_STORM_DAYS[2005]	= 0
TB_STORM_DAYS[2006]	= 365
TB_STORM_DAYS[2007]	= 730
TB_STORM_DAYS[2008]	= 1095
TB_STORM_DAYS[2009]	= 1461
TB_STORM_DAYS[2010]	= 1826

--从2005年起的每年周数计数起始值（相当于计算每年有多少个星期一）
TB_STORM_WEEKS = {}
TB_STORM_WEEKS[2005]	= 0
TB_STORM_WEEKS[2006]	= 52
TB_STORM_WEEKS[2007]	= 104
TB_STORM_WEEKS[2008]	= 157
TB_STORM_WEEKS[2009]	= 209
TB_STORM_WEEKS[2010]	= 261

STORM_LADDER_WEEK		= 36	--从第几周开始算排行
STORM_LADDERID_WEEK1	= 10182	--第一周排行
STORM_LADDERID_WEEK2	= 10183	--第二周排行
STORM_LADDERID_WEEK3	= 10184	--第三周排行
STORM_LADDERID_WEEK4	= 10185	--第四周排行
STORM_LADDERID_MONTH	= 10186	--本月排行（暂定全部？）

STORM_TIMERID_YS	= 44	--野叟任务倒计时
STORM_TIMER_YS		= 5		--野叟任务倒计时频率，5分钟

STORM_END_DAY	= 275	--积分风暴结束时间

IL("RELAYLADDER");
IL("TIMER");

--调试时用的输出，临时
function debug_out(str)
	--print(GetName()..":::"..str)
	--Msg2Player("<color=white>DEBUG:"..str.."<color>")
end

--带同步的SetTask
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

--检测日期，如果过了一天返回1，否则返回nil
--本函数同时处理跨日、跨周、跨月后的总积分计算、任务强行结束等
function storm_anotherday()
	local ndate = tonumber(GetLocalDate("%j%Y"))
	local nowyear = mod(ndate,10000)
	local nowday = floor(ndate/10000) + TB_STORM_DAYS[nowyear]

	--====跨日处理====--
	local lastday = GetTask(STORM_TASKID_DAY)
	if (nowday <= lastday) then	--没有跨日（不允许时间倒退），直接返回
		return nil
	else
		if (lastday>0) then	--做记录
			local loghead = "[STORM]"..lastday.."\t"..GetName().."\t"
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local gamemode = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_MODE])
					local extra = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_EXTRA])
					local point = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
					WriteLog(loghead..TB_STORM_DESCRIBE[i].."["..gamemode.."]\t"..extra.."\t"..point)
				end
			end
		end
		--清除活动标记
		for i = 1, STORM_GAMEID_MAX do
			if (TB_STORM_TASKID[i] ~= nil) then
				for j = 1, getn(TB_STORM_TASKID[i]) do
					SetTask(TB_STORM_TASKID[i][j],0)
				end
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_START])
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
				SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
			end
		end
		SetTask(STORM_TASKID_GAMES, 0)
		
		if (lastday + 1 == nowday) then	--只差一天，记录昨日积分
			nt_settask(STORM_TASKID_DAY_LASTPOINT, GetTask(STORM_TASKID_DAY_POINT))
			SetTask(STORM_TASKID_DAY_LASTAWARD, GetTask(STORM_TASKID_DAY_AWARD))
			debug_out("你昨天的积分是"..GetTask(STORM_TASKID_DAY_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_DAY_LASTPOINT, 0)
			SetTask(STORM_TASKID_DAY_LASTAWARD, 1)	--昨天没有参与风暴活动，没积分，就当他领过奖了？
		end
		nt_settask(STORM_TASKID_DAY, nowday)
		nt_settask(STORM_TASKID_DAY_POINT, 0)
		SetTask(STORM_TASKID_DAY_AWARD, 0)
		SetTask(STORM_TASKID_GAMES, 0)
		SetTask(STORM_TASKID_TIPS, 0)
		nt_settask(STORM_TASKID_DATE, tonumber(GetLocalDate("%Y%m%d")))	--记录日期，用于任务面板显示
	end
	
	--====跨周、跨月处理====--
	ndate = tonumber(GetLocalDate("%W%m"))
	local nowweek = floor(ndate/100) + TB_STORM_WEEKS[nowyear]
	local nowmonth = mod(ndate,100) + (nowyear-2005)*12
	if (tonumber(GetLocalDate("%d")) <= 2) then	--暂时以2号为分界线
		nowmonth = nowmonth - 1
	end
	--是否跨周
	local lastweek = GetTask(STORM_TASKID_WEEK)
	if (nowweek ~= lastweek) then	--有跨周
		if (lastweek + 1 == nowweek) then	--只差一周，记录上周积分
			nt_settask(STORM_TASKID_WEEK_LASTPOINT, GetTask(STORM_TASKID_WEEK_POINT))
			debug_out("你上周的积分是"..GetTask(STORM_TASKID_WEEK_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_WEEK_LASTPOINT, 0)
		end
		SetTask(STORM_TASKID_WEEK, nowweek)
		nt_settask(STORM_TASKID_WEEK_POINT, 0)
		SetTask(STORM_TASKID_WEEK_AWARD, 0)
	end
	--是否跨月
	local lastmonth = GetTask(STORM_TASKID_MONTH)
	if (nowmonth ~= lastmonth) then	--有跨月
		if (lastmonth + 1 == nowmonth) then	--只差一月，记录上月积分
			nt_settask(STORM_TASKID_MONTH_LASTPOINT, GetTask(STORM_TASKID_MONTH_POINT))
			debug_out("你上月的积分是"..GetTask(STORM_TASKID_MONTH_LASTPOINT))	--temp
		else
			nt_settask(STORM_TASKID_MONTH_LASTPOINT, 0)
		end
		SetTask(STORM_TASKID_MONTH, nowmonth)
		nt_settask(STORM_TASKID_MONTH_POINT, 0)
		SetTask(STORM_TASKID_MONTH_AWARD, 0)
	end
	
	return 1
end

--检查指定的活动计分是否仍然有效
--返回1有效；nil无效（超时或跨日）
function storm_valid_game(gameid)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	local starttime = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START])
	if (starttime == 0) then	--该活动的计分尚未开始，或者已经结束了
		return nil
	end

	if (storm_anotherday()) then	--隔了一天，活动无效
		return nil
	end
	
	if (not storm_gametime(gameid, starttime, storm_gettime(gameid))) then	--活动超时
		--storm_end(gameid, 1)
		return nil
	end
	
	return 1	
end

--结束某一活动的计分（不是必需的，结束后可以使得一些相关的函数反应更快）
--gameid：	1~10	活动的ID
function storm_end(gameid, silent)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end

	if (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START]) == 0) then
		return nil
	end

	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START], 0)

	if (not silent) then
		Say(storm_gamename(gameid, "red").."风暴挑战已结束.现有风暴积分是:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), 0)
	else
		debug_out(storm_gamename(gameid).."风暴挑战已结束.现有风暴积分是:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT)))
	end
	
	return 1
end

--将数字转为指定长度、带颜色的字符串
--len：	指定长度，nil为不限定，0为默认值
function storm_point2str(point, len)
	local str = tostring(point)
	if (len ~= nil) then
		if (len == 0) then
			len = 5
		end
		
		while (strlen(str) < len) do
			str = " "..str
		end
	end
	
	return "<color=yellow>"..str.."<color>"
end

--返回有颜色的活动名称
function storm_gamename(gameid,color)
	if (color == nil) then
		color = "white"
	end
	return "[<color="..color..">"..TB_STORM_DESCRIBE[gameid].."<color>]"
end

function OnCancel()
end

Include("\\script\\event\\storm\\custom.lua")

