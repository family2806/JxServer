IncludeLib("TONG")

Include("\\script\\tong\\tong_header.lua")
Include("\\script\\tong\\log.lua")
Include("\\script\\tong\\map\\map_management.lua")
Include("\\script\\global\\tonggetmasterpower.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\fenghuo_hero\\hero_event.lua")

--°ï»áÖÜÄ¿±êÁì½±
function tong_award(nTongID)
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		CreateTaskSay({"<dec><npc>Ng­¬i kh«ng cã quyÒn h¹n qu¶n lı môc tiªu tuÇn, kh«ng thÓ l·nh th­ëng!", "Ta biÕt råi/tong_cancel"});
		return
	end
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>TuÇn tr­íc kh«ng cã môc tiªu tuÇn, kh«ng thÓ nhËn th­ëng!", "Ta biÕt råi/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>Quİ bang ch­a hoµn thµnh môc tiªu tuÇn tr­íc, kh«ng thÓ nhËn th­ëng!", "Ta biÕt råi/tong_cancel"});
		return
	end
	local nWeek = TONG_GetWeek(nTongID);
	--±ØĞë¼ÓÁÙÊ±±äÁ¿ÅĞ¶Ï£¬·ñÔò»áË¢£¡ÒòÎª°ï»áÈÎÎñ±äÁ¿ÔÚ·şÎñ¶Ë²»ÊÇ¼´Ê±ÉèÉÏµÄ£¡
	--ÓÉÓÚÁì½±Ö»ÄÜÔÚ×ÔÉí°ï»áµØÍ¼£¬Òò´Ë»ù±¾²»´æÔÚ¶àc¸i·şÎñÆ÷Í¬Ê±Áì½±À´Ë¢µÄÇé¿ö
	if (nWeek == TONG_GetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE) or 
		nWeek == TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK)) then
		CreateTaskSay({"<dec><npc>§· nhËn phÇn th­ëng råi, cßn muèn nhËn n÷a sao!", "Ta biÕt råi/tong_cancel"});
		return
	end
	local nWeekGoalPriceTong = TONG_GetLWeekGoalPriceTong(nTongID)
	TONG_ApplyAddWarBuildFund(nTongID, nWeekGoalPriceTong);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WFADD, nWeekGoalPriceTong);
	--°ÑÁì½±±êÖ¾ÉèÎª±¾ÖÜ
	TONG_SetTaskTemp(nTongID, TONG_TMPWEEKGOALPRICE, nWeek);
	TONG_ApplySetTaskValue(nTongID, TONGTSK_WEEKGOAL_PRICE_WEEK, nWeek);
	TONG_ApplyAddEventRecord(nTongID, "§· nhËn th­ëng môc tiªu tuÇn."..nWeekGoalPriceTong.." v¹n ng©n s¸ch chiÕn bŞ");	-- °ï»áÊÂ¼ş¼ÇÂ¼
	Msg2Player(format("NhËn ®­îc phÇn th­ëng môc tiªu tuÇn: Ng©n s¸ch chiÕn bŞ <color=gold>%d<color> v¹n", nWeekGoalPriceTong))
end

--c¸iÈËÖÜÄ¿±êÁì½±
function WeekGoalPrice(nTongID)
	if (TONG_GetLWeekGoalEvent(nTongID) == 0) then
		CreateTaskSay({"<dec><npc>TuÇn tr­íc quİ bang kh«ng cã môc tiªu tuÇn, kh«ng thÓ nhËn th­ëng!", "Ta biÕt råi/tong_cancel"});
		return
	end
	if (TONG_GetTaskValue(nTongID, TONGTSK_WEEKGOAL_COMPLETE) ~= 1) then
		CreateTaskSay({"<dec><npc>Ch­a hoµn thµnh môc tiªu tuÇn, kh«ng thÓ nhËn th­ëng!", "Ta biÕt råi/tong_cancel"});
		return
	end
	local nTongWeek = TONG_GetWeek(nTongID)
	local nLWeekValue = TONGM_GetLWeekGoalOffer(nTongID, GetName())
	local nPlayerGoal = TONG_GetLWeekGoalPlayer(nTongID)
	--Ê¹ÓÃµÄÊÇÓÉ·şÎñ¶Ë¾ö¶¨µÄ³ÉÔ±±äÁ¿
	local nState = GetTongMTask(TONGMTSK_WEEK_GOAL_PRICE)
	if (nState == nTongWeek) then --ÒÑÁì¹ı½±£¬ÖÜÊıÎª±¾ÖÜ
		CreateTaskSay({"<dec><npc>§· nhËn phÇn th­ëng môc tiªu tuÇn tr­íc råi, cÇn tiÕp tôc cèng hiÕn cho bang héi, tuÇn sau h·y ®Õn nhĞ.", "Ta biÕt råi/tong_cancel"});
		return
	end
	if (nLWeekValue == 0 or nPlayerGoal == 0) then
		CreateTaskSay({"<dec><npc>TuÇn tr­íc ch­a lµm viÖc g× c¶, lµm g× cã chuyÖn kh«ng c«ng ®­îc th­ëng chø?", "Ta biÕt råi/tong_cancel"});
		return
	end
	if (nLWeekValue < nPlayerGoal) then
		CreateTaskSay({"<dec><npc>Ch­a hoµn thµnh môc tiªu tuÇn tr­íc, kh«ng thÓ nhËn th­ëng, cÇn tiÕp tôc cè g¾ng cho bang héi, sím muén g× còng ®­îc ®Òn ®¸p th«i.", "Ta biÕt råi/tong_cancel"});
		return
	end	
	local nPrice = TONG_GetLWeekGoalPricePlayer(nTongID)
	AddContribution(nPrice)
	Msg2Player("<#>§· hoµn thµnh môc tiªu tuÇn bang héi, nhËn ®­îc phÇn th­ëng ®iÓm cèng hiÕn:"..nPrice.."®iÓm")
	Msg2Player("<#>§· hoµn thµnh môc tiªu tuÇn bang héi, nhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm: "..(nPrice*10000).."®iÓm")
	AddOwnExp(nPrice*10000)
	SetTongMTask(TONGMTSK_WEEK_GOAL_PRICE, nTongWeek)
end

function main()
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (GetProductRegion() == "cn_ib") then
		-- °ï»áµØÍ¼Ä£°åÖĞµÄ¼À¾ÆÔòÖ±½Ó½øÈëµØÍ¼¹ÜÀí
		if (aDynMapCopyName[nSubWorldId] ~= nil) then
			tongmap_management();
			return
		end
	end;
	local _Name, nTongID = GetTongName();
	-- Íæ¼ÒÃ»ÓĞ°ï»áÔò²»³öÏÖ¹¦ÄÜÁĞ±í
	if (nTongID == 0) then
		CreateTaskSay({"<dec><npc>Muèn t×m hiÓu th«ng tin vÒ hÖ thèng bang héi míi!", "Trî gióp bang héi/#tong_help()", "Hñy bá /tong_cancel"});
		return
	end
	local param = "("..nTongID..")";
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if (nSubWorldId > DYNMAP_ID_BASE and nSubWorldId ~= TONG_GetTongMap(nTongID)) then
		Say("§©y kh«ng ph¶i lµ l·nh ®Şa cña quı bang, muèn ®Õn tham quan sao?", 2, "Trî gióp bang héi/#tong_help()", "Nh©n tiÖn ghĞ qua th«i/tong_cancel");
		return
	end
	local figure = TONGM_GetFigure(nTongID, GetName());
	local aryDescribe = 
	{
				"<dec><npc>Ng­¬i t×m ta cã viÖc g×?",
				"PhÇn th­ëng môc tiªu tuÇn c¸ nh©n/#WeekGoalPrice"..param,
				"NhËn phÇn th­ëng ®iÓm cèng hiÕn mçi ngµy/#GetDayPrice"..param,
--				"½¨ÉèµÈcÊpÌáÉı½±Àø/LUP_HelpInfo",
				-- Ô½ÄÏ°ï»á²»³ö
--				"·ÂÖÆ°²°îÌ××°/enter_anbang",
				"Tù tiÕn cö chøc bang chñ/#tong_mastercompetition"..param,
--				"°ï»á°ïÖúĞÅÏ¢/#tong_help()",
	};
	--Èç¹ûÊÇ³¤ÀÏºÍ°ïÖ÷
	if (figure == TONG_MASTER or figure == TONG_ELDER) then
		tinsert(aryDescribe, "ThiÕt lËp ®é khã môc tiªu tuÇn/#tong_levelchoose"..param);
		tinsert(aryDescribe, "PhÇn th­ëng môc tiªu tuÇn bang héi/#tong_award"..param);
	end
	tinsert(aryDescribe, "Trî gióp bang héi/#tong_help()");
	tinsert(aryDescribe, "Hñy bá /tong_cancel");
	CreateTaskSay(aryDescribe);
end

function tong_help()
	OpenHelp(80)
end

function GetDayPrice(nTongID)
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_RETIRE) then
		Say("§ang ë tr¹ng th¸i tho¸i Èn, kh«ng thÓ nhËn th­ëng", 0);	
		return
	end	
	if (TONGM_GetJoinDay(nTongID, GetName() ) == TONG_GetDay(nTongID)) then
		Say("<#>Ph¶i vµo bang trªn mét ngµy míi ®­îc nhËn!", 0)
		return
	end

	if (TONG_GetBuildLevel(nTongID) <= 0) then
		Say("<#>Bang héi ®¹t cÊp 1 míi ®­îc nhËn ®iÓm cèng hiÕn", 0)
		return
	end
	--¼ÀÌ³½±Àø²»ÀÛ¼Óµ½ÖÜÀÛ»ı¹±Ï×¶È
	if (TONG_GetPauseState(nTongID) ~= 0) then
		Say("<#>Bang héi ®ang ë tr¹ng th¸i t¹m ngõng ho¹t ®éng, kh«ng thÓ nhËn  ", 0)
		return
	end
	local nTongDay = TONG_GetDay(nTongID)
	if (GetTongMTask(TONGMTSK_DAILY_PRICE) == nTongDay) then
		Say("<#>§· nhËn phÇn th­ëng h«m nay", 0)
		return
	end
	local nPrice = DAILY_PRICE
	if (nPrice > 0)then
		AddContribution(nPrice)
		Msg2Player("NhËn ®­îc <color=gold>"..nPrice.."<color> ®iÓm cèng hiÕn")
	end
	SetTongMTask(TONGMTSK_DAILY_PRICE, nTongDay)
end

function unchain_pause_state(nTongID)
	local nConsume = TONG_GetMaintainFund(nTongID)	
	local nCurFund = TONG_GetWarBuildFund(nTongID)
	if (nCurFund < nConsume*7) then
		Say("<#>Ng©n s¸ch chiÕn bŞ thÊp h¬n møc ng©n s¸ch chiÕn bŞ b¶o tr× cho phĞp, kh«ng thÓ khëi ®éng t¸c ph­êng!", 0)
	else	
		TONG_ApplySetPauseState(nTongID, 0)
		Msg2Tong(nTongID, "T¸c Ph­êng bang héi kh«i phôc ho¹t ®éng!")
	end
end

function tong_levelchoose(nTongID)
	if nTongID == 0 then return end;
	local nLevel = TONG_GetCurWeekGoalLevel(nTongID)
	Say("<#>Møc ®é khã môc tiªu tuÇn cña bang héi lµ cÊp <color=yellow>"..nLevel.."<color>,\n\n ThiÕt lËp ®é khã môc tiªu tuÇn hiÖn t¹i sÏ cã t¸c dông vµo tuÇn sau, muèn thiÕt lËp l¹i ®é khã cña môc tiªu tuÇn kh«ng?", 3, "§é khã cÊp 1/#select_level(1)", "§é khã cÊp 2/#select_level(2)", "Kh«ng cÇn ®©u/tong_cancel")
end

function select_level(nLevel)
	local _Name, nTongID = GetTongName()
	if nTongID == 0 then return end;
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WEEKGOAL) ~= 1) then
		Say("<#>Ng­¬i kh«ng cã quyÒn h¹n qu¶n lı môc tiªu tuÇn, h·y mêi bang chñ ®Õn ®©y!", 0)
		return
	end
	TONG_ApplySetCurWeekGoalLevel(nTongID, nLevel)
	Say("<#>§é khã môc tiªu tuÇn hiÖn t¹i lµ: <color=yellow>"..nLevel.."cÊp", 0)
end

-- ÓÃ»§®iÓm»÷°ïÖ÷×Ô¼ö
function tong_mastercompetition() 
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --Èç¹û°ïÖ÷´æÔÚ
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --°ïÖ÷Àë¿ªÉÙÓÚ30Ìì,¶øÇÒÏÖÔÚ²»ÔÚÏß
				Say("Bang chñ ch­a rêi khái 30 ngµy, ch­a thÓ tæ chøc tù tiÕn cö vµo chøc vŞ bang chñ", 1, "X¸c nhËn/tong_cancel");
			return
		end
	end
	
	local param = "("..nTongID..")";
	
	-- Ö´ĞĞµ½´Ë´¦±íÃ÷°ïÖ÷Àë¿ª30ÌìÁË
	if (CheckTongMasterPower() ~= 1) then --²»·ûºÏµ±°ïÖ÷µÄ×Ê¸ñ
		Say("§iÓm thèng so¸i vµ danh väng kh«ng ®ñ ®Ó ®¶m nhiÖm chøc vŞ bang chñ", 1, "X¸c nhËn/tong_cancel")
		return
	end

	--Ö´ĞĞµ½ÕâÀï±íÃ÷¿ªÆô°ïÖ÷µÄÌõ¼ş´ïµ½£¬¸ù¾İÊÇ·ñ¿ªÆô¾ºÑ¡À´¿ªÆô»ò²ÎÓë
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then --ÈôÃ»ÓĞ¿ªÆô
		Say("Bang chñ ®· rêi khái 30 ngµy, ng­¬i cã thÓ tù tiÕn cö vµo chøc vŞ bang chñ, 2 tuÇn sau cã thÓ tham gia cuéc b×nh chän bang chñ.",
			2, "B¾t ®Çu/#_tong_startup_compete"..param, "Hñy bá /tong_cancel");
	elseif (TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE) == 0) then --»¹Ã»ÓĞ½øĞĞ2240ÈÎÎñ,²»ÊÇ°ïÖ÷ºòÑ¡ÈË
		Say("Muèn tranh ®ua chøc bang chñ cÇn ph¶i ®ãng gãp nhiÒu cho bang héi trong vßng 2 tuÇn tíi: tham gia c¸c ho¹t ®éng vµ ®¹t ®­îc 2240 ®iÓm cèng hiÕn c¸ nh©n (®iÓm cèng hiÕn dù tr÷ th­ëng tõ bang héi, ®iÓm cèng hiÕn tõ TÕ §µn, ®iÓm cèng hiÕn c¸ nh©n tõ môc tiªu tuÇn sÏ kh«ng ®­îc tİnh)", 2, "Tham gia/_foretask", "Hñy bá /tong_cancel");
	else  --ÒÑ¾­ÊÇºòÑ¡ÈËÁË£¬¼´²Î¼ÓÁË2240ÈÎÎñ
		local nIniContribution = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS);--»ñµÃ¸Õ²ÎÓë2240ÈÎÎñÊ±µÄ¹±Ï×¶È
		local nEarnContributiveness =  GetCumulateOffer() - nIniContribution;--Ïà¼õµÃµ½Ôö¼ÓµÄÊÖ¹¤¹±Ï×¶È
		if(nEarnContributiveness < FORETASKVALUE ) then --¹±Ï×®iÓm»¹²»¹»2240
			Say("§· cã "..tostring(nEarnContributiveness).." ®iÓm cèng hiÕn"..", cßn thiÕu "..tostring(FORETASKVALUE - nEarnContributiveness).." ®iÓm cèng hiÕn.", 0);
			return
		end
		local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);
		if (nLastContributiveness == 0) then
			Say("¹§Ï²! ÄãÕÒµ½ÁË×îÉÙÎª2240 ®iÓm cèng hiÕnËùÒÔ¿ÉÒÔ²Î¼Ó°ïÖ÷Ö°Î»µÄÕù¶á£¬ÇëÊäÈëÊı×Ö±ÈÈü£¬Êı×Ö×î¸ßµÄ½«µÃµ½20±¶µÄc¸iÈË¹±Ï×¶È£¬Òª×¢ÒâµÄÊÇ£¬Ã¿´ÎÑ¡Ôñ£¬½«¿Û³ı5% ÊÖĞø·Ñ.", 2, "X¸c nhËn/inputcontributiveness", "Hñy bá /tong_cancel");
		else
			Say("Sè ®iÓm thi ®ua lµ "..tostring(nLastContributiveness)..", ng­¬i muèn t¨ng thªm sao?", 2, "+/inputcontributiveness", "Hñy bá /tong_cancel");
		end
	end
end 

--Æô¶¯°ïÖ÷×Ô¼ö
function _tong_startup_compete(nTongID)
	local _Name, nCurTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrDateTime = GetCurServerTime();
	
	if (nCurTongID == 0 or nTongID ~= nCurTongID) then
		return
	end
	
	if (TONG_GetTaskValue(nTongID, TONGTSK_OPEN_DATE) == 0) then
		local nMasterID = TONG_GetFirstMember(nTongID, 0);
		local nMasterLastOnlineDate = 0;
		if (nMasterID ~= 0) then --Èç¹û°ïÖ÷´æÔÚ
			nMasterLastOnlineDate = TONGM_GetLastOnlineDate(nTongID, nMasterID);
		end
		
		if (TONGM_GetOnline(nTongID, nMasterID) == 1 or
			(floor(dwCurrDateTime/(24*3600)) - nMasterLastOnlineDate) <= MASTER_ASIDE_TIME) then --°ïÖ÷Àë¿ªÉÙÓÚ30Ìì,¶øÇÒÏÖÔÚ²»ÔÚÏß
			return
		end
	end
	
	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_OPEN_DATE, dwCurrDateTime); --¾ºÑ¡¿ªÊ¼ÈÕÆÚ
	--°ïÁÄ£¬°ï»áÊÂ¼şÖĞ¼ÇÂ¼
	Msg2Tong(nTongID, "Ho¹t ®éng tù tiÕn cöa bang chñ ®· b¾t ®Çu");
	TONG_ApplyAddEventRecord(nTongID, "Ho¹t ®éng tù tiÕn cöa bang chñ ®· b¾t ®Çu");
	--±éÀúÇå¿Õ
	local tbMsg = {
		startmemberid	 = GetTongMemberID(),
		startupdate      = FormatTime2String(dwCurrDateTime)
		}
		cTongLog:WriteInfTB("TONG", "master_compete_date", nTongID, tbMsg)

		Say("°ïÖ÷¾ºÑ¡»î¶¯ÒÑ¿ªÊ¼£¬Muèn tranh ®ua chøc bang chñ cÇn ph¶i ®ãng gãp nhiÒu cho bang héi trong vßng 2 tuÇn tíi: tham gia c¸c ho¹t ®éng vµ ®¹t ®­îc 2240 ®iÓm cèng hiÕn c¸ nh©n (®iÓm cèng hiÕn dù tr÷ th­ëng tõ bang héi, ®iÓm cèng hiÕn tõ TÕ §µn, ®iÓm cèng hiÕn c¸ nh©n tõ môc tiªu tuÇn sÏ kh«ng ®­îc tİnh)", 2, "Tham gia/_foretask", "Hñy bá /tong_cancel");
end

--ÉèÖÃÎªºòÑ¡ÈË,²¢°²ÅÅÏÈ¾öÈÎÎñ,Îª°ï»á¹±Ï×2240®iÓm¹±Ï×¶È
function _foretask()
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_MASTERCANDIDATE, 1);--ÉèÎª°ïÖ÷ºòÑ¡ÈË
	Say("¹§Ï², ÄãÒÑ³ÉÎª±»ÌáÃûµÄÈË£¬¿ìÈ¥l·nh2240 ®iÓm cèng hiÕn.", 1, "X¸c nhËn/tong_cancel");
	local tbMsg = {
		mastercandidat	 = GetTongMemberID()
		};
	cTongLog:WriteInfTB("TONG", "master_candidat", nTongID, tbMsg);
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_INICONTRIBUTIVENESS, GetCumulateOffer()); --¼ÇÂ¼µ±Ç°ÊÖ¹¤¹±Ï×¶È,×÷Îª2240ÈÎÎñµÄÆğÊ¼±êÖ¾
end

--ÈÃÓÃ»§ÊäÈëÒªÍ¶µÄÇ®Êı
function inputcontributiveness()
	AskClientForNumber("tong_masterbidding", 1, 500000000, "H·y nhËp vµo con sè: ");
end

-- ¾ºÍ¶£¬×¢Òâ±£´æÃ¿c¸iÈËµÄ¾ºÍ¶ÈÕÆÚ,ÒÑ±ã²¢ÁĞµÄÊ±ºò½øĞĞÅÅÁĞ
function tong_masterbidding(nContributiveness )
	local _Name, nTongID = GetTongName();
	local nMemberID = GetTongMemberID();
	local dwCurrsecond = GetCurServerTime();

	--¼ÆËã½«Òª¿Û³ı¹±Ï×¶È
	local nLastContributiveness = TONGM_GetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS);--ÉÏ´ÎÍ¶¹ıµÄ
	local nCurrTotalOffer = nLastContributiveness + nContributiveness; --×Ü¹²Í¶¹ıµÄ
	local nDeductContributiveness = ceil((nContributiveness/ 20));--Òª¿Û³ıµÄ¹±Ï×¶È
	local nNewcontrvalue = GetContribution() - nDeductContributiveness;
	
	if (nNewcontrvalue < 0) then
		Say("§iÓm cèng hiÕn thÊp h¬n 5% con sè ®· nhËp vµo, kh«ng thÓ tham gia.", 0);
		return
	end
	
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_CONTRIBUTIVENESS, nCurrTotalOffer)
	TONGM_ApplySetTaskValue(nTongID, nMemberID, TONGMTSK_SELFCOMMEND_TIME, dwCurrsecond)--¼ÇÂ¼¾ºÍ¶Ê±¼ä,µ±¹±Ï×¶ÈÏàÍ¬µÄÊ±ºò£¬ÏÈÀ´ÕßÓÅÏÈ
	
	Say("Sè ®iÓm tranh ®ua lµ: "..tostring(nCurrTotalOffer), 0);
	AddContribution((-nDeductContributiveness));

	local tbMsg = {
		contribution     = nCurrTotalOffer,
		selfcommend_time = FormatTime2String(dwCurrsecond)
		}
	cTongLog:WriteInfTB("TONG", "master_bidding", nTongID, tbMsg)
end

---·ÂÖÆ¶¨¹ú°²°ó---------------------------------------------------------------------------
--·ÂÖÆ¶¨¹ú°²°óµÄ±í
ab_detail = {
			[1] = {"An Bang §iÒn Hoµng th¹ch ngäc béi", "»î¶¯·»×Ü¹Ü: Âò <color=yellow>[·ÂÖÆ] An Bang §iÒn Hoµng th¹ch ngäc béi<color> ĞèÒª<color=yellow>200<color> ®iÓm cèng hiÕn, ÄãÍ¬ÒâÂğ?", 200, 218},
			[2] = {"An Bang Cóc hoa Th¹ch chØ hoµn", "»î¶¯·»×Ü¹Ü: Âò <color=yellow>[·ÂÖÆ] An Bang Cóc hoa Th¹ch chØ hoµn <color> ĞèÒª<color=yellow>500<color> ®iÓm cèng hiÕn, ÄãÍ¬ÒâÂğ?", 500, 217},
			[3] = {"An Bang Kª HuyÕt Th¹ch Giíi ChØ", "»î¶¯·»×Ü¹Ü: Âò <color=yellow>[·ÂÖÆ] An Bang Kª HuyÕt Th¹ch Giíi ChØcolor> ĞèÒª<color=yellow>500<color> ®iÓm cèng hiÕn, ÄãÍ¬ÒâÂğ?", 500, 219},
			[4] = {"An Bang B¨ng Tinh Th¹ch H¹ng Liªn", "»î¶¯·»×Ü¹Ü: Âò <color=yellow>[·ÂÖÆ] An Bang B¨ng Tinh Th¹ch H¹ng Liªn<color> ĞèÒª<color=yellow>1000<color> ®iÓm cèng hiÕn, ÄãÍ¬ÒâÂğ?", 1000, 216}
};
function enter_anbang()
	--°²°îµÄÑ¡Ïî
	local tab_ab_content = {};
	local nLoop = 4;

	tinsert(tab_ab_content, "T×m hiÓu vÒ bé An bang pháng chÕ/tong_ab_about");
	for i = 1, nLoop do
		tinsert(tab_ab_content, "Ta muèn mua "..ab_detail[i][1].." ("..ab_detail[i][3].." ®iÓm cèng hiÕn) /#tong_ab_get("..i..")");
	end;
	tinsert(tab_ab_content, "Rêi khái/tong_cancel");
	Say("TÕ §µn:  Ha ha ha…gÇn ®©y, bang héi ®· pháng chÕ ®­îc bé trang bŞ an bang, tuy chØ lµ m« pháng, nh­ng hiÖu qu¶ cña nã còng kh«ng thua g× bé an bang thËt, ngoµi ra, khi dïng chung víi bé an bang thËt vÉn cã thÓ kİch ho¹t ®­îc nh­ th­êng. Ng­¬i cã muèn mua kh«ng?",
	getn(tab_ab_content), tab_ab_content);
end;

function tong_ab_about()
	Say("£º¼ÀÌ³£ºÕâÊÇ·ÂÖÆ°²°î£¬ËäÈ»ĞÔÄÜÓëÕæµÄÓĞ²î±ğ£¬µ«ÊÇÖÆ×÷Ô­ÁÏ±ãÒËºÜ¶à¡£Äã¿ÉÒÔÂò <color=yellow>[·ÂÖÆ] An Bang Cóc hoa Th¹ch chØ hoµn<color>, <color=yellow>[·ÂÖÆ] An Bang Kª HuyÕt Th¹ch Giíi ChØcolor>, <color=yellow>[·ÂÖÆ] An Bang §iÒn Hoµng th¹ch ngäc béi<color>, <color=yellow>[·ÂÖÆ] An Bang B¨ng Tinh Th¹ch H¹ng Liªn<color>.", 0);
end;

function tong_ab_get(nIndex)
	if (nIndex < 1 or nIndex > 4) then
		return
	end;
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	if (GetContribution() < ab_detail[nIndex][3]) then
		Say("TÕ §µn:  §iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ <color=yellow>"..ab_detail[nIndex][3].."<color> ®iÓm, ²»ÄÜÂò¸ÃÎïÆ·, ÇëÏÈÅ¬Á¦ÕÒ¹±Ï×¶È®·.", 0);
		Msg2Player("§iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ, kh«ng thÓ sö dông chøc n¨ng nµy.");
		SetTaskTemp(193, 0);
		return
	end;
	
	AddGoldItem(0, ab_detail[nIndex][4]);
	AddContribution(-ab_detail[nIndex][3]);
	Msg2Player("Sö dông <color=yellow>"..ab_detail[nIndex][3].." ®iÓm cèng hiÕn<color> ®Ó Âò 1<color=yellow>"..ab_detail[nIndex][1].."<color>.")
	SetTaskTemp(193, 0);
end;

-------------------------------°ï»áÉıcÊp½±Àø---------------------------------------
aTongLevelUpPrice = {
	[2] = {	--2cÊpÊ±£ºboss·û£¬ÎäÉñÖ®Ó¡£¬¸ßcÊp»Ô»ÍÖ®¹û
		{20, 100, 200},
		{10, 100, 50},
		{8, 100, 50},
		{6, 100, 50},
		{4, 100, 50},
		{2, 100, 50},
		{1, 100, 50},
	},
	[4] = {	--4cÊpÊ±£ºboss·û£¬ÎäÉñÖ®Ó¡£¬¸ßcÊp»Ô»ÍÖ®¹û
		{30, 200, 200},
		{20, 200, 100},
		{15, 200, 100},
		{10, 200, 100},
		{8, 200, 100},
		{6, 200, 100},
		{4, 200, 100},
	}									}

function LUP_HelpInfo()
	Say("Ö»ĞèÒªÆäÖĞÒ»c¸i <color=red>7<color> ´øÍ·°ï»áµÄ½¨ÉèµÈcÊp´ïµ½cÊp±ğ<color=yellow>2<color> »òÕß<color=yellow>4<color>, "..
	 	"½«ÓÉ°ïÖ÷µ½ÎÒÕâÁì½±£¬½±Æ·¿ÉÄÜÊÇÕÙ»½bossÁîÅÆ£¬Vâ ThÇn Ên¼°¸ßcÊp»Ô»Í¹û£¬µÈcÊpÔ½¸ß£¬½±ÀøÔ½¶à.",
	 	3, "Bang héi ta ®¹t ®ñ ®iÒu kiÖn, muèn nhËn phÇn th­ëng/LUP_GetPrice", "ÎÒÏë¿´½±Æ·ÄÚÈİcÊpµÄphÇn th­ëng/#LUP_PriceInfo(nil)", "BiÕt råi/tong_cancel")	
end

function LUP_PriceInfo(nLevel, nOrder)
	if (nLevel == nil) then		
		Say("H·y lùa chän", 4, "µ±½¨ÉèµÈcÊp´ïµ½2cÊpµÄ½±ÀøcÊpµÄphÇn th­ëng/#LUP_PriceInfo(2)", "µ±½¨ÉèµÈcÊp´ïµ½4cÊpµÄphÇn th­ëng/#LUP_PriceInfo(4)",
			 "Quay l¹i/LUP_HelpInfo", "Rêi khái/tong_cancel")
	elseif nOrder == nil then
		local S = {i = 0, l = nLevel}
		function S:GenParam()
			self.i = self.i+1
			return "µÈcÊp "..self.i.."phÇn th­ëng/#LUP_PriceInfo("..self.l..","..self.i..")"
		end
		Say("H·y lùa chän", 9, S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(), S:GenParam(),
			"Quay l¹i/#LUP_PriceInfo(nil)", "Rêi khái/tong_cancel")
	else
		Say("°ï»á¿ÉÒÔ»ñµÃ<color=yellow>ÕÙ»½bossÁîÅÆ10cÊp<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][1].." <color>cÊp, <color=yellow>Vâ ThÇn Ên<color>(Sau khi Ê¹ÓÃ, 2Ğ¡Ê±ÄÚ¹±Ï×¶È»ñµÃ½«ÎªË«±¶)<color=green> "..aTongLevelUpPrice[nLevel][nOrder][2].." <color> cÊp, <color=yellow>¸ßcÊp»Ô»Í¹û<color><color=green> "..aTongLevelUpPrice[nLevel][nOrder][3].." <color> qu¶.",2,
			"Quay l¹i/#LUP_PriceInfo("..nLevel..",nil)", "Rêi khái/tong_cancel")
	end
end

function LUP_PriceInfo2()
	Say("", 4, "µ±½¨ÉèµÈcÊp´ïµ½2cÊpÊ±µÄ½±Àø/LUP_PriceInfo2", "µ±½¨ÉèµÈcÊp´ïµ½2cÊpÊ±µÄ½±Àø/LUP_PriceInfo4",
		 "Quay l¹i/LUP_HelpInfo", "Rêi khái/tong_cancel")
end

function LUP_GetPrice()
	local _,nTongID = GetTongName();
	local figure = TONGM_GetFigure(nTongID, GetName())
	--Èç¹û²»ÊÇ°ïÖ÷
	if (figure ~= TONG_MASTER) then
		Say("ThËt ®¸ng tiÕc, chØ cã bang chñ míi cã thÓ nhËn phÇn th­ëng.", 0)
		return
	end
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("²»ĞĞÁË, ²»»á²»ÊÇÆäÖĞ1c¸i <color=red>7<color> µÚÒ»c¸i´ïµ½µÈcÊpµÄ°ï»á"..nLevel..", kh«ng thÓ nhËn th­ëng.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "Quİ bang lµ bang héi thø <color=red>"..nOrder.."<color> ÉıcÊpµ½<color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", phÇn th­ëng ®· nhËn hÕt råi.", 0)
		return
	elseif (nPrice < 0) then --Ã»Áì¹ı½±
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	local tbSel = {}
	if (nBossFu > 0)then
		tinsert(tbSel, "NhËn tr­íc "..nBossFu.." µÈcÊpÎª10cÊpµÄÕÙ»½bossÁîÅÆ/#LUP_GivePrice(1,"..nBossFu..")")
	end
	if (nContributionPie >= 1 and nContributionPie < 20)then
		tinsert(tbSel, "l·nh"..nContributionPie.." c¸i Vâ ThÇn Ên/#LUP_GivePrice(2,"..nContributionPie..")")
	elseif (nContributionPie >= 20)then
		tinsert(tbSel, "NhËn tr­íc 20 c¸i Vâ ThÇn Ên/#LUP_GivePrice(2, 20)")
		if (nContributionPie >= 40)then
			tinsert(tbSel, "NhËn tr­íc 40 c¸i Vâ ThÇn Ên/#LUP_GivePrice(2, 40)")
			if (nContributionPie >= 60)then
				tinsert(tbSel, "NhËn tr­íc 60 c¸i Vâ ThÇn Ên/#LUP_GivePrice(2, 60)")
			end	
		end
	end
	if (nFruit >= 1 and nFruit < 20)then
		tinsert(tbSel, "l·nh"..nFruit.." c¸i¸ßcÊp»Ô»Í¹û/#LUP_GivePrice(3,"..nFruit..")")
	elseif (nFruit >= 20)then
		tinsert(tbSel, "NhËn tr­íc 20 c¸i¸ßcÊp»Ô»Í¹û/#LUP_GivePrice(3, 20)")
		if (nFruit >= 40)then
			tinsert(tbSel, "NhËn tr­íc 40 c¸i¸ßcÊp»Ô»Í¹û/#LUP_GivePrice(3, 40)")
			if (nFruit >= 60)then
				tinsert(tbSel, "NhËn tr­íc 60 c¸i¸ßcÊp»Ô»Í¹û/#LUP_GivePrice(3, 60)")
			end	
		end
	end	
	tinsert(tbSel, "T¹m thêi ch­a lÊy/tong_cancel")
	Say(szOrder..", hiÖn t¹i cã <color=yellow>"..nBossFu.."<color> c¸i<color=yellow>10cÊpÕÙ»½bossÁîÅÆ<color>, <color=yellow>"..nContributionPie.."<color> c¸i <color=yellow>Vâ ThÇn Ên<color> vµ <color=yellow> "..nFruit.."<color> <color=yellow>¸ßcÊp»Ô»ÍÖ®¹û<color>¿ÉÒÔl·nh£¬Çë¾ö¶¨´Ë´Îl·nhÎïÆ·¼°ÊıÁ¿¶àÉÙ¡£", 
		getn(tbSel), tbSel)
end

function LUP_GivePrice(nWhich, num)
	local aName = {"10cÊpÕÙ»½bossÁîÅÆ", "Vâ ThÇn Ên", "»Ô»Í¹û(¸ßcÊp) "}
	Say("§· NhËn tr­íc <color=yellow>"..num.."<color> <color=yellow>"..aName[nWhich].."<color>, h·y b¶o ®¶m hµnh trang ®ñ chç trèng, nÕu cã rít ra ®Êt bŞ ng­êi kh¸c nhÆt ®­îc còng ®õng tr¸ch ta kh«ng nh¾c nhë.", 
		2, "ÎÒÖªµÀÁË!cÊpµÄ½±Àø/#LUP_GivePrice_OK("..nWhich..","..num..")", "H·y ®îi ta xÕp l¹i hµnh trang ®·./tong_cancel")
end

function LUP_GivePrice_OK(nWhich, num)
	local _,nTongID = GetTongName();	
	local nLevel = TONG_GetBuildLevel(nTongID)
	local nOrder = TONG_GetTaskValue(nTongID, TONGTSK_LUP_ORDER)
	if (nLevel >= 4)then
		nLevel = 4
	else
		nLevel = 2
	end
	if nOrder <=0 or nOrder > 7 then
		Say("ÕæÊÇÒÅº¶£¬¹ó°ï²»ÊôÓÚ7c¸i×îÇ°ÁĞµÄ°ï»á£¬cÊp±ğ´ïµ½"..nLevel..", kh«ng thÓ nhËn th­ëng.", 0)
		return
	end
	local nPrice = TONG_GetTaskValue(nTongID, TONGTSK_LUP_PRICE)
	local nBossFu, nContributionPie, nFruit
	local szOrder = "Quİ bang lµ bang héi thø <color=red>"..nOrder.."<color> ÉıcÊpµ½<color=yellow>"..nLevel.."<color>."
	if (nPrice == 0)then
		Say(szOrder..", phÇn th­ëng ®· nhËn hÕt råi.", 0)
		return
	elseif (nPrice < 0) then --Ã»Áì¹ı½±
		nBossFu = aTongLevelUpPrice[nLevel][nOrder][1]
		nContributionPie = aTongLevelUpPrice[nLevel][nOrder][2]
		nFruit = aTongLevelUpPrice[nLevel][nOrder][3]
	else
		nBossFu = floor(mod(nPrice, 1000))
		nPrice = floor(nPrice/1000)
		nContributionPie = mod(nPrice, 1000)
		nPrice = floor(nPrice/1000)
		nFruit = nPrice
	end
	if nWhich == 1 then
		if (nBossFu < num)then
			return
		end
		nBossFu = nBossFu - num
		--½±ÀøÕÙ»½·û
		for i = 1,num do
			AddItem(6,1,1022,10,0,0,0)
		end
		local szMsg = GetName().."l·nh°ï»áÉıcÊp½±Àø: 10cÊpÕÙ»½bossÁîÅÆ"..num.."c¸i"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	elseif nWhich == 2 then
		if (nContributionPie < num)then
			return
		end
		nContributionPie = nContributionPie - num
		--½±ÀøÎäÉñÖ®Ó¡(Ò»c¸iÔÂÓĞĞ§)
		local ntime = GetCurServerTime() + 7 * 24 * 3600;
		local nTimeParam = tonumber(FormatTime2String("%y%m%d",ntime))	
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,1264,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			SetSpecItemParam(nItemIdx, 2, tonumber(FormatTime2String("%y",ntime)));
			SetSpecItemParam(nItemIdx, 3, tonumber(FormatTime2String("%m",ntime)));
			SetSpecItemParam(nItemIdx, 4, tonumber(FormatTime2String("%d",ntime)));
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."l·nh°ï»áÉıcÊp½±Àø: Vâ ThÇn Ên"..num.."c¸i"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)		
	elseif nWhich == 3 then
		if nFruit < num then
			return
		end
		nFruit = nFruit - num
		local ntime = tonumber(date("%y%m%d"));
		--½±Àø¸ßcÊp»Ô»ÍÖ®¹û
		for i = 1,num do
			local idx = NewItemEx(4,0,0,6,1,906,1,1,1)
			SetSpecItemParam(idx, 1, ntime);
			if AddItemByIndex(idx) <= 0 then
				print("Can Not AddItem To Player: jitan.lua\n", idx)
				RemoveItemByIndex(idx)
			end
		end
		local szMsg = GetName().."l·nh°ï»áÉıcÊp½±Àø: »Ô»Í¹û¸ßcÊp cÊp"..num.."c¸i"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
	end	
	TONG_ApplySetTaskValue(nTongID, TONGTSK_LUP_PRICE, 1000 * 1000 * nFruit + 1000 * nContributionPie + nBossFu)
end

function tong_cancel()
end

