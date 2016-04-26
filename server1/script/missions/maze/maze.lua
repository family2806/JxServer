Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\shop\\shop_checkmap.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\maze\\position.lua")
Include("\\script\\missions\\maze\\gate.lua")
Include("\\script\\missions\\maze\\tasklist.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\item\\heart_head.lua")
Include("\\script\\item\\forbiditem.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

Include("\\script\\missions\\maze\\taskinfo.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\missions\\maze\\task_final.lua")
Include("\\script\\missions\\maze\\randomtask\\task_1.lua")
Include("\\script\\missions\\maze\\randomtask\\task_2.lua")
Include("\\script\\missions\\maze\\randomtask\\task_3.lua")
Include("\\script\\missions\\maze\\randomtask\\task_4.lua")
Include("\\script\\missions\\maze\\randomtask\\task_5.lua")
Include("\\script\\missions\\maze\\randomtask\\task_6.lua")
Include("\\script\\missions\\maze\\randomtask\\task_7.lua")
Include("\\script\\missions\\maze\\randomtask\\task_8.lua")
Include("\\script\\missions\\maze\\randomtask\\task_10.lua")
Include("\\script\\missions\\maze\\randomtask\\task_11.lua")
Include("\\script\\missions\\maze\\randomtask\\task_12.lua")
Include("\\script\\missions\\maze\\randomtask\\task_17.lua")
Include("\\script\\missions\\maze\\randomtask\\task_20.lua")
Include("\\script\\missions\\maze\\randomtask\\task_21.lua")
Include("\\script\\missions\\maze\\randomtask\\task_22.lua")
Include("\\script\\missions\\maze\\randomtask\\task_23.lua")
Include("\\script\\missions\\maze\\randomtask\\task_24.lua")
Include("\\script\\missions\\maze\\randomtask\\task_32.lua")
Include("\\script\\missions\\maze\\randomtask\\task_33.lua")
Include("\\script\\missions\\maze\\randomtask\\task_40.lua")
Include("\\script\\missions\\maze\\randomtask\\task_41.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")
Include("\\script\\missions\\maze\\item\\mazeextaward.lua")

LUA_PLAYERDEATH = "\\script\\missions\\maze\\death_player.lua"
LUA_MAZETRAP 	= "\\script\\missions\\maze\\trap.lua"

SWORDMAN_ZHOUJUN 	= 1
SWORDMAN_TANGYU		= 2
SWORDMAN_WANGBIN	= 3
SWORDMAN_YUJIE		= 4
SWORDMAN_ZHANGZHAO	= 5
SWORDMAN_DONGZHI	= 6
SWORDMAN_XIAOZHUZHU	= 7
SWORDMAN_LIUYAOSHI	= 8
SWORDMAN_CHEFU		= 9

NPCID_ROOMSTELE	= 1624					-- 房间石碑ID
NPCID_POOLSTELE	= 736					-- 万花池石碑ID
NPCID_POOLSHOP	= 1621					-- 万花池咬掉

OUT_MAPID	 	= 949					-- 试剑谷mapid
OUT_POSX	 	= floor(51264 / 32)		-- 试剑谷x坐标
OUT_POSY	 	= floor(102368 / 32)	-- 试剑谷y坐标

MAZE_MAPID 		= 948
REVIVE_POSX	 	= floor(79136 / 32)		-- 万花池x坐标 
REVIVE_POSY  	= floor(117760 / 32)	-- 万花池y坐标 

MAX_DEATHCOUNT	= 3	-- 最大死亡+掉线次数，大于此数时会退出迷宫传送到试剑谷

TASKSTAT_INIT		= 0		-- 任务还未开始
TASKSTAT_DOING		= 1		-- 任务进行中
TASKSTAT_FINISH		= 2		-- 任务完成

COUNT_JOINEVERYDAY	= 2	-- 每天可以参加迷宫的次数
COUNT_JOINTOTAL		= 6	-- 最大累积次数

TASK_JOINPERMISSION	= 2842	-- 从2000-1-1起始的天数 * 100 + 当天参加的次数

DRUGSTORE_ID		= 99
DRUGSTORE_CURRENCY	= 1

STR_TRANSFERRING	= "队伍正在传送"

MapAlloc = {}

function MapAlloc:PreApplyMap(id)
	PreApplyDungeonMap(id, 0, 1)
end

function MapAlloc:ApplyMap(id)
	local res = ApplyDungeonMap(id)
	local msg = format("[MAZE]ApplyDungeonMap(%d): %d", id, res)
	WriteLog(msg)
	print(msg)
	return res
end

function MapAlloc:FreeMap(tempid, id)
	local res = ReturnDungenonMap(tempid, id)
	local msg = format("[MAZE]ReturnDungenonMap(%d, %d): %d", tempid, id, res)
	WriteLog(msg)
	print(msg)
	return res
end

GameTimer = {}

function GameTimer:OnTime(maze)
	return maze:CheckTimeout()
end

MazeList = {
	m_MaxCount = 50,	-- 允许同时存在的迷宫的最大数目
	m_CurCount = 0,
	m_LastId = 0,
	m_Mazes = {},
	m_Players = {},
}

function MazeList:Add(maze)
	self.m_LastId = self.m_LastId + 1
	self.m_Mazes[self.m_LastId] = maze
	self.m_CurCount = self.m_CurCount + 1
	WriteLog(format("AddMaze[%d], CurrentCount(%d)", self.m_LastId, self.m_CurCount))
	return self.m_LastId
end

function MazeList:Del(id)
	self.m_Mazes[id] = nil
	if (self.m_CurCount > 0) then
		self.m_CurCount = self.m_CurCount - 1
	end
	WriteLog(format("DelMaze[%d], CururentCount(%d)", id, self.m_CurCount))
end

function MazeList:CheckCount()
	if (self.m_CurCount >= self.m_MaxCount) then
		return 0
	else
		return 1
	end
end

function MazeList:Get(id)
	return self.m_Mazes[id]
end

function MazeList:Join(player, id)
	self.m_Players[player:GetName()] = id
end

function MazeList:Quit(player)
	self.m_Players[player:GetName()] = nil
end

function MazeList:QuitByName(name)
	self.m_Players[name] = nil
end

function MazeList:Find(player)
	local id = self.m_Players[player:GetName()]
	if (id ~= nil) then
		return self.m_Mazes[id]
	else
		return nil
	end
end

-- 石碑
NpcStele = {}
function NpcStele:Say(player, id)
	local maze = MazeList:Find(player)
	if (maze ~= nil) then
		if (id == 1) then
			maze:Enter(player)
		elseif (id == 2) then
			maze:StartTask(player)
		end
	end
end

-- 万花池药店
NpcShop = {}
function NpcShop:Say(player)
	player:Sale(99, 1)
end

-- 迷宫
Maze = {
	Timeout = 30		-- 超时时间（分钟数） 
}

function Maze:New(alloc)
	if (not alloc) then
		alloc = MapAlloc
	end
	local mapid = alloc:ApplyMap(MAZE_MAPID)
	if (mapid == 0) then
		WriteLog("[MAZE ERROR]Failed to apply maze map")
		return nil
	end
	local tb = clone(Maze)
	local rooms = {}
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			local index = (i - 1) * MAZE_COLCOUNT + j
			rooms[index] = Room:New(i, j, tb)
		end
	end
	OtherMap:AddMap(mapid)
	tb.m_Players = {}
	tb.m_Rooms = rooms
	tb.m_OrgRoom = PositionList:RandomOrgPosition()
	tb.m_EndRoom = PositionList:RandomEndPosition()
	tb.m_MapId = mapid
	tb.m_Id = MazeList:Add(tb)
	tb.m_MapAlloc = alloc
	tb.m_TrapTimerId = 0
	tb.m_LeftMinutes = Maze.Timeout
	tb.m_GameMinutes = 0
	tb.m_GameTimerId = TimerList:AddTimer(GameTimer, 60 * 18, tb)
	tb.m_PlayerCount = 0	-- 正在当前迷宫中的玩家人数（不计算万花谷里的玩家）
	tb.m_MateCount = 0		-- 队伍人数（包括万花谷里的玩家）
	tb.m_HotPosition = {}
	tb.m_HotPosition.row = 0
	tb.m_HotPosition.col = 0
	tb.m_SteleIndex = DlgNpcManager:AddNpc("荷花", NPCID_POOLSTELE, mapid, 78752, 117536, NpcStele, 1)
	tb.m_ShopIndex = DlgNpcManager:AddNpc("药店老板", NPCID_POOLSHOP, mapid, 79008, 117280, NpcShop, 1)
	tb:InitTrap()
	tb:InitTask()
	add_forbitmap(mapid)
	tb.m_FreeTaskList = nil
	tb.m_PopTaskCount = 0
	return tb
end

function Maze:Destroy()
	self:Log("destroy begin")
	if (self.m_Id == 0) then
		self:LogError("destroy twice?")
		return
	end
	MazeList:Del(self.m_Id)
	self:ClearTrap()
	for i = 1, getn(self.m_Rooms) do
		self.m_Rooms[i]:Destroy()
		self.m_Rooms[i] = nil
	end
	self.m_Rooms = nil
	self.m_MapAlloc:FreeMap(MAZE_MAPID, self.m_MapId)
	OtherMap:DelMap(self.m_MapId)
	del_forbitmap(self.m_MapId)
	del_MapType(self.m_MapId)
	ClearMapNpc(self.m_MapId)
	ClearMapObj(self.m_MapId)
	if (self.m_TrapTimerId > 0) then
		-- TimerList:DelTimer(self.m_TrapTimerId)
		DelTimer(self.m_TrapTimerId)
		ProgressBarList[self.m_TrapTimerId] = nil
		self.m_TrapTimerId = 0
	end
	for name, _ in self.m_Players do
		MazeList:QuitByName(name)
	end
	self.m_Players = nil
	self.m_PlayerCount = 0
	self.m_MateCount = 0
	if (self.m_GameTimerId > 0) then
		TimerList:DelTimer(self.m_GameTimerId)
		self.m_GameTimerId = 0
	end
	if (self.m_SteleIndex > 0) then
		DlgNpcManager:DelNpc(self.m_SteleIndex)
		self.m_SteleIndex = 0
	end
	if (self.m_ShopIndex > 0) then
		DlgNpcManager:DelNpc(self.m_ShopIndex)
		self.m_ShopIndex = 0
	end
	self:Log("destroy end", self.m_Id)
	self.m_Id = 0
	self.m_MapId = 0
end

function Maze:SetLeftMinutes(nMinutes)
	self.m_LeftMinutes = nMinutes
end

function Maze:CheckTimeout()
	self.m_LeftMinutes = self.m_LeftMinutes - 1
	self.m_GameMinutes = self.m_GameMinutes + 1
	if (self.m_LeftMinutes > 0) then
		if (mod(self.m_GameMinutes, 3) == 0) then
			self:NotifyMatesInMaze(format("目前已进行了%d分钟，离结束还剩%d 分钟",
				self.m_GameMinutes,
				self.m_LeftMinutes))
		end
		return 1
	else
		self:NotifyAllMates("本次剑冢试炼时间已到，祝各位在下次试炼中取得好成绩.")
		self:KickAll()
		self.m_GameTimerId = 0
		self:Destroy()
		return 0
	end
end

function Maze:SetCaptainName(captain)
	self:Log(format("set captain[%s]", captain))
	self.m_CaptainName = captain
end

function Maze:Finish()
	if (self.m_CaptainName ~= nil) then
		tbMazeExtAward:_Message(self.m_CaptainName)
--		AddGlobalCountNews(format(
--			"<color=red>%s<color>指引高手成功消灭最后的剑冢boss。从剑冢最深处打开神秘面纱!",
--			self.m_CaptainName),
--			3)
	end
	self:Log("finish")
	self:KickAll()
	self:Destroy()
end

function Maze:PopTask()
	local count = 0
	if (not self.m_FreeTaskList or getn(self.m_FreeTaskList) == 0) then
		self.m_FreeTaskList = {1, 2, 3, 4, 5, 6, 7, 8, 11, 12, 17, 20, 21, 22, 24, 32, 33, 40, 41, 10, 23}
		count = getn(self.m_FreeTaskList)
		if (self.m_PopTaskCount == 0) then
			-- 有可能无法通关的事件如第10和23不要放在第一个房间
			count = count - 2
		end
	else
		count = getn(self.m_FreeTaskList)
	end
	local index = random(1, count)
	local id = self.m_FreeTaskList[index]
	tremove(self.m_FreeTaskList, index)
	self.m_PopTaskCount = self.m_PopTaskCount + 1
	return id
end

function Maze:InitTask()
	local dst = self:GetRoom(self.m_EndRoom.row, self.m_EndRoom.col)
	if (dst) then
		dst.m_TaskId = 49
	end
end

function Maze:IsEqual(maze)
	if (maze ~= nil and self.m_Id == maze.m_Id) then
		return 1
	else
		return 0
	end
end

function Maze:Log(msg)
	local text = format("[MAZE id(%d) map(%d)] %s", self.m_Id, self.m_MapId, msg)
	-- print(text)
	WriteLog(text)
end

function Maze:LogError(msg)
	local text = format("[MAZEERROR id(%d) map(%d)] %s", self.m_Id, self.m_MapId, msg)
	-- print(text)
	WriteLog(text)
end

function Maze:IsAlive()
	if (self.m_Players == nil) then
		return 0
	else
		return 1
	end
end

-- 完成普通事件的奖励
function Maze:TaskAward(room)
	local players = self:AllMate(room)
	if (getn(players) == 0) then
		return
	end
	for i = 1, getn(players) do
		-- 100W经验
		players[i]:AddStackExp(2*1000 * 1000)
		tbMazeExtAward:MazeStepFinishAward(players[i])
	end
	-- 大力丸
	--local player = players[random(1, getn(players))]
	--player:AddItem(6, 0, 3, 1, 0, 0)
	--self:NotifyAllMates(format("恭喜%s 过关 %s!", player:GetName(),room))
end

-- 完成最终事件的奖励
function Maze:FinalAward(room)
	local players = self:AllMate(room)
	for i = 1, getn(players) do
		local player = players[i]
		-- 1000W经验
		player:AddStackExp(10 * 1000 * 1000)
		tbMazeExtAward:MazeBossAward(player)
		-- 飞速丸
		--player:AddItem(6, 0, 6, 1, 0, 0)
		--self:NotifyAllMates(format("恭喜 %s 获得飞速丸!", player:GetName()))
	end
end

function Maze:RandomMate(room)
	local count = 0
	local players = {}
	for _, tb in self.m_Players do
		local player = tb.Player
		local pos = tb.Position
		if (player ~= nil and pos.row == room.m_Row and pos.col == room.m_Col) then
			tinsert(players, player)
		end
	end
	if (getn(players) == 0) then
		return nil
	end
	local index = random(1, getn(players))
	return players[index]
end

function Maze:AllMate(room)
	local players = {}
	for _, tb in self.m_Players do
		local player = tb.Player
		local pos = tb.Position
		if (player ~= nil and pos.row == room.m_Row and pos.col == room.m_Col) then
			tinsert(players, player)
		end
	end
	return players
end

function Maze:RandomMateName(room)
	local player = self:RandomMate(room)
	if (player) then
		return player:GetName()
	else
		return nil
	end
end

-- 广播给在迷宫房间里的队员（不包括万花谷）
function Maze:NotifyMatesInMaze(msg)
	for _, tb in self.m_Players do
		local player = tb.Player
		local pos = tb.Position
		if (player ~= nil and pos.row ~= 0 and pos.col ~= 0) then
			player:Msg2Player(msg)
		end
	end
end

-- 广播给在指定房间里的队员
function Maze:NotifyRoomMessage(msg, row, col)
	for _, tb in self.m_Players do
		local player = tb.Player
		local pos = tb.Position
		if (player ~= nil and pos.row == row and pos.col == col) then
			player:Msg2Player(msg)
		end
	end
end

-- 广播给在迷宫里的队员（包括万花谷）
function Maze:NotifyAllMates(msg)
	for _, tb in self.m_Players do
		local player = tb.Player
		local pos = tb.Position
		if (player ~= nil) then
			player:Msg2Player(msg)
		end
	end
end

function Maze:NotifyMatesInMaze(msg)
	for _, tb in self.m_Players do
		local player = tb.Player
		local pos = tb.Position
		if (player ~= nil and pos.row ~= 0 and pos.col ~= 0) then
			player:Msg2Player(msg)
		end
	end
end

function Maze:GetPlayerList()
	local names = {}
	for _, tb in self.m_Players do
		local player = tb.Player
		if (player ~= nil) then
			tinsert(names, player:GetName())
		end
	end
	return names
end

-- 把指定数量的玩家踢到万花池
function Maze:KickCount(count, room)
	local kick_count = 0
	for _, tb in self.m_Players do
		local player = tb.Player
		if (player ~= nil and tb.Position.row == room.m_Row and tb.Position.col == room.m_Col) then
			self:Log(format("maze kill player(%s)", player:GetName()))
			self:Kill(player)
			kick_count = kick_count + 1
			if (kick_count >= count) then
				return
			end
		end
	end	
end

-- 把指定名字的玩家踢到万花池
function Maze:KickPlayer(name)
	for _, tb in self.m_Players do
		local player = tb.Player
		if (player ~= nil and
			tb.Position.row ~= 0 and
			tb.Position.col ~= 0 and
			player:GetName() == name) then
			self:Log(format("maze kill player(%s)", name))
			self:Kill(player)
			return 1
		end
	end
	return 0
end

function Maze:KickAll()
	for _, tb in self.m_Players do
		local player = tb.Player
		if (player ~= nil) then
			self:Quit(player)
		end
	end
	self.m_Players = {}
end

function Maze:Kill(player)
	local name = player:GetName()
	local tb = self.m_Players[name]
	if (not tb) then
		self:LogError(format("kill fail: player(%s) not found", name))
		return 0
	end
	local pos = tb.Position
	if (pos.row == 0 or pos.col == 0) then
		self:LogError(format("kill fail: player(%s) outside", name))
		return 0
	end
	local room = self:GetRoom(pos.row, pos.col)
	if (not room) then
		self:LogError(format("kill fail: player(%s), room[%d,%d] not found", name, pos.row, pos.col))
		return 0
	end
	self:NotifyMatesInMaze(format("%s已重伤", player:GetName()))
	room:OnPlayerDeath(player)
	tb.KilledCount = tb.KilledCount + 1
	if room ~= nil and room.m_Task ~= nil and room.m_TaskId ~= nil then
		AddStatDataPlayerLeaveCount(room.m_TaskId)
	end
	if (tb.KilledCount  + tb.LogoutCount > MAX_DEATHCOUNT) then
		self:Log(format("kill quit: player(%s), room[%d,%d], killed_count(%d), logout_count(%d)", name, pos.row, pos.col, tb.KilledCount, tb.LogoutCount))
		self:Quit(player)
		if (self.m_MateCount <= 0) then
			self:Destroy()
		end
		player:Msg2Player("此次大侠与剑冢挑战，身负重伤，不能继续参加，请通过试炼谷赶快离开。胜败乃兵家常事，请不要气馁。")
	else
		self:Log(format("kill ok: player(%s), room[%d,%d], killed_count(%d), logout_count(%d)", name, pos.row, pos.col, tb.KilledCount, tb.LogoutCount))
		self:Leave(player, 1)
		player:SetFightState(0)
		player:DisabledStall(1)
		player:NewWorld(self.m_MapId, REVIVE_POSX, REVIVE_POSY)		
		player:Msg2Player("你已负重伤，被转移到万花池治疗.")
		player:Msg2Player("点击万花池的荷花可以返回剑冢迷宫。你也可以通过使用在奇珍阁的回生符直接传送到刚才的房间和队伍一起战斗。")
	end
	return 1
end

-- 把玩家移动到正在进行事件的房间
function Maze:Revive(player)
	local pos = self.m_HotPosition
	if (pos.row ~= 0 and pos.col ~= 0) then
		self:Log(format("revive ok: player(%s) =>room[%d,%d]", player:GetName(), pos.row, pos.col))
		self:Enter(player, pos.row, pos.col)
		return 1
	end
	self:LogError(format("revive fail: player(%s)", player:GetName()))
	return 0
end

function Maze:GetGate(room_src, room_dst)
	local src = room_src.m_Row * 100 + room_src.m_Col
	local tb = self.m_Gates[src]
	if (not tb) then
		return nil
	else
		local dst = room_dst.m_Row * 100 + room_dst.m_Col
		return tb[dst]
	end
end

function Maze:AddGate(room_src, room_dst, gate)
	local src = room_src.m_Row * 100 + room_src.m_Col
	local tb = self.m_Gates[src]
	if (not tb) then
		tb = {}
		self.m_Gates[src] = tb
	end
	local dst = room_dst.m_Row * 100 + room_dst.m_Col
	tb[dst] = gate
end

function Maze:MakeGate(room_src, pos_src, direct)
	local row_dst, col_dst = PositionList:MakePosition(room_src.m_Row, room_src.m_Col, direct)
	local room_dst = self:GetRoom(row_dst, col_dst)
	local pos_dst = PositionList:GetPosition(row_dst, col_dst)
	local pt_entr = pos_dst.entrs[ReverseDirect[direct]]
	local gate = GateList:NewGate(self.m_MapId, pt_entr.x, pt_entr.y)
	local pts = pos_src.traps[direct]
	for i = 1, getn(pts) do
		local pt = pts[i]
		gate:AddTrap(self.m_MapId, pt.x, pt.y, LUA_MAZETRAP)
	end
	local tb = {room_src, room_dst, gate}
	gate:RegHandler(self, tb)
	self:AddGate(room_src, room_dst, gate)
end

function Maze:MakeConnection(row, col)
	local room_src = self:GetRoom(row, col)
	local pos_src = PositionList:GetPosition(row, col)
	self:MakeGate(room_src, pos_src, DIRECT_TOP)
	self:MakeGate(room_src, pos_src, DIRECT_BOTTOM)
	self:MakeGate(room_src, pos_src, DIRECT_LEFT)
	self:MakeGate(room_src, pos_src, DIRECT_RIGHT)
end

function Maze:InitTrap()
	self.m_Gates = {}
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			self:MakeConnection(i, j)
		end
	end
end

function Maze:ClearTrap()
	for _, gates in self.m_Gates do
		for _, gate in gates do
			GateList:Del(gate.m_Id)
		end
	end
	self.m_Gates = nil
end

function Maze:GetPlayingRoomList()
	local tb = {}
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			local room = self:GetRoom(i, j)
			if (room.m_TaskId ~= 0 and room.m_Status ==TASKSTAT_DOING) then
				local inf = {}
				inf.row = i
				inf.col = j
				inf.taskid = room.m_TaskId
				tinsert(tb, inf)
			end
		end
	end
	return tb
end

function Maze:OpenAllRooms()
	for i = 1, getn(self.m_Rooms) do
		self.m_Rooms[i]:Open()
	end
end

function Maze:GetRoom(row, col)
	local index = (row - 1) * MAZE_COLCOUNT + col
	return self.m_Rooms[index]
end

-- 起始房间
function Maze:GetOrgRoom()
	local pos = self.m_OrgRoom
	return self:GetRoom(pos.row, pos.col)
end

-- 终点房间
function Maze:GetEndRoom()
	local pos = self.m_EndRoom
	return self:GetRoom(pos.row, pos.col)
end

function Maze:SetHotPosition(row, col)
	self:Log(format("set HotPosition: room[%d,%d]", row, col))
	self.m_HotPosition.row = row
	self.m_HotPosition.col = col
end

-- 正在发生事件的房间位置
function Maze:GetHotPosition()
	return self.m_HotPosition
end

function Maze:Move(player, row, col)
	local dst = self:GetRoom(row, col)
	if (not dst) then
		return nil
	end
	local src = self:FindRoomWithPlayer(player)
	if (src ~= nil) then
		if (dst:IsEqual(src) == 1) then
			return nil
		end
		src:Leave(player)
	end
	dst:Enter(player)
	self:MoveTo(player, row, col)
	local pos = self:FindPlayerPosition(player)
	pos.row = row
	pos.col = col
	return dst
end

function Maze:MoveTo(player, row, col)
	local pos = PositionList:GetPosition(row, col)
	if (pos ~= nil) then
		local pt = pos.entrs[random(4)]
		local x = floor(pt.x / 32)
		local y = floor(pt.y / 32)
		player:NewWorld(self.m_MapId, x, y)
	end
end

function Maze:SetRevivePos(player)
	player:SetRevPos(OUT_MAPID, 1)
	player:SetLogoutRV(1)
	player:SetTempRevPos(self.m_MapId, REVIVE_POSX, REVIVE_POSY)
	player:SetDeathScript(LUA_PLAYERDEATH)
	player:SetPunish(0)
	player:SetTmpCamp(MAZE_PLAYERTMPCAMP)
	player:LeaveTeam()
	player:DisabledStall(1)
end

function Maze:RestoreRevivePos(player)
	player:SetLogoutRV(0)
	player:SetTempRevPos(OUT_MAPID, OUT_POSX * 32, OUT_POSY * 32)
	player:SetDeathScript("")
	player:SetTmpCamp(0)
	player:DisabledStall(0)
end

-- 进入起始房间或者指定房间
function Maze:Enter(player, row, col)
	local name = player:GetName()
	local tb = self.m_Players[name]
	if (not tb) then
		self:LogError(format("enter fail: player[%s] not found", name))
		return nil
	end
	local pos = tb.Position
	if (pos.row ~= 0 and pos.col ~= 0) then
		row = pos.row
		col = pos.col
	elseif (not row or not col) then
		row = self.m_OrgRoom.row
		col = self.m_OrgRoom.col
	end
	local room = self:GetRoom(row, col)
	if (not room) then
		self:LogError(format("enter fail: room[%d,%d] not found, player(%s)", row, col, name))
		return nil
	end
	room:Enter(player)
	self:MoveTo(player, row, col)
	pos.row = row
	pos.col = col
	tb.Player = player
	self.m_PlayerCount = self.m_PlayerCount + 1
	player:SetFightState(1)
	self:Log(format("enter ok: room[%d,%d], player(%s), count(%d)", row, col, name, self.m_PlayerCount))
	return room
end

-- 暂时离开（掉线/死亡）
function Maze:Leave(player, keeping)
	local name = player:GetName()
	local tb = self.m_Players[name]
	if (not tb) then
		self:LogError(format("leave fail: player(%s) not found, flag(%s)", name, tostring(keeping)))
		return 0
	end
	local pos = tb.Position
	if (pos.row ~= 0 and pos.col ~= 0) then
		local room = self:GetRoom(pos.row, pos.col)
		room:Leave(player)
		self.m_PlayerCount = self.m_PlayerCount - 1
	end
	pos.row = 0
	pos.col = 0
	if (not keeping) then
		tb.Player = nil
	end
	self:Log(format("leave ok: player(%s), flag(%s), count(%d)", name, tostring(keeping), self.m_PlayerCount))
	return 1
end

-- 加入
function Maze:Join(player)
	local name = player:GetName()
	local tb = self.m_Players[name]
	if (tb ~= nil) then
		self:LogError(format("join fail: player(%s) already exist", name))
		return 0
	end
	local pos = {}
	pos.row = 0
	pos.col = 0
	tb = {}
	tb.Position = pos
	tb.Player = player
	tb.KilledCount = 0
	tb.LogoutCount = 0
	self.m_Players[name] = tb
	MazeList:Join(player, self.m_Id)
	self.m_MateCount = self.m_MateCount + 1
	self:SetRevivePos(player)
	self:Log(format("join ok: player(%s)", name))
	return 1
end

-- 退出
function Maze:Quit(player)
	local name = player:GetName()
	if (self.m_Players[name] ~= nil) then
		self:Leave(player)
		self:RestoreRevivePos(player)
		MazeList:Quit(player)
		self.m_Players[name] = nil
		self.m_MateCount = self.m_MateCount - 1
	end
	player:SetFightState(0)
	player:NewWorld(OUT_MAPID, OUT_POSX, OUT_POSY)
	self:Log(format("quit: player(%s)", name))
end

function Maze:GetMateCount()
	return self.m_MateCount
end

function Maze:GetPlayerCount()
	return self.m_PlayerCount
end

function Maze:StartTask(player)
	local room = self:FindRoomWithPlayer(player)
	if (room ~= nil) then
		room:StartTask(player)
	else
		self:LogError(format("start task fail: player(%s) not found", player:GetName()))
	end
end

function Maze:FindPlayerPosition(player)
	local tb = self.m_Players[player:GetName()]
	if (not tb) then
		return nil
	else
		return tb.Position
	end
end

function Maze:FindRoomWithPlayer(player)
	local pos = self:FindPlayerPosition(player)
	if (pos ~= nil) then
		return self:GetRoom(pos.row, pos.col)
	else
		return nil
	end
end

function Maze:InRoom(player, row, col)
	local tb = self.m_Players[player:GetName()]
	if (not tb) then
		return 0
	end
	local pos = tb.Position
	if (pos.row == row and pos.col == col) then
		return 1
	else
		return 0
	end
end

function Maze:OpenRoom(row, col)
	local room = self:GetRoom(row, col)
	if (room ~= nil) then
		room:Open()
	end
end

function Maze:CloseRoom(row, col)
	local room = self:GetRoom(row, col)
	if (room ~= nil) then
		room:Close()
	end
end

function Maze:East(room)
	if (room.m_Col < MAZE_COLCOUNT) then
		return self:GetRoom(room.m_Row, room.m_Col + 1)
	else
		return nil
	end
end

function Maze:West(room)
	if (room.m_Col > 1) then
		return self:GetRoom(room.m_Row, room.m_Col - 1)
	else
		return nil
	end
end

function Maze:South(room)
	if (room.m_Row < MAZE_ROWCOUNT) then
		return self:GetRoom(room.m_Row + 1, room.m_Col)
	else
		return nil
	end
end

function Maze:North(room)
	if (room.m_Row > 1) then
		return self:GetRoom(room.m_Row - 1, room.m_Col)
	else
		return nil
	end
end

function Maze:OnTrigger(gate, player, param)
	local room_src = param[1]
	local room_dst = param[2]
	local gate = param[3]
	if (not room_src or
		not room_dst or
		room_src:IsEqual(room_dst) == 1 or
		room_src:IsOpen() == 0) then
		return 0
	end
	if (room_dst:IsOpen() == 1) then
		return 1
	elseif (room_dst.m_TaskId ~= 0 and room_dst.m_Status == TASKSTAT_DOING) then
		-- 事件正在进行的房间，只有使用复生符才能传进
		return 0
	end

	if (self.m_TrapTimerId == 0) then
		local id = player:OpenProgressBar(STR_TRANSFERRING, 18 * 2, 0, 0, "transfer_timeout", "Cancel")
		local tb = {}
		tb.obj = self
		tb.row_src = room_src.m_Row
		tb.col_src = room_src.m_Col
		tb.row_dst = room_dst.m_Row
		tb.col_dst = room_dst.m_Col
		tb.trap_id = gate.m_Id
		tb.pos = gate.m_Destination
		ProgressBarList[id] = tb
		self.m_TrapTimerId = id
		self:NotifyMatesInMaze(STR_TRANSFERRING)
	end
	return 0
end

function transfer_timeout(id)
	local tb = ProgressBarList[id]
	if (tb ~= nil) then
		tb.obj:OnTime(tb)
		ProgressBarList[id] = nil
	end
	return 0
end

function Maze:AftTrap(gate, player, param)
	local pos = self:FindPlayerPosition(player)
	if (not pos) then
		return
	end
	local room_src = param[1]
	local room_dst = param[2]
	if (not room_src or not room_dst) then
		return
	end
	room_src:Leave(player)
	room_dst:Enter(player)
	pos.row = room_dst.m_Row
	pos.col = room_dst.m_Col
end

function Maze:OnTime(tb)
	local room = self:GetRoom(tb.row_src, tb.col_src)
	-- 达到或者超过队伍人数的一半，就集体传送到目标房间
	if (not room) then
		self:LogError(format("transfer fail: room[%d,%d] not found", tb.row_src, tb.col_src))
	else
		local count_ontrap = room:GetTrapPlayerCount(tb.trap_id)
		local count_inmaze = self:GetMateCount()
		if (count_ontrap * 2 >= count_inmaze) then
			self:MoveAll(tb.row_dst, tb.col_dst, tb.pos)
			self:NotifyMatesInMaze("队伍传送成功!")
		else
			self:NotifyMatesInMaze("传送点人数不够一半，队伍传送失败")
			self:Log(format("transfer fail: count_ontrap(%d) * 2 < count_inmaze(%d)", count_ontrap, count_inmaze))
		end
	end
	self.m_TrapTimerId = 0
	return 0
end

function Maze:MoveAll(row, col, destination)
	local dest = self:GetRoom(row, col)
	local count = 0
	local x = floor(destination.x / 32)
	local y = floor(destination.y / 32)
	for name, tb in self.m_Players do
		local player = tb.Player
		local pos = tb.Position
		if (not player) then
			self:Log(format("transfer ignored: player(%s) offline, =>room[%d,%d], dest(%d,%d,%d)",
				name,
				row,
				col,
				destination.mapid,
				destination.x,
				destination.y))		
		elseif (pos == nil or pos.row == 0 or pos.col == 0) then
			self:Log(format("transfer ignored: player(%s) outside, =>room[%d,%d], dest(%d,%d,%d)",
				name,
				row,
				col,
				destination.mapid,
				destination.x,
				destination.y))		
		else
			local old_row = pos.row
			local old_col = pos.col
			if (player:NewWorld(destination.mapid, x, y) == 1) then
				local room = self:GetRoom(pos.row, pos.col)
				room:Leave(player)
				dest:Enter(player)
				pos.row = row
				pos.col = col
				count = count + 1
				self:Log(format("transfer ok: player(%s), room[%d,%d]=>[%d,%d], dest(%d,%d,%d)",
					name,
					old_row,
					old_col,
					row,
					col,
					destination.mapid,
					destination.x,
					destination.y))
			else
				self:LogError(format("transfer fail: player(%s), room[%d,%d]=>[%d,%d], dest(%d,%d,%d)",
					name,
					old_row,
					old_col,
					row,
					col,
					destination.mapid,
					destination.x,
					destination.y))
			end
		end
	end
	self:Log(format("transfer finish: count(%d)", count))
end

-- 玩家死亡次数
function Maze:GetPlayerKilledCount(player)
	local tb = self.m_Players[player:GetName()]
	if (not tb) then
		return 0
	else
		return tb.KilledCount
	end
end

-- 玩家掉线次数
function Maze:GetPlayerLogoutCount(player)
	local tb = self.m_Players[player:GetName()]
	if (not tb) then
		return 0
	else
		return tb.LogoutCount
	end
end

function Maze:Login(player)
	local name = player:GetName()
	local tb = self.m_Players[name]
	if (not tb or tb.Player ~= nil) then
		self:LogError(format("login fail: player(%s) not found", name))
		return
	end
	if (tb.KilledCount + tb.LogoutCount > MAX_DEATHCOUNT) then
		self:LogError(format("login deny: player(%s), killed_count(%d), logout_count(%d)", name, tb.KilledCount, tb.LogoutCount))
		self:Quit(player)
		player:Msg2Player(format("你的死亡次数已超过上限，不能继续进入剑冢了"))
		return
	end
	local pos = tb.Position
	if (pos.row ~= 0 or pos.col ~= 0) then
		self:LogError(format("login fail: player(%s) already in room[%d,%d]", name, pos.row, pos.col))
		return
	end
	tb.Player = player
	player:SetFightState(0)
	player:NewWorld(self.m_MapId, REVIVE_POSX, REVIVE_POSY)
	self:SetRevivePos(player)
	self:Log(format("login ok: player(%s)", name))
end

function Maze:Logout(player)
	local name = player:GetName()
	local tb = self.m_Players[name]
	if (not tb or not tb.Player) then
		self:LogError(format("logout fail: player(%s) not found", name))
		return
	end
	
	local pos = tb.Position
	local room = nil
	if pos.row ~= 0 and pos.col ~= 0 then
		room = self:GetRoom(pos.row, pos.col)
	end
	
	tb.LogoutCount = tb.LogoutCount + 1
	if room ~= nil and room.m_Task ~= nil and room.m_TaskId ~= nil then
		AddStatDataPlayerLeaveCount(room.m_TaskId)
	end
	if (tb.KilledCount + tb.LogoutCount > MAX_DEATHCOUNT) then
		self:Log(format("logout quit: player(%s), killed_count(%d), logout_count(%d)", name, tb.KilledCount, tb.LogoutCount))
		self:Quit(player)
		if (self.m_MateCount <= 0) then
			self:Destroy()
		end
	else
		self:Log(format("logout ok: player(%s), killed_count(%d), logout_count(%d)", name, tb.KilledCount, tb.LogoutCount))
		self:Leave(player)
		player:SetFightState(0)
		player:NewWorld(OUT_MAPID, OUT_POSX, OUT_POSY)
	end
end

Room = {}

function Room:New(row, col, maze)
	local tb = clone(Room)
	tb.m_Row = row
	tb.m_Col = col
	tb.m_Players = {}
	tb.m_PlayerCount = 0
	tb.m_Maze = maze
	tb.m_Open = 0
	tb.m_TaskId = 0
	tb.m_Status = TASKSTAT_INIT	-- 任务状态
	tb.m_SteleIndex = 0
	tb.m_ReadTimerId = 0
	return tb
end

function Room:Destroy()
	if (self.m_Task) then
		self.m_Task:Destroy()
		self.m_Task = nil
	end
	self.m_TaskId = 0
	self.m_Players = nil
	if (self.m_SteleIndex > 0) then
		DlgNpcManager:DelNpc(self.m_SteleIndex)
		self.m_SteleIndex = 0
	end
	if (self.m_ReadTimerId > 0) then
		TimerList:DelTimer(self.m_ReadTimerId)
		self.m_ReadTimerId = 0
	end
end

function Room:IsEqual(room)
	if (room.m_Row == self.m_Row and
		room.m_Col == self.m_Col) then
		return 1
	else
		return 0
	end
end

function Room:IterPlayers(obj, func)
	if (self.m_Players ~= nil) then
		for _, player in self.m_Players do
			if (player ~= nil) then
				func(obj, player)
			end
		end
	end
end

function Room:Enter(player)
	if (self.m_Status == TASKSTAT_INIT) then
		self.m_Maze:SetHotPosition(self.m_Row, self.m_Col)
		player:Msg2Player("那么已经进入一个神秘的房间，请点击房间内的石碑，将有各种冒险等着各位!")
	end
	self.m_Players[player:GetName()] = player
	self.m_PlayerCount = self.m_PlayerCount + 1
	if (self.m_SteleIndex == 0) then
		-- 石碑NPC
		local pos = PositionList:GetPosition(self.m_Row, self.m_Col)
		self.m_SteleIndex = DlgNpcManager:AddNpc("Bia Ц",
			NPCID_ROOMSTELE,
			self.m_Maze.m_MapId,
			pos.stele.x,
			pos.stele.y,
			NpcStele,
			2)
	end
	if (self.m_Task ~= nil and self.m_Task.OnEnter ~= nil) then
		self.m_Task:OnEnter(player, self.m_PlayerCount)
	end
end

function Room:Leave(player)
	local name = player:GetName()
	if (self.m_Players[name] ~= nil) then
		self.m_Players[name] = nil
		self.m_PlayerCount = self.m_PlayerCount - 1
	end
	if (self.m_Task ~= nil and self.m_Task.OnLeave ~= nil) then
		self.m_Task:OnLeave(player, self.m_PlayerCount)
	end
end

function Room:GetPlayerCount()
	return self.m_PlayerCount
end

function Room:Open()
	self.m_Maze:Log(format("room[%d,%d] is open!", self.m_Row, self.m_Col))
	self.m_Open = 1
end

function Room:Close()
	self.m_Open = 0
end

function Room:IsOpen()
	return self.m_Open
end

function Room:Inside(player)
	return self.m_Maze:InRoom(player, self.m_Row, self.m_Col)
end

function Room:GetTrapPlayerCount(want)
	local count = 0
	for _, player in self.m_Players do
		local x, y, _ = player:GetPos()
		local _, id = QueryMapTrap(self.m_Maze.m_MapId, x, y)
		if (id == want) then
			count = count + 1
		end
	end
	return count
end

function Room:OnPlayerDeath(player)
	if (self.m_Task ~= nil and self.m_Task.OnPlayerDeath ~= nil) then
		self.m_Task:OnPlayerDeath(player)
	end
end

function Room:StartTask(player)
	if (self.m_Status == TASKSTAT_INIT) then
		self.m_Status = TASKSTAT_DOING
		if (self.m_TaskId == 0) then
			self.m_TaskId = self.m_Maze:PopTask()
		end
		local fin = self.m_Maze.m_EndRoom
		if (fin.row == self.m_Row and fin.col == self.m_Col) then
			self.m_Maze:SetLeftMinutes(15)
			self.m_Maze:NotifyMatesInMaze(format("进入最后事件房间，开始计算%d分钟", 15))
		end
		self.m_ReadTimerId = TimerList:AddTimer(self, 10 * 18)
		self.m_Maze:NotifyMatesInMaze("事件已到，10秒后将开始，请点击石碑看闯关说明.")
		self.m_Maze:Log(format("start task: player(%s)", player:GetName()))
		AddStatDataTaskStartCount(self.m_TaskId)
		SetTaskStartTime(self.m_TaskId, self.m_Maze.m_MapId)
	else
		TaskInfo:Show(self.m_TaskId, player)
	end
end

function Room:OnTime()
	self.m_Task = TaskList:CreateTask(self.m_TaskId)
	if (not self.m_Task) then
		self.m_Maze:LogError(format("failed to create task(%d): room[%d,%d]", self.m_TaskId, self.m_Row, self.m_Col))
	else
		self.m_Task:Start(self.m_Maze, self)
		self.m_Maze:Log(format("start task(%d): room[%d,%d]", self.m_TaskId, self.m_Row, self.m_Col))
	end
	return 0
end

function Room:FinishTask()
	if (self.m_Status == TASKSTAT_DOING) then
		AddStatDataFinishedRoom()
		AddStatDataTaskFinishedCount(self.m_TaskId)
		AddStatDataTaskFinishedTime(self.m_TaskId, self.m_Maze.m_MapId)
		if (self.m_Players ~= nil and self.m_PlayerCount > 0) then
			-- FinishTaskAward(self.m_Maze, self.m_TaskId, self.m_Players, self.m_PlayerCount)
		end
		self.m_Maze:Log(format("task done: room[%d,%d], task(%d)", self.m_Row, self.m_Col, self.m_TaskId))
		self:Open()
		local fin = self.m_Maze.m_EndRoom
		if (fin.row == self.m_Row and fin.col == self.m_Col) then
			self.m_Maze:FinalAward(self)
			self.m_Maze:NotifyAllMates("恭喜你闯关成功，找到剑冢最后的秘密!")
			self.m_Maze:Finish()
			return
		else
			self.m_Maze:TaskAward(self)
			self.m_Maze:NotifyMatesInMaze("恭喜你已完成该房间的挑战，你已发现3条路已打开，你们可以进入一个房间继续.")
		end
		self.m_Status = TASKSTAT_FINISH
	else
		self.m_Maze:LogError(format("task's status is invalid: room[%d,%d], task(%d), status(%d)", self.m_Row, self.m_Col, self.m_TaskId, self.m_Status))
	end
	if (self.m_Task ~= nil) then
		
		self.m_Maze:Log(format("task close: room[%d,%d], task(%d)", self.m_Row, self.m_Col, self.m_TaskId))
		self.m_Task:Close(self.m_Maze, self)
		self.m_Task:Destroy()
		self.m_Task = nil
	else
		self.m_Maze:LogError(format("task is empty: room[%d,%d], task(%s)", self.m_Row, self.m_Col, tostring(self.m_TaskId)))
	end
end

function Room:CheckStatus(status)
	if (self.m_Status == status) then
		return 1
	else
		return 0
	end
end

function Room:HasStele()
	if (self.m_SteleIndex > 0) then
		return 1
	else
		return 0
	end
end

function Room:GetSteleScript()
	if (self.m_SteleIndex > 0) then
		local script, _ = GetNpcScript(self.m_SteleIndex)
		return script
	else
		return nil
	end
end

MazePermission = {
	m_OrgTime = Tm2Time(2000, 1, 1)	-- 起始时间为2000年1月1日
}

function MazePermission:Encode(player, day, count)
	local task = day * 100 + count
	player:SetTask(TASK_JOINPERMISSION, task)
end

function MazePermission:Decode(player)
	local task = player:GetTask(TASK_JOINPERMISSION)
	return floor(task / 100), mod(task, 100)
end

function MazePermission:DateToTime(days)
	local year = floor(days / 10000)
	local left = mod(days, 10000)
	local month = floor(left / 100)
	local day = mod(left, 100)
	return Tm2Time(year, month, day)
end

function MazePermission:TimeToDayCount(days)
	return floor((days - self.m_OrgTime) / (3600 * 24))
end

function MazePermission:DateToDayCount(days)
	return self:TimeToDayCount(self:DateToTime(days))
end

-- 检查是否允许参加迷宫（未检查次数限制）
function MazePermission:CheckPermission(player)
	local days, _ = self:Decode(player)
	if (days == 0) then
		return 0
	else
		return 1
	end
end

-- 允许参加迷宫活动
function MazePermission:Permit(player, days)
	local last_days, _ = self:Decode(player)
	if (last_days > 0) then
		return
	end
	if (not days) then
		days = self:TimeToDayCount(GetCurServerTime())
	end
	self:Encode(player, days, COUNT_JOINEVERYDAY)
end

function MazePermission:QueryLeftCount(player, days)
	local last_days, left_count = self:Decode(player)
	if (last_days == 0) then
		return 0
	end
	if (not days) then
		days = self:TimeToDayCount(GetCurServerTime())
	end
	if (days < last_days) then
		return 0
	end
	local count = (days - last_days) * COUNT_JOINEVERYDAY + left_count
	if (count > COUNT_JOINTOTAL) then
		count = COUNT_JOINTOTAL
	end
	self:Encode(player, days, count)
	return count
end

function MazePermission:ReduceLeftCount(player, dec)
	local day, count = self:Decode(player)
	dec = dec or 1
	if (count > 0) then
		count = count - dec
		self:Encode(player, day, count)
	end
end

function MazePermission:AddLeftCount(player, add)
	local day, count = self:Decode(player)
	add = add or 1
	count = count + add
	self:Encode(player, day, count)
end

-- 复生符
ReviveFigure = {}

function ReviveFigure:Use(player, err)
	local maze = MazeList:Find(player)
	if (not maze) then
		self:Msg(err, "你还未打开或者未参加剑冢活动")
		return 0
	end
	local pos = maze:FindPlayerPosition(player)
	if (pos.row ~= 0 and pos.col ~= 0) then
		maze:Leave(player)
	end
	if (maze:Revive(player) == 0) then
		self:Msg(err, "剑冢活动未打开")
		return 0
	end
	return 1
end

function ReviveFigure:Msg(err, msg)
	if (err ~= nil) then
		err.Msg = msg
	end
end

function EnterMaze()
	local maze = Maze:New()
	if (maze ~= nil) then
		maze:OpenAllRooms()
		local player = PlayerList:GetPlayer(PlayerIndex)
		maze:Enter(player)
	else
		Msg2Player("fail: maze map is not ready")
	end
end

function enter_shijiangu()
	SetFightState(0)
end

function Initialize()
	OtherMap:AddMap(OUT_MAPID)
	MapAlloc:PreApplyMap(MAZE_MAPID)
	set_MapType(MAZE_MAPID, "FUBEN")
	EventSys:GetType("EnterMap"):Reg(OUT_MAPID, enter_shijiangu)
end

-- DEBUG
function LoadRoomTask(id)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local maze = MazeList:Find(player)
	if (maze) then
		local room = maze:FindRoomWithPlayer(player)
		if (room) then
			room.m_TaskId = id
		end
	end
end

AutoFunctions:Add(Initialize)
