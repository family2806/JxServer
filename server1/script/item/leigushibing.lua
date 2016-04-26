Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--攻城战的地图ID
MSBegin = MS_TOOLBEGIN;
Count = g_nMaxToolCount;
NpcTempl = 526;
NpcLevel = 60;

function main()

--看当前位置是否处在攻城战地图上
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID(SubWorld);

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("你不能在这个地方使用鼋鼓兵符！")
	return 1;
end

if (GetCurCamp() ~= 1) then
	Msg2Player("只有守城一方才能使用鼋鼓兵符！")
	return 1;
end

bAdd = 0
for i  = 1, Count do 
	if (GetMissionV(MSBegin + i - 1) == 0) then 
		ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, X * 32, Y * 32, 1, GetName().." 雇佣兵", 1);
		if (ToolIndex > 0) then
			SetNpcCurCamp(ToolIndex, 1);
			SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
			SetMissionV(MSBegin + i - 1, ToolIndex); 
			Msg2MSAll(MISSIONID, GetName().."派遣了一名擂鼓武士，加入战斗！");
			WriteLog(GetLoop()..GetName().."派遣了一名擂鼓武士，加入战斗！");
			WriteLog("增加了某个leigu"..ToolIndex);
			bAdd = 1
			return 0
		end;
	end;
end

if (bAdd == 0) then 
	Msg2Player("目前派来的士兵已购，暂时不需要派了")
	return 1
end;

return 0;
end;

