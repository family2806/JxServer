-- 周云泉居所 传送点 离开.lua
-- By: Dan_Deng(2004-04-08)
-- 回到伏牛山西（天心洞入口）

function main()
	if (GetSex() == 0) then
		Talk(1,"","你快快下山，后方依然是雷诀的骂声：臭小子，你别跑'! ")
	else
		Talk(1,"","你快快下山，后方依然是雷诀的骂声：臭小子，你别跑'! ")
	end
	i = random(0,99)
	if (i < 33) then
		NewWorld(41, 1951, 2989)
	elseif (i < 67) then
		NewWorld(41, 1685, 3268)
	else
		NewWorld(41, 1788, 3085)
	end
end
