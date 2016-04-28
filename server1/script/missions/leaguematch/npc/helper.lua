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
	-- Ãû³Æ£¬	»ñÈ¡º¯Êý£¬				ÏÔÊ¾£¬																			µ¥Î»)
	{"Giíi tÝnh ",	GetSex,					{"Nam ", "N n÷ "},																	""},
	{"M«n ph¸i ",	GetLastFactionNumber,	{"ThiÕu L©m ", "Thiªn v­¬ng ", "§­êng m«n ", "N¨m ®éc ", "Nga Mi ", "Thóy khãi ", "C¸i Bang ", "Ngµy nhÉn ", "Vâ §­¬ng ", "C«n L«n "},""},
	{"CÊp bËc ",	GetLevel,				{{80,99}, {100,119}, {120,129}, {130,139}, {140,149}, {150,nil}},	"CÊp "},
	{"Tham gia liªn cuéc so tµi ",	wlls_get_total,			{{nil,9}, {10,48}, {49,99}, {100,200}, {200,nil}},								"Trµng "},
	{"Thñ th¾ng tû lÖ ",	wlls_get_winrate,		{{nil,29}, {30,49}, {50,70}, {70,90}, {90,nil}},								"%"},
}

function main()
	local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
	if (WLLS_TAB[n_ntype].max_member <= 1) then
		Say("Tr­íc m¾t vâ l©m tû vâ h×nh thøc v× mét ng­êi cuéc so tµi , ta kh«ng thÓ gióp ng­¬i !", 0)
		return
	end
	local n_lid = LG_GetLeagueObj(WLLS_REG_LGTYPE, GetName())
	local tb_option	= {}
	tb_option[getn(tb_option)+1]	= "Ta muèn kiÓm tra/wlls_reg_query_menu"
	if FALSE(n_lid) then
		tb_option[getn(tb_option)+1]	= "Ta muèn ®¨ng ký/wlls_reg_me"
	else
		tb_option[getn(tb_option)+1]	= "ÎÒµNam ÅÏ¢/wlls_view_me"
		tb_option[getn(tb_option)+1]	= "Ta muèn thay ®æi th«ng tin/wlls_want2out"
	end
	tb_option[getn(tb_option)+1]	= "KÕt thóc ®èi tho¹i/OnCancel"
	Say(" liªn cuéc so tµi sø gi¶  vâ l©m liªn cuéc so tµi chÝnh thøc b¾t ®Çu " .. WLLS_TAB[n_ntype].name .. ", ¿ÉÒÔ¼ûÎÒÀ´ÁË½âÆäËûÑ¡ÊÖµNam ÅÏ¢»òÕßµÇ¼Ç×Ô¼ººÍ×é¶ÓµNam ÅÏ¢", getn(tb_option), tb_option)
end

-- µÇ¼Ç³ÉÔ±
function wlls_reg_me()
	-- ½¨Õ½¶Ó
	local n_lid = LG_CreateLeagueObj()
	LG_SetLeagueInfo(n_lid, WLLS_REG_LGTYPE, GetName())
	LG_ApplyAddLeague(n_lid, "", "") 
	LG_FreeLeagueObj(n_lid)

	-- ´æÈë×ÔÉí»ù±¾Êý¾Ý
	wlls_save_myinfo()

	Talk(1, "wlls_view_me", " µÇ¼Ç³É¹¦£¬¿ÉÒÔ¸ü¸Nam ÅÏ¢")
end

-- ²é¿´×Ô¼º
function wlls_view_me()
	-- Èç¹û ¸ÕµÇ¼Ç/¸Õ¸üÐÂ Á¢¼´ÔËÐÐ´Ëº¯Êý ÓÐ¿ÉÄÜÏÔÊ¾Òì³£
	Describe(wlls_get_infostr(GetName()), 3,
		" söa ®æi ta c¨n b¶n tin tøc /wlls_reg_refresh", "¸ü¸ÄÆÚÍû¶ÓÓÑµNam ÅÏ¢/#wlls_edit_need('')", "Trë vÒ ")
end

-- ¸üÐÂ×Ô¼ºµÄ»ù±¾ÐÅÏ¢
function wlls_reg_refresh()
	wlls_save_myinfo()
	Talk(1, "wlls_view_me", strfill_right("Söa ®æi thµnh c«ng !", 30))
end

-- ½«×ÔÉí»ù±¾ÐÅÏ¢´æÈë
function wlls_save_myinfo()
	local tb_info = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_info[n_idx]	= tb_fmt[2]()
		if (type(tb_fmt[3][1]) == "string") then	-- Ã¶¾Ù+1
			tb_info[n_idx]	= tb_info[n_idx] + 1
		end
	end
	local n_data	= wlls_reg_savedata(tb_info)
	LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 1, n_data)
end

-- ²é¿´²¢±à¼­ÆÚÍû¶ÓÓÑÐÅÏ¢
function wlls_edit_need(str, b_query)
	if (str == "") then	-- ¸Õ´ò¿ª
		SetTaskTemp(WLLS_TEMPTASK, LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2))
		if b_query then
			str	= " xin/mêi söa ®æi ®éi h÷u ®Ých cam chÞu tin tøc "
		else
			str	= " ng­¬i b©y giê cã thÓ söa ®æi ®éi h÷u tin tøc "
		end
	end
	
	str	= " liªn cuéc so tµi sø gi¶ :\n" .. str
	str	= str .. "\ tr­íc m¾t ®ang thµnh lËp :\n" .. wlls_get_needinfo(GetTaskTemp(WLLS_TEMPTASK))
	if b_query then
		str	= str .. "\n\n muèn söa ®æi sao ? söa ®æi hoµn lµ cã thÓ kiÓm tra ."
	else
		str	= str .. "\n\n muèn söa ®æi sao ? söa ®æi hoµn nhí cÊt gi÷ söa ®æi '."
	end
	
	local tb_option = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[n_idx]	= " söa ®æi " .. tb_fmt[1] .. "/wlls_want2modify_need(" .. n_idx .. "," .. tostring(b_query) .. ")"
	end
	
	if b_query then
		tb_option[getn(tb_option)+1] = "Á¢¼´¼ì²é/wlls_reg_query_begin"
		tb_option[getn(tb_option)+1] = "Trë vÒ /wlls_reg_query_menu"
	else
		tb_option[getn(tb_option)+1] = "±£Áô¸ü¸Ä/wlls_save_need()"
		tb_option[getn(tb_option)+1] = "±£Áô¼ì²é/wlls_save_need(1)"
		tb_option[getn(tb_option)+1] = "È¡Ïû¸ü¸Ä/wlls_view_me"
	end
	Say(str, getn(tb_option), tb_option)
end

-- ×¼±¸ÐÞ¸ÄÄ³ÏîÆÚÍûÖµ
function wlls_want2modify_need(n_idx, b_query)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	local n_value	= tb_info[n_idx]
	local tb_option	= {}
	for i = 0, getn(tb_fmt[3]) do
		if (n_value ~= i) then
			tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/wlls_modify_need("..n_idx..","..i.."," .. tostring(b_query) .. ")"
		end
	end
	tb_option[getn(tb_option)+1]	= "²»¸ü¸Ä/wlls_edit_need ('Ïë¸ü¸ÄÆäËûÉèÁ¢Âð?'," .. tostring(b_query) .. ")"
	Say(" liªn cuéc so tµi sø gi¶ : tr­íc kú väng <color=yellow>" .. tb_fmt[1] .. "<color> thiÕt lËp v× <color=yellow>" ..
		wlls_get_oneneed(n_idx, n_value) .. "<color>\nxin lùa chän míi ph¹m vi :", getn(tb_option), tb_option)
end

-- Òª×¢Ïú³ÉÔ±
function wlls_want2out()
	Say(" liªn cuéc so tµi sø gi¶ : san liÔu sau , tÊt c¶ tuyÓn thñ còng kh«ng thÓ nh×n tin tøc , x¸c ®Þnh ch­a ?", 2, "Ta quyÕt ®Þnh san !/wlls_doout", "Ngµy sau h·y nãi !/OnCancel")
end

-- ×¢Ïú³ÉÔ±
function wlls_doout()
	LG_ApplyRemoveLeague(WLLS_REG_LGTYPE, GetName())
	Talk(1, "main", strfill_right("Thñ tiªu thµnh c«ng ", 30))
end

-- ²éÑ¯²Ëµ¥
function wlls_reg_query_menu()
	local tb_option = {}
	tb_option[getn(tb_option)+1]	= "°´ÕÕ[Ãû×Ö]ÁË½â/wlls_reg_query_name"
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[getn(tb_option)+1]	= "°´ÕÕ [" .. tb_fmt[1] .. "] /wlls_reg_query_single(" .. n_idx .. ")"
	end
	tb_option[getn(tb_option)+1] = "¸ßCÊp ÁË½â/#wlls_edit_need('',1)"
	tb_option[getn(tb_option)+1] = "Trë vÒ "
	Say("ÁªÈüÊ¹Õß: Äã¿ÉÒÔ¸ù¾Ý²»Í¬ÀàÐÍÀ´ÁË½âÑ¡ÊÖ£¬°üÀ¨Giíi tÝnh , M«n ph¸i ¸i, CÊp bËc .", getn(tb_option), tb_option)
end

-- ²é¿´¶ÓÓÑ£¨ÊäÈë£©
function wlls_reg_query_name()
	AskClientForString("wlls_reg_query_name_do", "", 1, 16, "§­a vµo muèn biÕt ®Ých thµnh viªn tªn ")
end

-- ²é¿´¶ÓÓÑ£¨²éÑ¯£©
function wlls_reg_query_name_do(str_name)
	Describe(wlls_get_infostr(str_name), 1, "Trë vÒ /wlls_reg_query_menu", "Trë vÒ ")
end

-- ×¼±¸µ¥Ïî²éÑ¯
function wlls_reg_query_single(n_idx)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_option	= {}
	for i = 1, getn(tb_fmt[3]) do
		tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/wlls_reg_query_single_do("..n_idx..","..i..")"
	end
	tb_option[getn(tb_option)+1]	= "Trë vÒ /wlls_reg_query_menu"
	Say(" liªn cuéc so tµi sø gi¶ : tr­íc m¾t dùa theo trËt tù color=yellow>"..tb_fmt[1].."<color> hiÓu râ , xin/mêi lùa chän cÇn t×m ph¹m vi :", getn(tb_option), tb_option)
end

-- µ¥Ïî²éÑ¯
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

-- ¶àÏî²éÑ¯
function wlls_reg_query_begin()
	SetStringTask(WLLS_STRINGTASK, "")
	wlls_reg_query_do()
end

-- ¸ù¾ÝÁÙÊ±±äÁ¿²éÑ¯
function wlls_reg_query_do(str_name, b_next)
	-- È·¶¨±¾Ò³µÄµÚÒ»¸öÕ½¶ÓID
	local n_lid
	local str_start
	if b_next then	-- ·­Ò³£¬str_nameÊÇÆðÊ¼³ÉÔ±
		SetStringTask(WLLS_STRINGTASK, str_name)
		str_start	= str_name
	else
		str_start	= GetStringTask(WLLS_STRINGTASK)
	end
	if (str_start ~= "") then	-- µ±Ç°Ò³
		n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_start)
	else	-- µÚÒ»Ò³
		n_lid	= LG_GetFirstLeague(WLLS_REG_LGTYPE)
	end
	
	-- ¼ÌÐø²éÕÒÕ½¶Ó
	local str_myname	= GetName()
	local str
	local tb_option	= {}
	local tb_need	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	while (not FALSE(n_lid)) do
		local tb_info	= wlls_reg_loaddata(LG_GetLeagueTask(n_lid, 1))
		if (wlls_check_need(tb_need, LG_GetLeagueTask(n_lid, 1))) then	-- ÕÒµ½Ò»¸öÆ¥Åä
			local str_lgname	= LG_GetLeagueInfo(n_lid)
			if (str_myname ~= str_lgname) then	-- ²»ÄÜËÑË÷×Ô¼º
				local n_got	= getn(tb_option)
				if (n_got == 0) then	-- µÚÒ»¸ö
					-- ÏÔÊ¾Òª²éÑ¯µÄÕ½¶Ó
					if (not str_name) then 	-- Ä¬ÈÏÏÔÊ¾±¾Ò³µÚÒ»¸ö
						str_name	= str_lgname
					end
					str	= wlls_get_infostr(str_name)
				elseif (getn(tb_option) >= 10) then	-- ÒÑÂú
					str_name	= str_lgname
					break
				end
				if (str_lgname == str_name) then	-- ÕýÊÇµ±Ç°²éÑ¯µÄÕ½¶Ó
					tb_option[getn(tb_option)+1]	= "< " .. safeshow(str_name) .. " >/wlls_reg_query_do('" .. safestr(str_name) .. "')"
				else
					tb_option[getn(tb_option)+1]	= safeshow(str_lgname) .. "/wlls_reg_query_do('" .. safestr(str_lgname) .. "')"
				end
			end
		end
		n_lid = LG_GetNextLeague(WLLS_REG_LGTYPE, n_lid)
	end

	if (not str) then	-- Ã»ÄÜÕÒµ½
		Say(" liªn cuéc so tµi sø gi¶ : thËt xin lçi , kh«ng thÓ t×m phï hîp ghi danh yªu cÇu thµnh viªn .", 1, "Trë vÒ /wlls_reg_query_menu")
		return
	end

	if (not FALSE(n_lid)) then	-- ºóÃæ»¹ÓÐ
		tb_option[getn(tb_option)+1]	= "ÏÂÒ»Ò³ /wlls_reg_query_do('" .. safestr(str_name) .. "', 1)"
	end
	tb_option[getn(tb_option)+1]	= "Trë vÒ /wlls_reg_query_menu"
	Describe(str, getn(tb_option), tb_option)
end

-- ÐÞ¸ÄÄ³ÏîÆÚÍûÖµ
function wlls_modify_need(n_idx, n_value, b_query)
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	tb_info[n_idx]	= n_value
	-- ·ûºÏÒ»¶¨Âß¼­
	if (n_idx == 2) then	-- M«n ph¸i 
		if (n_value == 1 or n_value == 2) then
			if (tb_info[1] == 2) then
				tb_info[1] = 1
			end
		elseif (n_value == 5 or n_value == 6) then
			if (tb_info[1] == 1) then
				tb_info[1] = 2
			end
		end
	elseif (n_idx == 1) then	-- Giíi tÝnh 
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
	wlls_edit_need(WLLS_REG_TABLE[n_idx][1] .. " ®· söa ®æi ", b_query)
end

-- ±£´æÆÚÍû¶ÓÓÑÐÅÏ¢
function wlls_save_need(b_query)
	local n_data	= GetTaskTemp(WLLS_TEMPTASK)
	if (n_data ~= LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2)) then
		LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2, n_data)
	end
	Talk(1, iif(b_query, "wlls_reg_query_begin", "wlls_view_me"), strfill_right("CÊt gi÷ thµnh c«ng !", 30))
end

-- µÃµ½ÏàÓ¦µÄ³ÉÔ±ÐÅÏ¢×Ö·û´®
function wlls_get_infostr(str_name)
	local n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_name)
	if FALSE(n_lid) then
		return "<link=image[0,8]:npcspr:?NPCSID=87?ACTION=0> liªn cuéc so tµi sø gi¶ <link>: thËt xin lçi , thµnh viªn '"..safeshow(str_name).."' kh«ng tån t¹i hoÆc lµ ®· thñ tiªu "
	end
	local n_data1	= LG_GetLeagueTask(n_lid, 1)
	local n_data2	= LG_GetLeagueTask(n_lid, 2)
	local tb_info	= wlls_reg_loaddata(n_data1)
	local str_ret
	if (tb_info[1] == 1) then
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\Íæ¼ÒÐ¤Ïñ\\Ð¤Ïñ\\001.spr>" .. str_name .. "<link>\n"
	else
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\Íæ¼ÒÐ¤Ïñ\\Ð¤Ïñ\\003.spr>" .. str_name .. "<link>\n"
	end
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneinfo(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- µ¥Êý
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- Ë«Êý
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	n_lid	= LG_GetLeagueObjByRole(WLLS_LGTYPE, str_name)
	if FALSE(n_lid) then
		str_ret	= str_ret .. " chiÕn ®éi  kh«ng cã \n"
	else
		local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
		local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_stype ~= GetGlbValue(GLB_WLLS_NEXT)) then
			str_ret	= str_ret .. " chiÕn ®éi :"..str_lgname.." ( ®· qua kú ) \n"
		else
			local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
			local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
			local n_maxmem	= WLLS_TAB[n_ntype].max_member
			str_ret	= str_ret .. " chiÕn ®éi :" .. str_lgname .. " (" .. n_count .. "/" .. n_maxmem .. ")\n"
		end
	end
	return str_ret .. "\n ®éi h÷u hy väng :\n" .. wlls_get_needinfo(n_data2)
end

-- µÃµ½ÏàÓ¦µÄÆÚÍûÐÅÏ¢×Ö·û´®
function wlls_get_needinfo(n_data)
	local tb_info	= wlls_reg_loaddata(n_data)
	local str_ret	= ""
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneneed(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- µ¥Êý
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- Ë«Êý
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	return str_ret
end

-- Trë vÒ Ò»ÌõÐèÇóÐÅÏ¢µÄ×Ö·û´®
function wlls_get_oneneed(n_idx, n_value)
	local tb		= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- ÊýÖµ·¶Î§
		local tb_range	= tb[n_value]
		if (not tb_range) then
			return " kh«ng thµnh vÊn ®Ò "
		elseif (not tb_range[1]) then
			return "#" .. tb_range[2] .. str_units
		elseif (not tb_range[2]) then
			return "#" .. tb_range[1] .. str_units
		else
			return tb_range[1] .. "~" .. tb_range[2] .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- Ã¶¾Ù
		local str = tb[n_value]
		if (not str) then
			return " kh«ng thµnh vÊn ®Ò "
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- Trë vÒ Ò»Ìõ³ÉÔ±»ù±¾ÐÅÏ¢µÄ×Ö·û´®
function wlls_get_oneinfo(n_idx, n_value)
	local tb	= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- ÊýÖµ
		if (n_value >= 255) then
			return "#" .. n_value .. str_units
		else
			return n_value .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- Ã¶¾Ù
		local str = tb[n_value]
		if (not str) then
			return " kh«ng hiÓu "
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- ¼ì²éÆÚÍûÖµÊÇ·ñ·ûºÏ
function wlls_check_need(tb_need, n_data)
	local tb_value	= wlls_reg_loaddata(n_data)
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local n_need	= tb_need[n_idx]
		if (n_need ~= 0) then
			local tb		= WLLS_REG_TABLE[n_idx][3]
			local n_value	= tb_value[n_idx]
			if (type(tb[1]) == "table") then	-- ÊýÖµ·¶Î§
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
			elseif (type(tb[1]) == "string") then	-- Ã¶¾Ù
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

-- ¸ù¾Ý ÐÅÏ¢ Trë vÒ  ±£´æµÄÊý¾Ý
function wlls_reg_savedata(tb_info)
	local n_data	= 0;
	n_data	= SetByte(n_data, 1, tb_info[1] * 16 + tb_info[2])
	n_data	= SetByte(n_data, 2, tb_info[3])
	n_data	= SetByte(n_data, 3, tb_info[4])
	n_data	= SetByte(n_data, 4, tb_info[5])
	return n_data
end

-- ¸ù¾Ý ±£´æµÄÊý¾Ý Trë vÒ  ÐÅÏ¢
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


