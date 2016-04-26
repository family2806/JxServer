function OnDeath()
	Uworld130 = GetTask(130)
	if (Uworld130 == 30) then
		SetTask(130,33)
		Msg2Player("打败邵玉飞")
	elseif (Uworld130 == 36) then
		SetTask(130,40)
		AddNote("打败鱼，邵二人，回叹息老人处")
		Talk(3,"Uworld130_good","在下无意重伤2二位，今后不要再做这么愚蠢的事情了.","鱼素真:嗯","好好，大侠放心，我们再也不敢了!")
	end
end

function Uworld130_good()
	Msg2Player("打败鱼，邵二人，回叹息老人处")
	SetFightState(0)
	NewWorld(131,1530,3228)			-- 自动送到叹息老人处
end
