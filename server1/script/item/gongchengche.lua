Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--攻城战的地图ID
MSBegin = MS_GCCBEGIN;
Count = g_nMaxGccPerDoor * g_nDoorCount;
NpcTempl = 524;
NpcLevel = 60;

function main()
--看当前位置是否处在攻城战地图上
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("你不能在这个地方使用孽龙冲车！")
	return 1;
end

if (GetCurCamp() ~= 2) then
	Msg2Player("只有攻城一方才能使用孽龙冲车！")
	return 1;
end

PosId = GetNearstPos(X*32,Y*32, GccPos);
if (PosId == 0) then 
	Say("你所在位置离孽龙冲车放置位置太远，无法使用！",0)
	return 1
end;



if (GetMissionV(MS_DOORBEGIN + PosId - 1)  == 0 ) then 
	Msg2Player("你所处位置前方的城门已被攻陷！无须使用孽龙冲车了。");
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, GccPos[PosId][1], GccPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		SetSiegeVoitureParam(ToolIndex, GetMissionV(MS_DOORBEGIN + PosId - 1))
		Msg2MSAll(MISSIONID, GetName().."放置了一台孽龙冲车，协助攻城。");
		WriteLog(GetLoop()..GetName()..":AddCC"..ToolIndex)
		return 0
	end;
else
	Msg2Player("你当前所处位置对应的孽龙冲车已存在，暂时不可再次放置。");
	return 1
end;

return 0;
end;
