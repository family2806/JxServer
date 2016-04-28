-- ÐÒÔË²ÊÆ±
-- Fanghao Wu
-- 2004.11.13

LOTTERY_GOLD_TYPENAME = "lottery_gold";	-- ²ÊÆ±Ãû£¬¶ÔÓ¦\settings\lotterys.txtµÄLOTTERY_NAME
EXTPOINT_LOTTERY_GOLD = 3;				-- ÁìÈ¡²ÊÆ±ÅÐ¶ÏµÄÀ©Õ¹µãµÄ±àºÅ
MONTH_CARD_EXTPOINT_COST = 2;			-- ³äÒ»ÕÅÔÂ¿¨µÈ¼ÛµÄÀ©Õ¹µãÊý
WEEK_CARD_EXTPOINT_COST = 1;			-- ³äÒ»ÕÅÖÜ¿¨µÈ¼ÛµÄÀ©Õ¹µãÊý
MONTH_CARD_LOTTERY_ID_COUNT = 10;		-- ÔÂ¿¨»»È¡µÄ²ÊÆ±°üº¬µÄºÅÂëÊý
WEEK_CARD_LOTTERY_ID_COUNT = 5;			-- ÖÜ¿¨»»È¡µÄ²ÊÆ±°üº¬µÄºÅÂëÊý


--	½±Æ·ÉèÖÃ¸ñÊ½Îª£º	 {
--						" phÇn th­ëng miªu t¶ ",
--						{
--							{ ºòÑ¡½±Æ·1Ãû³Æ, { ºòÑ¡½±Æ·1²ÎÊý }, ºòÑ¡½±Æ·1¸öÊý, ºòÑ¡½±Æ·1³éÖÐ¸ÅÊý },
--							...
--						}
--					 }
--	Thø 1ÆÚ £¨2004.11.22 - 2004.11.28£©--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							" an bang chi b¨ng tinh th¹ch gi©y chuyÒn 1 con ",
--							{ { " an bang chi b¨ng tinh th¹ch gi©y chuyÒn ", { 4, 2549, 0, 164 }, 1, 1 }, }
--						};
--	SECOND_PRIZE_AWARD = {
--							" vâ l©m bÝ tÞch 1 vèn ",
--							{ { " vâ l©m bÝ tÞch ", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							" tiªn th¶o lé 10 c¸ ",
--							{ { " tiªn th¶o lé ", { 6, 1, 71, 1, 0, 0, 0 }, 10, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							" tiªn th¶o lé 2 c¸ ",
--							{ { " tiªn th¶o lé ", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 }, }
--						 };
--	Thø 2ÆÚ £¨2004.11.28 - 2004.12.05£©--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							" ®Þnh n­íc hÖ liÖt hoµng kim trang bÞ ngÉu nhiªn 1 mãn ",
--							{
--								{ " ®Þnh quèc chi lôa máng xanh tr­êng sam ", { 0, 159 }, 1, 1 },
--								{ " ®Þnh quèc chi « sa ph¸t quan ", { 0, 160 }, 1, 1 },
--								{ " ®Þnh quèc chi xÝch quyªn mÒm ngoa ", { 0, 161 }, 1, 1 },
--								{ " ®Þnh quèc chi tö ®»ng hé cæ tay ", { 0, 162 }, 1, 1 },
--								{ " ®Þnh quèc chi ng©n tµm ®ai l­ng ", { 0, 163 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							" vâ l©m bÝ tÞch 1 vèn ",
--							{
--								{ " vâ l©m bÝ tÞch ", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--							}
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							" thñy tinh hoÆc ®á th¾m b¶o th¹ch 1 c¸ ",
--							{
--								{ " lan thñy tinh ", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " tö thñy tinh ", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " n­íc biÕc tinh ", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " ®á th¾m b¶o th¹ch ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							" tiªn th¶o lé 2 c¸ ",
--							{
--								{ " tiªn th¶o lé ", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };
--	Thø 3ÆÚ £¨2004.12.05 - 2004.12.12£©--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							" kÕ nghiÖp chi sÊm ®¸nh chui long sóng 1 ®em ",
--							{
--								{ " kÕ nghiÖp chi sÊm ®¸nh chui long sóng ", { 0, 21 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							" ®Þnh quèc an bang hoµng kim trang bÞ 1 mãn ",
--							{
--								{ " ®Þnh quèc chi lôa máng xanh tr­êng sam ", { 0, 159 }, 1, 10 },
--								{ " ®Þnh quèc chi « sa ph¸t quan ", { 0, 160 }, 1, 8 },
--								{ " ®Þnh quèc chi xÝch quyªn mÒm ngoa ", { 0, 161 }, 1, 14 },
--								{ " ®Þnh quèc chi tö ®»ng hé cæ tay ", { 0, 162 }, 1, 12 },
--								{ " ®Þnh quèc chi ng©n tµm ®ai l­ng ", { 0, 163 }, 1, 14 },
--								{ " an bang chi b¨ng tinh th¹ch gi©y chuyÒn ", { 0, 164 }, 1, 8 },
--								{ " an bang chi hoa cóc th¹ch chiÕc nhÉn ", { 0, 165 }, 1, 12 },
--								{ " an bang chi ®iÒn hoµng th¹ch ngäc béi ", { 0, 166 }, 1, 12 },
--								{ " an bang chi m¸u gµ th¹ch chiÕc nhÉn ", { 0, 167 }, 1, 10 },
--							}
--					 };
--	OTHER_PRIZE_AWARD1 = {
--							" thñy tinh hoÆc ®á th¾m b¶o th¹ch 1 c¸ ",
--							{
--								{ " lan thñy tinh ", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " tö thñy tinh ", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ " n­íc biÕc tinh ", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ " ®á th¾m b¶o th¹ch ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--								" tiªn th¶o lé 2 c¸ ",
--							{
--								{ " tiªn th¶o lé ", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };


--	Thø 5ÆÚ £¨2004.12.27 - 2005.01.02£©--------------------------------------------------------
--FIRST_PRIZE_AWARD = {
--						" c¸c m«n ph¸i ®¹i hoµng kim trang bÞ ngÉu nhiªn mét mãn ",
--						{
--							{ " ma hoµng chi theo nh­ ra hæ h¹ng vßng ", { 0, 107 }, 1, 1 },
--							{ " cïng phong chi ba thanh phï ", { 0, 122 }, 1, 1 },
--							{ " v« yÓm chi t¾m gièng ngäc trõ ", { 0, 39 }, 1, 1 },
--							{ " ®éng s¸t chi b¹ch ngäc cµn kh«n béi ", { 0, 144 }, 1, 1 },
--							{ " cïng thï chi hµng long c¸i y ", { 0, 92 }, 1, 1 },
--							{ " u l«ng chi mùc chu mÒm lý ", { 0, 60 }, 1, 1 },
--						}
--					};
--SECOND_PRIZE_AWARD = {
--						" vâ l©m bÝ tÞch 1 vèn ",
--						{
--							{ " vâ l©m bÝ tÞch ", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--						}
--					 };
--OTHER_PRIZE_AWARD1 = {
--						" thñy tinh hoÆc ®á th¾m b¶o th¹ch 1 c¸ ",
--						{
--							{ " lan thñy tinh ", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ " tö thñy tinh ", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ " n­íc biÕc tinh ", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ " ®á th¾m b¶o th¹ch ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--						}			
--					 };
--OTHER_PRIZE_AWARD2 = {
--						" tiªn th¶o lé 3 c¸ ",
--						{
--							{ " tiªn th¶o lé ", { 6, 1, 71, 1, 0, 0, 0 }, 3, 1 },
--						}
--					 };
					 

--Thø 6ÆÚ(2005.01.02 - 2005.01.09)
FIRST_PRIZE_AWARD = {
						" an bang chi b¨ng tinh th¹ch gi©y chuyÒn 1 con ",
						{ 
							{ " an bang chi b¨ng tinh th¹ch gi©y chuyÒn ", { 0, 164 }, 1, 1 }, 
						}
					};
SECOND_PRIZE_AWARD = {
						" TÈy Tñy Kinh 1 vèn ",
						{
							{ " TÈy Tñy Kinh ", { 6, 1, 22, 1, 0, 0, 0 }, 1, 1 },
						}
					 };
OTHER_PRIZE_AWARD1 = {
						" râ rµng c©u hoµn 3 c¸ ",
						{
							{ " râ rµng c©u hoµn ", { 6, 1, 130, 1, 0, 0, 0 }, 3, 1 },
						}			
					 };
OTHER_PRIZE_AWARD2 = {
						" râ rµng c©u hoµn 1 c¸ ",
						{
							{ " râ rµng c©u hoµn ", { 6, 1, 130, 1, 0, 0, 0 }, 1, 1 },
						}
					 };

-- ÐÒÔË²ÊÆ±²Ëµ¥Ïî
function onLotteryGold()
	Say( " lÔ quan  ngµi kháe , v× håi b¸o ngµi ®èi víi chóng ta lùc m¹nh ñng hé , vâng kiÕm tù 2004 n¨m 11 th¸ng 22 ngµy khëi ®Èy ra may m¾n vÐ sè ho¹t ®éng . th«ng qua mçi chñ nhËt ®Ých khai t­ëng , ngµi ®em ®¹t ®­îc chóng ta ®­a ra ®Ých c¸c lo¹i phong phó phÇn th­ëng . nÕu nh­ ngµi kh«ng hÒ râ rµng ®Þa ph­¬ng , cã thÓ tè duyÖt vèn thùc ®¬n trung liªn quan tíi may m¾n vÐ sè ®Ých gi¶i thÝch cÆn kÏ . ", 5, "NhËn lÊy may m¾n vÐ sè /onLotteryGold_Gain", "May m¾n vÐ sè ®æi t­ëng /onLotteryGold_Prize", "TuÇn tra trung t­ëng d·y sè /onLotteryGold_QueryPrize", " liªn quan tíi may m¾n vÐ sè /onLotteryGold_About", "Ta ch¼ng qua lµ tíi ®i d¹o mét chót /onCancel" );
end

-- ·ÇÑïÖÝµÄÀñ¹ÙµÄ¶Ô»°
function onLotteryGoldEx()
	Say( " lÔ quan  ngµi kháe , v× håi b¸o ngµi ®èi víi chóng ta lùc m¹nh ñng hé , vâng kiÕm tù 2004 n¨m 11 th¸ng 22 ngµy khëi ®Èy ra may m¾n vÐ sè ho¹t ®éng . th«ng qua mçi chñ nhËt ®Ých khai t­ëng , ngµi ®em ®¹t ®­îc chóng ta ®­a ra ®Ých c¸c lo¹i phong phó phÇn th­ëng , nµy ho¹t ®éng chØ giíi h¹n ë ë <color=red> D­¬ng Ch©u <color> ®Ých lÔ quan chç tiÕn hµnh . ",0);
end

-- ÁìÈ¡ÐÒÔË²ÊÆ±
function onLotteryGold_Gain()

	Say( " lÔ quan  vèn kú vÐ sè chê mét chót ph¸t ®­îc , ph¸t ®­îc thêi gian xin/mêi ngµi nhiÒu h¬n chó ý . ", 1, "Ta biÕt , c¸m ¬n /main" );
	do return end
	
	local nWeekDay = tonumber( date( "%w" ) );
	local nHour = tonumber( date( "%H" ) );
	if( nWeekDay == 0 and nHour >= 8 and nHour < 11 ) then
		Say( " lÔ quan  rÊt xin lçi , mçi tuÇn ngµy 800 tíi 1100 trong lóc së sung t¹p kh«ng c¸ch nµo ®æi lÊy vÐ sè , ho¹t ®éng tÕ lµ xin/mêi tra xÐt “ liªn quan tíi may m¾n vÐ sè ” , ®a t¹ hîp t¸c . ", 1, "Ta biÕt , c¸m ¬n /onLotteryGold" );
		do return end
	end
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	local szSayContent = "";
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		szSayContent = "<> lÔ quan  ngµi cã thÓ nhËn lÊy ";
		if( nMonthCardCount > 0 ) then
			szSayContent = szSayContent.." <color=yellow>"..nMonthCardCount.."<><color> tê 10 ngÉu nhiªn d·y sè ®Ých bé/vá phiÕu ";
		end
		if( nWeekCardCount > 0 ) then
			if( nMonthCardCount > 0 ) then
				szSayContent = szSayContent.."<> cïng ";
			end
			szSayContent = szSayContent.." <color=yellow>"..nWeekCardCount.."<><color> tê 5 ngÉu nhiªn d·y sè ®Ých bé/vá phiÕu ";
		end
		szSayContent = szSayContent.."<> , xin/mêi söa sang l¹i h¶o ngµi ®Ých tói ®eo l­ng , b¶o ®¶m cã ®Çy ®ñ kh«ng gian ®Ó ®­a vÐ sè , kh«ng nªn ®Ó cho ng­êi kh¸c l­îm tiÖn nghi nga . ";
		if( nMonthCardCount + nWeekCardCount > 10 ) then
			Say( szSayContent, 4, "Tói ®eo l­ng trèng kh«ng kia , ta toµn bé vÐ sè mét khèi lÜnh ®i /onLotteryGold_Gain_All", "Tói ®eo l­ng kh«ng gian kh«ng ph¶i lµ rÊt ®ñ , ta tr­íc chØ dÉn 10 tê vÐ sè ®i /onLotteryGold_Gain_10", "Tói ®eo l­ng kh«ng gian kh«ng ph¶i lµ rÊt ®ñ , ta tr­íc chØ dÉn 1 tê vÐ sè ®i /onLotteryGold_Gain_1", "Ta n÷a söa sang mét chót tói ®eo l­ng ®i /onCancel" );
		else
			Say( szSayContent, 3, "Tói ®eo l­ng trèng kh«ng kia , ta toµn bé vÐ sè mét khèi lÜnh ®i /onLotteryGold_Gain_All", "Tói ®eo l­ng kh«ng gian kh«ng ph¶i lµ rÊt ®ñ , ta tr­íc chØ dÉn 1 tê vÐ sè ®i /onLotteryGold_Gain_1", "Ta n÷a söa sang mét chót tói ®eo l­ng ®i /onCancel" );
		end
	else
		Say( " lÔ quan  thËt xin lçi , ngµi vèn chu ch­a sung t¹p hoÆc lµ ngµi ®· nhËn lÊy vèn kú ®Ých may m¾n vÐ sè , c¸i nµy h¹ng mua ho¹t ®éng lµ nh»m vµo sung t¹p dông hé ®Ých ®Æc biÖt t­ëng th­ëng nga , ngµi cã thÓ sÏ may m¾n ®¹t ®­îc hoµng kim trang bÞ , ngµi cÈn thËn suy nghÜ mét chót sao . ", 0 );
	end
end

-- ÁìÈ¡ÐÒÔË²ÊÆ±-È·ÈÏÁìÈ¡È«²¿²ÊÆ±
function onLotteryGold_Gain_All()
	onLotteryGold_Gain_Count( 0 );
end

-- ÁìÈ¡ÐÒÔË²ÊÆ±-È·ÈÏÁìÈ¡10ÕÅ²ÊÆ±
function onLotteryGold_Gain_10()
	onLotteryGold_Gain_Count( 10 );
end

-- ÁìÈ¡ÐÒÔË²ÊÆ±-È·ÈÏÁìÈ¡1ÕÅ²ÊÆ±
function onLotteryGold_Gain_1()
	onLotteryGold_Gain_Count( 1 );
end

-- ÁìÈ¡ÐÒÔË²ÊÆ±-È·ÈÏÁìÈ¡Ö¸¶¨ÊýÄ¿µÄ²ÊÆ±£¨0±íÊ¾ÁìÈ¡È«²¿£©
function onLotteryGold_Gain_Count( nLotteryCount )
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		if( nLotteryCount == 0 ) then
			nLotteryCount = nMonthCardCount + nWeekCardCount;
		end
		for i = 1, nMonthCardCount do
			if( i > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, MONTH_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nMonthLotteryCount = nMonthLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, MONTH_CARD_EXTPOINT_COST );
			end
		end
		for i = 1, nWeekCardCount do
			if( ( nMonthLotteryCount + i ) > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, WEEK_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nWeekLotteryCount = nWeekLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, WEEK_CARD_EXTPOINT_COST );
			end
		end
		
		if( ( nMonthLotteryCount + nWeekLotteryCount ) > 0 ) then
			szSayContent = "<> lÔ quan  ngµi ®· nhËn lÊy ";
			if( nMonthLotteryCount > 0 ) then
				szSayContent = szSayContent.." <color=yellow>"..nMonthLotteryCount.."<><color> tê 10 ngÉu nhiªn d·y sè ®Ých bé/vá phiÕu ";
			end
			if( nWeekLotteryCount > 0 ) then
				if( nMonthLotteryCount > 0 ) then
					szSayContent = szSayContent.."<> cïng ";
				end
				szSayContent = szSayContent.." <color=yellow>"..nWeekLotteryCount.."<><color> tê 5 ngÉu nhiªn d·y sè ®Ých bé/vá phiÕu ";
			end
			szSayContent = szSayContent.."<> , xin/mêi ë B¾c Kinh thêi gian vèn chñ nhËt s¸ng sím 1100 khi ®Õn chñ nhËt s¸ng sím 1100 gi÷a tíi ®æi t­ëng ®i . ";
			if( ( nMonthLotteryCount + nWeekLotteryCount ) < ( nMonthCardCount + nWeekCardCount ) ) then
				szSayContent = szSayContent.."<> ngµi cßn cã mÊy tê vÐ sè ë ta ®©y mµ , chí quªn ë vèn chñ nhËt 800 tíi tr­íc dÉn ®i nga . ";
			end
			Say( szSayContent, 0 );
			
			Msg2Player( "<> ngµi thu ®­îc "..(nMonthLotteryCount+nWeekLotteryCount).."<>ÕÅÐÒÔË²ÊÆ±" );
			WriteLog( format( "[%s] %s(%s) nhËn lÊy %d tê 10 d·y sè vÐ sè %d tê 5 d·y sè vÐ sè \r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nMonthLotteryCount, nWeekLotteryCount ) );
		else
			Say( " lÔ quan  may m¾n vÐ sè t¹m thêi kh«ng c¸ch nµo nhËn lÊy , xin hËu thö l¹i , c¸m ¬n . ", 0 );
		end
	end
end

-- ÐÒÔË²ÊÆ±¶Ò½±
function onLotteryGold_Prize()

	Say(" lÔ quan  th­îng ®ång thêi vÐ sè kh«ng cã ph¸t ®­îc nga , cô thÓ ph¸t ®­îc thêi gian kÝnh xin ngµi ë l©u ý . ",0)
	do return end
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	if( nPrizeIssueID > 0 ) then
		Say( "<><color=yellow> thø "..format( "%03d", nPrizeIssueID ).."<> kú may m¾n vÐ sè phÇn th­ëng <color>\n nhÊt ®¼ng t­ëng "..FIRST_PRIZE_AWARD[1].."<>\n nhÞ ®¼ng t­ëng "..SECOND_PRIZE_AWARD[1].."<>\n kû niÖm t­ëng [ ®¹i bé/vá phiÕu ]"..OTHER_PRIZE_AWARD1[1].."<> [ tiÓu bé/vá phiÕu ]"..OTHER_PRIZE_AWARD2[1].."<>\n<color=red> chó  bëi v× phÇn th­ëng sè l­îng kh¸ nhiÒu , ë ®æi t­ëng tr­íc xin chó ý söa sang l¹i tói ®eo l­ng , b¶o ®¶m cã ®Çy ®ñ kh«ng gian ®Ó ®­a phÇn th­ëng . ®Ò nghÞ kh«ng muèn mét lÇn ®æi qu¸ nhiÒu vÐ sè . <color>", 2, "Kh«ng thµnh vÊn ®Ò , tói ®eo l­ng cã ®Çy ®ñ kh«ng gian /onLotteryGold_Prize_Check", "Ta n÷a söa sang mét chót tói ®eo l­ng ®i /onCancel"  );
	else
		Say( "May m¾n vÐ sè ch­a khai t­ëng , xin/mêi víi vèn chñ nhËt buæi s¸ng 1100 sau trë l¹i ®i , c¸m ¬n . ", 1, "Ta biÕt , c¸m ¬n /onLotteryGold" );		
	end
end

-- ÐÒÔË²ÊÆ±¶Ò½±-²ÊÆ±¶Ò½±½çÃæ
function onLotteryGold_Prize_Check()
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	GiveItemUI( "Thø "..format( "%03d", nPrizeIssueID ).." kú may m¾n vÐ sè ®æi t­ëng ", " lÔ quan  xin/mêi ®em tíi ®æi t­ëng thêi gian vÐ sè th¶ vµo giíi nµy mÆt trung , chóng ta ®em ®em ngµi ®¹t ®­îc ®Ých phÇn th­ëng tù ®éng bá vµo ngµi ®Ých vËt phÈm lan . nÕu vÐ sè ®· qua kú , th× kh«ng ph¸p ®æi . <color=white> chó  bëi v× phÇn th­ëng sè l­îng kh¸ nhiÒu , kh«ng muèn mét lÇn ®æi qu¸ nhiÒu vÐ sè , ®Ó ngõa tói ®eo l­ng kh«ng gian ch­a ®ñ , phÇn th­ëng r¬i xuèng . <color>", "onLotteryGold_Prize_Confirm", "onCancel" );
end

-- ÐÒÔË²ÊÆ±¶Ò½±-²ÊÆ±¶Ò½±½çÃæ¡°È·¶¨¡±»Øµ÷º¯Êý
function onLotteryGold_Prize_Confirm( nCount )
	local nLotteryItemIndex, nLotteryIDCount, nPrize1Count, nPrize2Count, nPrize1TotalCount, nPrize2TotalCount, nOtherPrizeTotalCount;
	local nLotteryItemCount = 0;
	local nPrize1TotalCount = 0;
	local nPrize2TotalCount = 0;
	local nOtherPrizeTotalCount = 0;
	local szHeOrShe;
	
	if( GetSex() == 1 ) then
		szHeOrShe = " nµng ";
	else
		szHeOrShe = " h¾n ";
	end
	
	for i = 1, nCount do
		local nLotteryItemIndex = GetGiveItemUnit( i );
		local nLotteryIssueID = GetItemParam( nLotteryItemIndex, 1 );
		local nLotteryIDCount, nPrize1Count, nPrize2Count = Lottery_CheckPrize( LOTTERY_GOLD_TYPENAME, nLotteryItemIndex );
		local nRandAwardIdx;
		
		if( nLotteryIDCount > 0 ) then
			nLotteryItemCount = nLotteryItemCount + 1;
			if( RemoveItemByIndex( nLotteryItemIndex ) == 1 ) then
				if( nPrize1Count > 0 or nPrize2Count > 0 ) then
					for j = 1, nPrize1Count do
						local aryProbability = {};
						for k = 1, getn( FIRST_PRIZE_AWARD[2] ) do
							aryProbability[k] = FIRST_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( FIRST_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) nhËn lÊy thø %d kú ®Ých nhÊt ®¼ng t­ëng phÇn th­ëng %d c¸ %s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3], FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<> ngµi thu ®­îc "..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<> c¸ "..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( "<> ®Æc tin tøc tèt , "..GetName().."<> ë D­¬ng Ch©u ®Ých lÔ quan chç së nhËn lÊy ®Ých thø "..format("%03d", nLotteryIssueID).."<> kú may m¾n vÐ sè trung ph¶i nhÊt ®¼ng t­ëng , ®¹t ®­îc "..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1]..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<> mãn , ®Ó cho chóng ta trung t©m chóc phóc "..szHeOrShe.."<> . chóng ta mong ®îi sù tham dù cña ngµi , c¸m ¬n . ");
					end
					for j = 1, nPrize2Count do
						local aryProbability = {};
						for k = 1, getn( SECOND_PRIZE_AWARD[2] ) do
							aryProbability[k] = SECOND_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( SECOND_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) nhËn lÊy thø %d kú ®Ých nhÞ ®¼ng t­ëng phÇn th­ëng %d c¸ %s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<> ngµi thu ®­îc "..SECOND_PRIZE_AWARD[2][nRandAwardIdx][3].."<> c¸ "..SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( format( "§Æc tin tøc tèt , %s ë D­¬ng Ch©u ®Ých lÔ quan chç së nhËn lÊy ®Ých thø %03d kú may m¾n vÐ sè trung ph¶i nhÞ ®¼ng t­ëng , ®¹t ®­îc %s%d c¸ , ®Ó cho chóng ta trung t©m chóc phóc %s . chóng ta mong ®îi sù tham dù cña ngµi , c¸m ¬n . ", GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][1], SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], szHeOrShe ) );
					end
					nPrize1TotalCount = nPrize1TotalCount + nPrize1Count;
					nPrize2TotalCount = nPrize2TotalCount + nPrize2Count;
				else
					if( nLotteryIDCount == 10 ) then
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD1[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD1[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD1[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) nhËn lÊy thø %d kú ®Ých tam ®¼ng t­ëng ®¹i bé/vá phiÕu phÇn th­ëng %d c¸ %s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] ) );
						Msg2Player( "<> ngµi thu ®­îc "..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3].."<> c¸ "..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] );
					else
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD2[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD2[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD2[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) nhËn lÊy thø %d kú ®Ých tam ®¼ng t­ëng tiÓu bé/vá phiÕu phÇn th­ëng %d c¸ %s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] ) );
						Msg2Player( "<> ngµi thu ®­îc "..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3].."<> c¸ "..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] );
					end
					nOtherPrizeTotalCount = nOtherPrizeTotalCount + 1;
				end
			end
		end
	end
	if( nLotteryItemCount > 0 ) then
		local szPrizeResultContent = " lÔ quan  chóc mõng ngµi  ë ngµi ®æi ®Ých vÐ sè trung b¾n tróng liÔu <color=yellow>"
		if( nPrize1TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<> nhÊt ®¼ng t­ëng "..nPrize1TotalCount.."<> c¸ ";
		end
		if( nPrize2TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<> nhÞ ®¼ng t­ëng "..nPrize2TotalCount.."<> c¸ ";
		end
		if( nOtherPrizeTotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<> kû niÖm t­ëng "..nOtherPrizeTotalCount.."<> c¸ ";
		end
		szPrizeResultContent = szPrizeResultContent.."<color>"
		Say( szPrizeResultContent, 0 );
	else
		Say( "Xin/mêi kiÓm tra ngµi ®Ó ®­a chÝnh lµ h÷u hiÖu ®æi t­ëng kú bªn trong ®Ých may m¾n vÐ sè ", 3, "Míi võa råi lÇm , ta lÇn n÷a ®Ó ®i /onLotteryGold_Prize", "Ta muèn nh×n mét chót trung t­ëng vÐ sè d·y sè /onLotteryGold_QueryPrize", "Ta kh«ng cã muèn ®æi ®Ých vÐ sè , lÇn sau trë l¹i ®i /onCancel" );
	end
end

-- ²éÑ¯ÉÏÆÚÖÐ½±ºÅÂë
function onLotteryGold_QueryPrize()
	

	Say(" lÔ quan  th­îng ®ång thêi vÐ sè kh«ng cã ph¸t ®­îc nga , cô thÓ ph¸t ®­îc thêi gian kÝnh xin ngµi ë l©u ý . ",0)
	do return end
	
	local szResultPrize1, szResultPrize2;
	local nPrizeIssueID, nPrize1Count, nPrize2Count;
	local aryaryszPrize1ID = {};
	local aryaryszPrize2ID = {};
	
	nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	nPrize1Count = getn( aryaryszPrize1ID );
	nPrize2Count = getn( aryaryszPrize2ID );
	if( nPrizeIssueID > 0 ) then
		for i = 1, nPrize1Count do
			if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
				aryaryszPrize1ID[i] = " ( v« Ých ) ";
			end
		end
		for i = 1, nPrize2Count do
			if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
				aryaryszPrize2ID[i] = " ( v« Ých ) ";
			end
		end
		szResultPrize1 = "<> th­îng kú (<color=red> thø "..format( "%03d", nPrizeIssueID ).."<><color>) kú may m¾n vÐ sè trung th¶i tin tøc \n";
		szResultPrize1 = szResultPrize1.."<><color=yellow> nhÊt ®¼ng t­ëng <color> may m¾n d·y sè \n<color=yellow>";
		for i = 1, nPrize1Count do
			szResultPrize1 = szResultPrize1..aryaryszPrize1ID[i].." ";
		end
		szResultPrize2 = "<> th­îng kú (<color=red> thø "..format( "%03d", nPrizeIssueID ).."<><color>) kú may m¾n vÐ sè trung th¶i tin tøc \n";
		szResultPrize2 = szResultPrize2.."<><color=yellow> nhÞ ®¼ng t­ëng <color> may m¾n d·y sè \n<color=yellow>";
		for i = 1, nPrize2Count do
			szResultPrize2 = szResultPrize2..aryaryszPrize2ID[i].." ";
			if( mod( i, 7 ) == 0 ) then
				szResultPrize2 = szResultPrize2.."\n";
			end
		end
		Talk( 2, "onLoteryGold", szResultPrize1, szResultPrize2 );
	else
		Say( "May m¾n vÐ sè ch­a khai t­ëng , xin/mêi víi <color=yellow> vèn chñ nhËt 1100<color> sau trë l¹i tuÇn tra , c¸m ¬n . ", 1, "Ta biÕt , c¸m ¬n /onLotteryGold" );
	end
end

-- ¹ØÓÚÐÒÔË²ÊÆ±
function onLotteryGold_About()
	Talk( 3, "", " lÔ quan  may m¾n vÐ sè nÇy ®©y bé/vá phiÕu ph­¬ng thøc tÆng cho ngµi , mçi sung trÞ gi¸ mét tê 30 nguyªn sung trÞ gi¸ t¹p ®¹t ®­îc 1 tê bé/vá phiÕu , phiÕu bªn trong bao hµm <color=yellow>10<color> c¸ ngÉu nhiªn d·y sè . mçi sung trÞ gi¸ mét tê 10 nguyªn sung trÞ gi¸ t¹p ®¹t ®­îc 1 tê bé/vá phiÕu , phiÕu bªn trong bao hµm <color=yellow>5<color> c¸ ngÉu nhiªn d·y sè . ", " lÔ quan  cho phÐp sung t¹p nhËn lÊy vÐ sè ®Ých thêi gian lµ  mçi kú vÐ sè ë nªn vÐ sè ph¸t ®­îc <color=yellow> chñ nhËt s¸ng sím 1100 tíi cuèi tuÇn ngµy s¸ng sím 800<color> nhËn lÊy . <color=red> mµ mçi tuÇn ngµy ®Ých s¸ng sím 800 tíi 1100, së sung ®Ých t¹p kh«ng thÓ nhËn lÊy vÐ sè . <color>", " lÔ quan  ë chñ nhËt s¸ng sím 1100 chóng ta ®em th«ng b¸o khi kú trung t­ëng d·y sè , ngµi ë ®¹t ®­îc vÐ sè sau nh­ng c¨n cø phiÕu mÆt ®Ých ®æi t­ëng thêi gian cïng m×nh ®Ých ngÉu nhiªn d·y sè tíi ®æi phÇn th­ëng . " );
end

-- ±¾ÆÚ²ÊÆ±¿ª½±²¢Æô¶¯ÐÂÒ»ÆÚ²ÊÆ±£¨SystemTaskÃ¿Ìì¶¨Ê±µ÷ÓÃ£©
function onLotteryGold_UpdateIssue()
	
	do return end;
	
	local nLotteryLatestIssueID = Lottery_UpdateIssue( LOTTERY_GOLD_TYPENAME );
	if( nLotteryLatestIssueID > 0 ) then
		local nPrizeIssueID, nPrize1Count, nPrize2Count;
		local aryszPrize1ID = {};
		local aryszPrize2ID = {};
		
		nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
		nPrize1Count = getn( aryaryszPrize1ID );
		nPrize2Count = getn( aryaryszPrize2ID );
		if( nPrizeIssueID > 0 ) then
			for i = 1, nPrize1Count do
				if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
					aryaryszPrize1ID[i] = " ( v« Ých ) ";
				end
			end
			for i = 1, nPrize2Count do
				if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
					aryaryszPrize2ID[i] = " ( v« Ých ) ";
				end
			end
			local szNewsContent = "<> sè bªn ngoµi  sè bªn ngoµi  thø "..format( "%03d", nPrizeIssueID ).."<> kú may m¾n vÐ sè khai t­ëng n÷a/råi  nhÊt ®¼ng t­ëng may m¾n m· sè lµ ";
			for i = 1, nPrize1Count do
				szNewsContent = szNewsContent..aryaryszPrize1ID[i].." ";
			end
			szNewsContent = szNewsContent.."<> , nhÞ ®¼ng t­ëng may m¾n m· sè lµ ";
			for i = 1, nPrize2Count do
				szNewsContent = szNewsContent..aryaryszPrize2ID[i].." ";
			end
			szNewsContent = szNewsContent.."<> . vèn kú nhÊt ®¼ng t­ëng ph¶i chñ t­íng ®¹t ®­îc "..FIRST_PRIZE_AWARD[1].."<>  nhÞ ®¼ng t­ëng ph¶i chñ t­íng ®¹t ®­îc "..SECOND_PRIZE_AWARD[1].."<>  mäi ng­êi véi vµng tra ®èi víi m×nh mét chót ®Ých vÐ sè , còng kÞp thêi ®Õn D­¬ng Ch©u lÔ quan chç nhËn lÊy phÇn th­ëng ";
			AddGlobalCountNews( szNewsContent, 3 );
		end
	end
end

-- È¡Ïû
function onCancel()
end

-- ¸ù¾ÝÈô¸É¸öÖ¸¶¨¸ÅÂÊµÄÑ¡ÏîËæ»úÑ¡³öÄ³Ò»Ïî
function randByProbability( aryProbability )
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 191 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- ¸øÓèÍæ¼ÒÖ¸¶¨²ÎÊýµÄ½±Æ·
function addAward( aryAwardParam )
	local nAwardParamCount = getn( aryAwardParam );
	if( nAwardParamCount == 2 ) then
		return AddGoldItem( aryAwardParam[1], aryAwardParam[2] );
	elseif( nAwardParamCount == 4 ) then
		return AddVerGoldItem( aryAwardParam[1], aryAwardParam[2], aryAwardParam[3], aryAwardParam[4] );
	elseif( nAwardParamCount == 7 ) then
		return AddItem( aryAwardParam[1], aryAwardParam[2],aryAwardParam[3], aryAwardParam[4], aryAwardParam[5], aryAwardParam[6], aryAwardParam[7] );
	end
	return 0;
end