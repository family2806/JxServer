IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
--武林荣誉令 掉落
--honour
DROPRATE_BOSS_HONOURRATE = {
		["王佐"] = {350, 136},--739
		["玄觉大师"] = {350, 134},--740
		["唐不染"] = {350, 149},--741
		["白莹莹"] = {350, 138},--742
		["清绝师太"] = {350, 137},--743
		["嫣小倩"] = {350, 168},--744
		["何人我"] = {350, 171},--
		["单思南"] = {350, 171},--746745
		["璇玑子"] = {350, 144},--747
		--["韩蒙"] = {},--748
		["%天王%"] = {350, 250},--1193
		["乱世英豪げ彎"] = {350, 250},--1194
		["追命居士"] = {350, 250},--1195
		["神仙也不过如此"] = {350, 250},--1196
		["鹅战血"] = {350, 250},--1197
		["蝴蝶贝贝"] = {350, 250},--1198
		["玉海楼の勿忘我"] = {350, 250},--1199
		["♂清香々『天忍』"] = {350, 250},--1200
		["古道风"] = {350, 250},--1201
		["惹火的女人"] = {350, 250},--1202
		["大马虎"] = {0, 250},
		["耶律辟离"] = {350, 130},--563
		["完颜雪衣"] = {400, 130},--564
		["端木睿"] = {400, 127},--565
		["古柏"] = {350, 141},--566
		["道清真人"] = {300, 130},--562
		["钟玲秀"] = {400, 130},--567
		["何怜飘"] = {400, 130},--568
		["蓝依依"] = {250, 176},--582
		["孟苍浪"] = {300, 180},--583
		--[] = {},
}
HONOURID = {1257, 1294}
SIGNET_DROPCOUNT = 10
TSK_PLAYER_BOSSKILLED = 2598 -- 玩家击杀BOSS数量统计
--DC kinh nghi謒 boss HK - Modified By DinhHQ - 20111007
--KILLBOSSEXPAWARD = 20000000	-- 击杀boss奖励
--KILLBOSSNEAREXPAWARD = 12000000	-- 击杀boss附近奖励
KILLBOSSEXPAWARD = 10000000
KILLBOSSNEAREXPAWARD = 8000000
--Renew boss award - Modified by DinhHQ - 20120319
local tbVnNewItemDropAward = {
                {{szName="玄猿",tbProp={6,1,2351,1,0,0},nCount=1,nRate=50},},
		{{szName="洗髓",tbProp={6,1,22,1,0,0},nCount=1,nRate=50},},
		{{szName="武林",tbProp={6,1,26,1,0,0},nCount=1,nRate=50},},
		{{szName="长生",tbProp={0,3491},nCount=1,nRate=5,nQuality = 1},},
		{{szName="渤海",tbProp={0,3492},nCount=1,nRate=5,nQuality = 1},},
		{{szName="武威",tbProp={0,3493},nCount=1,nRate=5,nQuality = 1},},
		{{szName="若水",tbProp={0,3494},nCount=1,nRate=5,nQuality = 1},},
		{{szName="镇岳",tbProp={0,3495},nCount=1,nRate=5,nQuality = 1},},
		{{szName="烟波",tbProp={0,3496},nCount=1,nRate=5,nQuality = 1},},
		{{szName="神慧",tbProp={0,3497},nCount=1,nRate=5,nQuality = 1},},
		{{szName="追影",tbProp={0,3498},nCount=1,nRate=5,nQuality = 1},},
		{{szName="流萤",tbProp={0,3500},nCount=1,nRate=5,nQuality = 1},},
		{{szName="龙胆",tbProp={0,3499},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="狂澜",tbProp={0,3501},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="虹影",tbProp={0,3503},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="翠玉冰玄",tbProp={0,3502},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="凝雪寒霜",tbProp={0,3494},nCount=1,nRate=0.5,nQuality = 1},},
		{{szName="秒解尘缘",tbProp={0,3505},nCount=1,nRate=2,nQuality = 1},},
		{{szName="力破军星",tbProp={0,3506},nCount=1,nRate=2,nQuality = 1},},
		{{szName="特效仙草",tbProp={6,1,1181,1,0,0},nCount=1,nRate=50},},
		{{szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1,nRate=5},},
		{{szName="漠北传送令",tbProp={6,1,1448,1,0,0},nCount=1,nRate=50},},
		{{szName="紫莽令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=30},},
		{{szName="大力丸礼包",tbProp={6,1,2517,1,0,0},nCount=1,nRate=50},},
		{{szName="炎帝令",tbProp={6,1,1617,1,0,0},nCount=1,nRate=30},},		
		{{szName="九天云游丹",tbProp={6,1,2379,1,0,0},nCount=1,nRate=40},},
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
	--消灭boss之后丢弃奖励物品 - Modified by DinhHQ - 20111012
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
	-- 武林荣誉令牌掉落
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
	
	-- 给杀掉BOSS的人或队伍奖励
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSEXPAWARD, 0, format("%s 奖励","打败黄金BOSS经验"));
		end
	else -- 一个人
		szName = GetName();
		PlayerFunLib:AddExp(KILLBOSSEXPAWARD, 0, format("%s 奖励","打败黄金BOSS经验"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSNEAREXPAWARD, 0, format("%s 奖励","黄金BOSS被消灭时站在附近的经验"));
	end
	
	local szNews = format("大侠<color=yellow>%s<color>在<color=yellow>%s<color>已消灭成功<color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	-- BOSS击杀统计
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
	
	if (GetNpcParam(nNpcIndex, 1) == 1) then --19:30的黄金BOSS
		-- 黄金BOSS计数
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "ReduceGoldBossCount", 0);
	end
end;

