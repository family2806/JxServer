Include("\\script\\tong\\workshop\\ws_shilian.lua")
function main()
	local szTongName, nTongID = GetTongName()
	if nTongID == 0 then
		Say("<#>试炼总管：你未加入帮派，来找我有事吗?", 0)
		return
	end	
	local nTypeID = wsGetTypeID(NAME_SHILIAN)
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, nTypeID)
	USE_G_1(nTongID, nWorkshopID)
end
