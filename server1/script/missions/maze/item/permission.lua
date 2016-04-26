Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	if (player:GetLevel() < 120) then
		player:Say("120�����ϲ���ʹ����������.")
	elseif (MazePermission:CheckPermission(player) == 1) then
		player:Say("ÿλ���ֻ��ʹ����������һ��")
	else
		MazePermission:Permit(player, nil)
		AddStatDataCanEnterMazeCount(1)
		return 0
	end
	return 1
end
