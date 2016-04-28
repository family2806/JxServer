Include("\\script\\lib\\common.lua")
Include("\\script\\global\\rename_head.lua")

--»î¶¯¶¨Òå
EVENTS_TB = {
--	{
--		--ÏÔÊ¾»î¶¯Ìõ¼ş
--		ndate = {051101, 051131},	--ÆğÖ¹ÈÕÆÚ£¬¿ÉÑ¡
--		ntime = {2000, 2359},		--ÆğÖ¹Ê±¼ä£¬¿ÉÑ¡
--		level = {1, 200},			--ÆğÖ¹¼¶±ğ£¬¿ÉÑ¡
--		taskequal = {taskid, taskvalue},	--ÈÎÎñ±äÁ¿ÏàµÈ£¬¿ÉÑ¡
--		tasknot = {taskid, taskvalue},		--ÈÎÎñ±äÁ¿²»µÈ£¬¿ÉÑ¡
--		checkfunc = func			--¼ì²âº¯Êı£¬¿ÉÑ¡¡£º¯Êı·µ»Ønil±íÊ¾²»´¥·¢£¬·ñÔò´¥·¢
--		
--		--»î¶¯ÃèÊö
--		name = "Ä³Ä³»î¶¯",			--»î¶¯Ãû³Æ£¬±ØĞè
--		describe = "¼òµ¥ËµÃ÷ÎÄ×Ö",	--»î¶¯ËµÃ÷£¬Ò²¿ÉÒÔÓÃÒ»¸öº¯Êı·µ»Ø×Ö·û´®£¬¿ÉÑ¡
--		detail =
--[[¡¡¡¡ÕâÀï¿ÉÒÔĞ´ºÜ¶àÎÄ×Ö£¬ÏêÏ¸ÃèÊöÄãµÄ»î¶¯¡£
--¡¡¡¡·½À¨ºÅµÄĞÎÊ½¿ÉÒÔ×ÔÓÉ»»ĞĞ¡£
--¡¡¡¡Ò²¿ÉÒÔÓÃÒ»¸öº¯Êı·µ»Ø×Ö·û´®]],	--»î¶¯ÏêÇé£¬¿ÉÑ¡ \___¶şÕßÖ»¿ÉÑ¡ÆäÒ»
--		callback = nil,				--»Øµ÷º¯Êı£¬¿ÉÑ¡ /
--		link = nil,					--Describe¶Ô»°linkĞÅÏ¢£¬¿ÉÑ¡£¨Ê¹ÓÃdetailÊ±ÓĞĞ§£©
--	},
	{
		ndate = {070414,070424},
		name = "Ho¹t ®éng Th¸ng 3",
		describe = "Tõ <color=yellow>14/4/2007<color> ®Õn <color=yellow>24/4/2016<color>, ®ang ho¹t ®éng thêi gian bªn trong , tÊt c¶ ®ang ®¸nh tr¸ch luyÖn c«ng trong qu¸ tr×nh ®İch nhµ ch¬i ®em cã c¬ héi nhÆt ®­îc <color=yellow> hµng hãa ®¹i <color>. cÇm hµng hãa ®¹i cïng ng©n l­îng ®Õn c¸c thµnh phè NPC th­¬ng phiÕn chç ®æi lÊy <color=yellow> nguyªn liÖu chøa ®ùng tói <color>.",
	},
	{	--3¼¶ÒÔÇ°ÁúÎåH­íng dÉn nhiÖm vô
		level = {1, 3},
		tasknot = {1014, 2},
		name = "H­íng dÉn nhiÖm vô",
		describe = " NhËn nhiÖm vô s¬ nhËp t¹i Long Ngò",
		callback = Uworld1000_word,
	},
	{	--ÎäÁÖÁªÈü¡ª¡ªĞÂĞã
		level = {80, 119},
		name = "Vâ l©m liªn ®Êu",
		describe = "Ng­¬i cã thÓ ®Õn quan viªn ghi danh tham gia vâ l©m liªn ®Êu .",
		detail =
[[ÎäÁÖÁªÈüÕı´¦ÓÚ×¼±¸½×¶Î£¬ÄãµÄµÈ¼¶¿ÉÒÔ²Î¼Ó<color=yellow>ÎäÁÖÁªÓª<color>.
ÁªÈüÎ»ÖÃ: <color=yellow>ãê¾© (222, 191)<color>, <color=yellow>ÁÙ°²(182, 204)<color>.]],
	},
	{	--ÎäÁÖÁªÈü¡ª¡ª¸ß¼¶
		level = {120, 200},
		name = "Vâ l©m liªn ®Êu",
		describe = "Ng­¬i cã thÓ ®Õn quan viªn ghi danh tham gia vâ l©m liªn ®Êu .",
		detail =
[[ÎäÁÖÁªÈüÕı´¦ÓÚ×¼±¸½×¶Î£¬ÄãµÄµÈ¼¶¿ÉÒÔ²Î¼Ó<color=yellow>ÎäÁÖÁªÓª<color>.
ÁªÈüÎ»ÖÃ<color=yellow>´óÀí (200, 197)<color>, <color=yellow>ÑïÖİ(219, 190)<color>.]],
	},
	{	--Ho¹t ®éng ®ªm huy hoµng
		name = "Ho¹t ®éng ®ªm huy hoµng",
		describe = "Minh chñ Vâ l©m §éc c« KiÕm khai më ho¹t ®éng‘ Ho¹t ®éng ®ªm huy hoµng’mçi buæi tèi b¾t ®Çu tõ  7 giê 30 phót . ",
		detail =
[[Ä¿Ç°Îª·çµ÷ÓêË³Ê±¼ä£¬ÎªÁËÊ¢Çé´ğĞ»½­ºşÎäÁÖÈËÊ¿£¬ÎäÁÖÃËÖ÷´«ÈË¾ÙĞĞ'»Ô»ÍÒ¹'»î¶¯. »î¶¯´ÓÃ¿Ìì19µã30·Ö¿ªÊ¼£¬Ã¿´Î»î¶¯30·ÖÖÓ¡£¾ßÌåÄÚÈİ¿ÉÒÔÈ¥ÕÒÀñ¹ÙÁË½â.]],
	},

	-- {
	-- 	name = "<#>§æi tªn nh©n vËt",
	-- 	describe = "<#>Bëi v× ë còng dïng/uèng trong qu¸ tr×nh, ngµi ®İch vai trß tªn thay v× h¾n nhµ ch¬i ®İch vai trß tªn xuÊt hiÖn nÆng tªn t×nh huèng, v× vËy hÖ thèng ®· gióp ngµi tù ®éng h¬n tªn , nÕu nh­ ngµi cÇn lÇn n÷a söa ®æi vai trß tªn lêi cña , mêi ®­îc c¸c tay míi th«n ®İch tay míi phæ biÕn réng r·i viªn chç lùa chän söa ®æi vai trß tªn . ngµi chØ cã thÓ söa ®æi mét lÇn vai trß tªn , cho nªn xin/mêi cÈn thËn ®äc t­¬ng øng nãi râ .",
	-- },
	-- {
	-- 	name = "<#>§æi tªn Bang héi",
	-- 	describe = "Bëi v× ë còng dïng/uèng trong qu¸ tr×nh, ngµi chç ë bang héi, bang héi tªn thay v× h¾n bang héi tªn xuÊt hiÖn nÆng tªn t×nh huèng, v× vËy hÖ thèng ®· gióp ngµi chç ë bang héi tù ®éng h¬n tªn , nÕu nh­ bang chñ cÇn lÇn n÷a söa ®æi bang héi tªn lêi cña , mêi ®­îc c¸c tay míi th«n ®İch tay míi phæ biÕn réng r·i viªn chç lùa chän söa ®æi bang héi tªn . bang chñ chØ cã thÓ söa ®æi mét lÇn bang héi tªn , cho nªn xin/mêi cÈn thËn ®äc t­¬ng øng nãi râ .",
	-- },
}

EVENT_HINT_LINK = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy060\\enemy060_st.spr>Ho¹t ®éng:<link>"
EVENT_HINT_TIMES = 3	--Ã¿ÌìÉÏÏßÌáÊ¾´ÎÊı

--Èç¹ûÓĞ½Ï¸´ÔÓµÄ»î¶¯ĞèÒª×Ô¶¨ÒåÒ»Ğ©º¯Êı¡£ÇëÔÚÏÂÃæInclude£¬²¢Ê¹ÓÃ£º
--	if EVENTS_TB then EVENTS_TB[getn(EVENTS_TB)+1] = {¡­¡­} end
--µÄ·½Ê½Ìí¼Ó
--=================================================================
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
--=================================================================

--µÇÂ½Ê±µ÷ÓÃµÄº¯Êı
function event_hint_login(bExchangeIn)
	-- ¿ç·ş¹ıÀ´µÄ¾Í²»ÓÃÔÙÌáÊ¾ÁË
	if (bExchangeIn == 1) then
		return
	end
	local n_date = tonumber(GetLocalDate("%y%m%d"));
	local n_time = tonumber(GetLocalDate("%H%M"));
	local n_times;
	if (GetTask(2308) ~= n_date) then	--²»ÊÇ½ñÌìµÇÂ½µÄ
		SetTask(2308, n_date);
		SetTask(2309, 0);
		n_times = 0;
	else
		n_times = GetTask(2309);
	end
	if (n_times >= EVENT_HINT_TIMES) then	--ÒÑ´ïµ½ÌáÊ¾´ÎÊı£¬²»ÔÙÌáÊ¾
		return
	end
	
	local n_level = GetLevel();
	local tb = {};
	for i = 1, getn(EVENTS_TB) do
		if event_hint_check(EVENTS_TB[i], n_date, n_time, n_level) then	--·ûºÏÌõ¼ş
			tb[getn(tb)+1] = i;
		end
	end
	if (getn(tb) == 1) then	--Ö»ÓĞÒ»¸ö»î¶¯£¬Ö±½ÓÏÔÊ¾ÏêÇé
		event_show_detail(tb, 1);
	elseif (getn(tb) > 0) then	--¶à¸ö»î¶¯
		event_show_all(tb);
	end
	
	SetTask(2309, n_times + 1)
	
	bingfu_hint()	--²¢·ş¸üÃû£¬ÁÙÊ±Ìí¼ÓµÄ¸ßÓÅÏÈ¼¶ÉÏÏßÌáÊ¾£¬²»ÊôÓÚ¹æ·¶µÄÊ¹ÓÃ
end

--¼ì²éÄ³¸ö»î¶¯ÊÇ·ñĞèÒªÍ¨Öªµ±Ç°Íæ¼Ò
function event_hint_check(tb_event, n_date, n_time, n_level)
	local tb = tb_event.ndate;
	if (tb) then	--ÏŞ¶¨ÈÕÆÚ
		if (n_date < tb[1] or n_date > tb[2]) then	--ÈÕÆÚ²»·û
			return
		end			
	end
	tb = tb_event.ntime;
	if (tb) then	--ÏŞ¶¨Ê±¼ä
		if (n_time < tb[1] or n_time > tb[2]) then	--ÈÕÆÚ²»·û
			return
		end			
	end
	tb = tb_event.level;
	if (tb) then	--ÏŞ¶¨¼¶±ğ
		if (n_level < tb[1] or n_level > tb[2]) then	--¼¶±ğ²»·û
			return
		end			
	end
	tb = tb_event.taskequal
	if (tb) then	--ÈÎÎñ±äÁ¿ÏàµÈ
		if (GetTask(tb[1]) ~= tb[2]) then
			return
		end			
	end
	tb = tb_event.tasknot
	if (tb) then	--ÈÎÎñ±äÁ¿²»µÈ
		if (GetTask(tb[1]) == tb[2]) then
			return
		end			
	end
	local func = tb_event.checkfunc
	if (func) then	--º¯ÊıÅĞ¶Ï
		if (not func()) then
			return
		end			
	end
	return 1
end

--ÏÔÊ¾ËùÓĞ»î¶¯
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
			tb_option[getn(tb_option)+1] = tb_event.name.." chi tiÕt/#event_show_detail({"..join(tb).."},"..i..")";
		end
	end
	tb_option[getn(tb_option)+1] = "H«m nay nh¾c nhë ta/event_hint_stop";
	tb_option[getn(tb_option)+1] = "Ta ®· biÕt!/no";
	Describe(EVENT_HINT_LINK..str, getn(tb_option), tb_option);
end

--ÏÔÊ¾Ä³Ò»Ö¸¶¨»î¶¯ÏêÇé£¨È«²¿£¬µ±Ç°µÚ¼¸¸ö£©
function event_show_detail(tb, n)
	local tb_event = EVENTS_TB[tb[n]];
	if (tb_event.callback) then
		tb_event.callback();
	else
		local str = "<enter><color=red>"..tb_event.name.."<color><enter>"
		local tb_option = {};
		if (getn(tb) > 1) then
			tb_option[1] = "Ta muèn t×m hiÓu vÒ ho¹t ®éng/#event_show_all({"..join(tb).."})";
		end
		tb_option[getn(tb_option)+1] = "H«m nay nh¾c nhë ta/event_hint_stop";
		tb_option[getn(tb_option)+1] = "Ta ®· biÕt!/no";
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
	-- ½ÇÉ«¸ÄÃûÌáÊ¾
	local msg = ""
	if (check_renamerole() == 1) then
		msg = msg .. "<> Bëi v× ë còng dïng/uèng trong qu¸ tr×nh , hÖ thèng ®· gióp ngµi tù ®éng h¬n tªn , mêi ®­îc c¸c tay míi th«n ®İch tay míi phæ biÕn réng r·i viªn chç lùa chän <color=red> söa ®æi vai trß tªn <color> . "
	end
	-- °ï»á¸ÄÃûÌáÊ¾
	if (check_renametong() == 1) then
		msg = msg .. "<> Bëi v× ë còng dïng/uèng trong qu¸ tr×nh , hÖ thèng ®· gióp ngµi chç ë bang héi tù ®éng h¬n tªn , mêi ®­îc c¸c tay míi th«n ®İch tay míi phæ biÕn réng r·i viªn chç lùa chän <color=red> söa ®æi bang héi tªn <color> . "
	end
	if (check_castellan_remedy() == 1) then
		msg = msg .. "<> Bëi v× còng dïng/uèng trong qu¸ tr×nh hÖ thèng tù ®éng thu vÒ liÔu ngµi chç ë bang héi ®İch thµnh phè qu¶n lı quyÒn , ngµi cã thÓ ®Õn c¸c tay míi th«n ®İch tay míi phæ biÕn réng r·i viªn chç <color=red> nhËn lÊy t­¬ng øng båi th­êng <color> , nhËn lÊy bang héi båi th­êng chøc n¨ng ë <color=red> còng dïng/uèng sau trong vßng mét th¸ng <color> h÷u hiÖu . "
	end
	
	if (msg ~= "") then
		Say(msg, 1, "<#>Ta ®· biÕt/cancel")
	end
end

if login_add then login_add(event_hint_login, 0) end

