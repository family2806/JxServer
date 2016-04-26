Include("\\script\\lib\\common.lua")
Include("\\script\\global\\rename_head.lua")

--活动定义
EVENTS_TB = {
--	{
--		--显示活动条件
--		ndate = {051101, 051131},	--起止日期，可选
--		ntime = {2000, 2359},		--起止时间，可选
--		level = {1, 200},			--起止级别，可选
--		taskequal = {taskid, taskvalue},	--任务变量相等，可选
--		tasknot = {taskid, taskvalue},		--任务变量不等，可选
--		checkfunc = func			--检测函数，可选。函数返回nil表示不触发，否则触发
--		
--		--活动描述
--		name = "某某活动",			--活动名称，必需
--		describe = "简单说明文字",	--活动说明，也可以用一个函数返回字符串，可选
--		detail =
--[[　　这里可以写很多文字，详细描述你的活动。
--　　方括号的形式可以自由换行。
--　　也可以用一个函数返回字符串]],	--活动详情，可选 \___二者只可选其一
--		callback = nil,				--回调函数，可选 /
--		link = nil,					--Describe对话link信息，可选（使用detail时有效）
--	},
	{
		ndate = {070414,070424},
		name = "3月3日",
		describe = "从<color=yellow>14/4/2007<color> 到 <color=yellow>24/4/2007<color>, 在活动时间内，所有在打怪练功过程中的玩家将有机会捡到<color=yellow>货物袋<color>. 拿着货物袋和银两到各城市NPC商贩处换取 <color=yellow>原料储存包<color>.",
	},
	{	--3级以前龙五教育任务
		level = {1, 3},
		tasknot = {1014, 2},
		name = "教育任务",
		describe = "龙五提供的初学者任务",
		callback = Uworld1000_word,
	},
	{	--武林联赛——新秀
		level = {80, 119},
		name = "武林联赛，武林联赛'武林新秀'",
		describe = "你可以到官员处报名参加武林联赛.",
		detail =
[[武林联赛正处于准备阶段，你的等级可以参加<color=yellow>武林联营<color>.
联赛位置: <color=yellow>汴京 (222, 191)<color>, <color=yellow>临安(182, 204)<color>.]],
	},
	{	--武林联赛——高级
		level = {120, 200},
		name = "武林联赛，武林联赛'武林新秀'",
		describe = "你可以到官员处报名参加武林联赛.",
		detail =
[[武林联赛正处于准备阶段，你的等级可以参加<color=yellow>武林联营<color>.
联赛位置<color=yellow>大理 (200, 197)<color>, <color=yellow>扬州(219, 190)<color>.]],
	},
	{	--辉煌之夜
		name = "辉煌之夜",
		describe = "武林盟主独孤剑魔活动名称‘辉煌夜’每晚7时30分. ",
		detail =
[[目前为风调雨顺时间，为了盛情答谢江湖武林人士，武林盟主传人举行'辉煌夜'活动. 活动从每天19点30分开始，每次活动30分钟。具体内容可以去找礼官了解.]],
	},

	-- {
	-- 	name = "<#>角色改名",
	-- 	describe = "<#>由于在并服过程中，您的角色名与其他玩家的角色名出现了重名情况，因此系统已帮您自动更名，如果您需要重新改变角色名的话，请到各新手村的新手推广员处选择修改角色名。您只能更改一次角色名，所以请仔细阅读相应说明。",
	-- },
	-- {
	-- 	name = "<#>帮会改名",
	-- 	describe = "由于在并服过程中，您所在的帮会，帮会名与其他帮会名出现了重名情况，因此系统已帮您所在的帮会自动更名，如果帮主需要重新改变帮会名的话，请到各新手村的新手推广员处选择修改帮会名。帮主只能更改一次帮会名，所以请仔细阅读相应说明。",
	-- },
}

EVENT_HINT_LINK = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy060\\enemy060_st.spr>最近的活动安排:<link>"
EVENT_HINT_TIMES = 3	--每天上线提示次数

--如果有较复杂的活动需要自定义一些函数。请在下面Include，并使用：
--	if EVENTS_TB then EVENTS_TB[getn(EVENTS_TB)+1] = {……} end
--的方式添加
--=================================================================
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
--=================================================================

--登陆时调用的函数
function event_hint_login(bExchangeIn)
	-- 跨服过来的就不用再提示了
	if (bExchangeIn == 1) then
		return
	end
	local n_date = tonumber(GetLocalDate("%y%m%d"));
	local n_time = tonumber(GetLocalDate("%H%M"));
	local n_times;
	if (GetTask(2308) ~= n_date) then	--不是今天登陆的
		SetTask(2308, n_date);
		SetTask(2309, 0);
		n_times = 0;
	else
		n_times = GetTask(2309);
	end
	if (n_times >= EVENT_HINT_TIMES) then	--已达到提示次数，不再提示
		return
	end
	
	local n_level = GetLevel();
	local tb = {};
	for i = 1, getn(EVENTS_TB) do
		if event_hint_check(EVENTS_TB[i], n_date, n_time, n_level) then	--符合条件
			tb[getn(tb)+1] = i;
		end
	end
	if (getn(tb) == 1) then	--只有一个活动，直接显示详情
		event_show_detail(tb, 1);
	elseif (getn(tb) > 0) then	--多个活动
		event_show_all(tb);
	end
	
	SetTask(2309, n_times + 1)
	
	bingfu_hint()	--并服更名，临时添加的高优先级上线提示，不属于规范的使用
end

--检查某个活动是否需要通知当前玩家
function event_hint_check(tb_event, n_date, n_time, n_level)
	local tb = tb_event.ndate;
	if (tb) then	--限定日期
		if (n_date < tb[1] or n_date > tb[2]) then	--日期不符
			return
		end			
	end
	tb = tb_event.ntime;
	if (tb) then	--限定时间
		if (n_time < tb[1] or n_time > tb[2]) then	--日期不符
			return
		end			
	end
	tb = tb_event.level;
	if (tb) then	--限定级别
		if (n_level < tb[1] or n_level > tb[2]) then	--级别不符
			return
		end			
	end
	tb = tb_event.taskequal
	if (tb) then	--任务变量相等
		if (GetTask(tb[1]) ~= tb[2]) then
			return
		end			
	end
	tb = tb_event.tasknot
	if (tb) then	--任务变量不等
		if (GetTask(tb[1]) == tb[2]) then
			return
		end			
	end
	local func = tb_event.checkfunc
	if (func) then	--函数判断
		if (not func()) then
			return
		end			
	end
	return 1
end

--显示所有活动
function event_show_all(tb)
	local str = "<enter>";
	local tb_option = {};
	for i = 1, getn(tb) do
		local tb_event = EVENTS_TB[tb[i]];
		str = str .. "<color=red>" .. tb_event.name .. "<color><enter>";
		if (tb_event.describe) then
			local str_des
			if (type(tb_event.describe) == "function") then
				str_des = tb_event.describe()
			else
				str_des = tostring(tb_event.describe)
			end
			str = str .. "  " .. str_des .. "<color><enter>";
		end
		if (tb_event.detail or tb_event.callback) then
			tb_option[getn(tb_option)+1] = tb_event.name.."详情/#event_show_detail({"..join(tb).."},"..i..")";
		end
	end
	tb_option[getn(tb_option)+1] = "今天不用提醒我了/event_hint_stop";
	tb_option[getn(tb_option)+1] = "我知道了!/no";
	Describe(EVENT_HINT_LINK..str, getn(tb_option), tb_option);
end

--显示某一指定活动详情（全部，当前第几个）
function event_show_detail(tb, n)
	local tb_event = EVENTS_TB[tb[n]];
	if (tb_event.callback) then
		tb_event.callback();
	else
		local str = "<enter><color=red>"..tb_event.name.."<color><enter>"
		local tb_option = {};
		if (getn(tb) > 1) then
			tb_option[1] = "我还想了解其它活动/#event_show_all({"..join(tb).."})";
		end
		tb_option[getn(tb_option)+1] = "今天不用提醒我/event_hint_stop";
		tb_option[getn(tb_option)+1] = "我知道了!/no";
		if (tb_event.link) then
			str = tb_event.link .. str
		else
			str = EVENT_HINT_LINK .. str
		end
		if (tb_event.detail) then
			if (type(tb_event.detail) == "function") then
				str = str .. tb_event.detail()
			else
				str = str .. tb_event.detail
			end
		elseif (tb_event.describe) then
			if (type(tb_event.describe) == "function") then
				str = str .. tb_event.describe()
			else
				str = str .. tostring(tb_event.describe)
			end
		end
		Describe(str, getn(tb_option), tb_option);
	end
end

function event_hint_stop()
	SetTask(2309, EVENT_HINT_TIMES);
end

function bingfu_hint()
	-- 角色改名提示
	local msg = ""
	if (check_renamerole() == 1) then
		msg = msg .. "<#>由于在并服过程中，系统已帮您自动更名，请到各新手村的新手推广员处选择<color=red>修改角色名<color>。"
	end
	-- 帮会改名提示
	if (check_renametong() == 1) then
		msg = msg .. "<#>由于在并服过程中，系统已帮您所在的帮会自动更名，请到各新手村的新手推广员处选择<color=red>修改帮会名<color>。"
	end
	if (check_castellan_remedy() == 1) then
		msg = msg .. "<#>因为并服过程中系统自动回收了您所在帮会的城市管理权，您可以到各新手村的新手推广员处<color=red>领取相应的补偿<color>，领取帮会补偿的功能在<color=red>并服后一个月内<color>有效。"
	end
	
	if (msg ~= "") then
		Say(msg, 1, "<#>知道了/cancel")
	end
end

if login_add then login_add(event_hint_login, 0) end

