Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_get_winrate()
	local n_total	= GetTask(WLLS_TASKID_TOTAL)
	if (n_total > 0) then
		return floor(GetTask(WLLS_TASKID_WIN) / n_total * 100)
	else
		return 0
	end
end

function wlls_get_total()
	local n_total	= GetTask(WLLS_TASKID_TOTAL)
	if (n_total > 255) then
		return 255
	else
		return n_total
	end
end

WLLS_REG_TABLE	= {
	-- 名称，	获取函数，				显示，																			单位)
	{"性别",	GetSex,					{"男", "N女 "},																	""},
	{"门派",	GetLastFactionNumber,	{"少林 ", "天王", "唐门", "五毒", "峨眉", "翠烟", "丐帮", "天忍", "武当", "昆仑"},""},
	{"等级",	GetLevel,				{{80,99}, {100,119}, {120,129}, {130,139}, {140,149}, {150,nil}},	"级"},
	{"参加联赛",	wlls_get_total,			{{nil,9}, {10,48}, {49,99}, {100,200}, {200,nil}},								"场"},
	{"取胜比例",	wlls_get_winrate,		{{nil,29}, {30,49}, {50,70}, {70,90}, {90,nil}},								"%"},
}

function main()
	local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
	if (WLLS_TAB[n_ntype].max_member <= 1) then
		Say("目前武林比武形式为单人赛，我不能帮你了!", 0)
		return
	end
	local n_lid = LG_GetLeagueObj(WLLS_REG_LGTYPE, GetName())
	local tb_option	= {}
	tb_option[getn(tb_option)+1]	= "我想检查/wlls_reg_query_menu"
	if FALSE(n_lid) then
		tb_option[getn(tb_option)+1]	= "我想登记/wlls_reg_me"
	else
		tb_option[getn(tb_option)+1]	= "我的信息/wlls_view_me"
		tb_option[getn(tb_option)+1]	= "我想删除信息/wlls_want2out"
	end
	tb_option[getn(tb_option)+1]	= "结束对话/OnCancel"
	Say("联赛使者：武林联赛正式开始" .. WLLS_TAB[n_ntype].name .. ", 可以见我来了解其他选手的信息或者登记自己和组队的信息", getn(tb_option), tb_option)
end

-- 登记成员
function wlls_reg_me()
	-- 建战队
	local n_lid = LG_CreateLeagueObj()
	LG_SetLeagueInfo(n_lid, WLLS_REG_LGTYPE, GetName())
	LG_ApplyAddLeague(n_lid, "", "") 
	LG_FreeLeagueObj(n_lid)

	-- 存入自身基本数据
	wlls_save_myinfo()

	Talk(1, "wlls_view_me", " 登记成功，可以更改信息")
end

-- 查看自己
function wlls_view_me()
	-- 如果 刚登记/刚更新 立即运行此函数 有可能显示异常
	Describe(wlls_get_infostr(GetName()), 3,
		"更改我的基本信息/wlls_reg_refresh", "更改期望队友的信息/#wlls_edit_need('')", "返回")
end

-- 更新自己的基本信息
function wlls_reg_refresh()
	wlls_save_myinfo()
	Talk(1, "wlls_view_me", strfill_right("更改成功!", 30))
end

-- 将自身基本信息存入
function wlls_save_myinfo()
	local tb_info = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_info[n_idx]	= tb_fmt[2]()
		if (type(tb_fmt[3][1]) == "string") then	-- 枚举+1
			tb_info[n_idx]	= tb_info[n_idx] + 1
		end
	end
	local n_data	= wlls_reg_savedata(tb_info)
	LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 1, n_data)
end

-- 查看并编辑期望队友信息
function wlls_edit_need(str, b_query)
	if (str == "") then	-- 刚打开
		SetTaskTemp(WLLS_TEMPTASK, LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2))
		if b_query then
			str	= "请更改队友的默认信息"
		else
			str	= "你现在可以更改队友信息"
		end
	end
	
	str	= "联赛使者:\n#" .. str
	str	= str .. "\目前正在建立:\n" .. wlls_get_needinfo(GetTaskTemp(WLLS_TEMPTASK))
	if b_query then
		str	= str .. "\n\n 想更改吗? 更改完就能检查."
	else
		str	= str .. "\n\n想更改吗? 更改完记得保留更改 '."
	end
	
	local tb_option = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[n_idx]	= "改变" .. tb_fmt[1] .. "/#wlls_want2modify_need(" .. n_idx .. "," .. tostring(b_query) .. ")"
	end
	
	if b_query then
		tb_option[getn(tb_option)+1] = "立即检查/wlls_reg_query_begin"
		tb_option[getn(tb_option)+1] = "返回/wlls_reg_query_menu"
	else
		tb_option[getn(tb_option)+1] = "保留更改/#wlls_save_need()"
		tb_option[getn(tb_option)+1] = "保留检查/#wlls_save_need(1)"
		tb_option[getn(tb_option)+1] = "取消更改/wlls_view_me"
	end
	Say(str, getn(tb_option), tb_option)
end

-- 准备修改某项期望值
function wlls_want2modify_need(n_idx, b_query)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	local n_value	= tb_info[n_idx]
	local tb_option	= {}
	for i = 0, getn(tb_fmt[3]) do
		if (n_value ~= i) then
			tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/#wlls_modify_need("..n_idx..","..i.."," .. tostring(b_query) .. ")"
		end
	end
	tb_option[getn(tb_option)+1]	= "不更改/#wlls_edit_need ('想更改其他设立吗?'," .. tostring(b_query) .. ")"
	Say("联赛使者: 之前期望<color=yellow>" .. tb_fmt[1] .. "<color>设立为<color=yellow>" ..
		wlls_get_oneneed(n_idx, n_value) .. "<color>\nxin 选择新范围:", getn(tb_option), tb_option)
end

-- 要注销成员
function wlls_want2out()
	Say("联赛使者: 删了后，所有的选手都不能看信息，确定了吗?", 2, "我决定删!/wlls_doout", "日后再说!/OnCancel")
end

-- 注销成员
function wlls_doout()
	LG_ApplyRemoveLeague(WLLS_REG_LGTYPE, GetName())
	Talk(1, "main", strfill_right("删除成功", 30))
end

-- 查询菜单
function wlls_reg_query_menu()
	local tb_option = {}
	tb_option[getn(tb_option)+1]	= "按照[名字]了解/wlls_reg_query_name"
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[getn(tb_option)+1]	= "按照 [" .. tb_fmt[1] .. "] /#wlls_reg_query_single(" .. n_idx .. ")"
	end
	tb_option[getn(tb_option)+1] = "高级了解/#wlls_edit_need('',1)"
	tb_option[getn(tb_option)+1] = "返回"
	Say("联赛使者: 你可以根据不同类型来了解选手，包括性别, 门派竔, 等级.", getn(tb_option), tb_option)
end

-- 查看队友（输入）
function wlls_reg_query_name()
	AskClientForString("wlls_reg_query_name_do", "", 1, 16, "输入想了解的成员名字")
end

-- 查看队友（查询）
function wlls_reg_query_name_do(str_name)
	Describe(wlls_get_infostr(str_name), 1, "返回/wlls_reg_query_menu", "返回")
end

-- 准备单项查询
function wlls_reg_query_single(n_idx)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_option	= {}
	for i = 1, getn(tb_fmt[3]) do
		tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/#wlls_reg_query_single_do("..n_idx..","..i..")"
	end
	tb_option[getn(tb_option)+1]	= "返回/wlls_reg_query_menu"
	Say("联赛使者: 目前按照秩序 color=yellow>"..tb_fmt[1].."<color> 了解，请选择需要找的范围:", getn(tb_option), tb_option)
end

-- 单项查询
function wlls_reg_query_single_do(n_idx, n_need)
	local tb_info	= {}
	for n, tb_fmt in WLLS_REG_TABLE do
		if (n == n_idx) then
			tb_info[n]	= n_need
		else
			tb_info[n]	= 0
		end
	end
	SetTaskTemp(WLLS_TEMPTASK, wlls_reg_savedata(tb_info))
	wlls_reg_query_begin()
end

-- 多项查询
function wlls_reg_query_begin()
	SetStringTask(WLLS_STRINGTASK, "")
	wlls_reg_query_do()
end

-- 根据临时变量查询
function wlls_reg_query_do(str_name, b_next)
	-- 确定本页的第一个战队ID
	local n_lid
	local str_start
	if b_next then	-- 翻页，str_name是起始成员
		SetStringTask(WLLS_STRINGTASK, str_name)
		str_start	= str_name
	else
		str_start	= GetStringTask(WLLS_STRINGTASK)
	end
	if (str_start ~= "") then	-- 当前页
		n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_start)
	else	-- 第一页
		n_lid	= LG_GetFirstLeague(WLLS_REG_LGTYPE)
	end
	
	-- 继续查找战队
	local str_myname	= GetName()
	local str
	local tb_option	= {}
	local tb_need	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	while (not FALSE(n_lid)) do
		local tb_info	= wlls_reg_loaddata(LG_GetLeagueTask(n_lid, 1))
		if (wlls_check_need(tb_need, LG_GetLeagueTask(n_lid, 1))) then	-- 找到一个匹配
			local str_lgname	= LG_GetLeagueInfo(n_lid)
			if (str_myname ~= str_lgname) then	-- 不能搜索自己
				local n_got	= getn(tb_option)
				if (n_got == 0) then	-- 第一个
					-- 显示要查询的战队
					if (not str_name) then 	-- 默认显示本页第一个
						str_name	= str_lgname
					end
					str	= wlls_get_infostr(str_name)
				elseif (getn(tb_option) >= 10) then	-- 已满
					str_name	= str_lgname
					break
				end
				if (str_lgname == str_name) then	-- 正是当前查询的战队
					tb_option[getn(tb_option)+1]	= "< " .. safeshow(str_name) .. " >/#wlls_reg_query_do('" .. safestr(str_name) .. "')"
				else
					tb_option[getn(tb_option)+1]	= safeshow(str_lgname) .. "/#wlls_reg_query_do('" .. safestr(str_lgname) .. "')"
				end
			end
		end
		n_lid = LG_GetNextLeague(WLLS_REG_LGTYPE, n_lid)
	end

	if (not str) then	-- 没能找到
		Say("联赛使者: 对不起，不能找符合登记要求的成员.", 1, "返回/wlls_reg_query_menu")
		return
	end

	if (not FALSE(n_lid)) then	-- 后面还有
		tb_option[getn(tb_option)+1]	= "下一页 /#wlls_reg_query_do('" .. safestr(str_name) .. "', 1)"
	end
	tb_option[getn(tb_option)+1]	= "返回/wlls_reg_query_menu"
	Describe(str, getn(tb_option), tb_option)
end

-- 修改某项期望值
function wlls_modify_need(n_idx, n_value, b_query)
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	tb_info[n_idx]	= n_value
	-- 符合一定逻辑
	if (n_idx == 2) then	-- 门派
		if (n_value == 1 or n_value == 2) then
			if (tb_info[1] == 2) then
				tb_info[1] = 1
			end
		elseif (n_value == 5 or n_value == 6) then
			if (tb_info[1] == 1) then
				tb_info[1] = 2
			end
		end
	elseif (n_idx == 1) then	-- 性别
		if (n_value == 1) then
			if (tb_info[2] == 5 or tb_info[2] == 6) then
				tb_info[2] = 0
			end
		elseif (n_value == 2) then
			if (tb_info[2] == 1 or tb_info[2] == 2) then
				tb_info[2] = 0
			end
		end
	end
	SetTaskTemp(WLLS_TEMPTASK, wlls_reg_savedata(tb_info))
	wlls_edit_need(WLLS_REG_TABLE[n_idx][1] .. "已更改", b_query)
end

-- 保存期望队友信息
function wlls_save_need(b_query)
	local n_data	= GetTaskTemp(WLLS_TEMPTASK)
	if (n_data ~= LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2)) then
		LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2, n_data)
	end
	Talk(1, iif(b_query, "wlls_reg_query_begin", "wlls_view_me"), strfill_right("保留成功!", 30))
end

-- 得到相应的成员信息字符串
function wlls_get_infostr(str_name)
	local n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_name)
	if FALSE(n_lid) then
		return "<link=image[0,8]:#npcspr:?NPCSID=87?ACTION=0>联赛使者<link>: 对不起，成员'"..safeshow(str_name).."' 不存在或者已经删除"
	end
	local n_data1	= LG_GetLeagueTask(n_lid, 1)
	local n_data2	= LG_GetLeagueTask(n_lid, 2)
	local tb_info	= wlls_reg_loaddata(n_data1)
	local str_ret
	if (tb_info[1] == 1) then
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\001.spr>" .. str_name .. "<link>\n"
	else
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\玩家肖像\\肖像\\003.spr>" .. str_name .. "<link>\n"
	end
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneinfo(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- 单数
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- 双数
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	n_lid	= LG_GetLeagueObjByRole(WLLS_LGTYPE, str_name)
	if FALSE(n_lid) then
		str_ret	= str_ret .. "战队：没有\n"
	else
		local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
		local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_stype ~= GetGlbValue(GLB_WLLS_NEXT)) then
			str_ret	= str_ret .. "战队:"..str_lgname.." (已过期) \n"
		else
			local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
			local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
			local n_maxmem	= WLLS_TAB[n_ntype].max_member
			str_ret	= str_ret .. "战队:" .. str_lgname .. " (" .. n_count .. "/" .. n_maxmem .. ")\n"
		end
	end
	return str_ret .. "\n 队友希望:\n" .. wlls_get_needinfo(n_data2)
end

-- 得到相应的期望信息字符串
function wlls_get_needinfo(n_data)
	local tb_info	= wlls_reg_loaddata(n_data)
	local str_ret	= ""
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneneed(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- 单数
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- 双数
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	return str_ret
end

-- 返回一条需求信息的字符串
function wlls_get_oneneed(n_idx, n_value)
	local tb		= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- 数值范围
		local tb_range	= tb[n_value]
		if (not tb_range) then
			return "没问题"
		elseif (not tb_range[1]) then
			return "#" .. tb_range[2] .. str_units
		elseif (not tb_range[2]) then
			return "#" .. tb_range[1] .. str_units
		else
			return tb_range[1] .. "~" .. tb_range[2] .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- 枚举
		local str = tb[n_value]
		if (not str) then
			return "没问题"
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- 返回一条成员基本信息的字符串
function wlls_get_oneinfo(n_idx, n_value)
	local tb	= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- 数值
		if (n_value >= 255) then
			return "#" .. n_value .. str_units
		else
			return n_value .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- 枚举
		local str = tb[n_value]
		if (not str) then
			return "不懂"
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- 检查期望值是否符合
function wlls_check_need(tb_need, n_data)
	local tb_value	= wlls_reg_loaddata(n_data)
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local n_need	= tb_need[n_idx]
		if (n_need ~= 0) then
			local tb		= WLLS_REG_TABLE[n_idx][3]
			local n_value	= tb_value[n_idx]
			if (type(tb[1]) == "table") then	-- 数值范围
				local tb_range	= tb[n_need]
				if (not tb_range[1]) then
					if (n_value > tb_range[2]) then
						return
					end
				elseif (not tb_range[2]) then
					if (n_value < tb_range[1]) then
						return
					end
				else
					if (n_value < tb_range[1] or n_value > tb_range[2]) then
						return
					end
				end
			elseif (type(tb[1]) == "string") then	-- 枚举
				if (n_need ~= n_value) then
					return
				end
			else
				error("type(tb[1]) == " .. type(tb[1]))
			end
		end
	end
	return 1
end

-- 根据 信息 返回 保存的数据
function wlls_reg_savedata(tb_info)
	local n_data	= 0;
	n_data	= SetByte(n_data, 1, tb_info[1] * 16 + tb_info[2])
	n_data	= SetByte(n_data, 2, tb_info[3])
	n_data	= SetByte(n_data, 3, tb_info[4])
	n_data	= SetByte(n_data, 4, tb_info[5])
	return n_data
end

-- 根据 保存的数据 返回 信息
function wlls_reg_loaddata(n_data)
	local n_data1	= GetByte(n_data, 1)
	tb_info	= {
		floor(n_data1 / 16),
		mod(n_data1, 16),
		GetByte(n_data, 2),
		GetByte(n_data, 3),
		GetByte(n_data, 4),
	}
	return tb_info
end


