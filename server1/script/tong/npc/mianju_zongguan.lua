Include("\\script\\tong\\workshop\\ws_mianju.lua")
function main()
	local szTongName, nTongID = GetTongName()
	if nTongID == 0 then
		Say("<#>面具总管：你未加入帮派，来找我有事吗?", 0)
		return
	end	
	local nTypeID = wsGetTypeID(NAME_MIANJU)
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, nTypeID)	
	USE_G_1(nTongID, nWorkshopID)
end