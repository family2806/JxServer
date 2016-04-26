Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--攻城战的地图ID
MSBegin = MS_TSCBEGIN;
Count = g_nMaxTscPerDoor * g_nDoorCount;
NpcTempl = 525;
NpcLevel = 60;

function main()

--看当前位置是否处在攻城战地图上
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("你不能在这个地方使用浑石裂！")
	return 1;
end

if (GetCurCamp() ~= 2) then 
	Msg2Player("只有攻城一方才能使用浑石裂！")
	return 1
end;

PosId = GetNearstPos(X*32,Y*32, TscPos);

if (PosId == 0) then 
	Say("你所在位置离浑石裂放置位置太远，无法使用！",0)
	return 1
end;

DoorId = floor( (PosId - 1) / g_nMaxTscPerDoor ) + 1;

if (GetMissionV(MS_DOORBEGIN + DoorId - 1)  ~= 0 and (mod(PosId, 3) == 2) ) then 
	Msg2Player("你所处位置前方的城门还未攻陷,这个位置当前无法使用浑石裂!")
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, TscPos[PosId][1], TscPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		Msg2MSAll(MISSIONID, GetName().."放置了一台浑石裂，协助攻城。");
		SetMangonelParam(ToolIndex, TscPos[PosId][3], TscPos[PosId][4], 200);
		WriteLog(GetLoop()..GetName()..":AddHSL"..ToolIndex)
		return 0
	end;
else
	Msg2Player("你当前所处位置对应的浑石裂已存在，暂时不可再次放置。");
	return 1
end;

return 0;
end;
