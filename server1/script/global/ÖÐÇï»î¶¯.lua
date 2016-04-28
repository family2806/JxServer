-- Const List
aryAwardTime = { 1900, 2400, 928 }    	--Áì½±Ê±¼ä¶Î ( { ÆğÊ¼Ê±¼ä£¬ ½áÊøÊ±¼ä } Ê±¼ä¸ñÊ½ÎªHHMM )
aryAwardItem = {{ " hoa quÕ r­îu ",   {6,1,125,1,0,0,0} },	--½±Æ·Êı×é
  { " t¸m tr©n phóc th¸ng ®oµn viªn bİnh ", {6,1,126,1,0,0,0} }}
 
MingZi=50     	--µ¥×ÖºÏ³É¼¸ÂÊ
QiuZi=30
GeZi=30
YingZi=80
JuZi=10
WangZi=80
YuanZi=10

-- Talking String
STR_Do_Nothing  = " ta ch¼ng qua lµ tíi ®i d¹o mét chót /do_nothing"
STR_Next_Page  = " trang kÕ tiÕp "
STR_OK 	 	 = " ta biÕt , c¸m ¬n . "
STR_Main 	 = { " lÔ quan  ta lµ phô tr¸ch gëi lÔ vËt ®İch lÔ quan , mét n¨m trung ®İch träng ®¹i ngµy lÔ ta còng sÏ cã lÔ vËt gëi . ngoµi ra ta cßn phô tr¸ch ph¸i ph¸t tÆng vËt phÈm . ngµi b©y giê mÊu chèt lÊy lÔ vËt sao ? ",
    " hái th¨m trung thu tiÕt ®İch lai lŞch ",
     " hái th¨m mét chót trung thu ho¹t ®éng néi dung ",
     " trung thu ho¹t ®éng mét  tham gia ®o¸n ch÷ mª ho¹t ®éng ",
     " trung thu ho¹t ®éng hai  tham gia hîp thµnh mét ch÷ ®éc nhÊt ", --5
     " trung thu ho¹t ®éng ba  tham gia tËp th¬ tõ dÉn phÇn th­ëng ",
     " trung thu ho¹t ®éng bèn  nhËn lÊy ngµy lÔ tÆng phÈm ",
     " ta ch¼ng qua lµ tíi ®i d¹o mét chót ",
     " nhËn lÊy tÆng vËt phÈm ",
     " mua chu niªn kh¸nh ®¹i lÔ tói ph¶i may m¾n chiÕc nhÉn cïng m­êi toµn ®¹i bæ hoµn " } --10
STR_About_MA  = { " truyÒn thuyÕt , HËu NghÖ ®İch thª tö th­êng nga , bëi v× kh«ng chŞu ®­îc nh©n gian tŞch mŞch , ë th¸ng t¸m m­êi l¨m ngµy nµy , ¨n trém V­¬ng mÉu n­¬ng n­¬ng ®İch linh d­îc mµ phi th¨ng thµnh tiªn . tõ nay cïng ngäc thá lµm b¹n , hµng ®ªm chê ®îi th¸ng cung . HËu NghÖ hµng ®ªm ®èi víi v« İch tÕ th¸ng , lÊy t­ niÖm thª tö kú ph¸n ®oµn viªn , sau ®ã liÒn tõ tõ cã th¸ng t¸m m­êi l¨m ng¾m tr¨ng tÕ th¸ng ®İch phong tôc . ",
    " còng cã nãi , n«ng lŞch th¸ng t¸m m­êi l¨m ngµy nµy võa vÆn lµ ®¹o tö thµnh thôc thêi kh¾c , c¸c nhµ còng l¹y thæ ®Şa thÇn , trung thu lµ thu b¸o ®İch di tôc . mçi ®Õn ngµy nµy , gia gia hé hé còng sÏ ®oµn tô chung mét chç , th­ëng tr¨ng s¸ng  ¨n b¸nh Trung thu  ®o¸n ch÷ mª . tr¨ng s¸ng cao treo , hoa quÕ phiªu h­¬ng , trong ®ã còng kı th¸c rÊt nhiÒu kh¸ch c­ tha h­¬ng ®İch du tö th©m thiÕt ®İch t­ niÖm t×nh . ",
    " mçi ®Õn ngµy nµy , gia gia hé hé còng sÏ ®oµn tô chung mét chç , th­ëng tr¨ng s¸ng , ¨n b¸nh Trung thu , ®o¸n ch÷ mª . tr¨ng s¸ng cao treo , hoa quÕ phiªu h­¬ng , trong ®ã còng kı th¸c rÊt nhiÒu kh¸ch c­ tha h­¬ng ®İch du tö th©m thiÕt ®İch t­ niÖm t×nh . ",
    " ta ®· biÕt " }
STR_About_Rules  = { " ë n¬i nµy vui mõng ®İch trong cuéc sèng ,  vâng kiÕm  còng v× nhµ ch¬i cöa chuÈn bŞ rÊt cô d©n tôc phong t×nh ®İch ngµy lÔ ho¹t ®éng ——“<color=red> ®o¸n ch÷ mª <color><color=red> tËp th¬ tõ <color><color=red> phÈm b¸nh Trung thu <color><color=red> th­ëng tr¨ng s¸ng <color>” . ",
    " ®o¸n ch÷ mª ", 
    " tËp th¬ tõ ",
    " phÈm b¸nh Trung thu ", 
    " th­ëng tr¨ng s¸ng ",   --5
    " ta ®· hiÓu ",
    "    ½£ÍøºÍÍæ¼ÒÒ»ÆğÇì×£ÖĞ thu ¹úÇì£¬Óë¸÷³ÇÊĞµÄÀñ¹Ù¶Ô»°Ñ¡Ôñ²ÂÃÕÓÎÏ·£¬²¢Ã¿´Î½ÉÄÉ<color=red>Ò»Ç§Á½<color>£¬¾Í¿ÉÒÔ¿ªÊ¼²ÂÃÕÓÎÏ· . ÒªÇó<color=red>Á¬Ğø´ğ¶ÔÎåµÀÌâÄ¿<color>¾Í¿ÉÒÔËæ»ú»ñµÃÒ»¸ö<color=red>ÌØÊâµ¥×Ö<color>£¬Æä×÷ÓÃÊÇÓëÆÕÍ¨µ¥×ÖºÏ³É³ö<color=red>¸ßÒ»¼¶µÄÆÕÍ¨µ¥×Ö<color>£¬ÒÔ¼°ÔÚ²Î¼Ó tËp th¬ tõ »î¶¯ÖĞ»»È¡½±Æ· . ",
    "    ½£ÍøºÍÍæ¼ÒÒ»ÆğÇì×£ÖĞ thu ¹úÇì£¬ÔÚ»î¶¯ÆÚ¼ä£¬´ó¼Ò¿ÉÒÔÔÚÀñ¹Ù´¦ÓÃÒ»Ğ©µ¥×ÖÌîÊ«´ÊÒÔÁìÈ¡²»Í¬µÄ½±Æ·£¬ÓĞÈıÖÖÍ¾¾¶À´»ñµÃµ¥×Ö£º<color=red>´ò¹Ö<color>£¨<color=red>»ñµÃÆÕÍ¨µ¥×Ö<color>£©¡¢<color=red> ®o¸n ch÷ mª <color>£¨<color=red>»ñµÃÌØÊâµ¥×Ö<color>£©¡¢<color=red>ºÏ³Éµ¥×Ö<color>£¨<color=red>Éı¼¶ÆÕÍ¨µ¥×Ö<color>£©£¬ÁìÈ¡Ã¿ÖÖ½±Æ·¶¼ĞèÒªÆ¥ÅäÒ»¸öÆÕÍ¨×ÖÓëÒ»¸öÌØÊâ×Ö . ",
    "    ½£ÍøºÍÍæ¼ÒÒ»ÆğÇì×£ÖĞ thu ¹úÇì£¬ÔÚ<color=red>¾ÅÔÂ¶şÊ®°ËÈÕÖĞ thu <color>µ±ÌìµÄ <color=red>19:00~24:00<color> Ê±¶ÎÀï£¬·ûºÏÌõ¼şµÄÍæ¼Ò¶¼¿ÉÒÔµ½Àñ¹Ù´¦Ãâ·ÑÁìÈ¡Ò»´Î½ÚÈÕÔùÆ·£¨<color=red> t¸m tr©n phóc th¸ng ®oµn viªn bİnh <color>ºÍ<color=red> hoa quÕ r­îu <color>£©£¬ÑûÔ¼ÅóÓÑ phÈm b¸nh Trung thu  th­ëng tr¨ng s¸ng  . ",
    " vâng kiÕm cïng nhµ ch¬i cïng nhau ¨n mõng trung thu quèc kh¸nh , ®ang ho¹t ®éng trong lóc , <color=red> Hoa S¬n <color><color=red> nói Thanh Thµnh <color><color=red> Vò di s¬n <color> ba phong c¶nh khu nhµ ch¬i còng cã thÓ thÊy th¸ng c¶nh , cung mäi ng­êi ng¾m tr¨ng nãi chuyÖn phiÕm  chôp h×nh l­u niÖm . ",
    " hái th¨m nh÷ng kh¸c ho¹t ®éng nãi râ " }	--11
STR_Gift 	 = { " thËt xin lçi , ngµi cßn kh«ng cã sung t¹p . xin/mêi tr­íc sung t¹p . ",
    " thËt xin lçi , xin/mêi ë th¸ng chİn hai m­¬i t¸m ngµy trung thu tiÕt buæi tèi 19:00~24:00 ®o¹n thêi gian nµy tíi nhËn lÊy tÆng phÈm . ",
    " thËt xin lçi , ngµi ®İch cÊp bËc ch­a ®ñ n¨m m­¬i cÊp . ",
    " thËt xin lçi , ngµi ®· nhËn lÊy qu¸ tÆng th­ëng thøc . ",
    " ngµi thu ®­îc mét " }
STR_Guess 	 = { " thËt xin lçi ng­êi tuæi trÎ , ng©n l­îng cã ph¶i hay kh«ng quªn ë trong nhµ n÷a/råi ? ",
    " thËt xin lçi , ng©n l­îng ch­a ®ñ  cÇn ",
    " l­îng b¹c . ",
    " hai ngµy tr­íc nhµn rçi kh«ng chuyÖn g× , viÕt mÊy c©u ®Ìn mª , ng­êi tuæi trÎ cã muèn tíi hay kh«ng ®o¸n mét c¸i ? chØ cÇn <color=red> mét ngµn l­îng b¹c <color> , còng <color=red> liªn tôc ®¸p ®èi víi n¨m ®Ò <color> , ta liÒn cho ngµi mét <color=red> ®Æc thï mét ch÷ ®éc nhÊt <color> . ",
    " ta ®ang muèn thö mét chót ",   --5
    " ta muèn tham gia nh÷ng kh¸c ho¹t ®éng ",
    " ®¹o ®Ò môc . ",
    " còng chØ kĞm nh­ vËy mét chót n÷a/råi , ®õng n¶n chİ , ®ãn thªm n÷a lÖ ®i ",
    " ngµi lÊy ®­îc mét ch÷ ",
    " ®o¸n ch÷ mª ",   	--10
    " qu¶ nhiªn b·o häc th¬ s¸ch , l·o phu kİnh nÓ , n¬i nµy lµ høa hÑn ®İch phÇn th­ëng  ®­a ngµi mét <color=red> ®Æc thï mét ch÷ ®éc nhÊt <color> . ng­êi tuæi trÎ cßn ph¶i kh«ng nªn ®Ó cho l·o phu thi l¹i thi ngµi ? ",
    "     còng chØ kĞm nh­ vËy mét chót n÷a/råi , ®õng n¶n chİ , ®ãn thªm n÷a lÖ ®i »¹Òª²»ÒªÔÙÈÃÀÏ·ò¿¼¿¼Äú£¿" }
STR_Reward_Note  = { " ta chç nµy cã mét İt tµn ph¸ th¬ , nÕu nh­ ngµi trªn ng­êi võa lóc cã trong lóc <color=red> thiÕu sãt ®İch mét ch÷ ®éc nhÊt <color> , ta sÏ ®­a cho ngµi mét mãn lÔ phÈm . ",
    " qu¶ nhiªn lµ anh hïng xuÊt thiÕu niªn a ",
    " chóc mõng a  ngµi lÊy ®­îc ",
    " muèn dÉn phÇn th­ëng <color=red>",
    "<color> cÇn mæ ra “",
    "” c©u nµy th¬ , ngµi kh«ng cã cÇn thiÕt ®İch ch÷ ®©y ",
    " ta ch¼ng qua lµ tíi ®i d¹o mét chót ",
    " nãi cho mäi ng­êi mét tin tøc tèt , trong truyÒn thuyÕt ®İch cèng th¸ng phï dung ®· bŞ nhµ ch¬i nhËn lÊy , mäi ng­êi tiÕp tôc cè g¾ng a ",
    " nãi cho mäi ng­êi mét tin tøc tèt , trong truyÒn thuyÕt ®İch phông th¸ng qu¶ dong ®· bŞ nhµ ch¬i nhËn lÊy , mäi ng­êi tiÕp tôc cè g¾ng a ",
    " nãi cho mäi ng­êi mét tin tøc tèt , trong truyÒn thuyÕt ®İch ®Şnh quèc an bang hoµng kim trang bŞ ®· bŞ nhµ ch¬i nhËn lÊy , mäi ng­êi tiÕp tôc cè g¾ng a ",
    " cßn ph¶i ®æi lÊy nh÷ng kh¸c phÇn th­ëng ",
    " ta muèn tham gia nh÷ng kh¸c ho¹t ®éng " }
STR_Reward_Poem  = { " minh __ bao l©u cã , ®em __ hái thanh thiªn ",
    " trªn biÓn th¨ng __ th¸ng , thiªn nhai céng nµy __ ",
    "__ kh«ng minh th¸ng treo , quang __ lé dİnh ­ít ",
    " ta __ th¸ng båi håi , ta __ ¶nh thÊt thÇn ",
    " khëi vò biÕt râ __ , hµ tùa nh­ __ nh©n gian ",
    "__ chĞn yªu tr¨ng s¸ng , ®èi víi ¶nh thµnh ba __ ",
    " ngÈng ®Çu __ tr¨ng s¸ng , cói ®Çu __ cè h­¬ng ",
    " nh­ng __ ng­êi l©u dµi , ngµn dÆm céng thiÒn __ " }
STR_Reward_Reward	 = { "£¨ÑÌ»¨+2Á£PKÒ©Íè£©",
    " hÇu n¨m c¸t t­êng tói ",
    " tiªn th¶o lé ",
    "£¨ t¸m tr©n phóc th¸ng ®oµn viªn bİnh £©",
    "£¨ hoa quÕ r­îu £©",
    " cèng th¸ng phï dung ",
    " phông th¸ng qu¶ dong ",
    " ®Şnh quèc an bang hoµng kim trang bŞ mét mãn trong ®ã " }
STR_Reward_Func  = { "/yes1",
    "/yes2",
    "/yes3",
    "/yes4",
    "/yes5",
    "/yes6",
    "/yes7",
    "/yes8" }
STR_Combin_Note  = { " nÕu nh­ cã d­ thõa cÊp thÊp ch÷ , cã thÓ b¾t ®­îc ta chç nµy tíi , nÕu nh­ cho ta <color=red> mét tæ mét ch÷ ®éc nhÊt <color> cïng cÊp ®İch <color=red> mét ®Æc thï ch÷ cïng mét b×nh th­êng ch÷ <color> cïng <color=red> mét ngµn l­îng thñ tôc phİ <color> , ta sÏ nh­êng ngµi thö mét chót tõ n¬i nµy trong r­¬ng lÊy líp m­êi cÊp ®İch mét ch÷ ®éc nhÊt , nÕu nh­ thÊt b¹i ®em kh«ng lïi cßn ngµi bá ra ®İch ch÷  dÜ nhiªn , ®õng quªn mçi lÇn hîp thµnh <color=red> mét ngµn l­îng thñ tôc phİ <color> . ",
    " hîp thµnh ch÷ cÇn <color=red> mét ngµn l­îng thñ tôc phİ <color=red> , tiÒn cña ngµi gièng nh­ kh«ng ®ñ , cßn lµ lÇn sau trë l¹i ®i . ",
    " xin chê chèc l¸t . ",
    " ngµi lÊy ®­îc mét ch÷ ®éc nhÊt ",
    " thÊt b¹i , <color=red>",
    "<color> ch÷ còng kh«ng ph¶i tèt nh­ vËy hîp thµnh ®Õn ®İch , lÇn sau trë l¹i thö mét chót tay khİ ®i . ",
    " muèn hîp thµnh “<color=red>",
    "<color>” ch÷ cÇn <color=red>",
    "<color> , ngµi kh«ng cã cÇn thiÕt ®İch ch÷ ®©y  cã ph¶i hay kh«ng quªn mang theo ? mau ®i trë vÒ t×m mét chót trë l¹i ®i . ",
    " ta ch¼ng qua lµ tíi ®i d¹o mét chót /do_nothing", --10
    " cßn ph¶i hîp thµnh nh÷ng kh¸c mét ch÷ ®éc nhÊt ",
    " ta muèn tham gia nh÷ng kh¸c ho¹t ®éng " }
STR_Combin_Word  = { " minh ",
    " thu ",
    " ca ",
    " ¶nh ",
    " gi¬ ",
    " ng¾m ",
    " nguyÖn " }
STR_Combin_Request	 = { "£¨ÔÂ+¾Æ£©",
    "£¨ minh +Ê±£©",
    "£¨ thu +²Ê£©",
    "£¨ ca +Îè£©",
    "£¨ ¶nh +ÔÚ£©",
    "£¨ gi¬ +ÈË£©",
    "£¨ ng¾m +Ë¼£©" }
STR_Combin_Func  = { "/Combin1",
    "/Combin2",
    "/Combin3",
    "/Combin4",
    "/Combin5",
    "/Combin6",
    "/Combin7" }   
   
  
-- Start of Proc
--function main()
--	Say(STR_Main[1], 9, 
-- STR_Main[2].."/about_mid_autumn",
-- STR_Main[3].."/about_game_rules",
-- STR_Main[4].."/guess_at_riddle",
-- STR_Main[5].."/Combination",
-- STR_Main[6].."/GetReward",
-- STR_Main[7].."/take_gift",
-- STR_Main[9].."/onGift",
-- STR_Main[10].."/lg_onRingGift",
-- STR_Main[8].."/do_nothing" )
--end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ Ö÷²Ëµ¥ ----------------------------------------------
-- ------------------------------------------------------------------------------------------------
function on_mid_autumn()
	Say( 
 STR_Main[1],
 5,
-- STR_Main[2].."/about_mid_autumn",
 STR_Main[3].."/about_game_rules",
 STR_Main[4].."/guess_at_riddle",
 STR_Main[5].."/Combination",
 STR_Main[6].."/GetReward",
-- STR_Main[7].."/take_gift",
 STR_Main[8].."/do_nothing"
 );
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ¹ØÓÚÖĞ thu  --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_mid_autumn()
	Say(STR_About_MA[1], 1,
 STR_Next_Page.."/about_mid_autumn_b" )
end
function about_mid_autumn_b()
	Say(STR_About_MA[2], 1,
 STR_About_MA[4].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ÓÎÏ·Ëµ minh  --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function about_game_rules()
	Say(STR_About_Rules[1], 5,
 STR_About_Rules[2].."/rule_a",
 STR_About_Rules[3].."/rule_b",
 STR_About_Rules[4].."/rule_c",
 STR_About_Rules[5].."/rule_d",
 STR_About_Rules[6].."/main" )
end

function rule_a()
	Say(STR_About_Rules[7], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_b()
	Say(STR_About_Rules[8], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_c()
	Say(STR_About_Rules[9], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

function rule_d()
	Say(STR_About_Rules[10], 1,
 STR_About_Rules[11].."/about_game_rules" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ÁìÈ¡ÔùÆ· --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function take_gift()  	--ÖĞ thu ËÍÀñ( -1:Î´³ä¿¨  -2:µ±Ç°²»ÊÇÁì½±Ê±¼ä  -3£ºµÈ¼¶²»×ã50  -4:ÒÑÁì¹ı½± )
	local nCurrTime = tonumber(date("%H%M"))
	local nCurrData = tonumber(date("%m%d"))

	if( IsCharged() ~= 1 ) then   --ÊÇ·ñ³ä¹ı¿¨
 Say(STR_Gift[1], 1,
 	STR_OK.."/main" )
 return -1
	end
	if not ((nCurrTime >= aryAwardTime[1]) and (nCurrTime <= aryAwardTime[2]) and (nCurrData == aryAwardTime[3])) then  	--ÊÇ·ñÊÇÁì½±Ê±¼ä
 Say(STR_Gift[2], 1,
 	STR_OK.."/main" )
 return -2
	end	
	if (GetLevel() < 50) then   --µÈ¼¶ÊÇ·ñ´óÓÚ50
 Say(STR_Gift[3], 1,
 	STR_OK.."/main" )
 return -3
	end
	
	if (GetTask(702) == 5) then   --ÊÇ·ñÒÑÁì¹ı½±
 Say(STR_Gift[4], 1,
 	STR_OK.."/main" )
 return -4
	else
        AddItem( aryAwardItem[1][2][1], aryAwardItem[1][2][2], aryAwardItem[1][2][3], aryAwardItem[1][2][4], aryAwardItem[1][2][5], aryAwardItem[1][2][6] , aryAwardItem[1][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[1][1] )
        AddItem( aryAwardItem[2][2][1], aryAwardItem[2][2][2], aryAwardItem[2][2][3], aryAwardItem[2][2][4], aryAwardItem[2][2][5], aryAwardItem[2][2][6] , aryAwardItem[2][2][7])
        Msg2Player( STR_Gift[5]..aryAwardItem[2][1] )
 SetTask(702, 5)
	end	
	
end

function IsCharged()  	--ÅĞ¶ÏÍæ¼ÒÊÇ·ñ³ä¹ı¿¨
	if( GetExtPoint( 0 ) >= 1 ) then
 return 1
	else
 return 0
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ²ÂÖi²¿·Ö --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function guess_at_riddle()
	local mpay  = 1000 --ĞèÒªÖ§¸¶µÄ½ğåX”µÁ¿

	Say(STR_Guess[4], 2,
 STR_Guess[5].."/get_question",
 STR_Guess[6].."/main" )	
end
function get_question()
	local mpay  = 1000 --ĞèÒªÖ§¸¶µÄ½ğåX”µÁ¿
	
	if ( GetCash() >= mpay ) then
 SetTaskTemp(250, 0) --ÉèÖÃµ±Ç°ÌâÄ¿ÎªµÚ 0 Ìâ
 SetTaskTemp(251, 0) --ÉèÖÃµ±Ç°´ğ°¸ÎªµÚ 0
 Pay(mpay)
 gquestion()
	else
 Say(STR_Guess[1], 1,
 	STR_OK.."/main" )
 Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	end
end


-- ÏÂÃæÊÇÎå¸öÌâÄ¿
function gquestion()
	local qid_min  = 2001   --Ìâ¿âÆğÊ¼ID
	local qid_max  = 2220   --Ìâ¿â½áÊøID
	local qid 	 = random(qid_min, qid_max)	--È·¶¨Ò»¸öÌâÄ¿ID	
	local question  = GetQuestion(qid) 	--È¡ÎÊÌâ
	local qchoose  = {GetChoose(qid , 1), --È¡¿ÉÑ¡´ğ°¸ A
   	GetChoose(qid , 2), --È¡¿ÉÑ¡´ğ°¸ B
   	GetChoose(qid , 3), --È¡¿ÉÑ¡´ğ°¸ C
   	GetChoose(qid , 4)} --È¡¿ÉÑ¡´ğ°¸ D
	local qrextemp  = 0   --½»»»ÓÃÁÙÊ±±äÁ¿ÏÂ±ê
	local qchoosetemp	 = "_"   --½»»»ÓÃÁÙÊ±±äÁ¿
	local qanswer  = GetQAnswer(qid) 	--È¡´ğ°¸(´ğ°¸±àºÅ)
    local gttc 	 = GetTaskTemp(250) + 1
    local inttemp  = {1,2,3,4}
	SetTaskTemp(250, gttc)   	--ÕıÔÚ½øĞĞµÄÌâÄ¿ÂÖ´Î
	SetTaskTemp(251, 0)

	qrextemp = random(1, 3)
	qchoosetemp = qchoose[4]
	qchoose[4] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 4
	elseif (qanswer == 4) then
 qanswer = qrextemp
	end
	
	qrextemp = random(1, 2)
	qchoosetemp = qchoose[3]
	qchoose[3] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 3
	elseif (qanswer == 3) then
 qanswer = qrextemp
	end
	
	qrextemp = 1
	qchoosetemp = qchoose[2]
	qchoose[2] = qchoose[qrextemp]
	qchoose[qrextemp] = qchoosetemp
	if (qrextemp == qanswer) then
 qanswer = 2
	elseif (qanswer == 2) then
 qanswer = qrextemp
	end

	SetTaskTemp(251, qanswer)   --Ó›ä›®”Ç°†–î}´ğ°¸
	Say(question, 4, 
 qchoose[1].."/answerproc_a",
 qchoose[2].."/answerproc_b",
 qchoose[3].."/answerproc_c",
 qchoose[4].."/answerproc_d" )
end
	
function answerproc_a()  	--Ñ¡Ôñ´ğ°¸ A
	if (GetTaskTemp(251) == 1) then --ÊÇ·ñÊÇÕıÈ·´ğ°¸
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_b()  	--Ñ¡Ôñ´ğ°¸ B
	if (GetTaskTemp(251) == 2) then --ÊÇ·ñÊÇÕıÈ·´ğ°¸
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_c()  	--Ñ¡Ôñ´ğ°¸ C
	if (GetTaskTemp(251) == 3) then --ÊÇ·ñÊÇÕıÈ·´ğ°¸
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	
function answerproc_d()  	--Ñ¡Ôñ´ğ°¸ D
	if (GetTaskTemp(251) == 4) then --ÊÇ·ñÊÇÕıÈ·´ğ°¸
 if (GetTaskTemp(250) >= 5) then
 	add_random_special_word()
 else
 	gquestion()
 end
	else
 Msg2Player(STR_Guess[8])
 --guess_at_riddle()
 Say(STR_Guess[12], 2,
 	STR_Guess[5].."/get_question",
 	STR_Guess[6].."/main" )
	end
end	

function qfail()  --»Ø´ğ³ö´í
end
-- ÌâÄ¿½áÊø

function add_random_special_word()
	local qitem  	 = {426,427,428,429,430,431,432,433}  --Ó›ä›ÓĞ¿ÉÄÜµÄª„„îµÀ¾ß(×ÂÊÆ¥Åä)
	local qitem_rate	 = {763,863,913,963,983,993,998,1000}  --Ó›ä›ÓĞ¿ÉÄÜµÄª„„îµÀ¾ß³ö¬F™CÂÊ
   --  763 100  50  50  20  10   5    2
	local accuracy  = 1000   --ëS™C”µ¾«¶È
	local drop_rate  = random(1, accuracy) --´_¶¨ª„Æ·îĞÍµÄÒ»‚€ëS™C”µ
 
	if ( drop_rate <= qitem_rate[1] ) then
 AddItem(4,qitem[1],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[2] ) then
 AddItem(4,qitem[2],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[3] ) then
 AddItem(4,qitem[3],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[4] ) then
 AddItem(4,qitem[4],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[5] ) then
 AddItem(4,qitem[5],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[6] ) then
 AddItem(4,qitem[6],1,1,0,0,0)
	elseif ( drop_rate <=  qitem_rate[7] ) then
 AddItem(4,qitem[7],1,1,0,0,0)
	elseif ( drop_rate <= accuracy ) then
 AddItem(4,qitem[8],1,1,0,0,0)
	end
	Msg2Player(STR_Guess[9])
--	guess_at_riddle()
	Say(STR_Guess[11], 2,
 STR_Guess[5].."/get_question",
 STR_Guess[6].."/main" )
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ÌîÊ«Áì½±Æ·²¿·Ö --------------------------------------
-- ------------------------------------------------------------------------------------------------
function GetReward()
	Say(STR_Reward_Note[1],9,
 STR_Reward_Poem[1]..STR_Reward_Reward[1]..STR_Reward_Func[1],
 STR_Reward_Poem[2]..STR_Reward_Reward[2]..STR_Reward_Func[2],
 STR_Reward_Poem[3]..STR_Reward_Reward[3]..STR_Reward_Func[3],
 STR_Reward_Poem[4]..STR_Reward_Reward[4]..STR_Reward_Func[4],
 STR_Reward_Poem[5]..STR_Reward_Reward[5]..STR_Reward_Func[5],
 STR_Reward_Poem[6]..STR_Reward_Reward[6]..STR_Reward_Func[6],
 STR_Reward_Poem[7]..STR_Reward_Reward[7]..STR_Reward_Func[7],
 STR_Reward_Poem[8]..STR_Reward_Reward[8]..STR_Reward_Func[8],
 STR_Reward_Note[7].."/main")
end

function yes1()                                                                 -- ÑÌ»¨Óë2Á£PkÒ©Íè
	if ((GetItemCountEx(418)>=1) and (GetItemCountEx(426))>=1) then
	  	DelItemEx(418)
	  	DelItemEx(426)
	  	for i=1,2 do 
	    	local x=random(1,10)
	    	AddItem(6,0,x,1,0,0,0)
	  	end
	  	AddItem(6,0,11,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[1].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[1]..STR_Reward_Note[5]..STR_Reward_Poem[1]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes2()                                                                 -- ºïÄê¼ªÏé°ü
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
	  	DelItemEx(419)
	  	DelItemEx(427)
	  	AddItem(6,1,19,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[2].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[2]..STR_Reward_Note[5]..STR_Reward_Poem[2]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes3()                                                                 -- ÏÉ²İÂ¶
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
	  	DelItemEx(420)
	  	DelItemEx(428)
	  	AddItem(6,1,71,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[3].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[3]..STR_Reward_Note[5]..STR_Reward_Poem[3]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes4()                                                                 --  t¸m tr©n phóc th¸ng ®oµn viªn bİnh 
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
	  	DelItemEx(421)
	  	DelItemEx(429)
	  	AddItem(6,1,126,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[4].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[4]..STR_Reward_Note[5]..STR_Reward_Poem[4]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes5()                                                                 --  hoa quÕ r­îu 
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	DelItemEx(422)
	  	DelItemEx(430)
	  	AddItem(6,1,125,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[5].." . ")
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[5]..STR_Reward_Note[5]..STR_Reward_Poem[5]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes6()                                                                 -- ¹±ÔÂÜ½ÈØ
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	DelItemEx(423)
	  	DelItemEx(431)
	  	AddItem(6,1,128,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[6].." . ")
	  	local n=GetGlbValue(12)+1
	  	SetGlbValue(12,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[6]);
	  	AddGlobalNews(STR_Reward_Note[8])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[6]..STR_Reward_Note[5]..STR_Reward_Poem[6]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes7()                                                                 -- ·îÔÂ¹ûÈØ
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
	  	DelItemEx(424)
	  	DelItemEx(432)
	  	AddItem(6,1,127,1,0,0,0)
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[7].." . ")
	  	local n=GetGlbValue(11)+1
	  	SetGlbValue(11,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[7]);
	  	AddGlobalNews(STR_Reward_Note[9])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[7]..STR_Reward_Note[5]..STR_Reward_Poem[7]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

function yes8()                                                                 -- ¶¨¹ú°²°î»Æ½ğ×°±¸
	if ((GetItemCountEx(425)>=1) and GetItemCountEx(433)>=1) then
	  	DelItemEx(425)
	  	DelItemEx(433)
	  	local x=random(159,167)
	  	AddGoldItem(0,x)
	  	local n=GetGlbValue(10)+1
	  	SetGlbValue(10,n)
 	WriteLog(date("%H%M%S").." ACC- "..GetAccount().. ", CHAR- "..GetName().." "..STR_Reward_Reward[8]);
	  	Msg2Player(STR_Reward_Note[3]..STR_Reward_Reward[8].." . ")
	  	AddGlobalNews(STR_Reward_Note[10])
	  	GetReward()
	else
 Say(STR_Reward_Note[4]..STR_Reward_Reward[8]..STR_Reward_Note[5]..STR_Reward_Poem[8]..STR_Reward_Note[6], 2,
 	STR_Reward_Note[11].."/GetReward",
 	STR_Reward_Note[12].."/main" )
	end
end

-- ------------------------------------------------------------------------------------------------
-- ------------------------------------------ ºÏ³É²¿·Ö --------------------------------------------
-- ------------------------------------------------------------------------------------------------
function Combination()
	local mpay  = 1000 --ĞèÒªÖ§¸¶µÄ½ğåX”µÁ¿
	
	if ( GetCash() < mpay ) then
 Say(STR_Combin_Note[2], 1,
 	STR_OK.."/main" )
 Msg2Player(STR_Guess[2]..mpay..STR_Guess[3])
	else
 Say(STR_Combin_Note[1], 2,
 	STR_Guess[5].."/Combination_List",
 	STR_Guess[6].."/main" )
	end
end
function Combination_List()
	local i=GetCash()
	if (i>=1000) then
 Say(STR_Combin_Note[1],8,
 	STR_Combin_Word[1]..STR_Combin_Request[1]..STR_Combin_Func[1],
 	STR_Combin_Word[2]..STR_Combin_Request[2]..STR_Combin_Func[2],
 	STR_Combin_Word[3]..STR_Combin_Request[3]..STR_Combin_Func[3],
 	STR_Combin_Word[4]..STR_Combin_Request[4]..STR_Combin_Func[4],
 	STR_Combin_Word[5]..STR_Combin_Request[5]..STR_Combin_Func[5],
 	STR_Combin_Word[6]..STR_Combin_Request[6]..STR_Combin_Func[6],
 	STR_Combin_Word[7]..STR_Combin_Request[7]..STR_Combin_Func[7],
 	STR_Combin_Note[10] )
	end
end

function Combin1()                                                                 --  minh 
	if ((GetItemCountEx(418)>=1) and GetItemCountEx(426)>=1) then
	  	if (Pay(1000) > 0 ) then 
	   DelItemEx(418)
	   DelItemEx(426)
	   local x=random(1,100) 
	   if (x<=MingZi) then
            	AddItem(4,419,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[1])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[1]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[1]..STR_Combin_Note[8]..STR_Combin_Request[1]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin2()                                                                 --  thu 
	if ((GetItemCountEx(419)>=1) and GetItemCountEx(427)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(419)
	   DelItemEx(427)
	   local x=random(1,100) 
	   if (x<=QiuZi) then
            	AddItem(4,420,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[2])
	  else
  Say(STR_Combin_Note[5]..STR_Combin_Word[2]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[2]..STR_Combin_Note[8]..STR_Combin_Request[2]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin3()                                                                 --  ca 
	if ((GetItemCountEx(420)>=1) and GetItemCountEx(428)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(420)
	   DelItemEx(428)
	   local x=random(1,100) 
	   if (x<=GeZi) then
            	AddItem(4,421,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[3])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[3]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[3]..STR_Combin_Note[8]..STR_Combin_Request[3]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin4()                                                                 --  ¶nh 
	if ((GetItemCountEx(421)>=1) and GetItemCountEx(429)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(421)
	   DelItemEx(429)
	   local x=random(1,100) 
	   if (x<=YingZi) then
            	AddItem(4,422,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[4])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[4]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[4]..STR_Combin_Note[8]..STR_Combin_Request[4]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin5()                                                                 --  gi¬ 
	if ((GetItemCountEx(422)>=1) and GetItemCountEx(430)>=1) then
	  	if (Pay(1000) > 0 ) then 
	   DelItemEx(422)
	   DelItemEx(430)
	   local x=random(1,100) 
	   if (x<=JuZi) then
            	AddItem(4,423,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[5])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[5]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
	  	end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[5]..STR_Combin_Note[8]..STR_Combin_Request[5]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin6()                                                                 --  ng¾m 
	if ((GetItemCountEx(423)>=1) and GetItemCountEx(431)>=1) then
	  	if (Pay(1000) > 0 ) then 
	    	DelItemEx(423)
	    	DelItemEx(431)
	   local x=random(1,100) 
	   if (x<=WangZi) then
            	AddItem(4,424,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[6])
 	else
  Say(STR_Combin_Note[5]..STR_Combin_Word[6]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
 	end
 end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[6]..STR_Combin_Note[8]..STR_Combin_Request[6]..STR_Combin_Note[9], 2,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function Combin7()                                                                 --  nguyÖn 
	if ((GetItemCountEx(424)>=1) and GetItemCountEx(432)>=1) then
 if (Pay(1000) > 0 ) then 
	   DelItemEx(424)
	   DelItemEx(432)
	   local x=random(1,100) 
	   if (x<=YuanZi) then
            	AddItem(4,425,1,1,0,0,0)
	     Msg2Player(STR_Combin_Note[4]..STR_Combin_Word[7])
	   else
  Say(STR_Combin_Note[5]..STR_Combin_Word[7]..STR_Combin_Note[6], 1,
  	STR_OK.."/Combination" )
	   end
 end
	else
 Say(STR_Combin_Note[7]..STR_Combin_Word[7]..STR_Combin_Note[8]..STR_Combin_Request[7]..STR_Combin_Note[9], 1,
 	STR_Combin_Note[11].."/Combination",
 	STR_Combin_Note[12].."/main" )
	end
end

function do_nothing()
end