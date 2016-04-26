Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--����ս�ĵ�ͼID
MSBegin = MS_TSCBEGIN;
Count = g_nMaxTscPerDoor * g_nDoorCount;
NpcTempl = 525;
NpcLevel = 60;

function main()

--����ǰλ���Ƿ��ڹ���ս��ͼ��
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("�㲻��������ط�ʹ�û�ʯ�ѣ�")
	return 1;
end

if (GetCurCamp() ~= 2) then 
	Msg2Player("ֻ�й���һ������ʹ�û�ʯ�ѣ�")
	return 1
end;

PosId = GetNearstPos(X*32,Y*32, TscPos);

if (PosId == 0) then 
	Say("������λ�����ʯ�ѷ���λ��̫Զ���޷�ʹ�ã�",0)
	return 1
end;

DoorId = floor( (PosId - 1) / g_nMaxTscPerDoor ) + 1;

if (GetMissionV(MS_DOORBEGIN + DoorId - 1)  ~= 0 and (mod(PosId, 3) == 2) ) then 
	Msg2Player("������λ��ǰ���ĳ��Ż�δ����,���λ�õ�ǰ�޷�ʹ�û�ʯ��!")
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, TscPos[PosId][1], TscPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		Msg2MSAll(MISSIONID, GetName().."������һ̨��ʯ�ѣ�Э�����ǡ�");
		SetMangonelParam(ToolIndex, TscPos[PosId][3], TscPos[PosId][4], 200);
		WriteLog(GetLoop()..GetName()..":AddHSL"..ToolIndex)
		return 0
	end;
else
	Msg2Player("�㵱ǰ����λ�ö�Ӧ�Ļ�ʯ���Ѵ��ڣ���ʱ�����ٴη��á�");
	return 1
end;

return 0;
end;
