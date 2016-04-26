IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")

-- 普通BOSS表: NPCID、BOSS等级、BOSS五行、BOSS名称、BOSS套用的模版（无实际作用）
BattleBoss_tbCommonBoss = 
{
	{1465,	95,	0,	" %s 国将军", "王佐"},
	{1466,	95,	1,	" %s 国将军", "唐飞燕"},
	{1467,	95,	1,	" %s 国将军", "白盈盈"},
	{1468,	95,	2,	" %s 国将军", "清绝师太"},
	{1469,	95,	2,	" %s 国将军", "钟灵秀"},
	{1470,	95,	3,	" %s 国将军", "何人我"},
	{1471,	95,	3,	" %s 国将军", "端木睿"},
	{1472,	95,	4,	" %s 国将军", "清连子"},
	{1473,	95,	4,	" %s 国将军", "道清真人"},
}

-- BigBOSS表: NPCID、BOSS等级、BOSS名称
BattleBoss_tbBigBoss = 
{
	{1474, 95, "宋国大将军"},
	{1475, 95, "金国大将军"},
}

-- 双方各自增加9个普通BOSS
function BattleBoss_AddAllCommonBoss()
	local nBossID = 0;
	for nBossPosID = 1,9 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>宋金战报: 宋金每边将派遣本派的9位将军来支援!");
end

-- 双方各自在中路增加3个普通BOSS
function BattleBoss_AddSomeCommonBoss()
	local nBossID = 0;
	for nBossPosID = 4,6 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>宋金战报: 宋金每边将派遣本派的3位将军来支援！");
end

-- 指定阵营增加大BOSS
function BattleBoss_AddBigBoss(nBossCamp)
	
	if (nBossCamp == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>宋金战报: 急报! 宋军大将军已出现!")
	else
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>宋金大战: 急报! 金军大将军已出现!")
	end
	
	BattleBoss_AddBoss(0, nBossCamp, 0);
end

-- 在战场中加入Boss	
-- nBossID: 	Boss的ID 0为BigBoss，大于0为普通Boss
-- nBossCamp:	Boss的阵营 1为宋 2为金
-- nBossPosID:	Boss的位置ID 0为主营，1-9 分别为营外的左中右三路
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
		szCampName = "宋";
	elseif nBossCamp == 2 then
		szArea = szArea..BT_GetGameData(GAME_CAMP2AREA);
		szCampName = "金";
	else
		return		
	end
	
	-- 确定BOSS的坐标
	local szBossPosFile = GetIniFileData(szMapFile, szArea, "bosspos");
	local nX = GetTabFileData(szBossPosFile, nBossPosID + 2, 1);
	local nY = GetTabFileData(szBossPosFile, nBossPosID + 2, 2);
	
	-- 确定BOSS的NPC属性
	local nNpcID, nNpcLevel, nNpcSeries, szNpcName;
	
	if nBossID == 0 then
		-- 大BOSS
		nNpcID     = BattleBoss_tbBigBoss[nBossCamp][1];
		nNpcLevel  = BattleBoss_tbBigBoss[nBossCamp][2];
		nNpcSeries = random(1,5)-1;
		szNpcName  = BattleBoss_tbBigBoss[nBossCamp][3];
	else
		-- 普通BOSS
		nNpcID     = BattleBoss_tbCommonBoss[nBossID][1];
		nNpcLevel  = BattleBoss_tbCommonBoss[nBossID][2];
		nNpcSeries = BattleBoss_tbCommonBoss[nBossID][3];
		szNpcName  = format(BattleBoss_tbCommonBoss[nBossID][4], szCampName);	
	end
	
	-- 增加BOSS
	local nNpcIdx = AddNpcEx(nNpcID, nNpcLevel, nNpcSeries, SubWorld, nX*32, nY*32, 1, szNpcName, 1);
	if nNpcIdx > 0 then
		SetNpcCurCamp(nNpcIdx, nBossCamp);
		SetNpcDeathScript(nNpcIdx, "\\script\\battles\\boss\\bossset.lua");
	end
	
end

-- BOSS死亡
function OnDeath(nNpcIndex)
	
	if (GetMissionV(MS_STATE) ~= 2) then
		return
	end
	
	-- 如果是死于其它Npc则不统计排行
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end
	
	-- 确认杀死的BOSS的类别 0:错误 1:普通BOSS 2:BigBoss
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
		-- 普通BOSS	 
		nPointAward = 2000;
		
		if (GetCurCamp() == 1) then
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_S) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_S, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>报告战役: 宋兵 %s 刚刚取了金军将军首级! 金军被宋军所杀将军数量为%d.", GetName(), nNewKillBossCount));
		else
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_J) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_J, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>报告战役: 金冰%s 刚刚取了宋军将军首级! 宋军被金军所杀将军数量为%d.", GetName(), nNewKillBossCount));
		end
		 
	elseif nDeathBossType == 2 then
		-- 大BOSS
		nPointAward = 4000;
		
		if GetMissionV(MS_MARSHALDEATH) == 0 then
			SetMissionV(MS_MARSHALDEATH, GetCurCamp());
		else
			SetMissionV(MS_MARSHALDEATH, 0);
		end	
		
		if (GetCurCamp() == 1) then
			Msg2MSAll(MISSIONID, format("<color=yellow>报告战役: 宋军%s 刚刚消灭了金军大将军!!!", GetName()));
		else
			Msg2MSAll(MISSIONID, format("<color=yellow>报告战役h: 金军%s 刚刚消灭了宋金大将军!!!", GetName()));
		end
		
	else 
		 return
	end
	
	bt_addtotalpoint(nPointAward);
	mar_addmissionpoint(nPointAward);
	Msg2Player(format("为赠送杀BOSS的战功, 阁下获得奖励%d 积分!", nPointAward));
	BT_SetData(PL_KILLNPC, BT_GetData(PL_KILLNPC) + 1);
	BT_SortLadder();
	BT_BroadSelf();
	return
end

