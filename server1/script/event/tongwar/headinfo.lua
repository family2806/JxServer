IL("FILESYS");
IL("ITEM");
IL("LEAGUE");
IL("SETTING");
IL("TITLE");
IL("RELAYLADDER");
IL("BATTLE")


TONGWAR_LGTYPE = 10

--战队成员Task
TONGWAR_LGMTASK_JOB = 1		--队长为1；队员为0

--战队公用Task
TONGWAR_LGTASK_TONGCNT = 1	--共联盟数
TONGWAR_LGTASK_WIN = 2			--胜利次数
TONGWAR_LGTASK_LOSE = 3			--失败次数
TONGWAR_LGTASK_TIE = 4			--平局次数
TONGWAR_LGTASK_RESULT = 5		--比赛总积分
TONGWAR_LGTASK_POINT = 6		--每场净积分累加
TONGWAR_LGTASK_CITYID = 7		--该城市id
TONGWAR_LGTASK_CAMP = 8			--该场比赛阵营
TONGWAR_LGTASK_MAP = 9			--该城比赛比赛地图
TONGWAR_LGTASK_RANK = 10		--比赛最终排名
--11	黄金之果
--12	辉煌之果礼包
--13	神秘红包礼包
--14	武林秘籍
TONGWAR_LGTASK_TITLE = 15		--帮会联盟是否领取了光环
TONGWAR_LGTASK_TONGID = 16		--城主帮会ID
TONGWAR_LGTASK_SEASON = 17		--赛季
TONGWAR_LGTASK_ELDER = 18		--长老奖励，共7个
TONGWAR_LGTASK_MASTER = 19		--帮主奖励，共1个
TONGWAR_LGTASK_MSTITLE = 20		--帮主称号
--21	洗髓经

--角色Task
TONGWAR_RLTASK_POINT = 2369
TONGWAR_RLTASK_NDEATH = 2370
TONGWAR_RLTASK_KILLPLAYER = 2371
TONGWAR_RLTASK_LASTDTIME = 2372
TONGWAR_RLTASK_CURRANK = 2373
TONGWAR_RLTASK_SERIESKILL = 2374
TONGWAR_RLTASK_MAXSERIESKILL = 2375
TONGWAR_RLTASK_MAXDEATH = 2376
TONGWAR_RLTASK_KEYNUMBER = 2377
TONGWAR_RLTASK_TOTALPOINT = 2378
TONGWAR_RLTASK_AWARD = 1737;	--BYTE1=season 领取过普通奖励
								--BYTE2=初始化为个人排名奖励
								--BYTE3=帮主和长老奖励
								--BYTE4=初始化为season

--战队变量——奖励 黄金之果	辉煌之果	神秘大红包	武林秘籍	洗髓经
LG_TASK_AWORD = {11, 12, 13, 14, 21};
PL_TEMPTASK_SECURITY = 193;

TV_LASTDEATHTIME = 2306	
TV_LASTDEATHMAPX = 2307
TV_LASTDEATHMAPY = 2308
TV_SERIESKILL_REALY = 2305  --玩家当前的实际连斩值（高级杀比较低级的玩家，计连斩，但不计真实连斩）
--
-- TONG_MASTER = 3;

	
--BATTLE TASK---------------------
		PL_TOTALPOINT = 1
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		--玩家整个战局的最大连斩数
		PL_SERIESKILL = 14			--玩家当前的连斩数
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22
		PL_PARAM2 = 23
		PL_PARAM3 = 24
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 表示玩家当前的官职，目前使用第6号参数
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 --记录玩家上一次参加战役的战役流水号
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	--记录玩家本战役的总积分，总积分是玩家所参加的各场战局的积分总和, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48

		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5
		GAME_CAMP2 = 6
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14

--武林盟传人	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>武林传奇\n   <link>"
--城市
TONGWAR_CITY = {"凤翔","成都","大理","汴京","襄阳","扬州","临安",}
TONGWAR_CITYID = {['凤翔']=1,['成都']=2,['大理']=3,['汴京']=4,['襄阳']=5,['扬州']=6,['临安']=7}
--Change schedule VLDNB 11 - Modified by DinhHQ - 20120507
TONGWAR_CALENDAR = {
			format("<color=red>%s<color><color=yellow>|<color>临安 vs 襄阳<color=yellow>|<color>汴京 vs 扬州<color=yellow>|<color>\n成都 vs 大理<color=yellow>|<color>凤翔不比赛.", "16/05"),
			format("<color=red>%s<color><color=yellow>|<color>凤翔vs 汴京<color=yellow>|<color>襄阳vs扬州<color=yellow>|<color>临安vs大理<color=yellow>|<color>成都不比赛.", "17/05"),
			format("<color=red>%s<color><color=yellow>|<color>成都 vs 临安<color=yellow>|<color>凤翔vs 襄阳<color=yellow>|<color>\扬州 vs 大理<color=yellow>|<color>汴京不比赛.", "19/05"),
			format("<color=red>%s<color><color=yellow>|<color>汴京 vs 襄阳<color=yellow>|<color>成都vs 扬州<color=yellow>|<color>凤翔vs 大理<color=yellow>|<color>临安不比赛.", "20/05"),
			format("<color=red>%s<color><color=yellow>|<color>凤翔vs 成都<color=yellow>|<color>临安vs 扬州<color=yellow>|<color>\汴京vs 大理<color=yellow>|<color>襄阳不比赛.", "21/05"),
			format("<color=red>%s<color><color=yellow>|<color>成都vs 汴京<color=yellow>|<color>凤翔vs 临安<color=yellow>|<color>\襄阳vs 大理<color=yellow>|<color>扬州不比赛.", "22/05"),
			format("<color=red>%s<color><color=yellow>|<color>汴京vs 临安<color=yellow>|<color>成都vs 襄阳<color=yellow>|<color>\凤翔vs 扬州<color=yellow>|<color>大理不比赛.", "23/05"),
			}
			
PHB_WULIN = 10227 --武林十大排名
PHB_CHENGSHI = {['成都'] = 10228 ,--成都十大排名
				['凤翔'] = 10229 ,--凤翔十大排名
				['汴京'] = 10230 ,--汴京十大排名
				['临安'] = 10231 ,--临安十大排名
				['大理'] = 10232 ,--大理十大排名
				['襄阳'] = 10233 ,--襄阳十大排名
				['扬州'] = 10234 --扬州十大排名
			}

TAB_AWORD_GOOD = 
		{
			{{tbProp={6,1,907 ,1},szName="黄金之果",nExpiredTime=10080}, {15, 10, 8, 6, 5, 3, 1}},	--黄金之种的奖励列表
			{{tbProp={6,1,1075,1},szName="辉煌果礼盒"}, {150, 100, 80, 60, 50, 30, 10}},	--辉煌之种的奖励列表
			{{tbProp={6,1,2263,1},szName="紫金真丹",tbParam={0,20}}, {8, 4, 2, 1, 0, 0, 0}},	--紫金真丹（20亿）的奖励列表
			{{tbProp={6,1,2270,1},szName="千年辉煌果"}, {80, 60, 50, 40, 30, 20, 10}},	--千年辉煌之果的奖励列表
			--VLDNB 11 - Modified By DinhHQ - 20120507
			{{tbProp={6,1,2357,1},szName="白虎令"}, {5, 3, 2, 1, 0, 0, 0}},			
			{{tbProp={0,10,9,1, 5},szName="赤龙驹", nExpiredTime=180 * 60 * 24}, {1, 0, 0, 0, 0, 0, 0}},	--玄猿令的奖励列表
			
			
--		{{6, 1, 1074, TONGTASK_AWORD_SMDHB, "神秘大红包礼盒"}, {80, 50, 30, 20, 15, 10, 5}},	--神秘大红包的奖励列表
--		{{6, 1, 26, TONGTASK_AWORD_CBT, "武林秘籍"}, {15, 10, 8, 6, 5, 3, 1}},	--武林秘籍的奖励列表
--		{{6, 1, 22, TONGTASK_AWORD_CBT, "洗髓经"}, {15, 10, 8, 6, 5, 3, 1}},	--洗髓经的奖励列表
		}

function tongwar_contribute(szPlayerName, szCityName, nRecord)--更新排行榜
	--addrecord totalrecord
	--ladder_(ncity, record)   taskvalue
	--ladder_(record)
	--1.将个人积分加到武林排行榜跟城市排行榜中去；
	if (not szCityName or not szPlayerName) then
		return
	end;
	local taskid_record;
	local nPlayerRecord = GetTask(TONGWAR_RLTASK_TOTALPOINT);
--	nPlayerRecord = nPlayerRecord + nRecord;
--	SetTask(TONGWAR_RLTASK_TOTALPOINT, nPlayerRecord);
	if (tongwar_citynamecheck(szCityName)) then
		Ladder_NewLadder(PHB_CHENGSHI[szCityName], szPlayerName, nPlayerRecord, 0);
		Ladder_NewLadder(PHB_WULIN, szPlayerName, nPlayerRecord, 0);
	end;
	
end;

function tongwar_citynamecheck(szCityName)
	local bIsCity = 0;
	local i;
	for i = 1, getn(TONGWAR_CITY) do
		if (szCityName == TONGWAR_CITY[i]) then
			bIsCity = 1;
			break;
		end;
	end;
	return bIsCity;
end;

