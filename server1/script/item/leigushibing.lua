Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--����ս�ĵ�ͼID
MSBegin = MS_TOOLBEGIN;
Count = g_nMaxToolCount;
NpcTempl = 526;
NpcLevel = 60;

function main()

--����ǰλ���Ƿ��ڹ���ս��ͼ��
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID(SubWorld);

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("�㲻��������ط�ʹ�����ı�����")
	return 1;
end

if (GetCurCamp() ~= 1) then
	Msg2Player("ֻ���س�һ������ʹ�����ı�����")
	return 1;
end

bAdd = 0
for i  = 1, Count do 
	if (GetMissionV(MSBegin + i - 1) == 0) then 
		ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, X * 32, Y * 32, 1, GetName().." ��Ӷ��", 1);
		if (ToolIndex > 0) then
			SetNpcCurCamp(ToolIndex, 1);
			SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
			SetMissionV(MSBegin + i - 1, ToolIndex); 
			Msg2MSAll(MISSIONID, GetName().."��ǲ��һ���޹���ʿ������ս����");
			WriteLog(GetLoop()..GetName().."��ǲ��һ���޹���ʿ������ս����");
			WriteLog("������ĳ��leigu"..ToolIndex);
			bAdd = 1
			return 0
		end;
	end;
end

if (bAdd == 0) then 
	Msg2Player("Ŀǰ������ʿ���ѹ�����ʱ����Ҫ����")
	return 1
end;

return 0;
end;

