if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\chrismas\ch_file_npc_head.lua]]);
	Include("\\script\\lib\\gb_taskfuncs.lua") --
	Include("\\script\\lib\\common.lua")
	--常值部分
	DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>圣诞老人:<link>"	
	
	CH_MISSIONID = 28;
	CH_PREPAREMISSIONID = 29;
	CH_MAXPLAYERCOUNT = 10;	--每个游戏最多10个人；
	CH_ALL_MAXPLAYERCOUNT = 120; --一共最多120人；
	
	CH_FRAME = 18;	--每秒18帧
	CH_REFRASHTIME = 15 * CH_FRAME; -- 每15秒钟刷一次怪
	CH_VANISHTIME = 10 * CH_FRAME;	--圣诞礼包停留10秒钟
	CH_RUNINTERVER = 30 * CH_FRAME; --30秒一次，可以公告游戏
	CH_MAXPLAYTIMES = 5; --每人最多一天玩5次
	
	CH_PREPARETIME = 54; --准备场计时器
	CH_SMALLTIMERID = 55;	--刷怪计时器
	CH_RUNTIMERID = 56;	--RunMission用的计时器；
	CH_INTERVER = 5 * CH_FRAME;	--5秒钟触发刷怪和清楚怪触发器
	CH_TOTALINTERVER = 60 * 60 * CH_FRAME; --1小时之后关闭Mission
	
	--GLB值
	GLB_CH_PHASE = 848;
	CHRISMAS_SHREWMOUSE = "圣诞活动";
	--===============和怪相关==================
	CH_NPCID = 1236;	--刷出怪的NCP index
	CH_MAPID = {582, 583};	--圣诞活动地图Id
	
	CH_SMALLMAPCOUNT = 12;	--一共有12张小地图
	CH_MOUSECOUNT_MIN = 10;	--一个小地图一次最少刷地鼠数目
	CH_MOUSECOUNT_MAX = 10;	--一个小地图一次最多刷地鼠数目
	--=========================================
	
	--=======================================
	CHRIMAS_SALEID = 136; --商人卖东西的ID
	
	--=========任务变量===============都没有定，需要逗逗查找
	TK_LEAVERMAPID = 2323;	--存储明月镇的mapid
	TK_LEAVERPOSX = 2324;	--存储离开游戏的x坐标点
	TK_LEAVERPOSY = 2325;	--存储离开游戏的y坐标点
	
	TK_DAYKEY = 2326;	--记录是哪一天
	TK_PLAYTIMES = 2327; --记录一天内玩的次数
	TK_PLAYMAXTIMES = 2521;--最多参加50场
	
	TK_COUNT_ONETIME = 2328;	--记录一场点了多少个
	
	TK_RANK = 2329;		--记录一场的排名；
	
	TK_GROUPID = 2330;	--记录玩家的Group号
	TK_EXP_BEISHU = 2331; --
	TK_EXP_TIME = 2332;
	--================================
	
	--=============用来显示战报的==============
	CH_TOTALPOINT = 1;
	CH_GETITEM = 17;
	--=========================================
	
	--MS部分；
	MS_STATE = 1;
	MS_TIMERSTATE = 2; --用来记录用于交替的进行刷怪和清除怪：0－清除怪；1－刷出怪
	MS_NEWSVALUE = 3; --
	MS_BEGINGMAPID = 10; --记录开始的地图的ID
	
	MS_PREPARENEWSVALUE = 5; --准备场计时变量
	
	MSS_MOUSENAME = 1; --圣诞礼包的名字
	
	
	--播撒圣诞礼包
	function putfairy()
		local nNPCCount;
		local PosTab;	--用于记录
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2])
		local scriptfile = [[\script\missions\chrismas\npcs\shrewmouse.lua]];
		
		local name = GetMissionS(MSS_MOUSENAME);
		for i = 1, CH_SMALLMAPCOUNT do
			nNPCCount = random(CH_MOUSECOUNT_MIN, CH_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\chrismas\\elf_%d.txt", i);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, CH_NPCID, name)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--清除圣诞礼包
	function clearfairy()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2]);
		ClearMapNpcWithName(CH_MAPID[2], "圣诞礼包");
		SubWorld = OldWorld;
	end;
	
	
	--加入到游戏中
	function joingame()
		local nNowTime = tonumber(date("%y%m%d"));
		if (GetTask(TK_PLAYMAXTIMES) >= 50) then
			Talk(1, "", "<color=yellow>圣诞老人<color>:每人最多只能参加50次寻找礼物，你不能再参加了!");
			return
		end;
		
		if (GetTask(TK_DAYKEY) ~= nNowTime) then
			SetTask(TK_DAYKEY, nNowTime);
			SetTask(TK_PLAYTIMES, 0);
		end;

		--进行计数
		local nTimes = GetTask(TK_PLAYTIMES);
		if (GetTask(TK_PLAYTIMES) >= CH_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>圣诞老人<color>: 1天只比赛5场!");
			return
		end;
		
		
		if (gb_GetTask("圣诞活动", 1) ~= 1) then
			local nNowTime = tonumber(GetLocalDate("%H%M"));
			local bOn = 0;
			if ((nNowTime >=1900 and nNowTime <=2300) or (nNowTime >=1200 and nNowTime <=1400)) then
				bOn = 1;
			end;
			if (bOn == 0) then
				Talk(1, "", "<color=yellow>圣诞老人<color>: 从每天的12:00-4:00 和晚上19:00-23:00开展圣诞活动, 现在还没有到活动时间或者活动还没有开始!");
				return
			else
				Talk(1, "", "<color=yellow>圣诞老人<color>: 游戏正在进行，按顺序来！每场15、30、45分整开始.");
				return
			end;
		end;

		local szFile = [[\settings\maps\chrismas\player.txt]];
		local nPosX, nPosY;
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(CH_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--游戏结束
	function gameover()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2]);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(CH_MISSIONID, idx, 0);
			if (pidx > 0) then
				tabPlayer[i] = pidx;
			end;
			
			if (0 == idx) then
				break;
			end;
			
		end;
		
		local nLoop = getn(tabPlayer);
		for i = 1, nLoop do
			PlayerIndex = tabPlayer[i];
			setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--检察自己的状态
	function get_exptimes()
		local exp_time = GetTask(TK_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 and nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function setplayerreadystate()	--玩家离开游戏场时候进行状态设置
		ForbitSkill(1);
		SetMoveSpeed(18);

		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,1);
		--设置战斗状态
		SetFightState(0);
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(1);
		--无死亡惩罚
		SetPunish(0);
		--关闭组队功能
		SetCreateTeam(0);
		
		--禁止光环
		ForbitAura(1)
		--设置仇杀
		ForbidEnmity( 1 )
		--打开PK开关 

		--开始应该都不能PK
		SetPKFlag(0)
		--禁止交易;
		DisabledStall(1);
		ForbitTrade(0);
		
		ForbidChangePK(1);
		DisabledUseTownP(1);	--禁止使用回程；
	end;
	
	function setplayerleaverstate()	--玩家离开游戏场时候进行状态设置
		ForbitSkill(0);
		SetMoveSpeed(-1);
		
		--禁止光环
		ForbitAura(0)
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,0);
		--设置战斗状态
		SetFightState(0);
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		--SetLogoutRV(0);
		--无死亡惩罚
		SetPunish(1);
		--关闭组队功能
		SetCreateTeam(0);
		--打开PK开关 
		
		--设置仇杀
		ForbidEnmity( 0 )
		--开始应该都不能PK
		SetPKFlag(0)
		--禁止交易;
		DisabledStall(0);
		ForbitTrade(0);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(0);
		DisabledUseTownP(0);	--禁止使用回程；
	end;
	
	function setplayerjoinstate()	--玩家进入游戏的时候进行状态设置
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(TK_PLAYTIMES, GetTask(TK_PLAYTIMES) + 1);
		SetTask(TK_PLAYMAXTIMES, GetTask(TK_PLAYMAXTIMES) + 1);
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,1);
		--设置战斗状态
--		SetFightState(1);
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(1);
		
		--禁止光环
		ForbitAura(1)
		SetFightState(1);
		--无死亡惩罚
		SetPunish(0);
		--关闭组队功能
		SetCreateTeam(0);
		--打开PK开关 

		--设置仇杀
		ForbidEnmity( 1 )
		--开始应该都不能PK
		SetPKFlag(1)
		--禁止交易;
		DisabledStall(1);
		ForbitTrade(0);
		
		ForbidChangePK(1);
		SetCurCamp(4);	--设置临时阵营
		DisabledUseTownP(1);	--禁止使用回程；
	end;

	--生成一个相对于当前玩家的选项
	function ch_make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--检查该玩家是否仍在游戏中，成功返回PlayerIndex否则返回nil
	function ch_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--玩家是否在当前服务器
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(CH_MISSIONID, nPlIdx)	--玩家是否在指定Mission中
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
end;

function isXmasTime(bAward)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (bAward == 1) then
		if (nDate >= 061222 and nDate <= 070114) then
			return 1;
		end;
	elseif (nDate >= 061222 and nDate <= 070114) then
		return 1;
	end;
	return 0;
end;