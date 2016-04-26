Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\EventThangLong1000\\npc\\exchangitem\\exchangeitem.lua")
Include("\\script\\vng_event\\event_thang_long\\Event_1000_ThangLong.lua") --1000 nam Thang Long
Include("\\script\\EventThangLong1000\\head.lua")
function main()
	if (Event1000_ActiveDate() ~= 1) then
 		Talk(1,"","1000 年升龙活动已结束!")
 		return
 	end
	local tbOpp = {}
	local str = "<#> 请问，我能帮你什么吗?";
	--tinsert(tbOpp,"我想上交古物/DeliverPro");
	tinsert(tbOpp,"我来合成物品/Event1000_ExChangeItem_main");
	tinsert(tbOpp,"我来买升天令(中)/Shop中龙");
	
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (nHour >= 1200 and nHour <= 1400) then
		tinsert(tbOpp, "我想领取1000年升龙奖励/#EventThangLong:GetAward(1)")
	end
	
	if (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbOpp, "我想领取1000年升龙奖励/#EventThangLong:GetAward(2)")
	end
	tinsert(tbOpp, "我想上交10个功状令/#EventThangLong:GiveItem()")
	tinsert(tbOpp, "我想看已交的功状令数量/#EventThangLong:ViewTotalDragonItem()")	
	
	
	
	tinsert(tbOpp, "<#>退出/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end


function ShopTrungLong()
	AskClientForNumber("GetTrungLong",1,50,"<#>输入需要购买的数量")
end
function GetTrungLong(nCount)
	local nSum = nCount * 50000
	if (GetCash() < nSum) then
		Talk(1,"","大侠银两不够，请检查一下!")
		return
	end
	Pay(nSum)
	local nItemIndex = AddStackItem(nCount, 6, 1, 30050, 1, 0, 0)
	ITEM_SetExpiredTime(nItemIndex, 20101025);
	SyncItem(nItemIndex)
	Msg2Player(format("大侠获得%d 升天令(中)", nCount))
	WriteLog(format(date("%Y%m%d %H%M%S").."\t".."Event1000年升龙"..GetAccount().."\t"..GetName().."\t".."成功购买 %d 中龙",nCount))
end

function OnCancel()
end 