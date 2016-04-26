if (not __FESTIVAL_HEAD__) then
	__FESTIVAL_HEAD__ = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\springfestival\festival_file_npc_head.lua]]);
	Include("\\script\\lib\\gb_taskfuncs.lua") --
	Include("\\script\\lib\\common.lua")
	--常值部分
	--DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>圣诞老人：<link>"	
	
	FE_PREPAREMISSIONID = 30;
	FE_MISSIONID = 31;
	
	FE_FRAME = 18;	--每秒18帧
	FE_REFRASHTIME = 15 * FE_FRAME; -- 每15秒钟刷一次怪
	FE_VANISHTIME = 10 * FE_FRAME;	--圣诞精灵停留10秒钟
	FE_RUNINTERVER = 30 * FE_FRAME; --30秒一次，可以公告游戏
	FE_MAXPLAYTIMES = 5; --每人最多一天玩5次
	FE_LEVELLIMIT = 50; --玩家参加需要的最小级别
	
	FE_PREPARETIME = 57; --准备场计时器
	FE_FAIRY_SMALLTIMERID = 58;	--刷怪计时器
	FE_REPORT_SMALLTIMERID = 59;	--RunMission用的计时器；
	FE_INTERVER = 5 * FE_FRAME;	--5秒钟触发刷怪和清楚怪触发器
	
	--GLB值
	GLB_FE_PHASE = 849; --春节活动的时间
	--===============和怪相关==================
	FE_NPCID = 361;	--刷出怪的NCP index
	FE_MAPID = {584, 585};	--圣诞活动地图Id
	
	FE_SMALLMAPCOUNT = 19;	--一共有12张小地图
	FE_MOUSECOUNT_MIN = 10;	--一个小地图一次最少刷地鼠数目
	FE_MOUSECOUNT_MAX = 10;	--一个小地图一次最多刷地鼠数目
	FE_MAXPLAYERCOUNT = 10;	--每个游戏最多10个人；
	FE_NIANSHOU_XUANYUN = 10;   --年兽每被攻击10次就被眩晕
	FE_ALL_MAXPLAYERCOUNT = 100; --一共最多120人；
	--=========================================
	
	--=========任务变量===============
	TK_FE_LEAVERMAPID = 1123;	--存储明月镇的mapid
	TK_FE_LEAVERPOSX = 1124;	--存储离开游戏的x坐标点
	TK_FE_LEAVERPOSY = 1125;	--存储离开游戏的y坐标点
	
	TK_FE_DAYKEY = 1126;	--记录是哪一天
	TK_FE_PLAYTIMES = 1127; --记录一天内玩的次数
	
	TK_FE_COUNT_ONETIME = 1128;	--记录一场点了多少个
	
	TK_FE_RANK = 1129;		--记录一场的排名；
	
	TK_FE_GROUPID = 1130;	--记录玩家的Group号
	TK_FE_EXP_BEISHU = 1131; -- 获得经验的倍数
	TK_FE_EXP_TIME = 1132;  -- 获得双倍的时间
	
	TK_FE_ATTACKED_TIMES = 1133;    --记录年兽被攻击的次数
	TK_FE_ATTACKED_INTERVER = 1134;     --普通玩家使用道具间隔
	
	--================================
	
	--MS部分；
	MS_FE_STATE = 1;
	MS_FE_TIMERSTATE = 2; --用来记录用于交替的进行刷怪和清除怪：0－清除怪；1－刷出怪
	MS_FE_NEWSVALUE = 3; --
	MS_FE_BEGINGMAPID = 10; --记录开始的地图的ID
	MS_FE_PREPARENEWSVALUE = 5; --准备场计时变量
	MS_FE_GAMECOUNT = 6;    --  记录一场开始的游戏的个数
	--常量部分；
	FESTIVAL_SHREWMOUSE = "春季活动";
	FE_ANIMALNAME = "怪兽";
	FE_MOUSENAME = "失踪小孩"; --圣诞精灵的名字
	FE_GIFTNAME = "留下的礼物";       --礼物NPC的名字
	FE_SIGNNPCNAME = "<color=yellow>衙门差役<color>:";    --报名圣诞老人的名字
	FE_MAPPOINTFLORDER = "springfestival2006";
	FE_NIGHT_BEGINTIME = 1900;
	FE_NIGHT_ENDTIME = 2300;
	FE_NOON_BEGINTIME = 1200;
	FE_NOON_ENDTIME = 1400;
	FE_DARK_BEGINTIME = 100;
	FE_DARK_ENDTIME = 300;
	FESTIVAL_OK = 1;    --设置状态肯定表示
	FESTIVAL_NO = 0;    --设置状态否定表示
	FESTIVAL_ENTERSPEED = 16; --进行游戏的玩家的速度
	FESTIVAL_LEAVERSPEED = -1; --离开游戏的玩家的速度
	
	--播撒圣诞精灵
	function festival_putfairy()
		local nNPCCount;
		local PosTab;	--用于记录
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(FE_MAPID[2])
		local scriptfile = [[\script\missions\springfestival\npcs\festival_shrewmouse.lua]];
		
		local nBeginID = GetMissionV(MS_FE_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(MS_FE_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > FE_SMALLMAPCOUNT) then
		        j = mod(i, FE_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
			nNPCCount = random(FE_MOUSECOUNT_MIN, FE_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\"..FE_MAPPOINTFLORDER.."\\elf_%d.txt", j);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, FE_NPCID, FE_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--清除圣诞精灵
	function festival_clearfairy(szNPCName)
	    if ("string" ~= type(szNPCName)) then
	        return
	    end;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(FE_MAPID[2]);
		ClearMapNpcWithName(FE_MAPID[2], szNPCName);     --将所有的年兽清除
		SubWorld = OldWorld;
	end;
	
	
	--加入到游戏中
	function festival_joingame()
		local nNowTime = tonumber(date("%y%m%d"));
		if (GetTask(TK_FE_DAYKEY) ~= nNowTime) then
			SetTask(TK_FE_DAYKEY, nNowTime);
			SetTask(TK_FE_PLAYTIMES, 0);
		end;

		--进行计数
		local nTimes = GetTask(TK_FE_PLAYTIMES);
		if (nTimes >= FE_MAXPLAYTIMES) then
			Talk(1, "", FE_SIGNNPCNAME.."今天你已来5次了，要不休息一下吧!");
			return
		end;
		
		if (GetLevel() < FE_LEVELLIMIT) then
			Talk(1, "", FE_SIGNNPCNAME.."你的等级过低，我不想你有危险，等到50级后再来吧.");
			return
		end;
		
		
		if (gb_GetTask(FESTIVAL_SHREWMOUSE, 1) ~= 1) then
			local nNowTime = tonumber(GetLocalDate("%H%M"));
			local bOn = 0;
			if ((nNowTime >= FE_NIGHT_BEGINTIME and nNowTime <= FE_NIGHT_ENDTIME) or 
              (nNowTime >= FE_NOON_BEGINTIME and nNowTime <= FE_NOON_ENDTIME) or 
              (nNowTime >= FE_DARK_BEGINTIME and nNowTime <= FE_DARK_ENDTIME)) then
				    bOn = 1;
			end;
			if (bOn == 0) then
				Talk(1, "", FE_SIGNNPCNAME.."我们正准备对付怪兽的计划，活动将从12:00 到14:00, 晚上19:00 到 23:00, 午夜1:00 到3:00, 到时要来哦!");
				return
			else
				Talk(1, "", FE_SIGNNPCNAME.."你也想去打怪物啊？引路的人已经走了，在0 分, 15 分, 30 分, 45分 将回来.");
				return
			end;
		end;
		
		local ww, xx, yy = GetWorldPos();
		SetTask(TK_FE_LEAVERMAPID, ww);
		SetTask(TK_FE_LEAVERPOSX, xx);
		SetTask(TK_FE_LEAVERPOSY, yy);
		local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\player.txt]];
		local nPosX, nPosY;
		nPosX, nPosY = getadatabetween(szFile, 2, 15);
		NewWorld(FE_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--游戏结束
	function festival_gameover(nMapID, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapID);
		
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
			festival_setplayerleaverstate();
			NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--检察自己的状态
	function festival_get_exptimes()
		local exp_time = GetTask(TK_FE_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_FE_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 and nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function festival_setplayertoprepare()	--玩家进入准备场时候进行状态设置
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);

		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200, 1);
		--设置战斗状态
		SetFightState(FESTIVAL_NO);
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(FESTIVAL_OK);
		--无死亡惩罚
		SetPunish(FESTIVAL_NO);
		--关闭组队功能
		SetCreateTeam(FESTIVAL_NO);
		
		--禁止光环
		ForbitAura(FESTIVAL_OK)
		--设置仇杀
		ForbidEnmity(FESTIVAL_OK)
		--打开PK开关 

		--开始应该都不能PK
		SetPKFlag(FESTIVAL_NO)
		--禁止交易;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		DisabledUseTownP(FESTIVAL_OK);	--禁止使用回程；
	end;
	
	function festival_setplayerleaverstate()	--玩家离开游戏时候进行状态设置
		ForbitSkill(FESTIVAL_NO);
		SetMoveSpeed(FESTIVAL_LEAVERSPEED);
		
		RestoreOwnFeature();    --将所有人变成原来样子
		local i;
		for i = 1035, 1048 do
            ConsumeItem( -1, 1000, 6, 1, i, 1 );
        end;
		
		--禁止光环
		ForbitAura(FESTIVAL_NO)
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,0);
		--设置战斗状态
		SetFightState(FESTIVAL_NO);
		--无死亡惩罚
		SetPunish(FESTIVAL_OK);
		--关闭组队功能
		SetCreateTeam(FESTIVAL_NO);
		--打开PK开关 
		
		--设置仇杀
		ForbidEnmity( FESTIVAL_NO )
		--开始应该都不能PK
		SetPKFlag(FESTIVAL_NO)
		--禁止交易;
		DisabledStall(FESTIVAL_NO);
		ForbitTrade(FESTIVAL_NO);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(FESTIVAL_NO);
		DisabledUseTownP(FESTIVAL_NO);	--禁止使用回程；
	end;
	
	function festival_setplayertogame()	--玩家进入游戏的时候进行状态设置
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
		SetTaskTemp(200,1);
		
		SetTask(TK_FE_PLAYTIMES, GetTask(TK_FE_PLAYTIMES) + 1);
		--设置战斗状态
		--玩家退出时，保存RV并，在下次等入时用RV(城市重生点，非退出点)
		SetLogoutRV(FESTIVAL_OK);
		
		--禁止光环
		ForbitAura(FESTIVAL_OK)
		SetFightState(FESTIVAL_OK);
		--无死亡惩罚
		SetPunish(FESTIVAL_NO);
		--关闭组队功能
		SetCreateTeam(FESTIVAL_NO);
		--打开PK开关 

		--设置仇杀
		ForbidEnmity( FESTIVAL_OK )
		--开始应该都不能PK
		SetPKFlag(FESTIVAL_OK)
		--禁止交易;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		SetCurCamp(1);	--设置临时阵营
		DisabledUseTownP(FESTIVAL_OK);	--禁止使用回程；
	end;

	--生成一个相对于当前玩家的选项
	function festival_make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--检查该玩家是否仍在游戏中，成功返回PlayerIndex否则返回nil
	function festival_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--玩家是否在当前服务器
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(FE_MISSIONID, nPlIdx)	--玩家是否在指定Mission中
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	--检查道具是否可以被使用
	function itemuseplacecheck(nType)   --nType :1——公共道具；2——年兽专用道具；3——普通玩家专业道具
	    local ww, xx, yy = GetWorldPos();
	    if (FE_MAPID[2] ~= ww) then
    	    Talk(1, "", "该物品只用于春季活动.");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) <= FE_SMALLMAPCOUNT and 2 == nType) then
    	    Talk(1, "", "只有打怪玩家才能使用该面具");
	        return 0;
	    end;
	    
	    if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT and 3 == nType) then
    	    Talk(1, "", "只有一般玩家才能使用该物品.");
	        return 0;
	    end;
	    
	    return 1
	end;
	--找到对立阵营，年兽——>玩家，玩家——>年兽
	function festival_getgroupid(nGroupId)
	    if (nGroupId < 1) then
	        return nil
	    end;
	    
	    if (nGroupId > FE_SMALLMAPCOUNT) then
	        return nGroupId - FE_SMALLMAPCOUNT;
	    else
	        return nGroupId + FE_SMALLMAPCOUNT;
	    end;
	end;
	
	function festival_go_other_place()  --随机传到起始点
	    local nBeginMapID = GetMissionV(MS_FE_BEGINGMAPID);
    	local nGroupId = GetTask(TK_FE_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, FE_SMALLMAPCOUNT) + 1;
    	local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\elf_]]..nMapId..[[.txt]];
    	local PosX, PosY = getadata(szFile);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_go_back(nBeginMapID)  --随机传到起始点
    	local nGroupId = GetTask(TK_FE_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, FE_SMALLMAPCOUNT) + 1;
    	local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\player.txt]];
		local PosX, PosY = getadatabetween(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_checkinterver()
	    local gametime = GetGameTime();
	    if (GetTask(TK_FE_ATTACKED_INTERVER) > gametime) then
	        return 0;
	    else
	        SetTask(TK_FE_ATTACKED_INTERVER, gametime + 2);
	        return 1;
	    end;
	end;
end;
