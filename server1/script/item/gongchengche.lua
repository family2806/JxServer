Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--����ս�ĵ�ͼID
MSBegin = MS_GCCBEGIN;
Count = g_nMaxGccPerDoor * g_nDoorCount;
NpcTempl = 524;
NpcLevel = 60;

function main()
--����ǰλ���Ƿ��ڹ���ս��ͼ��
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("�㲻��������ط�ʹ�������峵��")
	return 1;
end

if (GetCurCamp() ~= 2) then
	Msg2Player("ֻ�й���һ������ʹ�������峵��")
	return 1;
end

PosId = GetNearstPos(X*32,Y*32, GccPos);
if (PosId == 0) then 
	Say("������λ���������峵����λ��̫Զ���޷�ʹ�ã�",0)
	return 1
end;



if (GetMissionV(MS_DOORBEGIN + PosId - 1)  == 0 ) then 
	Msg2Player("������λ��ǰ���ĳ����ѱ����ݣ�����ʹ�������峵�ˡ�");
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, GccPos[PosId][1], GccPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		SetSiegeVoitureParam(ToolIndex, GetMissionV(MS_DOORBEGIN + PosId - 1))
		Msg2MSAll(MISSIONID, GetName().."������һ̨�����峵��Э�����ǡ�");
		WriteLog(GetLoop()..GetName()..":AddCC"..ToolIndex)
		return 0
	end;
else
	Msg2Player("�㵱ǰ����λ�ö�Ӧ�������峵�Ѵ��ڣ���ʱ�����ٴη��á�");
	return 1
end;

return 0;
end;
