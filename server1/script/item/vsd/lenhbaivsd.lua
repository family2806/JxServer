Include("\\script\\maps\\checkmap.lua");
function main(nItemIndex)
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>微山岛令牌只能在城市的非战斗区域、新手村和西山村使用<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: 不能在闯关30处使用VSD令牌
	if pMapID == 957 then
		Msg2Player("<color=yellow>漠北传送册只能在城市的非战斗区域、新手村和西山村使用<color>");
		return 1;
	end
	NewWorld(342, 1417, 2801)
	SetFightState(0);
	return 0
end


