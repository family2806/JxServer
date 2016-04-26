-- \script\西北南区\华山\npc\战斗_金国将领托尔汉.lua
-- by xiaoyang (2004\4\15) 少林90级任务

function OnDeath()
Uworld122 = GetTask(122)
	if (Uworld122 == 55) then				-- 状态中，此处不检查令牌
		Talk(1,"","你又坏了金国的大事，金主一定不会放过你的!")
		SetTask(122,60)  -- 设置任务变量为60
		Msg2Player("杀了金国将领托尔汉，直接到营寨救常百里和季笛风")
		AddNote("杀了金国将领托尔汉，直接到营寨救常百里和季笛风. ")
	end
end
