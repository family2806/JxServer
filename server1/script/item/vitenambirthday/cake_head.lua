CAKE_ITEM = 
{
{"生日蛋糕",200000},
{"上等生日蛋糕",1000000},
}

MAX_EXP_CAKE = 50000000
TASK_CAKE_EXP = 1743

function main()
	if (GetTask(TASK_CAKE_EXP) < MAX_EXP_CAKE) then
		Msg2Player("您已吃了一个"..CAKE_ITEM[caketype][1]..", 获得奖励"..CAKE_ITEM[caketype][2].."经验值.")
		AddOwnExp(CAKE_ITEM[caketype][2])
		SetTask(TASK_CAKE_EXP,GetTask(TASK_CAKE_EXP) + CAKE_ITEM[caketype][2]) 
		if (GetTask(TASK_CAKE_EXP) >= MAX_EXP_CAKE) then
			Msg2Player("您只能从生日蛋糕获得5000万经验值!")
		else
			Msg2Player("您可以多吃一个生日蛋糕获得 "..(MAX_EXP_CAKE-GetTask(TASK_CAKE_EXP)).."经验值.")
		end
		return 0
	else
		Say("您只能从生日蛋糕获得5000万经验值!",0)
		return 1
	end
end