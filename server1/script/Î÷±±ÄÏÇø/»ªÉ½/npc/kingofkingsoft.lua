-- »ªÉ½ ¾ø¶¥ ½¨°ïNPC
-- By£ºDan_Deng(2003-09-23)
--edit by Ğ¡ÀË¶à¶à(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function about_tong()
	Talk(6,"","Ng­¬i hái thµnh lËp bang héi cã ®iÒu kiÖn g× , ta tõ tõ nãi cho ng­¬i nghe !","§Çu tiªn ng­¬i nhÊt ®Şnh ph¶i xuÊt s­ ®éc lËp x«ng x¸o giang hå, tiÕp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi nµo, danh väng trªn 450 vµ tµi l·i ®¹o trªn 30","Muèn cã Nh¹c V­¬ng KiÕm ng­¬i cã thÓ mua Nh¹c V­¬ng KiÕm LÔ Bao ë kú tr©n c¸c hoÆc tham gia chiÕn tr­êng tèng kim cã c¬ héi nhËn ®­îc","Sau khi thµnh lËp bang héi cã 3 ngµy thö th¸ch, ng­¬i ph¶i chiªu hé ®­îc İt nhÊt 16 ng­êi vµo bang","NÕu sau 3 h«m bang héi kh«ng ®ñ 16 ng­êi, bang sÏ tù ®éng bŞ gi¶i t¸n","Cuèi cïng , thµnh lËp bang héi cÇn ph¶i cã 100 v¹n l­îng ")
end

function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Tung hoµnh giang hå ph¶i lËp bang míi nªn chİ lín!",2,"B¾t ®Çu lËp bang /Direct_CreateTong","Chê mét chót /wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 1) and (GetReputeLevel(GetRepute()) >= 1) and (GetLeadLevel() >= 1) and (HaveItem(195) == 1) then
		Talk(4,"create_pay","Nhµ ch¬i # kim s¬n ch­ëng m«n nh©n , xin hái ta muèn nh­ thÕ nµo míi cã thÓ gièng ng­¬i mét d¹ng trë thµnh khai t«ng lËp ph¸i trë thµnh mét gióp t«ng chñ ®©y ? ","Kim s¬n ch­ëng m«n nh©n # ®Çu tiªn ng­¬i muèn tin ch¾c m×nh cã t­¬ng øng n¨ng lùc , sau ®ã t×m ra mét d¹ng ®Æc biÖt vËt phÈm lµm bang chñ tİn vËt , nãi thİ dô nh­ ë trªn chiÕn tr­êng phÊn dòng giÕt ®Şch cã thÓ lÊy ®­îc nh¹c v­¬ng kiÕm ","Nhµ ch¬i # nh¹c v­¬ng kiÕm ? ng­¬i nãi lµ thanh kiÕm nÇy sao ? ","Kim s¬n ch­ëng m«n nh©n # th× ra lµ ng­¬i ®· cã nã . kh«ng tÖ , qu¶ nhiªn tuæi trÎ tµi cao . ")
	else				-- ´Ë²¿·İÎªÈ±Ê¡¶Ô»°£¬´ıÀ©³ä¡£
		Say("<#> ng­¬i cã chuyÖn g× kh«ng ?",
			2,
			"<#> hiÓu râ dùng bang ph­¬ng ph¸p !/about_tong",
--			"<#> nhËn lÊy thµnh chñ bang héi t­ëng th­ëng /talk_citytong_award",
			"<#> kh«ng cã g× /nothing")
--		i = random(0,1)
--		if (i == 0) then
--			Talk(1,"","Kim s¬n ch­ëng m«n nh©n # nÕu nh­ muèn thµnh lËp m×nh bang héi , sÏ v× nã bá ra ®¹i l­îng thêi gian tinh lùc cïng t©m huyÕt , thiÕt kh«ng thÓ nöa ®­êng hñy bá . ")
--		else
--			Talk(4,"","Kim s¬n ch­ëng m«n nh©n # ng­¬i hái thµnh lËp bang héi cã ®iÒu kiÖn g× , ta tíi tõ tõ nãi cho ng­¬i nghe . ","Kim s¬n ch­ëng m«n nh©n # ®Çu tiªn ng­¬i nhÊt ®Şnh ph¶i ®· xuÊt s­ ®éc lËp x«ng x¸o giang hå # tiÕp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi trung # lÇn n÷a ng­¬i muèn cô cã nhÊt ®Şnh giang hå danh väng # cuèi cïng ng­¬i thèng suÊt lùc kh«ng thÓ nhá víi 30 cÊp . ","Kim s¬n ch­ëng m«n nh©n # ®¹t tíi nh÷ng thø nµy yªu cÇu sau ng­¬i chØ cÇn tõ trªn chiÕn tr­êng ®¹t ®­îc mét thanh nh¹c v­¬ng kiÕm lÊy nµy lµm bang chñ tİn vËt lµ ®­îc råi . nÕu nh­ ng­¬i thµnh lËp ®İch bang ph¸i cã ®Çy ®ñ nhiÒu ng­êi ñng hé , c¸i nµy bang héi lµ cã thÓ trë thµnh chİnh thøc bang héi mµ vËn hµnh . ","Kim s¬n ch­ëng m«n nh©n # cuèi cïng , cã thÓ t­ëng t­îng ®­îc bang ph¸i vËn hµnh cßn cÇn ®¹i l­îng tiÒn b¹c , h­íng môc tiªu cña ng­¬i cè g¾ng lªn , ng­êi tuæi trÎ #")
--			Talk(6,"","Kim s¬n ch­ëng m«n nh©n # ng­¬i hái thµnh lËp bang héi cã ®iÒu kiÖn g× , ta tíi tõ tõ nãi cho ng­¬i nghe . ","Kim s¬n ch­ëng m«n nh©n # ®Çu tiªn ng­¬i nhÊt ®Şnh ph¶i ®· xuÊt s­ ®éc lËp x«ng x¸o giang hå # tiÕp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi trung # lÇn n÷a ng­¬i muèn cô cã nhÊt ®Şnh giang hå danh väng # cuèi cïng ng­¬i thèng suÊt lùc kh«ng thÓ nhá víi 30 cÊp . ","Kim s¬n ch­ëng m«n nh©n # ®¹t tíi nh÷ng thø nµy yªu cÇu sau ng­¬i chØ cÇn tõ trªn chiÕn tr­êng ®¹t ®­îc mét thanh nh¹c v­¬ng kiÕm lÊy nµy lµm bang chñ tİn vËt lµ ®­îc råi thµnh lËp bang héi liÔu . ","Kim s¬n ch­ëng m«n nh©n # bÊt qu¸ cßn ph¶i chó ı lµ , ng­¬i muèn tin ch¾c m×nh cã t­¬ng øng ¶nh h­ëng lùc cïng n¨ng lùc l·nh ®¹o , ng­¬i nhÊt ®Şnh ph¶i ë 3 ngµy bªn trong t×m ®­îc İt nhÊt 16 tªn chİ ®ång ®¹o hîp ng­êi tíi ñng hé ng­¬i , nÕu kh«ng bang héi còng kh«ng c¸ch nµo thµnh lËp , ba ngµy nay b×nh th­êng x­ng lµ “ kh¶o nghiÖm kú ” . ","Kim s¬n ch­ëng m«n nh©n # h¬n n÷a bÊt cø lóc nµo nÕu nh­ ng­¬i bang héi nh©n sè İt víi 16 ng­êi tho¹i , giang hå sÏ lËp tøc ®em ng­¬i bang héi lÇn n÷a tiÕn hµnh kh¶o nghiÖm , nÕu nh­ ë trong vßng ba ngµy kh«ng thÓ kh«i phôc l¹i 16 ng­êi trë lªn , giang hå ®ång ®¹o vÉn sÏ kh«ng thõa nhËn ng­¬i bang héi . ","Kim s¬n ch­ëng m«n nh©n # cuèi cïng , cã thÓ t­ëng t­îng ®­îc bang ph¸i vËn hµnh cßn cÇn ®¹i l­îng tiÒn b¹c , h­íng môc tiªu cña ng­¬i cè g¾ng lªn , ng­êi tuæi trÎ #")
--		end
	end
end

function create_pay()
	Say("Kim s¬n ch­ëng m«n nh©n # nh­ vËy , ng­¬i chØ cÇn cã ®Çy ®ñ tiÒn b¹c ®Ó cho bang ph¸i cã thÓ vËn chuyÓn lªn lµ ®­îc råi , nãi thİ dô nh­ cã c¸ 100 v¹n l­îng b¹c ®i . ",2,"Kh«ng thµnh vÊn ®Ò , ta ®· cã 100 v¹n l­îng b¹c /create_pay_yes","Qu¸ phİ tiÒn , İt mét chót cã ®­îc hay kh«ng /create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)				-- ÊÕ·Ñ
		DelItem(195)			-- É¾³ıÏà¹ØµÀ¾ß
		SetTask(99,1)				-- ²¢´òÉÏ±ê¼Ç£¨Í¬Ê±¶¨ÒåÎª°ïÅÉÖĞµÄµÚÒ»¸öÈË£¨¼´°ïÖ÷±¾ÈË£©£©
		Direct_CreateTong()		-- ¿ªÊ¼½¨°ï
	else
		Talk(1,"","Kim s¬n ch­ëng m«n nh©n # ng­¬i tùa hå còng kh«ng cã nhiÒu tiÒn nh­ vËy a , nh­ vËy lµ kh«ng ®­îc . chê ng­¬i cã ®Çy ®ñ kinh tÕ n¨ng lùc tíi t×m ta n÷a ®i . ")
	end
end

function create_pay_no()
	Talk(1,"","Kim s¬n ch­ëng m«n nh©n # ë duy tr× bang héi ®İch b×nh th­êng vËn hµnh vèn chİnh lµ rÊt phİ tiÒn , nÕu nh­ ng­¬i ®iÒu nµy còng th¶o giíi hoµn giíi , theo l·o phu thÊy cßn ch­a ph¶i muèn dùng bang ®İch h¶o . ")
end

function Direct_CreateTong()
	CreateTong(1)				-- µ¯³ö½¨°ï¶Ô»°¿ò£¬½áÊø½Å±¾¿ØÖÆ
end

function wait_a_moment()
end

--µÃµ½Ò»¸öÍæ¼ÒËùÔÚ°ï»áÕ¼ÁìµÄ³ÇÊĞ,·µ»ØË÷ÒıÖµ
function gettongownercity()
	--µÃµ½Íæ¼Ò°ï»áÃû³Æ
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--·Ö±ğµÃµ½Æß´ó³ÇÊĞµÄ°ï»áÃû³ÆÓëÍæ¼Ò°ï»áÃû³Æ¶Ô±È
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--±íÊ¾Íæ¼ÒËùÔÚµÄ°ï»áÃ»ÓĞÕ¼Áì³ÇÊĞ
	return 0
end

-- ¼ì²éÁì½±Ìõ¼ş
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> chØ cã chiÕm lÜnh thµnh phè ®İch bang ph¸i míi cã thÓ dÉn t­ëng , dÉn huynh ®Ö cña m×nh ®i chiÕm lÜnh mét tßa thµnh ®i !")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#> chØ cã bang chñ míi cã thÓ nhËn lÊy bang ph¸i t­ëng th­ëng , gäi bang chñ tíi ®©y ")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- ½ñÌìÊÇĞÇÆÚ¼¸£¿
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#> chØ cã mçi tuÇn mét 9:00~20:00 míi lµ dÉn t­ëng thêi gian , ®Õn lóc ®ã trë l¹i ®i ")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#> tuÇn nµy ®İch phÇn th­ëng ®· lÜnh , cuèi tuÇn trë l¹i ®i . ")
		end
		return 0
	end

	return 1
end

-- ÁìÈ¡³ÇÖ÷°ï»á½±Àø
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#> nhËn lÊy thµnh chñ bang héi t­ëng th­ëng ",
			2,
			"<#> ta muèn dÉn 60 c¸ /#take_tong_award(60)",
			"<#> ta t¹m thêi kh«ng dÉn /nothing")
	end
end

-- ÁìÈ¡ºì°ü
function take_tong_award(count)
	-- Ò»¸öºì°üÕ¼Ò»¸ö¸ñ×Ó
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> l­ng cña ng­¬i tói ®Çy , söa sang l¹i sau n÷a dÉn t­ëng .")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local today = tonumber(date("%Y%m%d"))
	set_citybonus_date(city_index, today)
	-- ¸øºì°ü
	for i = 1, count do
		AddItem(6,1,1535,1,1,1)
	end
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#> ®¹i bao tiÒn l× x× from kim s¬n ch­ëng m«n nh©n "
	WriteLog(msg);
	Talk(1, "", "<#> ®©y lµ ng­¬i cöa ®İch phÇn th­ëng , cÇm ®i ®i ")
end
