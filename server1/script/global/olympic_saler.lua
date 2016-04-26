Include("\\script\\global\\olympics_award.lua")

TEMP_QID = 122;
TEMP_QCHOOSE = 123;

function onBuyTicket()
if (IsCharged() ~= 1 ) then
	 Say("对不起，您尚未充值，所以无法参加雅典盛会彩票活动。", 0)
	return
end
nCount = GetTicketCount();

if (nCount == 0 ) then 
	Say("对不起，现在暂时没有任何彩票可以购买！", 0)
	return
end;

Tab = {};
for i = 1, nCount do 
	Tab[i] = GetQuestionTip(GetTicket(i)).."/OSAsk";
end;
Tab[nCount + 1] = "暂时不参加竞猜了/Cancel";
Say("5000一张彩票，您要竞猜哪个?", nCount + 1, Tab)
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
	Choose[ChooseCount + 1] = "暂时不参加竞猜了/Cancel";
	Say(GetQuestion(nQId), ChooseCount + 1, Choose);
	SetTaskTemp(TEMP_QID, nQId)
end;

function OSSale(nSel)
	if (GetTaskTemp(TEMP_QID) == 0) then 
		return
	end
	SetTaskTemp(TEMP_QCHOOSE, nSel + 1)
	Say(GetQuestion(GetTaskTemp(TEMP_QID)).."\n投:<color=yellow>"..GetChoose(GetTaskTemp(TEMP_QID), GetTaskTemp(TEMP_QCHOOSE)).."<color>\n价格:5000", 2, "好，我买了！/OSOnSale", "暂时不买了/OSCancel");
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
				Msg2Player("成功购得彩票一张！")
			else
				Earn(GetQuestionPrice(nQId))
				Say("对不起，该类彩票已经无法再购买了。",0)
			end
		else
			Say("您身上带的钱不够，请先去取了再来买吧。",0)
		end;
	end
end

function OSCancel()

end;
