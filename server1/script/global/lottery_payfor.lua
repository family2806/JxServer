TEMP_QID = 122;
TEMP_QCHOOSE = 123;
GOLD_TIMESTEMP = 4001;
GOLD_SERIES = 4000;
GOLD_COUNT = 4002;
FIRSTDAY = 816;

GLBID_GOLD_LOTTERY_COUNT = 6;	--ȫ�ֱ���ID of ���������ѷ����Ļƽ��Ʊ��
-- �ߴ���е�ͼ
-- 1-����, 2-�ɶ�, 3-����, 4-�꾩, 5-����, 6-����, 7-�ٰ�
arynCityMapID = { 1, 11, 162, 37, 78, 80, 176 }
nMaxGoldLottery = 100000;		--ÿ̨GameServer�Ͽɷ��������ƽ��Ʊ��

function onPayTicket()
if (IsCharged() ~= 1 ) then
	 Say("Th�t xin l�i , ng�i ch�a sung tr� gi� , cho n�n kh�ng c�ch n�o tham gia nh� �i�n th�nh h�i v� s� ho�t ��ng . ", 0)
	return
end
nCount = GetPayTicketCount();

if (nCount == 0 ) then
	Say("Th�t xin l�i , b�y gi� kh�ng t�i ��i v� s� ��ch th�i gian , xin/m�i ng�i � B�c Kinh th�i gian s�ng s�m 9 �i�m ��n ng�y �� bu�i t�i 22 �i�m t�i ��i �i , c�m �n . ", 0) 
	return
end;

Tab = {};

for i = 1, nCount + 1 do 
	Tab[i] = GetQuestionTip(GetPayTicket(i)).."/OPAsk";
end;

Tab[nCount + 1] = "Kh�ng/Cancel";
Say("Mu�n ��i g� ?", nCount + 1, Tab)
end;

function OPAsk(nSel)
	nQuestion, nBonus = GetPayTicket(nSel + 1);
	if (nQuestion > 0 ) then 
		nAnswer = GetQAnswer(nQuestion)
		if (nAnswer > 0) then 
			if (nQuestion ~= 1000) then 
				str = format("C�nh �o�n :%s , k�t qu� :%s , ti�n th��ng :%d . ng�i mu�n ��i t��ng sao ?", GetQuestion(nQuestion), GetChoose(nQuestion, nAnswer), nBonus )
			else
				lGold = GetByte(nAnswer, 1);
				lYing = GetByte(nAnswer,2);
				lTong = GetByte(nAnswer,3);
				str = format("C�nh �o�n :%s, k�t qu� : kim b�i %d kh�i  ng�n b�i %d kh�i  ��ng b�i %d kh�i , ti�n th��ng :%d . ng��i mu�n ��i t��ng sao ?", GetQuestion(nQuestionI), lGold, lYing, lTong,nBonus)
			end
			Say(str, 2, "��i t��ng /OPOnPayFor", "Kh�ng ��i t��ng /Cancel");
			SetTaskTemp(TEMP_QID, nQuestion)
		end
	end
end;


function OPOnPayFor()
	nQuestion = GetTaskTemp(TEMP_QID)
	nTotal, nRight, nBonus = CheckTicket(75, nQuestion);
	
	if (nTotal == 0) then
		Say("Th�t xin l�i , ng�i mua v� s� kh�ng c� ��p ��i v�i , ��n th�m n�a l� , kh�ng mu�n bu�ng tha cho nga , c� l� ��i t��ng �ang � ch� ng�i , ho�ng kim trang b� ��y ", 0)
	else
		nTotalBonus = nBonus * nRight
		local str = "";
		if (nQuestion ~= 1000) then 
			str = format("Ng�i t�ng c�ng c� %d t� c�i n�y lo�i t��ng phi�u , trong �� trung t��ng ��ch c� %d t� , l�y ���c t�ng ti�n th��ng v� %d, ch�c m�ng ng�i ! n�u nh� ng�i trung t��ng , ch�ng ta c�n ngh� t�ng cho ng�i ho�ng kim v� s� , b�ng n�y v� s� c� th� s� ��t ���c m�t m�n ho�ng kim trang b� nga . ho�ng kim v� s� ��ch khai t��ng nh�t k� �ang � t�i nay ��ch 22 �i�m 30 ��n 24 �i�m . ", nTotal,nRight, nTotalBonus);
		else
			str = format("Ng�i t�ng c�ng c� %d t� c�i n�y lo�i t��ng phi�u , trong �� trung t��ng ��ch c� %d t� , l�y ���c t�ng ti�n th��ng v� %d, ch�c m�ng ng�i ! n�u nh� ng�i trung t��ng , ch�ng ta c�n ngh� t�ng cho ng�i ho�ng kim v� s� , b�ng n�y v� s� c� th� s� ��t ���c m�t m�n l�n n�y nh� �i�n th�nh h�i ��ch ho�ng kim trang b� ��i t��ng  khai t��ng nh�t k� � 9 th�ng 1 ng�y 9 th�ng 2 ng�y v�n 22 �i�m 30 ��n 24 �i�m . ", nTotal,nRight, nTotalBonus);
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
				UpdateSDBRecord("GoldLottery0901", LotteryId, LotteryTime, 0) --�ƽ�󽱼�¼Ϊ9 th�ng 1�յĲ�Ʊ
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
		Say("Th�t xin l�i , l�n n�y nh� �i�n th�nh h�i ��ch b�nh th��ng ho�ng kim v� s� ��ch ��i t��ng ho�t ��ng �� k�t th�c . ",0)
		return
	end
	
	nIntervalDay = tonumber(date("%m%d")) - FIRSTDAY + 1;
	
	if (nIntervalDay <=0) then 
		return
	end

	for i = 1, nIntervalDay do 
		nMonth = floor((FIRSTDAY + nIntervalDay - i) / 100)
		nDay = mod(FIRSTDAY + nIntervalDay - i , 100)
		PayTab[i] = nMonth.." th�ng "..nDay.." ng�y ho�ng kim v� s� /doPayforGold"
	end;
	PayTab[nIntervalDay + 1] = "���öҽ���/Cancel";
	Say("Ng��i mu�n ��i m�t ng�y kia ��ch ho�ng kim v� s� ��i t��ng ? ", getn(PayTab), PayTab);
--	Say("V�n ng�y trung t��ng ��ch ho�ng kim v� s� s� v� ["..GetGlbValue(GOLD_TIMESTEMP).."-"..GetGlbValue(GOLD_SERIES).."], l�y ���c t��ng ng��i c� th� ph�i ��n ng�u nhi�n l�y ���c ho�ng kim trang b� m�t m�n  ng��i mu�n ��i t��ng sao ? ", 2, "T�t /doPayforGold", "Kh�ng c�n /Cancel")
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
		Say("Th�t xin l�i , tr��c m�t n�n nh�t k� ��ch ho�ng kim v� s� c� th� ch�a l�i/m� ra , xin sau n�a ��i t��ng , c�m �n . ", 0)
		return
	end;

	 nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("Ch�c m�ng ng��i , ng��i ho�ng kim v� s� trung t��ng li�u , ��t ���c ho�ng kim trang b� m�t m�n ", 0)
			
			nMonth = floor((FIRSTDAY + nSel)/100);
			nDay = mod( (FIRSTDAY + nSel) , 100)

			AddGoldItem(0, random(159,167))
			Msg2Player("Ch�c m�ng ng��i ��t ���c ho�ng kim trang b� m�t m�n ")
			WriteLog(GetAccount()..","..GetName().."����"..FIRSTDAY+nSel.."�ƽ��Ʊ�󽱣���ûƽ�װ��һ������ƱID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = " ch�c m�ng : nh� ch�i "..GetName().." trung li�u "..nMonth.." th�ng "..nDay.." ng�y ��ch ho�ng kim v� s� ��i t��ng , ��t ���c ho�ng kim trang b� m�t m�n ";
			AddGlobalCountNews(msg, 1);
		end
	else
		Say("Th�t xin l�i , trung t��ng s� v� "..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).." , tr�n ng��i ng��i khai t��ng ��ch ho�ng kim v� s� trung kh�ng c� th�t x�ng ��ch trung t��ng d�y s� . ", 0)
	end
end;



function doPayforGreateGold()

	nIntervalDay = 901 - FIRSTDAY;
	
	dayGOLD_SERIES = GOLD_SERIES + nIntervalDay * 2;
	dayGOLD_TIMESTEMP = GOLD_TIMESTEMP + nIntervalDay * 2;

	if ( GetGlbValue(dayGOLD_TIMESTEMP) == 0 ) then 
		Say("Th�t xin l�i , tr��c m�t nh� �i�n th�nh h�i c�nh �o�n tr�ng n��c t��ng b�i ��m ��ch ho�ng kim v� s� trung t��ng s� c� th� ch�a l�i/m� ra , xin sau n�a ��i t��ng , c�m �n . ", 0)
		return
	end;

	
	nItem = FindSpecItemParam2(1, 76, GetGlbValue(dayGOLD_SERIES), GetGlbValue(dayGOLD_TIMESTEMP));
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) > 0) then 
			Say("Nhi�t li�t ��a ch�c m�ng ng�i , ng�i ��ch ho�ng kim v� s� trung t��ng li�u , trung li�u �o v�n h� li�t ho�t ��ng ��ch l�n nh�t t��ng  ��t ���c nh� �i�n chi h�n  B�c Kinh chi m�ng cao c�p ho�ng kim chi�c nh�n m�t ��i ", 0)
			AddGoldItem(0, 141)
			AddGoldItem(0, 142)
			Msg2Player("Ng�i ��t ���c nh� �i�n chi h�n  B�c Kinh chi m�ng m�t ��i ho�ng kim chi�c nh�n ")
			WriteLog(GetAccount()..","..GetName().." trung li�u �o v�n Trung qu�c ��i t��ng b�i ��m ��ch ho�ng kim v� s� ��i t��ng , ��t ���c �o v�n chi�c nh�n trang b� m�t b� . v� s� ID"..GetGlbValue(dayGOLD_TIMESTEMP).."-".. GetGlbValue(dayGOLD_SERIES))
			msg = " nhi�t li�t ch�c m�ng : nh� ch�i "..GetName().." trung li�u nh� �i�n th�nh h�i Trung qu�c ��i t��ng b�i ��m c�nh �o�n ��ch ho�ng kim ��i t��ng , ��t ���c nh� �i�n chi h�n  B�c Kinh chi m�ng cao c�p ho�ng kim chi�c nh�n m�t ��i ";
			AddGlobalNews(msg);
		end
	else
		Say("Th�t xin l�i , trung t��ng s� v� "..GetGlbValue(dayGOLD_TIMESTEMP).."-"..GetGlbValue(dayGOLD_SERIES).." , tr�n ng��i ng��i khai t��ng ��ch ho�ng kim v� s� trung kh�ng c� th�t x�ng ��ch trung t��ng d�y s� . ", 0)
	end
end;



function getGoldLotteryID()
	local nMapCount = getn( arynCityMapID );
	local nCurrServerID = nMapCount + 1;
	for i = 1, nMapCount do
		if( SubWorldID2Idx( arynCityMapID[i] ) >= 0 ) then	--���õ�ͼ�Ƿ�������жϵ�ǰ������һ̨��������
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