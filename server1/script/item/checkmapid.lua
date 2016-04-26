-- 检查是否在宋金地图
-- LiuKuo
-- 2004.12.22
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
tbCD_MAP = {516, 517, 580, 581}	--烽火连城守城地图

function main(nItemIdx)

--	W,X,Y = GetWorldPos();
	nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				Msg2Player("此道具不能在国战宋金战场内使用");
				return 1;
			end
			
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	
	for i = 1, getn(tbCD_MAP) do
		if (nMapId == tbCD_MAP[i]) then
			if (EatMedicine(nItemIdx) == -1) then
				return 1
			else
				return 0
			end
		end
	end
	Msg2Player("此道具只能在宋金战场内使用");
	return 1;
end