Include("\\script\\global\\olympics_award.lua")

TEMP_QID = 122;
TEMP_QCHOOSE = 123;

function onBuyTicket()
if (IsCharged() ~= 1 ) then
	 Say("�Բ�������δ��ֵ�������޷��μ��ŵ�ʢ���Ʊ���", 0)
	return
end
nCount = GetTicketCount();

if (nCount == 0 ) then 
	Say("�Բ���������ʱû���κβ�Ʊ���Թ���", 0)
	return
end;

Tab = {};
for i = 1, nCount do 
	Tab[i] = GetQuestionTip(GetTicket(i)).."/OSAsk";
end;
Tab[nCount + 1] = "��ʱ���μӾ�����/Cancel";
Say("5000һ�Ų�Ʊ����Ҫ�����ĸ�?", nCount + 1, Tab)
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
	Choose[ChooseCount + 1] = "��ʱ���μӾ�����/Cancel";
	Say(GetQuestion(nQId), ChooseCount + 1, Choose);
	SetTaskTemp(TEMP_QID, nQId)
end;

function OSSale(nSel)
	if (GetTaskTemp(TEMP_QID) == 0) then 
		return
	end
	SetTaskTemp(TEMP_QCHOOSE, nSel + 1)
	Say(GetQuestion(GetTaskTemp(TEMP_QID)).."\nͶ:<color=yellow>"..GetChoose(GetTaskTemp(TEMP_QID), GetTaskTemp(TEMP_QCHOOSE)).."<color>\n�۸�:5000", 2, "�ã������ˣ�/OSOnSale", "��ʱ������/OSCancel");
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
				Msg2Player("�ɹ����ò�Ʊһ�ţ�")
			else
				Earn(GetQuestionPrice(nQId))
				Say("�Բ��𣬸����Ʊ�Ѿ��޷��ٹ����ˡ�",0)
			end
		else
			Say("�����ϴ���Ǯ����������ȥȡ��������ɡ�",0)
		end;
	end
end

function OSCancel()

end;
