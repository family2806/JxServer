-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 百人擂台主文件
-- 文件名　：arena.lua
-- 创建者　：子非魚
-- 创建时间：2011-04-24 13:58:40

-- ======================================================

Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\lib\\file.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\map.lua")
Include("\\script\\missions\\bairenleitai\\head.lua")
Include("\\script\\lib\\remoteexc.lua")
IncludeLib("FILESYS")
Include("\\script\\activitysys\\playerfunlib.lua")

HundredArena = {
	nMapId = 960,
	bTrapFlag = 0,			-- 是否加载Trap点
	tbPlayerList = {},		-- 玩家表，索引为玩家名字，表项结构为{}
	tbArenaList = {},		-- 单个擂台
	tbRegId = {},			-- EventSys事件
	nPak = curpack(),
	nPlayerCount = 0,
	nDoubleCount = 0,
	--每日领取经验界限 - modified by DinhHQ - 20110714
	nTaskExpLimit = 2709,
};

function HundredArena:LoadPosition(file, tb)
	if (TabFile_Load(file, file) == 0) then
		return
	end
	local count = TabFile_GetRowCount(file)
	if (count < 2) then
		return
	end
	for i = 2, count do
		local x = tonumber(TabFile_GetCell(file, i, 1))
		local y = tonumber(TabFile_GetCell(file, i, 2))
		tinsert(tb, {x, y})
	end
end

function HundredArena:LoadTrap()
	for i = 1, getn(tbArena_Info) do
		local trap_file = format(tbTrapFile.szPosFile, i);
		
		local trap_list = {};
		self:LoadPosition(trap_file, trap_list)
		
		for k = 1, getn(trap_list) do
			local x = trap_list[k][1]
			local y = trap_list[k][2]
			
			AddMapTrap(self.nMapId, x, y, tbTrapFile.szScriptFile, i);
			--AddObstacleObj(474, self.nMapId, x,y);
		end
		
	end
end;

function HundredArena:AddNpc()
	local tbChefu = {
		nNpcId = 393,
		szName = "车夫",
		nLevel = 1,
		nMapId = self.nMapId,
		nPosX = 56000,
		nPosY = 101088,
		szScriptPath = tbNpcFile.szTranserNpc,
	};
	basemission_CallNpc(tbChefu);
	
	local tbChuwuxiang = {
		nNpcId = 625,
		szName = "储物箱",
		nLevel = 1,
		nMapId = self.nMapId,
		nPosX = 55232,
		nPosY = 100512,
		szScriptPath = tbNpcFile.szBox,
	};
	basemission_CallNpc(tbChuwuxiang);
	
	local tbYaodian = {
		nNpcId = 389,
		szName = "药商",
		nLevel = 1,
		nMapId = self.nMapId,
		nPosX = 55936,
		nPosY = 99744,
		szScriptPath = tbNpcFile.szDrugstore,
	};
	basemission_CallNpc(tbYaodian);
end


function HundredArena:AddObstacle()
	local tb_obstacle = {};
	self:LoadPosition(tbTrapFile.szObstacleFile, tb_obstacle);
	
	for i = 1, getn(tb_obstacle) do
		AddObstacleObj(359, self.nMapId, tb_obstacle[i][1] ,tb_obstacle[i][2]);
	end
	
end

function HundredArena:LoadMap()
	
	local new_subworld = SubWorldID2Idx(self.nMapId);
	
	if new_subworld >= 0 then
		
		self:LoadTrap();
		
		self:AddNpc();
		
		self:AddObstacle();
		
	end
end

-- 初始化环境
-- 地图信息：Trap，NPC
function HundredArena:IniEnvironment()
	local nPak = usepack(self.nPak)
	for i = 1, getn(tbArena_Info) do
		self.tbArenaList[i] = ArenaField:New(i)
--		self.tbArenaList[i].tbHundredArena = self
	end
	
	if (self.bTrapFlag == 0) then
		self:LoadMap()
		self.bTrapFlag = 1;
	end
	
	self:UnReg()
	self:OnReg();
	self.tbTimer = {};	-- nSDTimerId, nTimerCount
	self.tbTimer.nSDTimerId = TimerList:AddTimer(self, tbTimerInfo.nSchedule, 1);
	self.tbTimer.nTimerCount = 0;
	print("HundredArena:IniEnvironment Done!!")
	usepack(nPak)
end

function HundredArena:UnReg()
	if self.tbRegId then
		for szType, nId in self.tbRegId do
			EventSys:GetType(szType):UnReg(self.nMapId, nId);
		end
	end
end

function HundredArena:OnReg()
	self:RegMap("LeaveMap", self.OnLeaveMap, self);
	self:RegMap("EnterMap", self.OnEnterMap, self);
end

function HundredArena:RegMap(szType, varFun, ...)
		
	local nRegId = EventSys:GetType(szType):Reg(self.nMapId, varFun, unpack(arg))
	
	self.tbRegId = self.tbRegId or {}
	self.tbRegId[szType] = self.tbRegId[szType] or nRegId;
	
end

function HundredArena:NewPlayer(nPlayerIndex)
	self.tbPlayerList = self.tbPlayerList or {};
	
	local szPlayerName = CallPlayerFunction(nPlayerIndex, GetName);
	
	local tb = {};
	
	tb.szPlayerName = szPlayerName;
	tb.nPlayerIndex = nPlayerIndex;
	self.tbPlayerList[szPlayerName] = self.tbPlayerList[szPlayerName] or tb;
	
	self.tbPlayerList[szPlayerName].nGrade = 0;		-- 擂台阶段
	self.tbPlayerList[szPlayerName].nRight = 0;		-- 1是擂主，2是挑战方
	self.tbPlayerList[szPlayerName].nArenaId = 0;	-- 当前在哪个擂台
	self.tbPlayerList[szPlayerName].nDoubleTime = 0;-- 领取双倍的时间
	self.tbPlayerList[szPlayerName].nDouble = 0;	-- 双倍有效结束时间
	self.tbPlayerList[szPlayerName].nLastServerTime = tonumber(GetCurServerTime()) + HA_MAXSTAYTIME;
	
	self.nPlayerCount = self.nPlayerCount + 1;
	
end

function HundredArena:DelPlayer(nPlayerIndex)
	local szPlayerName = CallPlayerFunction(nPlayerIndex, GetName);
	
	self.tbPlayerList = self.tbPlayerList or {};
	
	if (self.tbPlayerList[szPlayerName]) then
		self.tbPlayerList[szPlayerName] = nil
	end
	self.nPlayerCount = self.nPlayerCount - 1;
end

function HundredArena:NpcEnter()
	if (self:IsOpen() ~= 1) then
		return
	end
	
	local nMapId, nX, nY = GetWorldPos()
	SetTask(TSK_LEAVERMAPID, nMapId)
	SetTask(TSK_LEAVERPOSX, nX)
	SetTask(TSK_LEAVERPOSY, nY)
	
	local nPosX, nPosY = GetRandomAData(tbTrapFile.szEnterMapFile);
	
	NewWorld(self.nMapId, nPosX/32, nPosY/32)
	
end

function HundredArena:OnEnterMap()
	
	self:NewPlayer(PlayerIndex);
	SetDeathScript("\\script\\missions\\bairenleitai\\player_death.lua");
	
	-- SetAForbitSkill(210, 1) --禁止使用轻功
	DisabledUseTownP(1)--不能回城符
	SetLogoutRV(1);
	DisabledStall(1)	--摆摊
	SetFightState(0)
	Msg2Player("请用轻功上擂台比武");
end

function HundredArena:OnLeaveMap()
	
	local szPlayerName = GetName();
	
	local nArenaId = self.tbPlayerList[szPlayerName].nArenaId;
	if (nArenaId and nArenaId ~= 0) then
		if (self.tbPlayerList[szPlayerName].nRight == 1) then
			self.tbArenaList[nArenaId]:PlayerDeath(2);
			
		else
			self.tbArenaList[nArenaId]:PlayerDeath(1);
			
		end
		
	end
	
	ST_StopDamageCounter();
	SetDeathScript("");
	DisabledUseTownP(0)	-- 可以回城符
	-- SetLogoutRV(0);	-- 只有在主动离开时 才设置为0
	DisabledStall(0)	-- 可以摆摊
	SetFightState(0)	-- 非战斗
	SetCurCamp(GetCamp());
	
	SetRevPos(GetPlayerRev())
	SetPKFlag(0);		
	self:DelPlayer(PlayerIndex)
end

function HundredArena:OnTime()
	local nHour = tonumber(GetLocalDate("%H"));
	local nMin = tonumber(GetLocalDate("%M"));
	
	
	if (nHour == 0) then
		self:Close();
		print("HundredArena:Close")
		return 1
	end
	
	if (nHour >= 0 and nHour <= 11) then
		print("HundredArena:NoTIme")
		return 1;
	end
	
	local t = self.tbTimer.nTimerCount + 1;
	self.tbTimer.nTimerCount = t;
--	Msg2SubWorld("HundredArena:OnTime:"..t)
	local nPlayerCount = 0;
	local nCurSvrTime = tonumber(GetCurServerTime());
	local n_mod_t = mod(t, 5);
	if (nMin == 0 or mod(nMin, 5) == 0) then
		for szname, tb in self.tbPlayerList do
			
			if (tb.nLastServerTime > nCurSvrTime) then
				--Change request 14/07/2011 - Modified By DinhHQ - 2011
				--local nExp = 122400
				local nExp = 1e6
				local nOldPlayer = PlayerIndex
				PlayerIndex = tb.nPlayerIndex				
				if (tb.nDouble and tb.nDouble > GetCurServerTime()) then					
					--CallPlayerFunction(tb.nPlayerIndex, AddOwnExp, floor(nExp*1.66));
					if PlayerFunLib:GetTaskDailyCount(self.nTaskExpLimit) < 50 then
						PlayerFunLib:AddTaskDaily(self.nTaskExpLimit, 2)
						CallPlayerFunction(tb.nPlayerIndex, AddOwnExp, floor(nExp*2));					
					end
				else					
					if PlayerFunLib:GetTaskDailyCount(self.nTaskExpLimit) < 50 then
						PlayerFunLib:AddTaskDaily(self.nTaskExpLimit, 1)
						CallPlayerFunction(tb.nPlayerIndex, AddOwnExp, nExp);
					end
				end
				--Change request 17/4/2011 - Modified By DinhHQ - 20110714
				--local nExpEx = 204000;
				local nExpEx = 2e6;
				if (tb.nRight == 1) then					
					if PlayerFunLib:GetTaskDailyCount(self.nTaskExpLimit) < 50 then
						PlayerFunLib:AddTaskDaily(self.nTaskExpLimit, 2)
						CallPlayerFunction(tb.nPlayerIndex, AddOwnExp, nExpEx);
					end
				end				
				PlayerIndex = nOldPlayer
				nPlayerCount = nPlayerCount +1;
			else
				local nMapId = GetTask(TSK_LEAVERMAPID);
				local nX = GetTask(TSK_LEAVERPOSX);
				local nY = GetTask(TSK_LEAVERPOSY);
				
				CallPlayerFunction(tb.nPlayerIndex, Msg2Player, "时间过得真快，你什么活动都没有参加，请离开皇城司擂台");
				CallPlayerFunction(tb.nPlayerIndex, NewWorld, nMapId,nX,nY);
			end
		end
	end
	 
	if (nMin == 0 or mod(nMin, 30) == 0) then
		local nPosX,nPosY = GetRandomAData(tbTrapFile.szBeautyFile);
		local tbnpc = clone(tbNpcTypeList[11]);
		tbnpc.nMapId = self.nMapId
		tbnpc.nPosX = nPosX;
		tbnpc.nPosY = nPosY;
		tbnpc.tbNpcParam = {};
		tbnpc.tbNpcParam[1] = t;
		
--		for szname, tb in self.tbPlayerList do
--			nPlayerCount = nPlayerCount +1;
--		end
		
		Msg2Map(self.nMapId,"<color=green>鼓手出现了大家加快脚步! <color>");
		WriteLog(format("BaiRenLeiTai\tCallNPC_GuShou:%d,%d,%d",
						tbnpc.nMapId, tbnpc.nPosX, tbnpc.nPosY))
	 	basemission_CallNpc(tbnpc)
	 	self.nDoubleCount = floor(nPlayerCount*0.2)--0.2;
--	 	print("Call Bueaty", self.nDoubleCount, nPlayerCount,t);
	end
	
	return 1
end

-- 未使用
function HundredArena:Announce(szMsg)
	for name, tb in self.tbPlayerList do
		CallPlayerFunction(tb.nPlayerIndex, Msg2Player, szMsg);
	end
end


function HundredArena:AddDoubleState(szPlayerName, nTimes)
	if (self.tbPlayerList[szPlayerName]) then
		self.tbPlayerList[szPlayerName].nLastServerTime = tonumber(GetCurServerTime()) + HA_MAXSTAYTIME;
		
		if (self.nDoubleCount <= 0) then
			Talk(1, "", "我累了，等我休息一下吧");
		else
			
			if (self.tbPlayerList[szPlayerName].nDoubleTime ~= nTimes) then
				self.nDoubleCount = self.nDoubleCount - 1;
				self.tbPlayerList[szPlayerName].nDouble = GetCurServerTime()+HA_DOUBLETIME;
				self.tbPlayerList[szPlayerName].nDoubleTime = nTimes;
				
				Talk(1, "", "这样你们听清楚了吧");
			else
				Talk(1, "", "已经读公文给你们听了!");
			end
		end
	else
		Talk(1, "", "你不该在这出现.");
		-- self:LeaveHundredArena();
	end
	
end

function HundredArena:Close()
	for i = 1, getn(tbArena_Info) do
		self.tbArenaList[i]:Destroy();
	end
	
	Msg2Map(self.nMapId, "今天皇城司擂台结束了!");
	for szname, tb in self.tbPlayerList do
		tb.nArenaId = 0;
		local nMapId = GetTask(TSK_LEAVERMAPID);
		local nX = GetTask(TSK_LEAVERPOSX);
		local nY = GetTask(TSK_LEAVERPOSY);
		
		CallPlayerFunction(tb.nPlayerIndex, NewWorld, nMapId,nX,nY);
	end
	
	self.tbTimer.nTimerCount = 0;
end


function HundredArena:IsOpen()
	local ntime = tonumber(GetLocalDate("%H%M"));
	
	if (ntime >= 1200) then
		
		if (GetLevel() >= 120) then
			return 1;
		else
			Talk(1, "", "<color=yellow>120级和120级以上<color>才可以参加.")
		end
		
	else
		Talk(1, "", "每天开擂台的时间是<color=yellow>12:00 ~ 24:00<color>,待会再来吧!")
	end
	return 0;
end

ArenaField = {
	InPos = {},
	OutPos = {},
	};

function ArenaField:New(nArenaId)
	local tb = clone(ArenaField);
	tb.nArenaId = nArenaId;
	tb.InPos = clone(tbArena_Info[nArenaId].InPos);
	tb.OutPos = clone(tbArena_Info[nArenaId].OutPos);
	tb.NpcPos = clone(tbArena_Info[nArenaId].NpcPos);
	tb.RevivalPos = clone(tbArena_Info[nArenaId].RevivalPos);
	
	tb.nGrade = 1;
	tb.nFightState = 0;
	return tb
end

function ArenaField:Destroy()
	Msg2Map(HundredArena.nMapId, format("擂台 %d: 比赛结束，等待着新勇士成为擂主！", self.nArenaId));
	
	if (self.nNpcIndex) then
		DelNpc(self.nNpcIndex);
	end
	
	self.nNpcIndex = nil
	self:DelTimer();
	self.Master = nil;		-- 擂主
	self.Visitor = nil;	-- 挑战者
	self.nGrade = 1;
	self.nFightState = 0;
end

function ArenaField:DelTimer()
	local id = self.TimerID;
	if (id ~= nil and id > 0) then
		TimerList:DelTimer(id)
		
		self.TimerID = nil
	end
end

function HundredArena:InTrap(index)
--	tb.Master = {};		-- 擂主
--	tb.Visitor = {};	-- 挑战者
	-- 没有擂主
	local tb_arena = self.tbArenaList[index]
	local player = Player:New(PlayerIndex);
	
	if (tb_arena.nFightState == 0) then
		tb_arena.nGrade = 1;
		
		tb_arena.Master = {};
		tb_arena.Master.szPlayerName = player:GetName();
		tb_arena.Master.nPlayerIndex = PlayerIndex;
		
		self.tbPlayerList[tb_arena.Master.szPlayerName].nArenaId = tb_arena.nArenaId;
		self.tbPlayerList[tb_arena.Master.szPlayerName].nRight = 1;
		self.tbPlayerList[tb_arena.Master.szPlayerName].nGrade = 1;
		
		SetTempRevPos(self.nMapId, tb_arena.RevivalPos[1]*32, tb_arena.RevivalPos[2]*32)
		SetTmpCamp(1);
		SetCurCamp(4);
		
		Msg2Map(self.nMapId, format("擂台%d: <color=yellow>%s<color>成为擂主， 等待别人挑战!", tb_arena.nArenaId, tb_arena.Master.szPlayerName));
		
		tb_arena.TimerID = TimerList:AddTimer(tb_arena, tbTimerInfo.nApply, 1);
		
		tb_arena.nFightState = 1;
		
		
		WriteLog(format("BaiRenLeiTai\tAccount:%s\tName:%s\tBecome Master At ArenaField:%d",
						player:GetAccount(),tb_arena.Master.szPlayerName, tb_arena.nArenaId))
	elseif (tb_arena.nFightState == 1) then		-- 有擂主没有挑战者
		
		if (tb_arena.Master.szPlayerName == player:GetName()) then
			tb_arena:Leave(player);
			tb_arena:Destroy();
			return
		end
		
		tb_arena.Visitor = {};
		tb_arena.Visitor.szPlayerName = player:GetName();
		tb_arena.Visitor.nPlayerIndex = PlayerIndex;
		
		self.tbPlayerList[tb_arena.Visitor.szPlayerName].nArenaId = tb_arena.nArenaId;
		self.tbPlayerList[tb_arena.Visitor.szPlayerName].nRight = 2;
		
		SetTempRevPos(self.nMapId, tb_arena.RevivalPos[1]*32, tb_arena.RevivalPos[2]*32)
		SetTmpCamp(2);
		SetCurCamp(4);
		
		tb_arena:DelTimer();
		tb_arena.TimerID = TimerList:AddTimer(tb_arena, tbTimerInfo.nPrepare, 2);
		tb_arena.nFightState = 2;
		
		Msg2Map(self.nMapId, format("擂台%d: 擂主是<color=yellow>%s<color>, 挑战者是<color=yellow>%s<color>, 第 %d场对抗迅速开始!", 
			tb_arena.nArenaId, tb_arena.Master.szPlayerName, tb_arena.Visitor.szPlayerName, tb_arena.nGrade));
		
		Msg2Player("3秒后比赛开始!");
		
		CallPlayerFunction(tb_arena.Master.nPlayerIndex, Msg2Player, "3秒以后比赛开始!");
		
		WriteLog(format("BaiRenLeiTai\tAccount:%s\tName:%s\tBecome Visitor At ArenaField:%d,Master:%s",
						player:GetAccount(), player:GetName(), tb_arena.nArenaId, tb_arena.Master.szPlayerName))
	else
		Msg2Player("擂台已经开始比武，请等着顺序报名.");
		tb_arena:Leave(player);
		return
	end
	
	tb_arena:Enter(player);
end

function ArenaField:Leave(player)
	local n_idx = random(getn(self.OutPos));
	local x,y = self.OutPos[n_idx][1], self.OutPos[n_idx][2];
	player:SetPos(x,y);
	player:SetFightState(0);
	
	CallPlayerFunction(player.m_PlayerIndex, SetPKFlag,1)
	CallPlayerFunction(player.m_PlayerIndex, RestoreLife)
	CallPlayerFunction(player.m_PlayerIndex, RestoreMana);
	CallPlayerFunction(player.m_PlayerIndex, RestoreStamina);
	CallPlayerFunction(player.m_PlayerIndex, ST_StopDamageCounter);
	CallPlayerFunction(player.m_PlayerIndex, SetTmpCamp, 0);
	--CallPlayerFunction(player.m_PlayerIndex, SetCurCamp, 0);
	
	HundredArena.tbPlayerList[player:GetName()].nArenaId = 0;
	HundredArena.tbPlayerList[player:GetName()].nGrade = 0;
	HundredArena.tbPlayerList[player:GetName()].nRight = 0;
	HundredArena.tbPlayerList[player:GetName()].nLastServerTime = tonumber(GetCurServerTime()) + HA_MAXSTAYTIME;
	
	player:Msg2Player("你已离开擂台");
end

function ArenaField:Enter(player)
	local x,y = self.InPos[1], self.InPos[2];
	player:SetPos(x,y);
	player:SetFightState(0);
	CallPlayerFunction(player.m_PlayerIndex, RestoreLife)
	CallPlayerFunction(player.m_PlayerIndex, RestoreMana);
	CallPlayerFunction(player.m_PlayerIndex, RestoreStamina);
	HundredArena.tbPlayerList[player:GetName()].nLastServerTime = tonumber(GetCurServerTime()) + HA_MAXSTAYTIME;
	
	player:Msg2Player("你已进入擂台");
end;

function ArenaField:OnTime(nFightState)
	if (nFightState == 0) then
		return 0
	end
	
	if (nFightState == 1) then			--擂主等待30秒结束
		-- 表示没有挑战方，AddNpc
		self:CallFightNpc();
		
		Msg2Map(HundredArena.nMapId, format("擂台 %d: 擂主是<color=yellow>%s<color>,没有人挑战，系统指定NPC参战!", 
					self.nArenaId, self.Master.szPlayerName, self.nGrade));
		self.TimerID = TimerList:AddTimer(self, tbTimerInfo.nPrepare, 2);
		
		CallPlayerFunction(self.Master.nPlayerIndex, Msg2Player, "3秒之后比赛开始!");
		self.nFightState = 2;
		return 0
	elseif (nFightState == 2) then		-- 准备时间结束
		-- 有，SetFightState，开打，开始伤害量
		-- 开始比赛计时器
		if (self.Master) then
			CallPlayerFunction(self.Master.nPlayerIndex, SetFightState, 1);
			CallPlayerFunction(self.Master.nPlayerIndex, SetPKFlag, 2);
			CallPlayerFunction(self.Master.nPlayerIndex, SetTmpCamp, 1);
			
			CallPlayerFunction(self.Master.nPlayerIndex, ST_StartDamageCounter);
			HundredArena.tbPlayerList[self.Master.szPlayerName].nLastServerTime = tonumber(GetCurServerTime()) + HA_MAXSTAYTIME;
		end
		if (self.Visitor) then
			CallPlayerFunction(self.Visitor.nPlayerIndex, SetFightState, 1);
			CallPlayerFunction(self.Visitor.nPlayerIndex, SetPKFlag, 2);
			CallPlayerFunction(self.Visitor.nPlayerIndex, SetTmpCamp, 2);
			
			CallPlayerFunction(self.Visitor.nPlayerIndex, ST_StartDamageCounter);
			HundredArena.tbPlayerList[self.Visitor.szPlayerName].nLastServerTime = tonumber(GetCurServerTime()) + HA_MAXSTAYTIME;
		end
		
		Msg2Map(HundredArena.nMapId, format("擂台%d: 排在比赛第 %d开始!", self.nArenaId, self.nGrade));
		
		self.TimerID = TimerList:AddTimer(self, tbTimerInfo.nFight, 3);
		
		return 0
	elseif (nFightState == 3) then		-- 3分钟比赛时间结束
		self:TimeClose()
		return 0;
	end
end

function ArenaField:CallFightNpc()
	local n_idx = random(1, 10);
	local nLevel = floor((self.nGrade - 1)/ 10);
	if (nLevel < 0 or nLevel >=10) then
		nLevel = 9;
	end
	local tb_npc = clone(tbNpcTypeList[n_idx]);
	tb_npc.nLevel = 90+nLevel;
	tb_npc.szScriptPath = tbNpcFile.szFightNpc;
	tb_npc.tbNpcParam = {self.nArenaId};
	
	local nMapIndex = SubWorldID2Idx(HundredArena.nMapId)
	local nNpcIndex = AddNpcEx(
		tb_npc.nNpcId,  --npc Id
		tb_npc.nLevel or 90,		-- 等级
		tb_npc.nSeries or random(0,4),		-- 五行
		nMapIndex,	-- 地图
		self.InPos[1]*32,	-- X坐标
		self.InPos[2]*32,	-- Y坐标
		tb_npc.bNoRevive or 1,			-- 不重生
		tb_npc.szName,		-- 名字
		tb_npc.nIsboss or 1
	);	-- 是否BOSS
	if nNpcIndex <= 0 then
		print("AddNpcError!!!")
		return nil
	end
	
	self.nNpcIndex = nNpcIndex;
	
	if tb_npc.szDeathScript then
		SetNpcDeathScript(nNpcIndex, tb_npc.szDeathScript);
	end
		
	if tb_npc.szScriptPath then 
		SetNpcScript(nNpcIndex, tb_npc.szScriptPath)
	end
	if tb_npc.nTime then
		SetNpcTimer(nNpcIndex, 18*tb_npc.nTime);
	end
	
	if tb_npc.tbNpcParam then
		for i =1, getn(tb_npc.tbNpcParam) do 
			if tb_npc.tbNpcParam[i] then
				SetNpcParam(nNpcIndex, i, tb_npc.tbNpcParam[i])
			end
		end
	end
	
end

function ArenaField:IsMaxGrade(nGrade)
	
	local n_last_grade = self.nGrade - 1;
	local n_mod_t = mod(n_last_grade, 10);
	if (n_last_grade < 100) then
		if (n_mod_t == 0 and self.Master and self.nArenaId == 1) then
			local sz_msg = format("<color=yellow>%s<color>在皇城司擂台已经连续战胜了<color=yellow>%d <color>挑战者，武功真是深厚",
								self.Master.szPlayerName, n_last_grade );
			RemoteExc("\\script\\event\\msg2allworld.lua", "battle_msg2allworld", {sz_msg});
		end
		
		return 0
	else
		
		if (self.Master) then
			
			if (self.nArenaId == 1) then
				local sz_msg = format("<color=yellow>%s<color>在皇城司擂台已连续战胜<color=yellow>%d<color>挑战者，在江湖上已成为一个传说",
								self.Master.szPlayerName, 100 );
				
				RemoteExc("\\script\\event\\msg2allworld.lua", "battle_msg2allworld", {sz_msg});
			end
			
			local player = Player:New(self.Master.nPlayerIndex)
			self:Leave(player);
		end
		
		if (self.Visitor) then
			local player = Player:New(self.Visitor.nPlayerIndex)
			self:Leave(player);
		end
		self:Destroy();
		return 1;
	end
end

function ArenaField:TimeClose()
	self.nFightState = 4;	-- 比赛结束结算ing
	if (self.Master and self.Visitor) then
		local n_master_damage = CallPlayerFunction(self.Master.nPlayerIndex, ST_GetDamageCounter);
		local n_visitor_damage = CallPlayerFunction(self.Visitor.nPlayerIndex, ST_GetDamageCounter);
		
		if (n_master_damage <= n_visitor_damage) then
			local sz_msg = format("擂台 %d: 比赛结束！擂主：<color=yellow>%s<color>, 承受杀伤力:<color=yellow>"..n_master_damage.."<color>;"
						.."挑战者:<color=yellow>%s<color>, 承受杀伤力:<color=yellow>"..n_visitor_damage.."<color>.擂主胜利!",
						self.nArenaId, self.Master.szPlayerName, self.Visitor.szPlayerName);
			Msg2Map(HundredArena.nMapId, sz_msg);
			
			self.nGrade = self.nGrade + 1;
			
			if (self:IsMaxGrade() == 1) then
				return
			end
			
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreLife)
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreMana);
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreStamina);
			CallPlayerFunction(self.Master.nPlayerIndex, ST_StopDamageCounter)
			CallPlayerFunction(self.Master.nPlayerIndex, SetFightState, 0)
			CallPlayerFunction(self.Master.nPlayerIndex, SetPKFlag, 0)
			
			local player = Player:New(self.Visitor.nPlayerIndex)
			
			
			HundredArena.tbPlayerList[self.Visitor.szPlayerName].nArenaId = 0;
			HundredArena.tbPlayerList[self.Visitor.szPlayerName].nRight = 0;
			HundredArena.tbPlayerList[self.Visitor.szPlayerName].nGrade = 0;
			
			self:Leave(player);
			
			self.Visitor = nil;	-- 挑战者
			
			Msg2Map(HundredArena.nMapId, format("擂台%d: 擂主是<color=yellow>%s<color>, 排在比赛第 %d,等别的玩家挑战!", 
								self.nArenaId, self.Master.szPlayerName, self.nGrade));
			
			self.TimerID = TimerList:AddTimer(self, tbTimerInfo.nApply, 1);
			self.nFightState = 1;	-- 又开始了
			
		else
			local sz_msg = "擂台%d: 比赛结束！擂主:<color=yellow>%s<color>, 承受杀伤力:<color=yellow>"..n_master_damage.."<color>;"
							.."挑战者:<color=yellow>%s<color>, 承受杀伤力:<color=yellow>"..n_visitor_damage.."<color>,挑战者胜利!"
			Msg2Map(HundredArena.nMapId, format(sz_msg, self.nArenaId, self.Master.szPlayerName, self.Visitor.szPlayerName));
			
			self.nGrade = 1;
			
			local szLoser = self.Master.szPlayerName;
			HundredArena.tbPlayerList[self.Master.szPlayerName].nArenaId = 0;
			HundredArena.tbPlayerList[self.Master.szPlayerName].nRight = 0;
			HundredArena.tbPlayerList[self.Master.szPlayerName].nGrade = 0;
			
			local player = Player:New(self.Master.nPlayerIndex)
			self:Leave(player);
			
			self.Master = {szPlayerName = self.Visitor.szPlayerName, nPlayerIndex = self.Visitor.nPlayerIndex};
			
			-- HundredArena.tbPlayerList[self.Visitor.szPlayerName].nArenaId = 0;
			HundredArena.tbPlayerList[self.Visitor.szPlayerName].nRight = 1;
			HundredArena.tbPlayerList[self.Visitor.szPlayerName].nGrade = 1;
			self.Visitor = nil;
			
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreLife)
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreMana);
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreStamina);
			CallPlayerFunction(self.Master.nPlayerIndex, ST_StopDamageCounter)
			CallPlayerFunction(self.Master.nPlayerIndex, SetFightState, 0);
			CallPlayerFunction(self.Master.nPlayerIndex, SetPKFlag, 0);
			
			Msg2Map(HundredArena.nMapId, format("擂台%d: <color=yellow>%s<color>战胜<color=yellow>%s<color>, 成为新擂主!",
					self.nArenaId, self.Master.szPlayerName, szLoser));
			
			Msg2Map(HundredArena.nMapId, format("擂台%d: 擂主是<color=yellow>%s<color>, 排在比赛第%d，等待别的玩家挑战!", 
								self.nArenaId, self.Master.szPlayerName, self.nGrade));
			self.TimerID = TimerList:AddTimer(self, tbTimerInfo.nApply, 1);
			self.nFightState = 1;	-- 又开始了
			
		end
	elseif (self.Master) then	-- 对手是NPC
		HundredArena.tbPlayerList[self.Master.szPlayerName].nArenaId = 0;
		HundredArena.tbPlayerList[self.Master.szPlayerName].nRight = 0;
		HundredArena.tbPlayerList[self.Master.szPlayerName].nGrade = 0;
		
		Msg2Map(HundredArena.nMapId, format("擂台%d: 擂主是<color=yellow>, 被NPC打败!", 
								self.nArenaId, self.Master.szPlayerName, self.nGrade));
		
		-- CallPlayerFunction(self.Master.nPlayerIndex, Msg2Player, format("第%d轮擂台开始，等待挑战者。", self.nGrade))
		local player = Player:New(self.Master.nPlayerIndex)
		self:Leave(player);
		
		self:Destroy()
	else
		self:Destroy()
	end
end

function ArenaField:NpcDeath()
	self.nFightState = 4;
	Msg2Map(HundredArena.nMapId, format("擂台%d: 擂主<color=yellow>%s<color>战胜第 %d", self.nArenaId, self.Master.szPlayerName, self.nGrade));
	
	self:DelTimer();
	self.nGrade = self.nGrade + 1;
	
	if (self:IsMaxGrade() == 1) then
		return
	end
	
	CallPlayerFunction(self.Master.nPlayerIndex, RestoreLife)
	CallPlayerFunction(self.Master.nPlayerIndex, RestoreMana);
	CallPlayerFunction(self.Master.nPlayerIndex, RestoreStamina);
	CallPlayerFunction(self.Master.nPlayerIndex, ST_StopDamageCounter)
	CallPlayerFunction(self.Master.nPlayerIndex, SetFightState, 0)
	CallPlayerFunction(self.Master.nPlayerIndex, SetPKFlag, 0)
	
	HundredArena.tbPlayerList[self.Master.szPlayerName].nGrade = self.nGrade;
	Msg2Map(HundredArena.nMapId, format("擂台%d: 擂主是<color=yellow>%s<color>, 排在比赛第%d,等别的玩家来挑战!", 
								self.nArenaId, self.Master.szPlayerName, self.nGrade));
	self.TimerID = TimerList:AddTimer(self, tbTimerInfo.nApply, 1);
	self.nFightState = 1;	-- 又开始了
end

function ArenaField:PlayerDeath(nType)
	self.nFightState = 4;
	
	self:DelTimer();
	if (nType == 1) then						-- 擂主胜利
		self.nGrade = self.nGrade + 1;
		local szLoser = "无系"
		if (self.Visitor) then
			szLoser = self.Visitor.szPlayerName;
			HundredArena.tbPlayerList[szLoser].nArenaId = 0;
			HundredArena.tbPlayerList[szLoser].nRight = 0;
			HundredArena.tbPlayerList[szLoser].nGrade = 0;
			local player = Player:New(self.Visitor.nPlayerIndex);
			self:Leave(player);
			
			self.Visitor = nil;	-- 挑战者
		end
		
		if (self.Master) then
			Msg2Map(HundredArena.nMapId,format("擂台%d: 挑战者<color=yellow>%s<color>离开擂台<color=yellow>%s<color>胜利了.", self.nArenaId, szLoser, self.Master.szPlayerName));
			
			if (self:IsMaxGrade() == 1) then
				return
			end
			
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreLife)
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreMana);
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreStamina);
			CallPlayerFunction(self.Master.nPlayerIndex, ST_StopDamageCounter)
			CallPlayerFunction(self.Master.nPlayerIndex, SetFightState, 0);
			CallPlayerFunction(self.Master.nPlayerIndex, SetPKFlag, 0);
			
			HundredArena.tbPlayerList[self.Master.szPlayerName].nGrade = self.nGrade;
			Msg2Map(HundredArena.nMapId, format("擂台%d: 擂主是<color=yellow>%s<color>, 排在比赛第%d，等待别的玩家挑战!", 
								self.nArenaId, self.Master.szPlayerName, self.nGrade));
			self.TimerID = TimerList:AddTimer(self, tbTimerInfo.nApply, 1);
			self.nFightState = 1;	-- 又开始了
			
		end
		
	elseif (nType == 2) then					-- 擂主失败
		self.nGrade = 1;
		
		local szLoser = "无系"
		if (self.Master) then
			
			local player = Player:New(self.Master.nPlayerIndex);
			szLoser = player:GetName();
			HundredArena.tbPlayerList[szLoser].nArenaId = 0;
			HundredArena.tbPlayerList[szLoser].nRight = 0;
			HundredArena.tbPlayerList[szLoser].nGrade = 0;
			self:Leave(player);
		end
		
		if (self.Visitor) then	-- 如果挑战者是Player
			self.Master = {szPlayerName = self.Visitor.szPlayerName, nPlayerIndex = self.Visitor.nPlayerIndex};
			self.Visitor = nil;
			
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreLife)
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreMana);
			CallPlayerFunction(self.Master.nPlayerIndex, RestoreStamina);
			CallPlayerFunction(self.Master.nPlayerIndex, ST_StopDamageCounter)
			CallPlayerFunction(self.Master.nPlayerIndex, SetFightState, 0)
			CallPlayerFunction(self.Master.nPlayerIndex, SetPKFlag, 0);
			CallPlayerFunction(self.Master.nPlayerIndex, SetTmpCamp, 1);
			HundredArena.tbPlayerList[self.Master.szPlayerName].nRight = 1;
			HundredArena.tbPlayerList[self.Master.szPlayerName].nGrade = self.nGrade;
			
			Msg2Map(HundredArena.nMapId, format("擂台%d: <color=yellow>%s<color>战胜<color=yellow>%s<color>, 成为新擂主!",
					self.nArenaId, self.Master.szPlayerName, szLoser));
			Msg2Map(HundredArena.nMapId, format("擂台%d: 擂主是<color=yellow>%s<color>, 排在比赛第%d，等待别的玩家挑战!", 
								self.nArenaId, self.Master.szPlayerName, self.nGrade));
			self.TimerID = TimerList:AddTimer(self, tbTimerInfo.nApply, 1);
			self.nFightState = 1;	-- 又开始了
		else									-- 挑战者是NPC
					
			self:Destroy();
		end
	else
		HundredArena.tbPlayerList[self.Master.szPlayerName].nRight = 0;
		HundredArena.tbPlayerList[self.Master.szPlayerName].nGrade = 0;
		HundredArena.tbPlayerList[self.Master.szPlayerName].nArenaId = 0;
		local Master = Player:New(self.Master.nPlayerIndex);
		self:Leave(Master);
		
		self:Destroy();
	end
end

ArenaNpc = {
	nParamArena = 1,
};

function ArenaNpc:GetNpcArena(nNpcIndex)
	return GetNpcParam(nNpcIndex, self.nParamArena);
end

function ArenaNpc:SetNpcParam(nNpcIndex, nArenaId)
	return SetNpcParam(nNpcIndex, self.nParamArena, nArenaId);
end

