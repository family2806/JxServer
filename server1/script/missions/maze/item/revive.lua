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
		player:Say("ֻ���ڽ�ڣ�Թ�ʹ�ø�����.")
		return 1
	end
	local rooms = maze:GetPlayingRoomList()
	if (getn(rooms) == 0) then
		player:Say("����û�������ڽ���")
		return 1
	end
	local tb = {}
	for i = 1, getn(rooms) do
		local room = rooms[i]
		local inf = TaskInfo:GetInfo(room.taskid)
		tinsert(tb, format("%s/#enter_room(%d,%d)", inf.Name, room.row, room.col))
	end
	tinsert(tb, "�����Ի�/Cancel")
	player:Say("��ѡ������תȥ�ķ���.", getn(tb), tb)
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
		player:Say("װ����û�и����� ")
		return
	end
	local room = maze:FindRoomWithPlayer(player)
	if (not room) then
		maze:Enter(player, row, col)
	elseif (room.m_Row == row and room.m_Col == col) then
		player:Say("����ѡ���¼������з�����.")
		return
	elseif (room.m_Open ~= 1) then
		player:Say("Ϊ��ɷ��ڵ��£�����ʹ�ø�����")
		return
	else
		maze:Move(player, row, col)
	end
	player:SetProtectTime(PROTECT_TIME)
	player:ConsumeEquiproomItem(1, ITEM_MAZEREVIVE[1], ITEM_MAZEREVIVE[2], ITEM_MAZEREVIVE[3], ITEM_MAZEREVIVE[4])
end
