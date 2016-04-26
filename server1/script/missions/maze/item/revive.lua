Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\missions\\maze\\taskinfo.lua")

ITEM_MAZEREVIVE = {6, 1, 2657, 1}
PROTECT_TIME 	= 18 * 2

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	local maze = MazeList:Find(player)
	if (not maze) then
		player:Say("只能在剑冢迷宫使用复生符.")
		return 1
	end
	local rooms = maze:GetPlayingRoomList()
	if (getn(rooms) == 0) then
		player:Say("房内没有事情在进行")
		return 1
	end
	local tb = {}
	for i = 1, getn(rooms) do
		local room = rooms[i]
		local inf = TaskInfo:GetInfo(room.taskid)
		tinsert(tb, format("%s/#enter_room(%d,%d)", inf.Name, room.row, room.col))
	end
	tinsert(tb, "结束对话/Cancel")
	player:Say("请选择你想转去的房间.", getn(tb), tb)
	return 1
end

function enter_room(row, col)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return
	end
	local maze = MazeList:Find(player)
	if (not maze) then
		return
	end
	local count = player:CalcEquiproomItemCount(ITEM_MAZEREVIVE[1], ITEM_MAZEREVIVE[2], ITEM_MAZEREVIVE[3], ITEM_MAZEREVIVE[4])
	if (count == 0) then
		player:Say("装备里没有复生符 ")
		return
	end
	local room = maze:FindRoomWithPlayer(player)
	if (not room) then
		maze:Enter(player, row, col)
	elseif (room.m_Row == row and room.m_Col == col) then
		player:Say("你已选择事件，已有房间了.")
		return
	elseif (room.m_Open ~= 1) then
		player:Say("为完成房内的事，不能使用复生符")
		return
	else
		maze:Move(player, row, col)
	end
	player:SetProtectTime(PROTECT_TIME)
	player:ConsumeEquiproomItem(1, ITEM_MAZEREVIVE[1], ITEM_MAZEREVIVE[2], ITEM_MAZEREVIVE[3], ITEM_MAZEREVIVE[4])
end
