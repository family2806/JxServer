CAKE_ITEM = 
{
{"B竛h sinh nh藅",200000},
{"上等B竛h sinh nh藅",1000000},
}

MAX_EXP_CAKE = 50000000
TASK_CAKE_EXP = 1743

function main()
	if (GetTask(TASK_CAKE_EXP) < MAX_EXP_CAKE) then
		Msg2Player("B筺  ╪ 1 "..CAKE_ITEM[caketype][1]..", nh薾 頲 ph莕 thng"..CAKE_ITEM[caketype][2].."甶觤 kinh nghi謒.")
		AddOwnExp(CAKE_ITEM[caketype][2])
		SetTask(TASK_CAKE_EXP,GetTask(TASK_CAKE_EXP) + CAKE_ITEM[caketype][2]) 
		if (GetTask(TASK_CAKE_EXP) >= MAX_EXP_CAKE) then
			Msg2Player("您只能从B竛h sinh nh藅获得5000万经验值!")
		else
			Msg2Player("您可以多吃一个B竛h sinh nh藅获得 "..(MAX_EXP_CAKE-GetTask(TASK_CAKE_EXP)).."甶觤 kinh nghi謒.")
		end
		return 0
	else
		Say("您只能从B竛h sinh nh藅获得5000万经验值!",0)
		return 1
	end
end