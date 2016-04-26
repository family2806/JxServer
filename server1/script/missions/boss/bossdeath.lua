IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
--���������� ����
--honour
DROPRATE_BOSS_HONOURRATE = {
		["����"] = {350, 136},--739
		["������ʦ"] = {350, 134},--740
		["�Ʋ�Ⱦ"] = {350, 149},--741
		["��ӨӨ"] = {350, 138},--742
		["���ʦ̫"] = {350, 137},--743
		["��Сٻ"] = {350, 168},--744
		["������"] = {350, 171},--
		["��˼��"] = {350, 171},--746745
		["�����"] = {350, 144},--747
		--["����"] = {},--748
		["%����%"] = {350, 250},--1193
		["����Ӣ������"] = {350, 250},--1194
		["׷����ʿ"] = {350, 250},--1195
		["����Ҳ�������"] = {350, 250},--1196
		["��սѪ"] = {350, 250},--1197
		["��������"] = {350, 250},--1198
		["��¥��������"] = {350, 250},--1199
		["�����㡩�����̡�"] = {350, 250},--1200
		["�ŵ���"] = {350, 250},--1201
		["�ǻ��Ů��"] = {350, 250},--1202
		["����"] = {0, 250},
		["Ү�ɱ���"] = {350, 130},--563
		["����ѩ��"] = {400, 130},--564
		["��ľ�"] = {400, 127},--565
		["�Ű�"] = {350, 141},--566
		["��������"] = {300, 130},--562
		["������"] = {400, 130},--567
		["����Ʈ"] = {400, 130},--568
		["������"] = {250, 176},--582
		["�ϲ���"] = {300, 180},--583
		--[] = {},
}
HONOURID = {1257, 1294}
SIGNET_DROPCOUNT = 10
TSK_PLAYER_BOSSKILLED = 2598 -- ��һ�ɱBOSS����ͳ��
--DC kinh nghi�m boss HK - Modified By DinhHQ - 20111007
--KILLBOSSEXPAWARD = 20000000	-- ��ɱboss����
--KILLBOSSNEAREXPAWARD = 12000000	-- ��ɱboss��������
KILLBOSSEXPAWARD = 10000000
KILLBOSSNEAREXPAWARD = 8000000
--Renew boss award - Modified by DinhHQ - 20120319
local tbVnNewItemDropAward = {
                {{szName="��Գ",tbProp={6,1,2351,1,0,0},nCount=1,nRate=50},},
		{{szName="ϴ��",tbProp={6,1,22,1,0,0},nCount=1,nRate=50},},
		{{szName="����",tbProp={6,1,26,1,0,0},nCount=1,nRate=50},},
		{{szName="����",tbProp={0,3491},nCount=1,nRate=5,nQuality = 1},},
		{{szName="����",tbProp={0,3492},nCount=1,nRate=5,nQuality = 1},},
		{{szName="����",tbProp={0,3493},nCount=1,nRate=5,nQuality = 1},},
		{{szName="��ˮ",tbProp={0,3494},nCount=1,nRate=5,nQuality = 1},},
		{{szName="����",tbProp={0,3495},nCount=1,nRate=5,nQuality = 1},},
		{{szName="�̲�",tbProp={0,3496},nCount=1,nRate=5,nQuality = 1},},
		{{szName="���",tbProp={0,3497},nCount=1,nRate=5,nQuality = 1},},
		{{szName="׷Ӱ",tbProp={0,3498},nCount=1,nRate=5,nQuality = 1},},
		{{szName="��ө",tbProp={0,3500},nCount=1,nRate=5,nQuality = 1},},
		{{szName="����",tbProp={0,3499},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="����",tbProp={0,3501},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="��Ӱ",tbProp={0,3503},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="�������",tbProp={0,3502},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="��ѩ��˪",tbProp={0,3494},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="��⳾Ե",tbProp={0,3505},nCount=1,nRate=2,nQuality = 1},},
		{{szName="���ƾ���",tbProp={0,3506},nCount=1,nRate=2,nQuality = 1},},
		{{szName="��Ч�ɲ�",tbProp={6,1,1181,1,0,0},nCount=1,nRate=50},},
		{{szName="������",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},},
		{{szName="Į��������",tbProp={6,1,1448,1,0,0},nCount=1,nRate=50},},
		{{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,nRate=30},},
		{{szName="���������",tbProp={6,1,2517,1,0,0},nCount=1,nRate=50},},
		{{szName="�׵���",tbProp={6,1,1617,1,0,0},nCount=1,nRate=30},},		
		{{szName="�������ε�",tbProp={6,1,2379,1,0,0},nCount=1,nRate=40},},
}

function OnDeath( nNpcIndex )
	local x, y, world = GetNpcPos(nNpcIndex);
	local maxcount = SIGNET_DROPCOUNT;
	local _, nTongID = GetTongName();
	if (nTongID > 0) then
		if (IsDoubledMoneyBox(nTongID)) then
			maxcount = getSignetDropRate(SIGNET_DROPCOUNT);
		end;
	end;
	local nCurtime = GetCurServerTime() + 7 * 24 *60 * 60
	local nYear = tonumber(FormatTime2String("%Y", nCurtime))
	local nMonth = tonumber(FormatTime2String("%m", nCurtime))
	local nDay = tonumber(FormatTime2String("%d", nCurtime))
	--����boss֮����������Ʒ - Modified by DinhHQ - 20111012
--	for i = 1, maxcount do
--		local nItemIdx = DropItem(world, x, y, PlayerIndex, 6, 1, 1094, 1, 0, 0, 0, 0, 0, 0, 0, 0);
--		SetSpecItemParam(nItemIdx, 1, nCurtime);
--		SetSpecItemParam(nItemIdx, 2, nYear)
--		SetSpecItemParam(nItemIdx, 3, nMonth)
--		SetSpecItemParam(nItemIdx, 4, nDay)
--		SyncItem(nItemIdx);
--	end;
	--Renew boss award - Modified by DinhHQ - 20120319
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbVnNewItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	-- �����������Ƶ���
	if (GetProductRegion() == "cn" or GetProductRegion() == "cn_ib") then
		local szNpcName = GetNpcName(nNpcIndex);
		if (DROPRATE_BOSS_HONOURRATE[szNpcName]) then
			for i = 1, getn(DROPRATE_BOSS_HONOURRATE[szNpcName]) do
				local nrate = random(1, 10000);
				if (nrate < DROPRATE_BOSS_HONOURRATE[szNpcName][i]) then
				DropItem(world, x, y, PlayerIndex, 6, 1, HONOURID[i], 1, 0, 0, 0, 0, 0, 0, 0, 0);
				end;
			end;
		end;
	end;
	
	-- ��ɱ��BOSS���˻���齱��
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSEXPAWARD, 0, format("%s ����","��ܻƽ�BOSS����"));
		end
	else -- һ����
		szName = GetName();
		PlayerFunLib:AddExp(KILLBOSSEXPAWARD, 0, format("%s ����","��ܻƽ�BOSS����"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSNEAREXPAWARD, 0, format("%s ����","�ƽ�BOSS������ʱվ�ڸ����ľ���"));
	end
	
	local szNews = format("����<color=yellow>%s<color>��<color=yellow>%s<color>������ɹ�<color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	-- BOSS��ɱͳ��
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
	
	if (GetNpcParam(nNpcIndex, 1) == 1) then --19:30�Ļƽ�BOSS
		-- �ƽ�BOSS����
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "ReduceGoldBossCount", 0);
	end
end;

