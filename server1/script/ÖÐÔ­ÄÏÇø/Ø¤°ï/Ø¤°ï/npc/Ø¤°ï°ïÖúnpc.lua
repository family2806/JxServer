--Khëi ¤ngÅÉ°ïÖúNPC
-- By: Dan_Deng(2003-11-25)

Include("\\script\\global\\map_helper.lua")
npc_name = "Khëi ¤ng"

function main(sel)
	UTask_gb = GetTask(8)
	player_faction = GetFaction()
	if (player_faction == "gaibang") then		-- ±¾ÃÅµÜ×Ó
		RestoreLife()		-- ±¾ÃÅÃâ·ÑÖÎÁÆ
		RestoreMana()
		RestoreStamina()
		Say("Ta theo ÎÒÈëKhëi ¤ngÒÑ¾­50ÄêÁË£¬ËãÆğÀ´Ò²ÊÇºÎ°ïÖ÷µÄÊ¦ÊåÁË¡£ÓĞÊ²Ã´²»¶®µÄ¾ÍÎÊÎÒ.",6,"T×m hiÓu viÖc cña bæn bang/faction","T×m hiÓu c¸c vŞ trong bæn bang/member","T×m hiÓu nhiÖm vô /task_get","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 70*256) then				-- ±¾ÃÅ³öÊ¦
		Say("Ng­¬i xuÊt s­ ®· mÊy n¨m, ch¼ng lÏ vÉn cßn nhí ®­îc nh÷ng sù gian khæ lóc ®ã ­? Khµ! Khµ! Khµ!",6,"¤n l¹i bæn m«n cè sù /faction","Th¨m l¹i huynh ®Ö ®ång m«n/member","Ta cßn cã thÓ gióp g× kh«ng/task_get","T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng hái n÷a!/nothing")
	elseif (player_faction ~= "") then			-- ·Ç±¾ÃÅ³öÊ¦¡¢ÆäËüÃÅÅÉ£¨ÃÅÅÉ²»Îª¿Õ¼´Ö¸·ÇĞÂÊÖ£©
		Say("»¶Ó­À´µ½Khëi ¤ng! ²»ÖªÓĞÊ²Ã´Ö¸½Ì?",3,"T×m hiÓu quı bang/faction","T×m hiÓu c¸c vŞ anh hïng/member","Kh«ng hái n÷a!/nothing")
	else													-- ĞÂÊÖ
		Say("Khëi ¤ng»¶Ó­¸÷Î»¿¹½ğµÄÓĞÖ¾Ö®Ê¿!",4,"T×m hiÓu quı bang/faction","T×m hiÓu c¸c vŞ anh hïng/member","T×m hiÓu ®iÒu kiÖn nhËp m«n/task_get","Kh«ng hái n÷a!/nothing")
	end
end

----------------- ÃÅÅÉ½éÉÜ²¿·İ ----------------------------
function faction()
	Say("VËy th× ng­¬i muèn nghe ta giíi thiÖu vÒ bé phËn nµo cña bæn bang? ",5,"Khëi ¤ngµÄÆğÔ´/F1","VŞ trİ ®Şa lı /F2","§Şa vŞ giang hå /F3","§Æc s¾c m«n ph¸i/F4","Kh«ng hái n÷a!/nothing")
end

function F1()
	Say("LŞch sö cña bæn bang ®· cã tõ l©u. Tõ lóc s¬ Tèng ®· cã danh x­ng 'Thiªn h¹ ®Ö nhÊt bang' råi. Danh chÊn giang hå, anh tµi cña bæn bang nh­ 'Ngäa hæ tµng long', thêi nµo còng cã!",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F2()
	Say("¶«ÄÏÎ÷±±£¬ÄÄÀïÓĞÆòØ¤£¬ÄÄÀï¾ÍÓĞKhëi ¤ng!",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F3()
	Say("Khëi ¤ng³ÆÎªÌìÏÂµÚÒ»°ï£¬Óöµ½²»ÉÙÀ§ÄÑ. ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function F4()
	Say("Khëi ¤ngµÄÌØµãÊÇ£¬ÌÖ·¹Éú»î£¬ÊÇ×î±¦¹óµÄ¼Ò²Æ£¬¼ÓÈëKhëi ¤ng£¬ĞèÒª·ÅÆúËùÓĞ¼Ò²ú£¬ÆòÌÖÉú»î¡£ÒòÎª±¾°ï·Ö²¼¹ã·º£¬ËùÒÔ£¬¶úÄ¿ÖÚ¶à£¬ĞÅÏ¢¼°Ê±",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ³ÉÔ±½éÉÜ²¿·İ ----------------------------
function member()
	Say("Muèn nghe ta giíi thiÖu vŞ nµo trong bæn bang?",11,"Bang chñ Hµ Nh©n Ng· /Mhe","ChÊp ph¸p tr­ëng l·o M¹nh Th­¬ng L­¬ng/Mmeng","Ch­ëng bæng tr­ëng l·o La Khu«ng Sinh/Mluo","TruyÒn c«ng tr­ëng l·o Ngôy LiÔu ¤ng/Mwei","Ch­ëng B¸t tr­ëng l·o Xµ Tam Tr­îng/Mshe","TriÖu ®µ chñ /Mzhao","M¹nh ViÔn Tµi/Myuan","Tr­¬ng T¸n/Mzhang","Lı Tı /Mli","V­¬ng Ng« /Mwang","Kh«ng hái n÷a!/nothing")
end

function Mhe()
	Say("°ïÖ÷ºÎÈËÎÒ  Î»ÖÃ£ºKhëi ¤ng¹ã³¡   ×ø±ê: 191,231<enter>¿ñ·ÅºÀË¬£¬´ÖÖĞÓĞÏ¸£¬¼«ÖØÒåÆø¡£°®ºÈ¾Æ£¬ÊÖÖĞÓÀÔ¶Ò»ÊÖÄÃ¹÷£¬Ò»ÊÖÄÃ×Å¾Æºø£¬ËäÈ»³£³£ºÈµÃõ¤ôú´ó×í£¬µ«ÊÇ´¦Àí°ïÖĞ´óÊÂ¾ö²»»áºıÍ¿",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mmeng()
	Say("Ö´·¨³¤ÀÏÃÏ²ÔÀË   Î»ÖÃ£ºKhëi ¤ng¹ã³¡   ×ø±ê: 194,236<enter>ÎªÈË¹«ÕıÑÏÃ÷£¬Ö´·¨ÈçÉ½£¬ÓĞÊ±ÀíĞÔµÃ¼¸ºõ²»½üÈËÇé¡£ÓëÆäÔçÊÅµÄĞÖ³¤¸ĞÇéÉîºñ£¬¶ÔÆäÒÅ×ÓÃÏÔ¶²ÅÒ»Ö±Ê®·ÖÌÛ°®",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mluo()
	Say("ÕÆ°ô³¤ÀÏÂŞ¿ïÉú   Î»ÖÃ£ºKhëi ¤ng¹ã³¡   ×ø±ê: 190,226<enter>ÎªÈËÖÒºñ¡£³ÁÄ¬¹ÑÑÔ£¬Ò»µ©·¢ÑÔ£¬ÔòÒ»Õë¼ûÑª£¬³£ÄÜ¼ûµ½ËûÈËËù²»ÄÜ¼û¡£.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mwei()
	Say("´«¹¦³¤ÀÏÎºÁËÎÌ   Î»ÖÃ£ºKhëi ¤ng¹ã³¡   ×ø±ê: 191,241<enter> ĞÔÇé»ğ±¬¹¢Ö±£¬¼²¶ñÈç³ğ.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mshe()
	Say("ÕÆ³j³¤ÀÏÙÜÈıÕÉ   Î»ÖÃ£ºKhëi ¤ng¹ã³¡   ×ø±ê: 189,236<enter> Ê®·ÖËæºÍ¿ÉÇ×µÄÒ»¸öÀÏÍ·£¬¾­³£»áºÍÈË¿ªÍæĞ¦£¬ÊÇ°ïÖĞµÜ×Ó×îÏ²°®µÄÒ»¸ö³¤ÀÏ¡£",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mzhao()
	Say("TriÖu §µ chñ   VŞ trİ: D­¬ng Ch©u Tø Väng ®×nh B¾c   Täa ®é: 213,177<enter> D­¬ng Ch©u lµ ®µ chñ ph©n ®µ thø 3 ë D­¬ng Ch©u, tİnh t×nh cÈn thËn! Nghiªm minh chİnh trùc.",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Myuan()
	Say("ÃÏÔ¶²Å   Î»ÖÃ£ºKhëi ¤ngÇøÓòÍâ <enter> ÊÇÎŞ´üµÜ×Ó£¬ÊÇÖ´·¨³¤ÀÏÃÏ²ÔÀËµÄÖ¶×Ó¡£Ï²ºÃÃûÉù£¬±»¸÷Î»³¤ÀÏ½ÌÑµ¹ı¡£µ«ÊÇËûºÜ´ÏÃ÷£¬Ëµ»°ºÜÓĞÈ¤",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mzhang()
	Say("Tr­¬ng T¶n   VŞ trİ: Qu¶ng tr­êng   Täa ®é: 48,84   Phô tr¸ch: Giao dŞch binh khİ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mli()
	Say("Lı Tı   VŞ trİ: Qu¶ng tr­êng   Täa ®é: 51,85   Phô tr¸ch: Giao dŞch trang bŞ ",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function Mwang()
	Say("V­¬ng Ng«   VŞ trİ: Qu¶ng tr­êng   Täa ®é: 53,86   Phô tr¸ch: Giao dŞch D­îc phÈm",2,"T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

----------------- ÈÎÎñ½éÉÜ²¿·İ ----------------------------
function task_get()
	UTask_gb = GetTask(8)
	if (UTask_gb < 10*256) then	-- Î´ÈëÃÅ
		Say("ng­¬i hiÖn t¹i ch­a nhËp m«n, nÕu muèn nhËp m«n, chØ cÇn t×m ®­îc ®Ö tö tiÕp dÉn bæn m«n ë bÊt k× th«n míi nµo lµ ®­îc, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_enroll","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 10*256) and (UTask_gb < 20*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô mua r­îu, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L10","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 20*256) and (UTask_gb < 30*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L20","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 30*256) and (UTask_gb < 40*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô N¸o Quû Phong Ba, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L30","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 40*256) and (UTask_gb < 50*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô b¶o vÖ Tr­¬ng TuÊn, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L40","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 50*256) and (UTask_gb < 60*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô Trung Nguyªn §Şa H×nh §å, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L50","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 60*256) and (UTask_gb < 70*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô XuÊt s­, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_L60","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	elseif (UTask_gb >= 70*256) and (UTask_gb < 80*256) then
		Say("NhiÖm vô hiÖn giê cña ng­¬i lµ nhiÖm vô Trïng ph¶n s­ m«n, ®· ®­îc ghi nhí "..UTask_gb..".",4,"TiÕp tôc t×m hiÓu nhiÖm vô hiÖn t¹i/T_return","T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	else
		Say("B©y giê ng­¬i cã thÓ tù do hµnh tÈu giang hå, t¹m thêi ch­a cã nhiÖm vô míi, ®· ®­îc ghi nhí "..UTask_gb..".",3,"T×m hiÓu nh÷ng nhiÖm vô kh¸c/T_all","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
	end
end

function T_all()
	Say("Muèn t×m hiÓu nhiÖm vô g×?",10,"NhiÖm vô nhËp m«n/T_enroll","NhiÖm vô mua r­îu/T_L10","NhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi/T_L20","NhiÖm vô n¸o quû phong ba/T_L30","NhiÖm vô b¶o hé Tr­¬ng TuÊn/T_L40","NhiÖm vô Trung nguyªn ®Şa ®å/T_L50","NhiÖm vô xuÊt s­ /T_L60","NhiÖm vô trïng ph¶n s­ m«n/T_return","T×m hiÓu nh÷ng vÊn ®Ò kh¸c/main","Kh«ng hái n÷a!/nothing")
end

function T_enroll()
	Talk(1,"t_all","Muèn nhËp m«n häc nghÖ, chØ thuéc hÖ Háa, ch­a gia nhËp ph¸i kh¸c ®ång thêi ®¼ng cÊp trªn 10, ®Õn bÊt kú T©n Thñ Th«n nµo ®èi tho¹i víi §Ö tö bæn ph¸i.Tr­íc tiªn ph¶i hoµn thµnh nhiÖm vô nhËp m«n. Sau ®ã lÇn l­ît hoµn thµnh 5 NhiÖm vô cña m«n ph¸i. SÏ häc ®­îc vâ c«ng,®­îc phong Danh hiÖu.Sau khi hoµn thµnh NhiÖm vô xuÊt s­ sÏ thµnh nghÖ xuÊt s­!")
end

function T_L10()
	Talk(5,"t_all","ÈëÃÅ¼¶10¼¶ÒÔÉÏºó£¬Äã¿ÉÒÔ½ÓÈÎÎñÈ¥½»Ò×¾Æ£¬Í¨¹ıÍê³ÉÈÎÎñ£¬Äã½«ÉıÎªÖ´´üµÜ×Ó£¬Ñ§µ½Îä¹¦<color=blue> Khëi ¤ng°ô·¨, Khëi ¤ngÈ­·¨<color>. ","B­íc thø nhÊt: §Õn chç cña<color=blue> Bang chñ Hµ Nh©n Ng·<color> TiÕp nhËn nhiÖm vô. §i mua 5 lo¹i r­îu næi tiÕng: Trung TuyÒn < color=red>, Kim L¨ng Xu©n, B¸ch hoa n­¬ng, Kinh Hoa Lé, Song C©u §¹i Khóc. <color>. ","B­íc thø hai: GÆp<color=blue> D­¬ng Ch©u töu lÇu <color> mua ®­îc 4 lo¹i r­îu, <color> nh­ng <color=red>cßn Trung TuyÒn töu<color> th× ®· bŞ Tóy B¸n Tiªn< color>®Õn mua tr­íc råi ","B­íc thø ba: T×m<color=blue> ®­îc Tóy B¸n Tiªn <color>bªn c¹nh töu lÇu <color=blue>. §¸p øng ®­îc nh÷ng yªu cÇu cña h¾n, <color=blue>nhËn ®­îc Trung TuyÒn Töu ","µÚËÄ²½£º ·µ»Ø <color=blue> Khëi ¤ng <color>, ¼û<color=blue>ºÎÈËÎÒ color>½»ÎåÖÖ¾Æ<color=red>¸øËû <color>Íê³ÉÈÎÎñ")
end

function T_L20()
	Talk(4,"t_all","Sau khi hoµn thµnh nhiÖm vô Giao dŞch r­îu vµ ®¼ng cÊp cña ng­¬i ®· t¨ng lªn cÊp 20. ng­¬i ®· cã thÓ tiÕp TiÕp nhËn nhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi. §i ®Õn hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ ChÊp B¸t ®Ö tö ®­îc häc vâ c«ng<color=blue>Hãa KiÕm Vi Di<color>. ","µÚÒ»²½: µ½ <color=blue> ÊØÁÖ´å<color>ÕÒÒ»Î»<color=blue>Khëi ¤ngµÜ×Ó<color>, ½ÓÈÎÎñ½ÌÑµ<color=blue>ÃÏÔ¶²Å<color>. ","B­íc 2: T×m ®­îc M¹nh ViÔn Tµi, ®¸nh b¹i h¾n.","µÚÈı²½: ·µ»Øcolor=blue>Khëi ¤ng<color>, ¼û<color=blue>ÃÏ²ÔÀË<color>¸´Ãü, Íê³ÉÈÎÎñ ")
end

function T_L30()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô gi¸o huÊn M¹nh ViÔn Tµi vµ ®¼ng cÊp cña ng­¬i ®· t¨ng lªn 30, ng­¬i ®· cã thÓ tiÕp TiÕp nhËn nhiÖm vô N¸o Quû Phong Ba. §i ®Õn hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc th¨ng lµ ChÊp Bæng ®Ö tö. Häc ®­îc vâ c«ng<color=blue>Gi¸ng Long Ch­ëng; §¶ CÈu TrËn<color>. ","B­íc thø nhÊt: §Õn gÆp<color=blue>La Khu«ng Sinh<color>, tiÕp nhËn nhiÖm vô, thay ¤ng ta ®Õn<color=blue> D­¬ng Ch©u gÆp TriÖu §µ chñ <color>®Ó lÊy quyÓn s¸ch mµ <color=red> ¤ng ta ®ang viÕt dë<color>. ","B­íc thø hai: §Õn<color=blue>D­¬ng Ch©u Tø Väng §×nh<color>gÆp ®­îc<color=blue>TriÖu §µ chñ<color>, th× ra mÊy ngµy nay ®Ö tö cña TriÖu chñ ë<color=blue>Thôc c­¬ng s¬n <color>®· g©y nªn nh÷ng chuyÖn n¸o lo¹n, g©y ra lêi ®µm tiÕu ","µÚÈı²½: §iÈ¥<color=blue> Êñ¸ÚÉ½<color>, ´ò°Ü½ğÈËµÄ <color=blue> ·ü±ø<color>, ¾ÈÁËKhëi ¤ngµÜ×Ó<color=blue> <color>. ","B­íc thø t­: Trë vÒ<color=blue>gÆp<color>TriÖu ®µ chñ. ¤ng Êy ®· viÕt xong, <color=red>quyÓn s¸ch <color>, nhê ng­¬i ®em vÒ giao cho <color=blue>La Khu«ng Sinh<color>. ","µÚÎå²½: ·µ»Øcolor=blue>Khëi ¤ng<color>, ½»<color=red>Êé<color> ¸ø<color=blue>ÂŞ¿ïÉú<color>, Íê³ÉÈÎÎñ")
end

function T_L40()
	Talk(6,"t_all","Sau khi hoµn thµnh nhiÖm vô N¸o Quû phong ba vµ ®¼ng cÊp cña ng­¬i t¨ng lªn cÊp 40, th× ng­¬i ®· cã thÓ tiÕp nhËn nhiÖm vô b¶o hé Tr­¬ng TuÊn. Th«ng qua viÖc hoµn thµnh nhiÖm vô nµy, ng­¬i sÏ ®­îc th¨ng lµ Long §Çu ®Ö tö ®­îc häc vâ c«ng<color=blue>ho¹t BÊt L­u Thñ<color>. ","B­íc thø nhÊt: §i t×m TruyÒn c«ng tr­ëng l·o <color=blue>Ngôy Tñ c«ng<color>, TiÕp nhËn nhiÖm vô: Tiªu diÖt<color=blue>bän s¸t thñ<color>ng­êi Kim ®ang <color=blue>mai phôc ë La Tiªu s¬n <color>, b¶o vÖ <color=blue>Tr­¬ng TuÊn<color>an toµn ","B­íc thø hai: §Õn <color=blue> Long Quan ®éng ë La Tiªu s¬n <color> t×m thÊy vµ tiªu diÖt bän s¸t thñ Kim quèc<color=blue>®ang mai phôc ë ®ã<color>, ng­¬i nhÊt ®Şnh ph¶i lÊy ®­îc mét bøc <color=red>mËt hµm<color>. ","µÚÈı²½: ·µ»ØKhëi ¤ng<color=blue>¼û<color>Îº×ÓÎÌ, ½»<color=red> ÃÜº¯<color> ¸ø<color=blue>Îº×ÓÎÌ<color>, Ô­À´ÃÜº¯ÖĞ¼ÇÂ¼ÁË³¯Í¢ÖĞÓë½ğÈË¹´½áµÄ¹ÙÔ±Ãû×Ö£¬ÒªÇó°Ñ<color=red> ÃÜº¯<color>½»¸ø <color=blue>ÕÅ¿¡<color>. ","B­íc thø t­: §Õn <color=blue> mét l÷ qu¸n bİ mËt ë D­¬ng Ch©u<color>t×m Tr­¬ng TuÊn<color=blue> <color>, giao bøc mËt hµm cho ¤ng Êy. ","µÚÎå²½ : ·µ»Ø<color=blue> Khëi ¤ng<color>, ¼û<color=blue> ÎºÁËÎÌ<color> ±¨ĞÅ, Íê³ÉÈÎÎñ")
end

function T_L50()
	Talk(10,"t_all","Sau khi hoµn thµnh nhiÖm vô b¶o hé Tr­¬ng TuÊn vµ ®¼ng cÊp cña ng­¬i ®· t¨ng lªn cÊp 50, th× ng­¬i cã thÓ tiÕp nhËn nhiÖm vô B¶n ®å Trung Nguyªn. §i ®Õn hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµ §¹i Long §Çu. Häc ®­îc vâ c«ng<color=blue> Bæng §¶ ¸c CÈu; Kh¸ng Long H÷u bèi <color>. ","B­íc thø nhÊt: §Õn gÆp bang chñ<color=blue>Hµ Nh©n Ng·<color>®Ó tiÕp nhËn nhiÖm vô. giao<color=red>bøc b¶n ®å Trung Nguyªn<color>mang ®Õn<color=blue>L©m An<color> giao cho triÒu ®×nh ","B­íc thø hai: Tr­íc<color=blue>cöa Hoµng Cung<color>, bŞ vÖ binh ng¨n c¶n, kh«ng cã lÖnh bµi th«ng hµnh th× kh«ng thÓ vµo ®­îc Hoµng cung ","B­íc thø ba: T×m ®­îc <color=blue> Tr­¬ng TuÊn <color>, yªu cÇu cho m­în tÊm lÖnh bµi th«ng hµnh <color=red>®Ó vµo Hoµng Cung<color>. ","B­íc thø t­: Trë l¹i<color=blue>tr­íc cöa Hoµng Cung<color>, sau khi ®èi tho¹i víi vÖ binh, ®i vµo Hoµng Cung, gÆp l·o th¸i gi¸m<color=blue>Tµo c«ng c«ng<color>, giao <color=red>bøc b¶n ®å Trung Nguyªn <color> cho h¾n ","B­íc thø n¨m: Quay l¹i <color=blue> chç <color> Tr­¬ng TuÊn, ph¸t hiÖn ra l·o Tµo c«ng c«ng ®ã sím ®· c©u kÕt víi Kim quèc. Bøc b¶n ®å ®ã ®· bŞ g¹t lÊy mÊt råi ","B­íc thø s¸u: LÇn thø ba quay l¹i <color=blue> cæng Hoµng cung <color>, lÇn nµy Tµo c«ng c«ng sím ®· ®o¸n tr­íc, cã ®­îc lÖnh bµi th«ng hµnh vÉn kh«ng thÓ vµo ®­îc Hoµng Cung. ","B­íc thø b¶y: ng­¬i ph¶i hèi lé <color=blue> tªn tiÓu th¸i gi¸m ë cæng bªn <color>, ®i vµo Hoµng cung lÇn n÷a t¹i <color=blue> mét mËt ®¹o ë Ngù Hoa viªn <color> t×m gÆp ®­îc <color=blue>Tµo c«ng c«ng<color>. Sau khi ®¸nh b¹i bän vÖ sÜ, ®o¹t l¹i< color=red>B¶n ®å Trung Nguyªn<color>. ","B­íc thø t¸m: ng­¬i quay l¹i <color=blue> gÆp <color>Tr­¬ng TuÊn, ®­a<color=red>bøc B¶n ®å Trung Nguyªn <color>cho ¤ng ta. ","µÚ¾Å²½: ·µ»Øcolor=blue>Khëi ¤ng<color>, ¼û<color=blue>ºÎÈËÎÒcolor>±¨ĞÅ, Íê³ÉÈÎÎñ ")
end

function T_L60()
	Talk(4,"t_all","Hoµn thµnh nhiÖm vô Trung Nguyªn ®Şa ®å vµ ®¼ng cÊp trªn 50, ng­¬i cã thÓ tiÕp nhËn nhiÖm vô xuÊt s­. Th«ng qua hoµn thµnh nhiÖm vô nµy, ng­¬i ®­îc phong lµm Tiªu Dao ThÇn C¸i, thuËn lîi xuÊt s­.","B­íc thø nhÊt: §Õn gÆp Ch­ëng B¸t tr­ëng l·o <color=blue>X¸ tam Tr­îng<color>®Ó tiÕp nhËn nhiÖm vô, <color=blue>T­êng V©n ®éng<color>®Ó t×m<color=red>9 c¸i tói v¶i<color>. ","B­íc thø hai: Vµo<color=blue>T­êng V©n ®éng<color>t×m trong mét c¸i B¶o r­¬ng<color=blue>t×m ®­îc<color>, 9 c¸i<color=red>tói v¶i<color>. ","µÚÈı²½: ·µ»Ø<color=blue>Khëi ¤ng <color>, ½» <color=red> 9 ¸ö²¼´ü<color>¸øÕÆ²§³¤ÀÏ<color=blue>ÙÜÈıÕÂ, <color>, Íê³ÉÈÎÎñ")
end

function T_return()
	Talk(3,"t_all","Th«ng qua Trïng ph¶n s­ m«n, ng­¬i ®­îc th¨ng lµ tr­ëng l·o 9 tói. Häc ®­îc TuyÖt Häc chİnh ph¸i<color=blue>: Tiªu diªu c«ng vµ Tóy ®iÖp cuång vò<color>. ","µÚÒ»²½: ÔÚÄãµÈ¼¶³¬¹ı60¼¶ºó£¬È¥¼û°ïÖ÷<color=blue>ºÎÈËÎÒ<color>, ÉêÇë·µ»ØKhëi ¤ng ","µÚ¶ş²½: Í¨¹ı¾è<color=red>50000 Á½<color>, ·µ»ØKhëi ¤ng ")
end

----------------- ½áÊø ---------------------------
function nothing()
end
