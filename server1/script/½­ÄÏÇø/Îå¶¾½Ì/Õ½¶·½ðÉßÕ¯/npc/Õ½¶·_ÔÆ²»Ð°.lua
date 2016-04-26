-- 战斗_云不邪.lua 战斗云不邪死亡脚本
-- By: Xiao_Yang(2004-04-29)

function OnDeath()
	if (GetTask(124) == 35) then
		AddEventItem(387)
		SetTask(124,40)
		Talk(1,"","你真恶毒! ")
		Msg2Player("你打败云不邪，搜身找到阴阳笑奇毒的解药")
		SetFightState(0)
		NewWorld(185,1612,3204)
	end
end
