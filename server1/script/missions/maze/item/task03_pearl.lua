Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
IL("ITEM")

function main()
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (player) then
		if (player:CalcEquiproomItemCount(6, 1, 2634, 1, 0, 0) < 10) then
			player:Say("需要 <color=red>10<color> 褐雪灵珠才能合成一个雪灵珠魂.")
		elseif (player:ConsumeEquiproomItem(10, 6, 1, 2634, 1) ~= 1) then
			player:Msg2Player("合成雪灵珠魂失败.")
		else
			local nItemIndex = player:AddItem(6, 1, 2635, 1, 0, 0)
			if (nItemIndex <= 0) then
				player:Msg2Player("合成雪灵珠魂失败.")
			else
				ITEM_SetExpiredTime(nItemIndex, 30)
				player:SyncItem(nItemIndex)
				player:Msg2Player("成功合成一个雪灵珠魂.")
			end
		end
	end
	return 1
end
