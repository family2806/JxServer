Include("\\script\\vng_event\\LunarYear2011\\item\\head.lua")

function main(itemidx)
	if (tbVNG_NLY2011_Itemhead:isExpired(itemidx) == 1) then
		Msg2Player("物品过使用期，自动失去.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNG_NLY2011_Itemhead:useItem("banhchungdacbiet")
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end
		
end