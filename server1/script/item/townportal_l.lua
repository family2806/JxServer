Include("\\script\\battles\\battlehead.lua")

TOWNPORTAL_MAXCOUNT = 1000

function main(nItemIdx)
	if (GetFightState() == 0 or IsDisabledUseTownP() == 1 or GetTaskTemp(200) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("你目前不能使用回城符！");
		return 1
	end
	
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("在此你不能使用此道具");
			return 1;
		end
	end
	local n_param = tonumber(GetItemParam(nItemIdx,1)) + 1
	local itemname = "<color=yellow>"..GetItemName(nItemIdx).."<color>"
	SetSpecItemParam(nItemIdx,1,n_param)
	SyncItem(nItemIdx)
	if (n_param >= TOWNPORTAL_MAXCOUNT) then
		RemoveItemByIndex(nItemIdx)
		Msg2Player("<#>您的"..itemname.."<#>已使用了"..TOWNPORTAL_MAXCOUNT.."<#>次，不能再用了。")
	else
		Msg2Player("<#>您的"..itemname.."<#>还可以使用"..(TOWNPORTAL_MAXCOUNT - n_param).."<#>次")
	end
	UseTownPortal();
	return 1	
end;

function GetDesc( nItemIdx )
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItemIdx, 1 ))
	szDesc = szDesc..format("\n还可使用<color=yellow>%d<color>次", (TOWNPORTAL_MAXCOUNT - n_param));
	return szDesc;
end