-- 漠北传送卷
-- 是用后传送到漠北草原非战斗区域
-- Edit: 子非鱼
-- Date: 2007-06-06 19:47
Include("\\script\\maps\\checkmap.lua");

function main()
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>漠北传送册只能在城市非战斗区域、新手村以及西山村使用<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: 在闯关30不给使用漠北传送
	if pMapID == 957 then
		Msg2Player("<color=yellow>漠北传送册只能在城市非战斗区域、新手村以及西山村使用<color>");
		return 1;
	end
	local tbPos = {
		{1265,2493},
		{1281,2502},
		{1291,2546},
		{1289,2482},
	};
	local nrand = random(getn(tbPos));
	NewWorld(341, tbPos[nrand][1], tbPos[nrand][2]);
	SetFightState(0);
	SetRevPos(175,1)	--设定死亡重生点为西山村
	return 0;
end;