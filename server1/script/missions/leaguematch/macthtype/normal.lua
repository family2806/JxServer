--==============Ò»°ã±ÈÈüÏà¹ØÊı¾İ===============
/*
if (not WLLS_HEAD) then
	return
end
*/
-- ½±Àø¹æÔò£¬½±Æ·±í
function tmp_help_award(tbData, nLevel)
	local tbAward	= tbData.award_rank[nLevel]
	local str = " 1. mÖt mái kÕ t­ëng th­ëng : th¾ng ph­¬ng ®¹t ®­îc "..(5*nLevel).." ®iÓm , cïng "..(2*nLevel).." ®iÓm , bŞ/cha/chŞu ph­¬ng : 0 ®iÓm . mçi cuéc tranh tµi ®em gia t¨ng <color=red> chót kinh nghiÖm t­ëng <color>. th¾ng b¹i ®Òu cã t­¬ng øng t­ëng th­ëng \n"
		.." 2. ®øng hµng t­ëng th­ëng : sau khi cuéc tranh tµi kÕt thóc , dùa theo chiÕn ®éi thµnh tİch , ®øng hµng thø <color=red> tõ 1 ®Õn "..tbAward[getn(tbAward)][1].."<color>, thµnh viªn cã thÓ ®¹t ®­îc ®øng hµng t­ëng th­ëng ( vinh dù trŞ gi¸ .\n"
		.." <t> ®øng hµng t­ëng th­ëng : \n"
		.." ®øng hµng t­ëng th­ëng "
	if (tbData.max_member ~= 1) then
		str	= str.."( chiÕn ®éi thµnh viªn )"
	end

	local nLastRank	= 1
	for nAward = 1, getn(tbAward) do
		local nRank	= tbAward[nAward][1]
		local szRank
		if (nLastRank == nRank) then
			szRank	= nRank
		else
			szRank	= nLastRank.."-"..nRank
		end
		str = str.."\n"..strfill_left(format(" lÇn %s ", szRank), 16)..tbAward[nAward][2].." vinh dù trŞ gi¸ "
		nLastRank	= nRank + 1
	end

	return str
end

-- °ïÖúÎÄ×Ö
-- ¸ñÊ½1£º
--	{"Bé m«n tªn ", "Trî gióp néi dung ", 1/2(ÏŞ¶¨£¬¿ÉÑ¡)},
--	ÏŞ¶¨£º1¡¢Ö»Õë¶Ôµ¥ÈËÀàĞÍ£»2¡¢Ö»Õë¶Ô¶àÈË£»nil¡¢È«²¿£¨ÏÂÍ¬£©
-- ¸ñÊ½2£º
--	{"Bé m«n tªn ", function(·µ»ØTrî gióp néi dung µÄº¯Êı), 1/2(ÏŞ¶¨£¬¿ÉÑ¡)},
-- ¸ñÊ½3£º
--	{
--		"Bé m«n tªn ",
--		{
--			"ĞÂĞãÈüTrî gióp néi dung ",
--			"¸ß¼¶ÈüTrî gióp néi dung ",
--		},
--		1/2(ÏŞ¶¨£¬¿ÉÑ¡)
--	},
tmp_help = {
	{
		"<t> giíi thiÖu ",
		{
			" lÇn nµy t©n tó liªn cuéc so tµi v× <color=red><s><color>, tham gia ng­êi cÊp bËc cÇn tõ <color=red>80-119<color>. nhµ ch¬i ®i gÆp <color=red> t©n tó sø gi¶ <color> ghi danh thµnh lËp chiÕn ®éi , sau ®ã tiÕn vµo t©n tó liªn cuéc so tµi héi tr­êng tiÕn hµnh tranh tµi ",
			" lÇn nµy vâ l©m liªn cuéc so tµi v× <color=red><s><color>, tham gia ng­êi cÊp bËc cÇn tõ <color=red>120<color>. ®i gÆp <color=red> liªn cuéc so tµi sø gi¶ <color>, ghi danh thµnh lËp chiÕn ®éi , sau ®ã tiÕn vµo vâ l©m liªn cuéc so tµi héi tr­êng tiÕn hµnh tranh tµi ",
		}
	},
	{"Ghi danh tham gia tranh tµi tr×nh tù ", " ë tranh tµi giai ®o¹n , nhµ ch¬i cã thÓ ghi danh tham gia bÊt kú h×nh thøc ®İch tranh tµi ", 1},
	{"Ghi danh tham gia tranh tµi tr×nh tù ", "Ghi danh tham gia <s>, cÇn thµnh lËp chiÕn ®éi . nhµ ch¬i cã thÓ lùa chän m×nh chiÕn ®éi , còng cã thÓ gia nhËp nh÷ng chiÕn ®éi kh¸c . ®éi tr­ëng cïng h¾n ng­êi häp thµnh ®éi sau , ®em cïng quan viªn ®èi tho¹i <t>, lùa chän <color=red> chiÕn ®éi <t> lËp tøc t¹o thµnh chiÕn ®éi . thµnh viªn sè l­îng nhiÒu nhÊt v× <color=red><d> ng­êi <color><e>.", 2},
	{"Rêi ®i tranh tµi ®éi ", " ë <color=red> c¸ch nghØ ng¬i giai ®o¹n ­íc chõng <color>, nhµ ch¬i cã thÓ tù ®i tho¸t khái chiÕn ®éi . ë tranh tµi giai ®o¹n , nÕu nh­ ng­¬i chiÕn ®éi <color=red> ch­a tíi tranh tµi thêi ®iÓm <color>, nhµ ch¬i cã thÓ tù ®i rêi ®i chiÕn ®éi , nÕu nh­ ®· so tµi th× kh«ng thÓ rêi ®i . <color=yellow> rêi ®i chiÕn ®éi sau , th× kh«ng thÓ dÉn ®øng hµng t­ëng th­ëng <color>. <color=yellow> rêi ®i chiÕn ®éi sau , ®em kh«ng thÓ trë vÒ tranh tµi <color>.", 1},
	{"Rêi ®i tranh tµi ®éi ", " ë <color=red> c¸ch nghØ ng¬i giai ®o¹n ­íc chõng <color>, nhµ ch¬i cã thÓ tù ®i tho¸t khái chiÕn ®éi . ë tranh tµi giai ®o¹n , nÕu nh­ ng­¬i chiÕn ®éi <color=red> ch­a tíi tranh tµi thêi ®iÓm <color>, nhµ ch¬i cã thÓ tù ®i rêi ®i chiÕn ®éi , nÕu nh­ ®· so tµi th× kh«ng thÓ rêi ®i . <color=yellow> rêi ®i chiÕn ®éi sau , th× kh«ng thÓ dÉn ®øng hµng t­ëng th­ëng <color>. nÕu nh­ ®éi tr­ëng rêi ®i chiÕn ®éi , lµ ®éi tr­ëng quyÒn lîi ®em chuyÓn giao cho nh÷ng ng­êi kh¸c . <color=yellow> nÕu nh­ chiÕn ®éi kh«ng ai liÔu , ®em tù ®éng gi¶i t¸n <color>. mçi lÇn liªn cuéc so tµi kÕt thóc , c¸i nµo chiÕn ®éi kh«ng phï hîp lÇn sau tranh tµi liÒn tù ®éng bŞ gi¶i t¸n ", 2},
	{"§Êu tr­êng lÇn ", "Mçi tuÇn tõ thø hai ®Õn thø n¨m , tõ <color=red>18: 00- 19: 00<color> khai tr­¬ng tranh tµi <color=yellow>4 trµng <color>. cßn sãt l¹i 3 ngµy tõ <color=red>18: 00-19: 00<color> cïng <color=red>21: 00-22: 00<color> cã thÓ tranh tµi <color=yellow>8 trµng <color>. toµn bé tranh tµi giai ®o¹n <color=red>( mçi th¸ng tõ 8-28)<color> tÊt c¶ tranh tµi <color=yellow>108 trµng <color>. tham gia chiÕn ®éi nhiÒu nhÊt tham gia <color=red>48 trµng <color> "},
	{"Tranh tµi l­u tr×nh ", "ChiÕn ®éi ®éi viªn ®i cïng <t> ®èi tho¹i tiÕn vµo héi tr­êng <t>, tiÕp theo sau ®ã cïng héi tr­êng quan viªn ®èi tho¹i , còng sÏ bŞ mang vµo trang bŞ khu vùc . ®Õn tranh tµi thêi gian , tham gia ®éi viªn ®em tù ®éng bŞ ®­a ng­êi cuéc so tµi trµng . <color=red> cã thÓ tù do lùa chän vò khİ cïng trang bŞ <color>."},
	{"Tranh tµi quy t¾c ",	-- µ¥ÈË
[[    1. ÔÚ±ÈÈüÊ±¼ä, ´ò°Ü¶ÔÊÖÁ¢¼´»ñÊ¤
    2. ÔÚ±ÈÈüÊ±¼ä <color=red>Èç¹ûÒ»±ß²»Ê£Ò»¸ö³ÉÔ±ÁË¾ÍÊÇ¸º·½<color> Á¢¼´±»´¦Àí
    3. Èç¹û½áÊø±ÈÈü£¬2±ß³ÉÔ±¶¼ÊÇÒ»ÑùµÄ£¬ÏµÍ³½«»áÅĞ¶ÏÄÇ±ß±»´òÖĞµÄ´ÎÊı×îÉÙÎª»ñÊ¤·½£¬Èç¹û»¹ÊÇÒ»ÑùµÄ£¬¾ÍÊÇºÍ¡£
    4. Èç¹ûÄÄ¶Ó²»¼°Ê±½øÈëÈü³¡¾ÍÊÇ¸º·½, <color=red>Ê£ÏÂ·½ÎªÊ¤Àû·½<color>
    5. ¼Æ·Ö: Ê¤·½<pw> µã; ºÍ<pt> µã; ¸º·½ 0 µã
    6. ±ÈÈü¶ÓÔ±Ö»ÄÜÊ¹ÓÃÔÚÒ©µêÂòµÄÒ©Æ·
    7. <color=red>½ø³¡10Ãëºó¿ªÊ¼±ÈÈü<color>; ±ÈÈüÊ±¼äÎª14·Ö50Ãë 
    8. 2³¡±ÈÈüĞİÏ¢¼ä¸ô <color=red>10 ·ÖÖÓ<color>. <color=red>×¼±¸Ê±¼ä<color> 5 ·ÖÖÓ
]], 1},
	{"Tranh tµi quy t¾c ",	-- ¶àÈË
[[    1. ÔÚ±ÈÈüÊ±¼ä <color=red>ÄÄ±ßÈ«²¿ËÀÍöcolor> ¾ÍÎª¸º·½, ±ÈÈü½áÊø
    2. ÔÚ±ÈÈüÊ±¼ä <color=red>Èç¹ûÒ»±ß²»Ê£Ò»¸ö³ÉÔ±ÁË¾ÍÊÇ¸º·½<color> Á¢¼´±»´¦Àí
    3. ±ÈÈüÊ±¼ä½áÊø <color=red>ÄÄ±ßÊ£ÓàµÄ³ÉÔ±×î¶àÎªÊ¤·½<color>. Èç¹û <color=red>2·½ÈËÊıÒ»Ñù<color> Ôò±»´òÖĞ×îÉÙµÄÒ»·½È¡Ê¤¡£·ñÔòÎªºÍ¡£
    4. Èç¹ûÄÄ¶Ó²»¼°Ê±½øÈëÈü³¡¾ÍÊÇ¸º·½, <color=red>Ê£ÏÂ·½ÎªÊ¤Àû·½<color>
    5. ¼Æ·Ö: Ê¤·½<pw> µã; ºÍ<pt> µã; ¸º·½ 0 µã
    6. ±ÈÈü¶ÓÔ±Ö»ÄÜÊ¹ÓÃÔÚÒ©µêÂòµÄÒ©Æ·
    7. <color=red>½ø³¡10Ãëºó¿ªÊ¼±ÈÈü<color>; ±ÈÈüÊ±¼äÎª14·Ö50Ãë
    8. Ã¿³¡±ÈÈü×¼±¸Ê±¼äÎª <color=red>5 ·ÖÖÓ<color>
]], 2},
	{"§¸nh tróng sè lÇn ",
[[§¸nh tróng sè lÇn £º¾ÍÊÇ±»¶Ô·½ÓÃ´¸×Ó£¬¶¾£¬»òÕß±»´òÖĞÊÜÉË´ÎÊı

¼ÆËã±»´òÖĞ´ÎÊı¹æÔò
    1. Ã¿³¡±»¶Ô·½´òÖĞ£¬ÑªÁ¿¼õÉÙ
    2. ±»¶Ô·½µÄ´¸×Ó´òÖĞ£¬ÑªÁ¿¼õÉÙ
    3. ±»¶Ô·½·´»÷´òÖĞ£¬ÑªÁ¿¼õÉÙ
    4. ±»¶Ô·½¶¾ÖĞ£¬ÑªÁ¿¼õÉÙ
    5. Èç¹ûÒòÎªÊ¹ÓÃ¼¼ÄÜµ¼ÖÂÑªÁ¿¼õÉÙ¾Í²»±»¼ÆÈë±»´òÖĞ´ÎÊıÄÚ
]]
	},
	{"Ghi danh quy t¾c ", "     <color=red>§i±ÈÈü»ı·Ö <t><color>ÓÃÓÚ×÷ÎªÅÅĞĞÒÀ¾İ <t>. ½áÊø±ÈÈü<color=red><pw><color> ®iÓm , cïng <color=red><pt><color> µã; ¸º·½ <color=red>0<color> µã. Ã¿´Î<t>½áÊø£¬¸ù¾İ<color=red>Õ½¶Ó×Ü»ı·Ö<color>ÅÅÃû. Èç¹û»ı·ÖÒ»Ñù£¬½«¸ù¾İ<color=yellow>Ê¤Àû±ÈÀı<color> ÅÅĞĞ¡£Èç¹ûÊ¤Àû±ÈÀıÒ»Ñù£¬½«¸ù¾İ<color=green> Ã¿¸öÕ½¶Ó±ÈÈü×ÜÊ±¼ä<color> ÅÅĞĞ¡£±ÈÈü½×¶Î<t> ºó£¬»ı·Ö½«ÖØĞÂ¼ÆËã"},
	{"HiÓu râ nhiÒu h¬n t­êng t×nh ", tmp_help_award},
}

tmp_main = {	--officerÖ÷¶Ô»°
	" giang hå phong ba lo¹n khëi , nh­ng lµ , hay kh«ng v« cïng th¸i lai . khi mét t©n tó anh hïng xuÊt hiÖn thêi ®iÓm , còng lµ mét míi lŞch sö bŞ t¸i nhËp sö s¸ch . ng­êi nµo sÏ lµ cïng mét ngµy h¹ ®İch míi anh hïng ®©y ?",
	" v× ®Ó tr¸nh cho anh hïng hµo kiÖt l¹i mét lÇn n÷a ph©n tranh , ®éc c« minh chñ cö hµnh tranh tµi ®Õn t×m ra nh©n tµi , phôc vô quèc gia ",
}

tmp_creat = " thµnh lËp chiÕn ®éi tham gia sau <s>, ng­¬i cã thÓ <color=red> m×nh lµm ®éi tr­ëng <color><enter>"
	.." thµnh lËp chiÕn ®éi sau , v« luËn khi nµo , ng­¬i còng cã thÓ xin/mêi ng­êi kh¸c tham gia hoÆc lµ gia nhËp nh÷ng kh¸c ®éi . mçi chiÕn ®éi nhiÒu nhÊt chØ cã thÓ <d> ng­êi ( bao gåm ®éi tr­ëng ). <color=red> nÕu nh­ ch­a tíi tranh tµi thêi ®iÓm <color> còng <color=red> kh«ng t¸i qu¸ bÊt kú trµng lÇn <color>, ng­¬i cã thÓ tïy ı rêi ®i chiÕn ®éi . ng­¬i x¸c ®Şnh thµnh lËp m×nh chiÕn ®éi sao ? "

--====Functions====
--·µ»Øµ±Ç°½ÇÉ«¿ÉÒÔ²Î¼ÓµÄ±ÈÈüÀàĞÍ£¬nilÎª²»ÄÜ²ÎÈü
function tmp_player_type()
	local nLevel = wlls_player_level()
	return iif(nLevel > 0, nLevel, nil)
end

--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
function tmp_check_addmem(n_capidx, n_lid, n_mtype)
	if (n_mtype ~= wlls_player_type()) then
	 	return " thËt xin lçi , ®éi trung ®éi viªn :"..GetName().." cïng <color=red> tranh tµi lo¹i h×nh <color> kh«ng phï hîp , cho nªn , kh«ng thÓ vµo ng­¬i chiÕn ®éi !"
	end
end

function tmp_str(str, tbData)
	str	= gsub(str, "<s>", tbData.name)
	str	= gsub(str, "<d>", tbData.max_member)
	str	= gsub(str, "<e>", tbData.addmem_ex)
	return str
end

function tmp_process_data(tbData)
	-- Ä¬ÈÏÖµ
	if (not tbData.addmem_ex) then
		tbData.addmem_ex	= ""
	end
	if (not tbData.text_creat) then
		tbData.text_creat	= tmp_str(tmp_creat, tbData)
	end
	if (not tbData.player_type) then
		tbData.player_type	= tmp_player_type
	end
	if (not tbData.check_addmem) then
		tbData.check_addmem	= tmp_check_addmem
	end

	--½¨Á¢µØÍ¼Ë÷Òı£¨¿ìËÙÕÒµ½Ä³Ò»µØÍ¼¶ÔÓ¦µÄ±ÈÈüÀàĞÍ¡¢³¡µØ×é±àºÅ¡¢³¡µØÀàĞÍ£©
	local tbMapIdx = {}
	for nMType, tbMType in tbData.match_type do
		for nGroup, tbGroup in tbMType.map do
			for i = 1, 3 do
				tbMapIdx[tbGroup[i]] = {nMType, nGroup, i}
			end
		end
	end
	tbData.map_index = tbMapIdx

	-- ´¦Àí°ïÖúÎÄ×Ö
	local nCount = 0
	local nMultiple = iif(tbData.max_member == 1, 1, 2)
	local tbSpecialHelp	= tbData.help_msg	-- ÌØ¶¨°ïÖúĞÅÏ¢
	if (not tbSpecialHelp) then
		tbSpecialHelp	= {}
	end
	tbData.help_msg	= {}
	for _, tbTopic in tmp_help do
		local szTitle	= tmp_str(tbTopic[1], tbData)
		local varText, nLimit
		if (tbSpecialHelp[tbTopic[1]]) then	-- ÓĞ×Ô¶¨Òå°ïÖúĞÅÏ¢
			varText	= tbSpecialHelp[tbTopic[1]]
			nLimit	= nil
		else
			varText	= tbTopic[2]
			nLimit	= tbTopic[3]
		end
		if (not nLimit or nLimit == nMultiple) then
			nCount	= nCount + 1
			local szType	= type(varText)
			local tbText	= {"", ""}
			if (szType == "function") then
				tbText[1]	= varText(tbData, 1)
				tbText[2]	= varText(tbData, 2)
			elseif (szType == "table") then
				tbText[1]	= varText[1]
				tbText[2]	= varText[2]
			else
				tbText[1]	= tostring(varText)
				tbText[2]	= tbText[1]
			end

			tbData.help_msg[nCount]	= {}
			for nLevel = 1, 2 do
				tbText[nLevel]	= tmp_str(tbText[nLevel], tbData)
				tbText[nLevel]	= gsub(tbText[nLevel], "<t>", WLLS_LEVEL_DESC[nLevel])
				tbText[nLevel]	= gsub(tbText[nLevel], "<pw>", 5*nLevel)
				tbText[nLevel]	= gsub(tbText[nLevel], "<pt>", 2*nLevel)
				tbData.help_msg[nCount][nLevel]	= {
					gsub(szTitle, "<t>", WLLS_LEVEL_DESC[nLevel]),
					tbText[nLevel],
				}
			end
		end
	end

	-- ´¦ÀíOfficerÖ÷¶Ô»°ÎÄ×Ö
	tbData.text_main[1]	= tmp_main[1]..tbData.text_main[1]
	tbData.text_main[2]	= tmp_main[2]..tbData.text_main[2]
end
