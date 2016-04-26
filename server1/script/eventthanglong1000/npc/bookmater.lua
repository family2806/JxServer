Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\EventThangLong1000\\npc\\exchangitem\\exchangeitem.lua")
Include("\\script\\vng_event\\event_thang_long\\Event_1000_ThangLong.lua") --1000 nam Thang Long
Include("\\script\\EventThangLong1000\\head.lua")
function main()
	if (Event1000_ActiveDate() ~= 1) then
 		Talk(1,"","1000 ��������ѽ���!")
 		return
 	end
	local tbOpp = {}
	local str = "<#> ���ʣ����ܰ���ʲô��?";
	--tinsert(tbOpp,"�����Ͻ�����/DeliverPro");
	tinsert(tbOpp,"�����ϳ���Ʒ/Event1000_ExChangeItem_main");
	tinsert(tbOpp,"������������(��)/Shop����");
	
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (nHour >= 1200 and nHour <= 1400) then
		tinsert(tbOpp, "������ȡ1000����������/#EventThangLong:GetAward(1)")
	end
	
	if (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbOpp, "������ȡ1000����������/#EventThangLong:GetAward(2)")
	end
	tinsert(tbOpp, "�����Ͻ�10����״��/#EventThangLong:GiveItem()")
	tinsert(tbOpp, "���뿴�ѽ��Ĺ�״������/#EventThangLong:ViewTotalDragonItem()")	
	
	
	
	tinsert(tbOpp, "<#>�˳�/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end


function ShopTrungLong()
	AskClientForNumber("GetTrungLong",1,50,"<#>������Ҫ���������")
end
function GetTrungLong(nCount)
	local nSum = nCount * 50000
	if (GetCash() < nSum) then
		Talk(1,"","������������������һ��!")
		return
	end
	Pay(nSum)
	local nItemIndex = AddStackItem(nCount, 6, 1, 30050, 1, 0, 0)
	ITEM_SetExpiredTime(nItemIndex, 20101025);
	SyncItem(nItemIndex)
	Msg2Player(format("�������%d ������(��)", nCount))
	WriteLog(format(date("%Y%m%d %H%M%S").."\t".."Event1000������"..GetAccount().."\t"..GetName().."\t".."�ɹ����� %d ����",nCount))
end

function OnCancel()
end 