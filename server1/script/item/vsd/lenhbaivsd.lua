Include("\\script\\maps\\checkmap.lua");
function main(nItemIndex)
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>΢ɽ������ֻ���ڳ��еķ�ս���������ִ����ɽ��ʹ��<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: �����ڴ���30��ʹ��VSD����
	if pMapID == 957 then
		Msg2Player("<color=yellow>Į�����Ͳ�ֻ���ڳ��еķ�ս���������ִ����ɽ��ʹ��<color>");
		return 1;
	end
	NewWorld(342, 1417, 2801)
	SetFightState(0);
	return 0
end


