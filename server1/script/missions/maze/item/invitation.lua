-- 钰龙英雄帖使用脚本
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\missions\\maze\\head.lua")

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	if (player:GetTask(TASK_MAZEINVITATION) ~= 0) then
		player:Say("玉龙英雄帖，每人只能使用一次")
	elseif (player:GetLevel() < 120) then
		player:Say("120级以上才能使用玉龙英雄帖")
	else
		player:SetTask(TASK_MAZEINVITATION, 1)
		player:Say("玉龙山在请阁下参观试剑谷，朱军是天趋护剑使，在试剑谷恭迎阁下大驾光临，可以通过城市里的车夫到达试剑谷。.")
		return 0
	end
	return 1
end
