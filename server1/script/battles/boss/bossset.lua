IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")

-- ��ͨBOSS��: NPCID��BOSS�ȼ���BOSS���С�BOSS���ơ�BOSS���õ�ģ�棨��ʵ�����ã�
BattleBoss_tbCommonBoss = 
{
	{1465,	95,	0,	" %s ������", "����"},
	{1466,	95,	1,	" %s ������", "�Ʒ���"},
	{1467,	95,	1,	" %s ������", "��ӯӯ"},
	{1468,	95,	2,	" %s ������", "���ʦ̫"},
	{1469,	95,	2,	" %s ������", "������"},
	{1470,	95,	3,	" %s ������", "������"},
	{1471,	95,	3,	" %s ������", "��ľ�"},
	{1472,	95,	4,	" %s ������", "������"},
	{1473,	95,	4,	" %s ������", "��������"},
}

-- BigBOSS��: NPCID��BOSS�ȼ���BOSS����
BattleBoss_tbBigBoss = 
{
	{1474, 95, "�ι��󽫾�"},
	{1475, 95, "����󽫾�"},
}

-- ˫����������9����ͨBOSS
function BattleBoss_AddAllCommonBoss()
	local nBossID = 0;
	for nBossPosID = 1,9 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>�ν�ս��: �ν�ÿ�߽���ǲ���ɵ�9λ������֧Ԯ!");
end

-- ˫����������·����3����ͨBOSS
function BattleBoss_AddSomeCommonBoss()
	local nBossID = 0;
	for nBossPosID = 4,6 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>�ν�ս��: �ν�ÿ�߽���ǲ���ɵ�3λ������֧Ԯ��");
end

-- ָ����Ӫ���Ӵ�BOSS
function BattleBoss_AddBigBoss(nBossCamp)
	
	if (nBossCamp == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>�ν�ս��: ����! �ξ��󽫾��ѳ���!")
	else
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>�ν��ս: ����! ����󽫾��ѳ���!")
	end
	
	BattleBoss_AddBoss(0, nBossCamp, 0);
end

-- ��ս���м���Boss	
-- nBossID: 	Boss��ID 0ΪBigBoss������0Ϊ��ͨBoss
-- nBossCamp:	Boss����Ӫ 1Ϊ�� 2Ϊ��
-- nBossPosID:	Boss��λ��ID 0Ϊ��Ӫ��1-9 �ֱ�ΪӪ�����������·
function BattleBoss_AddBoss(nBossID, nBossCamp, nBossPosID)
	
	if nBossID < 0 or nBossID > getn(BattleBoss_tbCommonBoss) then
		return
	end
	if nBossPosID < 0 or nBossPosID > 9 then
		return
	end
	
	local szCampName;
	local szArea    = "Area_";
	local szMapFile = GetMapInfoFile(BT_GetGameData(GAME_MAPID));
	
	if nBossCamp == 1 then
		szArea = szArea..BT_GetGameData(GAME_CAMP1AREA);
		szCampName = "��";
	elseif nBossCamp == 2 then
		szArea = szArea..BT_GetGameData(GAME_CAMP2AREA);
		szCampName = "��";
	else
		return		
	end
	
	-- ȷ��BOSS������
	local szBossPosFile = GetIniFileData(szMapFile, szArea, "bosspos");
	local nX = GetTabFileData(szBossPosFile, nBossPosID + 2, 1);
	local nY = GetTabFileData(szBossPosFile, nBossPosID + 2, 2);
	
	-- ȷ��BOSS��NPC����
	local nNpcID, nNpcLevel, nNpcSeries, szNpcName;
	
	if nBossID == 0 then
		-- ��BOSS
		nNpcID     = BattleBoss_tbBigBoss[nBossCamp][1];
		nNpcLevel  = BattleBoss_tbBigBoss[nBossCamp][2];
		nNpcSeries = random(1,5)-1;
		szNpcName  = BattleBoss_tbBigBoss[nBossCamp][3];
	else
		-- ��ͨBOSS
		nNpcID     = BattleBoss_tbCommonBoss[nBossID][1];
		nNpcLevel  = BattleBoss_tbCommonBoss[nBossID][2];
		nNpcSeries = BattleBoss_tbCommonBoss[nBossID][3];
		szNpcName  = format(BattleBoss_tbCommonBoss[nBossID][4], szCampName);	
	end
	
	-- ����BOSS
	local nNpcIdx = AddNpcEx(nNpcID, nNpcLevel, nNpcSeries, SubWorld, nX*32, nY*32, 1, szNpcName, 1);
	if nNpcIdx > 0 then
		SetNpcCurCamp(nNpcIdx, nBossCamp);
		SetNpcDeathScript(nNpcIdx, "\\script\\battles\\boss\\bossset.lua");
	end
	
end

-- BOSS����
function OnDeath(nNpcIndex)
	
	if (GetMissionV(MS_STATE) ~= 2) then
		return
	end
	
	-- �������������Npc��ͳ������
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end
	
	-- ȷ��ɱ����BOSS����� 0:���� 1:��ͨBOSS 2:BigBoss
	local nDeathBossType = 0;
	
	for i = 1,getn(BattleBoss_tbCommonBoss) do
		if GetNpcSettingIdx(nNpcIndex) == BattleBoss_tbCommonBoss[i][1] then
			nDeathBossType = 1;
			break
		end
	end
	
	for i = 1,getn(BattleBoss_tbBigBoss) do
		if GetNpcSettingIdx(nNpcIndex) == BattleBoss_tbBigBoss[i][1] then
			nDeathBossType = 2;
			break
		end
	end
	
	local nPointAward = 0;
	if nDeathBossType == 1 then
		-- ��ͨBOSS	 
		nPointAward = 2000;
		
		if (GetCurCamp() == 1) then
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_S) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_S, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>����ս��: �α� %s �ո�ȡ�˽�������׼�! ������ξ���ɱ��������Ϊ%d.", GetName(), nNewKillBossCount));
		else
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_J) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_J, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>����ս��: ���%s �ո�ȡ���ξ������׼�! �ξ��������ɱ��������Ϊ%d.", GetName(), nNewKillBossCount));
		end
		 
	elseif nDeathBossType == 2 then
		-- ��BOSS
		nPointAward = 4000;
		
		if GetMissionV(MS_MARSHALDEATH) == 0 then
			SetMissionV(MS_MARSHALDEATH, GetCurCamp());
		else
			SetMissionV(MS_MARSHALDEATH, 0);
		end	
		
		if (GetCurCamp() == 1) then
			Msg2MSAll(MISSIONID, format("<color=yellow>����ս��: �ξ�%s �ո������˽���󽫾�!!!", GetName()));
		else
			Msg2MSAll(MISSIONID, format("<color=yellow>����ս��h: ���%s �ո��������ν�󽫾�!!!", GetName()));
		end
		
	else 
		 return
	end
	
	bt_addtotalpoint(nPointAward);
	mar_addmissionpoint(nPointAward);
	Msg2Player(format("Ϊ����ɱBOSS��ս��, ���»�ý���%d ����!", nPointAward));
	BT_SetData(PL_KILLNPC, BT_GetData(PL_KILLNPC) + 1);
	BT_SortLadder();
	BT_BroadSelf();
	return
end

