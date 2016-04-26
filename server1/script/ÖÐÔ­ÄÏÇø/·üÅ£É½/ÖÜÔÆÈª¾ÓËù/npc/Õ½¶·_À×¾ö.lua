--中原南区\伏牛山\周云泉居所\战斗_雷决.lua
--by xiaoyang (2004\4\20)

function OnDeath()
Uworld129 = GetTask(129)
	if (Uworld129 == 55) then
		SetTask(129,60)
		Talk(1,"",".....不曾想你这么厉害，雷诀只是天忍教差劲的弟子，会有人给我报仇。武林中人将被消亡....")
		Msg2Player("打败雷诀，救出受伤的朱云泉. ")
		i = random(0,99)
		if (i < 33) then
			NewWorld(41, 1951, 2989)
		elseif (i < 67) then
			NewWorld(41, 1685, 3268)
		else
			NewWorld(41, 1788, 3085)
		end
   end
end
