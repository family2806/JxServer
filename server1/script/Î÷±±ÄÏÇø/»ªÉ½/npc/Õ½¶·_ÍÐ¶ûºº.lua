-- \script\西北南区\华山\npc\战斗_金国将领托尔汉.lua
-- by xiaoyang (2004\4\15) 少林90级任务

function OnDeath()
Uworld122 = GetTask(122)
	if (Uworld122 == 55) then				-- 状态中，此处不检查令牌
		Talk(1,"","Ngi l筰 ph� h醤g i s� c馻 Kim qu鑓! Kim ch� nh蕋 nh kh玭g bu玭g tha ngi!")
		SetTask(122,60)  -- 设置任务变量为60
		Msg2Player("Gi誸 ch誸 tng Th竎 Nh� H竛 nc Kim, ti課 th糿g v祇 doanh tr筰 c鴘 Thng B竎h L� v� L� мch Phong. ")
		AddNote("Gi誸 ch誸 tng Th竎 Nh� H竛 nc Kim, ti課 th糿g v祇 doanh tr筰 c鴘 Thng B竎h L� v� L� мch Phong. . ")
	end
end
