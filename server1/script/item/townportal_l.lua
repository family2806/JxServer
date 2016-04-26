Include("\\script\\battles\\battlehead.lua")

TOWNPORTAL_MAXCOUNT = 1000

function main(nItemIdx)
	if (GetFightState() == 0 or IsDisabledUseTownP() == 1 or GetTaskTemp(200) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("��Ŀǰ����ʹ�ûسǷ���");
		return 1
	end
	
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("�ڴ��㲻��ʹ�ô˵���");
			return 1;
		end
	end
	local n_param = tonumber(GetItemParam(nItemIdx,1)) + 1
	local itemname = "<color=yellow>"..GetItemName(nItemIdx).."<color>"
	SetSpecItemParam(nItemIdx,1,n_param)
	SyncItem(nItemIdx)
	if (n_param >= TOWNPORTAL_MAXCOUNT) then
		RemoveItemByIndex(nItemIdx)
		Msg2Player("<#>����"..itemname.."<#>��ʹ����"..TOWNPORTAL_MAXCOUNT.."<#>�Σ����������ˡ�")
	else
		Msg2Player("<#>����"..itemname.."<#>������ʹ��"..(TOWNPORTAL_MAXCOUNT - n_param).."<#>��")
	end
	UseTownPortal();
	return 1	
end;

function GetDesc( nItemIdx )
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItemIdx, 1 ))
	szDesc = szDesc..format("\n����ʹ��<color=yellow>%d<color>��", (TOWNPORTAL_MAXCOUNT - n_param));
	return szDesc;
end