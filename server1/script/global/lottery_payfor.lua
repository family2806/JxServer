TEMP_QID = 122;
TEMP_QCHOOSE = 123;
GOLD_TIMESTEMP = 4001;
GOLD_SERIES = 4000;
GOLD_COUNT = 4002;
FIRSTDAY = 816;

GLBID_GOLD_LOTTERY_COUNT = 6;	--È«¾Ö±äÁ¿ID of ·şÎñÆ÷ÉÏÒÑ·¢³öµÄ»Æ½ğ²ÊÆ±Êı
-- Æß´ó³ÇÊĞµØÍ¼
-- 1-·ïÏè, 2-³É¶¼, 3-´óÀí, 4-ãê¾©, 5-ÏåÑô, 6-ÑïÖİ, 7-ÁÙ°²
arynCityMapID = { 1, 11, 162, 37, 78, 80, 176 }
nMaxGoldLottery = 100000;		--Ã¿Ì¨GameServerÉÏ¿É·¢³öµÄ×î¶à»Æ½ğ²ÊÆ±Êı

function onPayTicket()
if (IsCharged() ~= 1 ) then
	 Say("ThËt xin lçi , ngµi ch­a sung trŞ gi¸ , cho nªn kh«ng c¸ch nµo tham gia nh· ®iÓn thŞnh héi vĞ sè ho¹t ®éng . ", 0)
	return
end
nCount = GetPayTicketCount();

if (nCount == 0 ) then
	Say("ThËt xin lçi , b©y giê kh«ng tíi ®æi vĞ sè ®İch thêi gian , xin/mêi ngµi ë B¾c Kinh thêi gian s¸ng sím 9 ®iÓm ®Õn ngµy ®ã buæi tèi 22 ®iÓm tíi ®æi ®i , c¸m ¬n . ", 0) 
	return
end;

Tab = {};

for i = 1, nCount + 1 do 
	Tab[i] = GetQuestionTip(GetPayTicket(i)).."/OPAsk";
end;

Tab[nCount + 1] = "Kh«ng/Cancel";
Say("Muèn ®æi g× ?", nCount + 1, Tab)
end;

function OPAsk(nSel)
	nQuestion, nBonus = GetPayTicket(nSel + 1);
	if (nQuestion > 0 ) then 
		nAnswer = GetQAnswer(nQuestion)
		if (nAnswer > 0) then 
			if (nQuestion ~= 1000) then 
				str = format("C¹nh ®o¸n :%s , kÕt qu¶ :%s , tiÒn th­ëng :%d . ngµi muèn ®æi t­ëng sao ?", GetQuestion(nQuestion), GetChoose(nQuestion, nAnswer), nBonus )
			else
				lGold = GetByte(nAnswer, 1);
				lYing = GetByte(nAnswer,2);
				lTong = GetByte(nAnswer,3);
				str = format("C¹nh ®o¸n :%s, kÕt qu¶ : kim bµi %d khèi  ng©n bµi %d khèi  ®ång bµi %d khèi , tiÒn th­ëng :%d . ng­¬i muèn ®æi t­ëng sao ?", GetQuestion(nQuestionI), lGold, lYing, lTong,nBonus)
			end
			Say(str, 2, "§æi t­ëng /OPOnPayFor", "Kh«ng ®æi t­ëng /Cancel");
			SetTaskTemp(TEMP_QID, nQuestion)
		end
	end
end;


function OPOnPayFor()
	nQuestion = GetTaskTemp(TEMP_QID)
	nTotal, nRight, nBonus = CheckTicket(75, nQuestion);
	
	if (nTotal == 0) then
		Say("ThËt xin lçi , ngµi mua vĞ sè kh«ng cã ®¸p ®èi víi , ®ãn thªm n÷a lÖ , kh«ng muèn bu«ng tha cho nga , cã lÏ ®¹i t­ëng ®ang ë chê ngµi , hoµng kim trang bŞ ®©y ", 0)
	else
		nTotalBonus = nBonus * nRight
		local str = "";
		if (nQuestion ~= 1000) then 
			str = format("Ngµi tæng céng cã %d tê c¸i nµy lo¹i t­ëng phiÕu , trong ®ã trung t­ëng ®İch cã %d tê , lÊy ®­îc tæng tiÒn th­ëng v× %d, chóc mõng ngµi ! nÕu nh­ ngµi trung t­ëng , chóng ta cßn nghÜ tÆng cho ngµi hoµng kim vĞ sè , b»ng nµy vĞ sè cã thÓ sÏ ®¹t ®­îc mét mãn hoµng kim trang bŞ nga . hoµng kim vĞ sè ®İch khai t­ëng nhËt kú ®ang ë tèi nay ®İch 22 ®iÓm 30 ®Õn 24 ®iÓm . ", nTotal,nRight, nTotalBonus);
		else
			str = format("Ngµi tæng céng cã %d tê c¸i nµy lo¹i t­ëng phiÕu , trong ®ã trung t­ëng ®İch cã %d tê , lÊy ®­îc tæng tiÒn th­ëng v× %d, chóc mõng ngµi ! nÕu nh­ ngµi trung t­ëng , chóng ta cßn nghÜ tÆng cho ngµi hoµng kim vĞ sè , b»ng nµy vĞ sè cã thÓ sÏ ®¹t ®­îc mét mãn lÇn nµy nh· ®iÓn thŞnh héi ®İch hoµng kim trang bŞ ®¹i t­ëng  khai t­ëng nhËt kú ë 9 th¸ng 1 ngµy 9 th¸ng 2 ngµy v·n 22 ®iÓm 30 ®Õn 24 ®iÓm . ", nTotal,nRight, nTotalBonus);
		end
		
		local logstr = format("[Lottery] Acc:%s Role:%s Q:%d QSum:%d QWin:%d Bonus:%d", GetAccount(), GetName(), nQuestion, nTotal, nRight, nTotalBonus )
		WriteLog(logstr);	
		Earn(nTotalBonus);
		Say(str,0)
		
		for i = 1, nRight do 
			item = AddItem(6,1,76, 1,0,0);
			LotteryId = getGoldLotteryID();
			LotteryTime = getCurrTime();
			SetSpecItemParam(item , 1, LotteryId)
			SetSpecItemParam(item , 2, LotteryTime)
			P3 = SetByte(GetByte(LotteryId, 3), 2, GetByte(LotteryId,4))
			P4 = SetByte(GetByte(LotteryTime, 3), 2, GetByte(LotteryTime,4))
			SetSpecItemParam(item , 3, P3)
			SetSpecItemParam(item , 4, P4)
			SetSpecItemParam(item, 5, nQuestion)
			if (nQuestion == 1000) then 
				SetSpecItemParam(item, 5, 1000)
				UpdateSDBRecord("GoldLottery0901", LotteryId, LotteryTime, 0) --»Æ½ğ´ó½±¼ÇÂ¼Îª9 th¸ng 1ÈÕµÄ²ÊÆ±
			else
				UpdateSDBRecord("GoldLottery"..date("%m%d"),LotteryId, LotteryTime, 0)
			end
			SyncItem(item)
		end;
	end;
end;

function Cancel()

end;

function onPayforGoldLottery()
	local PayTab={};
	if (tonumber(date("%m%d")) > 831 ) then 
		Say("ThËt xin lçi , lÇn nµy nh· ®iÓn thŞnh héi ®İch b×nh th­êng hoµng kim vĞ sè ®İch ®æi t­ëng ho¹t ®éng ®· kÕt thóc . ",0)
		return
	end
	
	nIntervalDay = tonumber(date("%m%d")) - FIRSTDAY + 1;
	
	if (nIntervalDay <=0) then 
		return
	end

	for i = 1, nIntervalDay do 
		nMonth = floor((FIRSTDAY + nIntervalDay - i) / 100)
		nDay = mod(FIRSTDAY + nIntervalDay - i , 100)
		PayTab[i] = nMonth.." th¸ng "..nDay.." ngµy hoµng kim vĞ sè /doPayforGold"
	end;
	PayTab[nIntervalDay + 1] = "²»ÓÃ¶Ò½±ÁË/Cancel";
	Say("Ng­¬i muèn ®æi mét ngµy kia ®İch hoµng kim vĞ sè ®¹i t­ëng ? ", getn(PayTab), PayTab);
--	Say("Vèn ngµy trung t­ëng ®İch hoµng kim vĞ sè sè v× ["..GetGlbValue(GOLD_TIMESTEMP).."-"..GetGlbValue(GOLD_SERIES).."], lÊy ®­îc t­ëng ng­êi cã thÓ ph¶i ®Õn ngÉu nhiªn lÊy ®­îc hoµng kim trang bŞ mét mãn  ng­¬i muèn ®æi t­ëng sao ? ", 2, "Tèt /doPayforGold", "Kh«ng cÇn /Cancel")
end

function doPayforGold(nDay)

	ldate = tonumber(date("%m%d"))
	
	if (ldate > 831) then 
		return 
	end
	
	nIntervalDay = ldate - FIRSTDAY + 1;

	if (nIntervalDay <= 0) then
		return
	end

	nSel =  nIntervalDay - nDay - 1;
	dayGOLD_SERIES = GOLD_SERIES + nSel * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nSel * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("ThËt xin lçi , tr­íc m¾t nªn nhËt kú ®İch hoµng kim vĞ sè cã thÓ ch­a l¸i/më ra , xin sau n÷a ®æi t­ëng , c¸m ¬n . ", 0)
		return
	end;

	 nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("Chóc mõng ng­¬i , ng­¬i hoµng kim vĞ sè trung t­ëng liÔu , ®¹t ®­îc hoµng kim trang bŞ mét mãn ", 0)
			
			nMonth = floor((FIRSTDAY + nSel)/100);
			nDay = mod( (FIRSTDAY + nSel) , 100)

			AddGoldItem(0, random(159,167))
			Msg2Player("Chóc mõng ng­¬i ®¹t ®­îc hoµng kim trang bŞ mét mãn ")
			WriteLog(GetAccount()..","..GetName().."ÖĞÁË"..FIRSTDAY+nSel.."»Æ½ğ²ÊÆ±´ó½±£¬»ñµÃ»Æ½ğ×°±¸Ò»¼ş¡£²ÊÆ±ID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = " chóc mõng : nhµ ch¬i "..GetName().." trung liÔu "..nMonth.." th¸ng "..nDay.." ngµy ®İch hoµng kim vĞ sè ®¹i t­ëng , ®¹t ®­îc hoµng kim trang bŞ mét mãn ";
			AddGlobalCountNews(msg, 1);
		end
	else
		Say("ThËt xin lçi , trung t­ëng sè v× "..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).." , trªn ng­êi ng­¬i khai t­ëng ®İch hoµng kim vĞ sè trung kh«ng cã thÊt xøng ®İch trung t­ëng d·y sè . ", 0)
	end
end;



function doPayforGreateGold()

	nIntervalDay = 901 - FIRSTDAY;
	
	dayGOLD_SERIES = GOLD_SERIES + nIntervalDay * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nIntervalDay * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("ThËt xin lçi , tr­íc m¾t nh· ®iÓn thŞnh héi c¹nh ®o¸n tróng n­íc t­ëng bµi ®Õm ®İch hoµng kim vĞ sè trung t­ëng sè cã thÓ ch­a l¸i/më ra , xin sau n÷a ®æi t­ëng , c¸m ¬n . ", 0)
		return
	end;

	
	nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("NhiÖt liÖt ®Şa chóc mõng ngµi , ngµi ®İch hoµng kim vĞ sè trung t­ëng liÔu , trung liÔu ¸o vËn hÖ liÖt ho¹t ®éng ®İch lín nhÊt t­ëng  ®¹t ®­îc nh· ®iÓn chi hån  B¾c Kinh chi méng cao cÊp hoµng kim chiÕc nhÉn mét ®«i ", 0)
			AddGoldItem(0, 141)
			AddGoldItem(0, 142)
			Msg2Player("Ngµi ®¹t ®­îc nh· ®iÓn chi hån  B¾c Kinh chi méng mét ®«i hoµng kim chiÕc nhÉn ")
			WriteLog(GetAccount()..","..GetName().." trung liÔu ¸o vËn Trung quèc ®éi t­ëng bµi ®Õm ®İch hoµng kim vĞ sè ®¹i t­ëng , ®¹t ®­îc ¸o vËn chiÕc nhÉn trang bŞ mét bé . vĞ sè ID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = " nhiÖt liÖt chóc mõng : nhµ ch¬i "..GetName().." trung liÔu nh· ®iÓn thŞnh héi Trung quèc ®éi t­ëng bµi ®Õm c¹nh ®o¸n ®İch hoµng kim ®¹i t­ëng , ®¹t ®­îc nh· ®iÓn chi hån  B¾c Kinh chi méng cao cÊp hoµng kim chiÕc nhÉn mét ®«i ";
			AddGlobalNews(msg);
		end
	else
		Say("ThËt xin lçi , trung t­ëng sè v× "..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).." , trªn ng­êi ng­¬i khai t­ëng ®İch hoµng kim vĞ sè trung kh«ng cã thÊt xøng ®İch trung t­ëng d·y sè . ", 0)
	end
end;



function getGoldLotteryID()
	local nMapCount = getn( arynCityMapID );
	local nCurrServerID = nMapCount + 1;
	for i = 1, nMapCount do
		if( SubWorldID2Idx( arynCityMapID[i] ) >= 0 ) then	--ÀûÓÃµØÍ¼ÊÇ·ñ´æÔÚÀ´ÅĞ¶Ïµ±Ç°ÊÇÔÚÄÄÒ»Ì¨·şÎñÆ÷ÉÏ
			nCurrServerID = i;
			break;
		end
	end
	local nLotteryCount = GetGlbValue( GLBID_GOLD_LOTTERY_COUNT );
	SetGlbValue( GLBID_GOLD_LOTTERY_COUNT, nLotteryCount + 1 );
	return nMaxGoldLottery * ( nCurrServerID - 1 ) + nLotteryCount;
end

function getCurrTime()
	return tonumber( date( "%m%d%H%M%S" ) );
end