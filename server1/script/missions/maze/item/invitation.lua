-- ����Ӣ����ʹ�ýű�
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\missions\\maze\\head.lua")

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	if (player:GetTask(TASK_MAZEINVITATION) ~= 0) then
		player:Say("����Ӣ������ÿ��ֻ��ʹ��һ��")
	elseif (player:GetLevel() < 120) then
		player:Say("120�����ϲ���ʹ������Ӣ����")
	else
		player:SetTask(TASK_MAZEINVITATION, 1)
		player:Say("����ɽ������²ι��Խ��ȣ��������������ʹ�����Խ��ȹ�ӭ���´�ݹ��٣�����ͨ��������ĳ��򵽴��Խ��ȡ�.")
		return 0
	end
	return 1
end
