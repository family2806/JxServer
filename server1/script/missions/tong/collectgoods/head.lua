if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\tong\collectgoods\npcpoint.lua]]);
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include([[\script\missions\tong\tong_head.lua]]);
	
	--常值部分
	COLLG_PREPAREMISSIONID = 44;
	COLLG_MISSIONID = 45;
	COLLG_MAXPLAYERCOUNT = 10;	--每个游戏最多10个人；
	COLLG_ALL_MAXPLAYERCOUNT = 120; --一共最多120人；
	
	COLLG_FRAME = 18;	--每秒18帧
	COLLG_REFRASHTIME = 15 * COLLG_FRAME; -- 每15秒钟刷一次怪
	COLLG_VANISHTIME = 10 * COLLG_FRAME;	--圣诞精灵停留10秒钟
	COLLG_RUNINTERVER = 30 * COLLG_FRAME; --30秒一次，可以公告游戏
	COLLG_BOMBINTERVER = 30 * COLLG_FRAME; --30秒爆炸一次，
	COLLG_MAXPLAYTIMES = 5; --每人最多一天玩8次
	
	COLLG_PREPARETIME = 75; --准备场计时器
	COLLG_SMALLTIMERID = 76;	--刷怪计时器
	COLLG_RUNTIMERID = 77;	--RunMission用的计时器；

	COLLG_INTERVER = 5 * COLLG_FRAME;	--5秒钟触发刷怪和清楚怪触发器
	--物品的index值；
	COLLG_GOODSIDX = 1086;
	--GLB值
	GLB_COLLG_PHASE = 918;
	--===============和怪相关==================
	COLLG_NPCID = 1121;	--刷出怪的NCP index
	COLLG_MAPID = {827, 828};	--圣诞活动地图Id
	
	COLLG_SMALLMAPCOUNT = 23;	--一共有12张小地图
	COLLG_MOUSECOUNT = 10;	--一个小地图一次最少刷地鼠数目
	--=========================================
	
	--=========任务变量===============
--	TK_LEAVERMAPID = 2423;	--存储离开游戏的mapid
--	TK_LEAVERPOSX = 2424;	--存储离开游戏的x坐标点
--	TK_LEAVERPOSY = 2425;	--存储离开游戏的y坐标点
	
	COLLG_TK_DAYKEY = 2402;		--记录是哪一天
	COLLG_TK_PLAYTIMES = 2403; 	--记录一天内玩的次数
	
	COLLG_COUNT_ONETIME = 2404;	--记录一场点了多少个
	COLLG_TK_RANK = 2408;			--记录一场的排名；
--	
--	TK_GROUPID = 2430;	--记录玩家的Group号
--	TK_EXP_TIME = 2432;
	
	COLLG_TK_BOMB_MARK = 2409;	--记录是被第几个炸弹炸中
	--================================
	
	--MS部分；
	COLLG_MS_STATE = 1;
	COLLG_MS_TIMERSTATE = 2; --用来记录用于交替的进行刷怪和清除怪：0－清除怪；1－刷出怪
	COLLG_MS_NEWSVALUE = 3; --
	COLLG_MS_BEGINGMAPID = 10; --记录开始的地图的ID

	COLLG_MS_PREPARENEWSVALUE = 5; --准备场计时变量
	COLLG_MS_GAMECOUNT = 11;	--记录有多少个场地
	COLLG_NAME = "Thu th藀 v藅 ph萴 bang h閕";
	
	COLLG_SKILLIDBOMB = 736;
	COLLG_SKILLLVLBOMB = 10;
	
	function collg_settobomber()
		SetTask(COLLG_TK_BOMB_MARK, -1);
	    AddTempMagic(COLLG_SKILLIDBOMB, COLLG_SKILLLVLBOMB);
	    SetImmedSkill(0, COLLG_SKILLIDBOMB)
	    SetAForbitSkill(COLLG_SKILLIDBOMB,0)
    	AddSkillState(705, 10, 0, 20000 * 18);
	end;
	
	function collg_settonormal()
		SetTask(COLLG_TK_BOMB_MARK, 0);
		SetAForbitSkill(COLLG_SKILLIDBOMB, 1);
		AddTempMagic(COLLG_SKILLIDBOMB, -1 * COLLG_SKILLLVLBOMB);
		SetImmedSkill(0, 1);
	    AddSkillState(705, 10, 0, 0);
	end;
	
	--播撒圣诞精灵
	function collg_putfairy()
		local nNPCCount;
		local PosTab;	--用于记录
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		
		local nBeginID = GetMissionV(COLLG_MS_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(COLLG_MS_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > COLLG_SMALLMAPCOUNT) then
		        j = mod(i, COLLG_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
		    
		    if (j >= 20 and j <= 23) then
				j = j + 4;
			end;
			local PosFile = format("\\settings\\maps\\dragonboatfestival_06\\elf_%d.txt", j);
			PosTab = getndata(PosFile, COLLG_MOUSECOUNT)

			tabaddgoods(PosTab);
		end;
		SubWorld = OldWorld;
	end;
	
	
	--清除圣诞精灵
	function collg_clearfairy()
		ClearMapObj(COLLG_MAPID[2]);
	end;
	
	--判断玩家是否充过卡
	function collg_IsCharged()
		if( GetExtPoint( 0 ) >= 1 ) then
			return 1;
		else
			return 0;
		end;
	end;
	--加入到游戏中
	function collg_joindisciple(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(COLLG_TK_DAYKEY) ~= nNowTime) then
			SetTask(COLLG_TK_DAYKEY, nNowTime);
			SetTask(COLLG_TK_PLAYTIMES, 0);
		end;
		
		--进行计数
		local nTimes = GetTask(COLLG_TK_PLAYTIMES);
		if (GetTask(COLLG_TK_PLAYTIMES) >= COLLG_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>活动坊总管<color>: 每天只能参加5轮收集物品活动!");
			return
		end;
		
		local nPhase = gb_GetTask(COLLG_NAME, 1);
		if (nPhase ~= 1) then
			if (nPhase == 2) then
				Talk(1, "", "真是不好意思，引路人已带一些侠客走了，稍候才回来，请等下一次吧.");
				Msg2Player("活动正在进行，请等下一次吧.");
				return
			end;
			Talk(1, "", "目前有很多需要做的重要事情，在0h 00 到1h 00, 12h00 饿14h00, 19h 00 恶 22h00回来找我.");
			Msg2Player("活动未开始.");
			return
		end
		
		--帮会的判断
		if (festival_tongjudge(3, nTongID, nWorkshopID) == 0) then
			return
		end;

		local szFile = [[\settings\maps\dragonboatfestival_06\player.txt]];
		ww, xx, yy = GetWorldPos()
		local nPosX, nPosY;
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(COLLG_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--游戏结束
	function collg_gameover(nMapid, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapid);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(nMissionID, idx, 0);
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
			collg_setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--检察自己的状态
	function collg_get_exptimes()
		local exp_time = GetTask(TK_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 or nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function collg_setplayerreadystate()	--玩家进入准备场
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
	
	function collg_setplayerleaverstate()	--玩家离开游戏场
		ForbitSkill(0);
		SetMoveSpeed(-1);
		
	    SetAForbitSkill(COLLG_SKILLIDBOMB, 1);
		--去除炸弹人标记
		collg_settonormal();
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
	
	function collg_setplayerjoinstate()	--玩家进入游戏
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(COLLG_TK_PLAYTIMES, GetTask(COLLG_TK_PLAYTIMES) + 1);
		SetTask(TK_TIME_ALL, GetTask(TK_TIME_ALL) + 1);
		SetTask(COLLG_TK_BOMB_MARK, 0);
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,1);
		--设置战斗状态
		SetFightState(1);
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
			local nPlMsIdx = PIdx2MSDIdx(COLLG_MISSIONID, nPlIdx)	--玩家是否在指定Mission中
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	function OnCancel()
	end;
end;
