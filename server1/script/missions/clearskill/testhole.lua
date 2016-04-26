------------------------------------------------------------------------------
--�ξ�ɽ�����е������Ӫ��ʱ��Ϊ��������������PK���ڴ˴�PKû�������ͷ���
--��ɽ��ֻ���������20�ˣ����дﵽ20������ʱ�����ٴ��������˽��루ֻ����������
--�����Ϊ�Լ�ϴ��������ʱ��ͨ�����ξ��ڵ���ɮ�Ի��뿪�ξ���
--�뿪ʱ��ԭ�����������Լ��������״̬��ϴ����ɣ��ص��һ�Դ��			
--1����ӽ���
-------------------------------------------------------------------------------
Include("\\script\\missions\\clearskill\\head.lua")

function TeamEnterHole(nTrapId)
	
	if (IsCaptain() == 0) then
		Say("��Ҫ������������������ӣ�ֻ���鳤�ſ��Դ����Լ��Ķ������!", 0);
		return 0
	end;

	--�ӳ�����ǰ���кϷ��Լ��
	-- �Ƿ�״̬
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("�Ƿ�����ϴ�趴. ");
		Say("GM: <color=red>�㲻�ܽ���ϴ�趴,�ѱ�ϵͳ��¼�����ҷ�����Ա����һ��! <color> ", 0);
		return 0
	end

	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT or Size < 2) then
		Say("������Ӧ��2��8��!" , 0);
		return 0
	end;
	
	--�ҿ��еĵ�ͼ
	--N����ͼ��ÿ����ͼ����һ��Mission
	--��������ͼ��Mission�Զ�����������SetMissionV(1,1)	
	--�жϵ�ͼ�Ƿ���о��ǿ����MissionV(1)�Ƿ�Ϊ0
	--Mission����ʱ���ر�Mission ��MissionV(1)Ϊ0����������ڵ��������
	--Mission����ʱҪ���һ���Ի�Npc��������ֶ�������ʱ��Ӫ
	
	W,X,Y = GetWorldPos()
	nCityIndex = CSP_GetCityIndexByClearMap(W);
	if (nCityIndex <= 0 ) then
		return 0
	end;
	
	nFreeMap = CSP_GetFreeTestMapID(nCityIndex);
	if (nFreeMap <= 0 ) then 
		Say("������˼��ɽ������!", 0)
		return 0
	end;
	OldSubWorld = SubWorld;
	OldPlayer = PlayerIndex;
	
	nIdx = SubWorldID2Idx(nFreeMap);
	SubWorld = nIdx;
	OpenMission(MISSIONID)
	RunMission(MISSIONID)
	
	TeamMember = {};
	nCount = 1;
	for i = 1, Size do 
		PIdx = GetTeamMember(i);
		if (PIdx > 0) then 
			TeamMember[nCount] = PIdx;
			nCount = nCount + 1;
		end
	end;
	
	for i = 1, nCount - 1 do 
		PlayerIndex = TeamMember[i];
		tW,tX,tY = GetWorldPos();
		
		--����ǰ���кϷ��Լ��
		--��ⷽ����
		-- 1.���˵�״̬�Ϸ�(�Ƿ���������������)
		-- 2.��������Ӧ��CityIndex��ӳ���һ�²ſɽ���
		if (CSP_CheckValid() == 1 and CSP_GetCityIndexByClearMap(tW) == nCityIndex) then
			JoinHole(nFreeMap, nTrapId)
		end
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
	return 1

end;

function JoinHole(TestMap,nTrapId)
	LeaveTeam()
	
	EnterPosX = CSP_TestHoleTab[nTrapId][1];
	EnterPosY = CSP_TestHoleTab[nTrapId][2];
	NewWorld(TestMap, EnterPosX, EnterPosY)
	
	AddMSPlayer(MISSIONID, 1);
	SetTaskTemp(JOINSTATE, 1);
	
	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,1);
	
	--����ս��״̬
	SetFightState(1);
	
	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetLogoutRV(1);
	
	--�������ͷ�
	SetDeathScript("\\script\\missions\\clearskill\\playerdeath.lua");--���������ű�Ϊ��
	SetPunish(0);
	SetTempRevPos(TestMap, CSP_CAMPMANX, CSP_CAMPMANY);
	ForbidChangePK(0);
	SetPKFlag(1) --��PK����
	return 1
end;

--���Ҫ���뿪��Ϸ
function LeaveGame(nTrapId)
	camp = GetCamp();--�ָ�ԭʼ��Ӫ
	SetFightState(1)
	SetPunish(0)--����PK�ͷ�
	SetTaskTemp(JOINSTATE, 0);
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(1);
	SetCurCamp(camp);
	SetLogoutRV(1);--����������
	SetDeathScript("");--���������ű�Ϊ��
	W,X,Y = GetWorldPos();
	LeaveTeam()

	local CityId = CSP_GetCityIndexByTestMap(W);
	ClearPosX = CSP_ClearHoleTab[nTrapId][1]
	ClearPosY = CSP_ClearHoleTab[nTrapId][2]
	W = CSP_GetClearMapID(CityId);
	SetRevPos(W, CSP_RevieSWID);	
	NewWorld(W, ClearPosX, ClearPosY);
end;
