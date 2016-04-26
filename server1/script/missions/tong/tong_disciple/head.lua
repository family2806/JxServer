if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\tong\tong_disciple\npcpoint.lua]]);
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include([[\script\missions\tong\tong_head.lua]]);
	
	--常值部分
	DIS_MISSIONID = 38;
	DIS_PREPAREMISSIONID = 37;
	DIS_MAXPLAYERCOUNT = 10;	--每个游戏最多10个人；
	DIS_ALL_MAXPLAYERCOUNT = 120; --一共最多120人；
	
	DIS_FRAME = 18;	--每秒18帧
	DIS_REFRASHTIME = 15 * DIS_FRAME; -- 每15秒钟刷一次怪
	DIS_VANISHTIME = 10 * DIS_FRAME;	--圣诞精灵停留10秒钟
	DIS_RUNINTERVER = 30 * DIS_FRAME; --30秒一次，可以公告游戏
	DIS_MAXPLAYTIMES = 5; --每人最多一天玩3次
	
	DIS_PREPARETIME = 65; --准备场计时器
	DIS_SMALLTIMERID = 66;	--刷怪计时器
	DIS_RUNTIMERID = 67;	--RunMission用的计时器；
	DIS_INTERVER = 5 * DIS_FRAME;	--5秒钟触发刷怪和清楚怪触发器
	
	--GLB值
	GLB_DIS_PHASE = 852;
	CHRISMAS_SHREWMOUSE = "TONG_SHREWMOUSE";
	--===============和怪相关==================
	DIS_NPCID = 323;	--刷出怪的NCP index
	DIS_MAPID = {821, 822};	--圣诞活动地图Id
	
	DIS_SMALLMAPCOUNT = 12;	--一共有12张小地图
	DIS_MOUSECOUNT = 10;	--一个小地图一次最少刷地鼠数目
	--=========================================
	
	--=========任务变量===============
--	TK_LEAVERMAPID = 2392;	--存储离开游戏的mapid
--	TK_LEAVERPOSX = 2393;	--存储离开游戏的x坐标点
--	TK_LEAVERPOSY = 2394;	--存储离开游戏的y坐标点
	
	DIS_TK_DAYKEY = 2395;	--记录是哪一天
	DIS_TK_PLAYTIMES = 2396; --记录一天内玩的次数
	
	DIS_COUNT_ONETIME = 2397;	--记录一场点了多少个
	DIS_TK_RANK = 2398;		--记录一场的排名；
--	
--	TK_GROUPID = 2399;	--记录玩家的Group号
--	TK_EXP_BEISHU = 2400; --
--	TK_EXP_TIME = 2401;
	--================================
	
	--MS部分；
	MS_STATE = 1;
	MS_TIMERSTATE = 2; --用来记录用于交替的进行刷怪和清除怪：0－清除怪；1－刷出怪
	MS_NEWSVALUE = 3; --
	MS_BEGINGMAPID = 10; --记录开始的地图的ID

	MS_PREPARENEWSVALUE = 5; --准备场计时变量

	DIS_MOUSENAME = "弟子"; --圣诞精灵的名字


	--播撒圣诞精灵
	function putfairy()
		local nNPCCount;
		local PosTab;	--用于记录
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(DIS_MAPID[2])
		local scriptfile = [[\script\missions\tong\tong_disciple\npcs\shrewmouse.lua]];
		
		for i = 1, DIS_SMALLMAPCOUNT do
			nNPCCount = DIS_MOUSECOUNT;
			local PosFile = format("\\settings\\maps\\chrismas\\elf_%d.txt", i);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, DIS_NPCID, DIS_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--清除圣诞精灵
	function clearfairy()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
		ClearMapNpcWithName(DIS_MAPID[2], DIS_MOUSENAME);
		SubWorld = OldWorld;
	end;
	
	
	--加入到游戏中
	function joindisciple(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(DIS_TK_DAYKEY) ~= nNowTime) then
			SetTask(DIS_TK_DAYKEY, nNowTime);
			SetTask(DIS_TK_PLAYTIMES, 0);
		end;
		
		--进行计数
		local nTimes = GetTask(DIS_TK_PLAYTIMES);
		if (GetTask(DIS_TK_PLAYTIMES) >= DIS_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>活动坊总管<color>: 每天只能参加5次弟子招募活动 ");
			return
		end;
		
		local nPhase = gb_GetTask(CHRISMAS_SHREWMOUSE, 1);
		if (nPhase ~= 1) then
			if (nPhase == 3) then
				Talk(1, "", "活动坊总管:  请等下次开始。报名时间为 0h, 3h, 6h， 21h,的15分, 30分和45分钟.");
				return
			end;
			Talk(1, "", "活动坊总管: 招募活动正在进行，报名时间为 0h, 3h, 6h， 21h,的15分, 30分和45分钟.");
			return
		end

		--帮会的判断
		if (festival_tongjudge(1, nTongID, nWorkshopID) == 0) then
			return
		end;

		local szFile = [[\settings\maps\chrismas\player.txt]];
		ww, xx, yy = GetWorldPos()
		local nPosX, nPosY;
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(DIS_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--游戏结束
	function gameover(nMapid, nMissionID)
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
		elseif (nBeishu ~= 2 or nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function setplayerreadystate()	--玩家进入准备场
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
	
	function setplayerleaverstate()	--玩家离开游戏场
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
	
	function setplayerjoinstate()	--玩家进入游戏
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(DIS_TK_PLAYTIMES, GetTask(DIS_TK_PLAYTIMES) + 1);
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
			local nPlMsIdx = PIdx2MSDIdx(DIS_MISSIONID, nPlIdx)	--玩家是否在指定Mission中
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
end;
