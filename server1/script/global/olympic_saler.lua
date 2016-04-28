Include("\\script\\global\\olympics_award.lua")

TEMP_QID = 122;
TEMP_QCHOOSE = 123;

function onBuyTicket()
if (IsCharged() ~= 1 ) then
	 Say("ThËt xin lçi , ngµi ch­a sung trÞ gi¸ , cho nªn kh«ng c¸ch nµo tham gia nh· ®iÓn thÞnh héi vÐ sè ho¹t ®éng . ", 0)
	return
end
nCount = GetTicketCount();

if (nCount == 0 ) then 
	Say("ThËt xin lçi , b©y giê t¹m thêi kh«ng cã bÊt kú vÐ sè cã thÓ mua ", 0)
	return
end;

Tab = {};
for i = 1, nCount do 
	Tab[i] = GetQuestionTip(GetTicket(i)).."/OSAsk";
end;
Tab[nCount + 1] = "Kh«ng/Cancel";
Say("5000 mét tê vÐ sè , ngµi muèn c¹nh ®o¸n c¸i nµo ?", nCount + 1, Tab)
end;

function OSAsk(nSel)
	nQId = GetTicket(nSel + 1);

	if (nQId == 1000) then
		onMedalmain()
		return	
	end

	Choose = {};
	ChooseCount = GetChooseCount(nQId);
	for i = 1,  ChooseCount do 
		Choose[i] = GetChoose(nQId, i).."/OSSale";
	end;
	Choose[ChooseCount + 1] = "Kh«ng/Cancel";
	Say(GetQuestion(nQId), ChooseCount + 1, Choose);
	SetTaskTemp(TEMP_QID, nQId)
end;

function OSSale(nSel)
	if (GetTaskTemp(TEMP_QID) == 0) then 
		return
	end
	SetTaskTemp(TEMP_QCHOOSE, nSel + 1)
	Say(GetQuestion(GetTaskTemp(TEMP_QID)).."\n ®Çu :<color=yellow>"..GetChoose(GetTaskTemp(TEMP_QID), GetTaskTemp(TEMP_QCHOOSE)).."<color>\n gi¸ c¶ :5000", 2, "H¶o , ta mua /OSOnSale", "T¹m thêi kh«ng mua /OSCancel");
end;

function OSOnSale()
	nQId = GetTaskTemp(TEMP_QID);
	nQChoose = GetTaskTemp(TEMP_QCHOOSE);
	if (nQId > 0 and nQChoose > 0) then 
		if (Pay(GetQuestionPrice(nQId)) > 0) then 
			if (AddTicket(nQId, nQChoose) == 1) then
				nItem = AddItem(6,1,75,1,0,0)
				SetSpecItemParam(nItem, 1, nQId)
				SetSpecItemParam(nItem, 2, nQChoose)
				SyncItem(nItem)
				Msg2Player("Thµnh c«ng mua ®­îc vÐ sè mét tê ")
			else
				Earn(GetQuestionPrice(nQId))
				Say("ThËt xin lçi , nªn lo¹i vÐ sè ®· kh«ng c¸ch nµo n÷a mua . ",0)
			end
		else
			Say("Ngµi trªn ng­êi mang ®Ých kh«ng ®ñ tiÒn , xin/mêi ®i tr­íc lÊy trë l¹i mua ®i . ",0)
		end;
	end
end

function OSCancel()

end;
