Include("\\script\\battles\\battlehead.lua")

function main(sel)
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
	UseTownPortal();
	return 1	
end;
