--Create by yfeng ,2004-3-9
--感悟之书，80级以上玩家使用之后，可以获得1点潜能
--玩家每升2级，可以多一点潜能点，做多获得5点潜能点
--即：89级以上玩家使用可以获得5点潜能点
--该物品同一玩家只能使用15次
--任务变量81低4位表示使用该物品的次数
function main(sel)
	times = mod(GetTask(81),16)
	point= {
		{pot=1,msg="一点"},
		{pot=2,msg="少许"},
		{pot=3,msg="一些"},
		{pot=4,msg="不少"},
		{pot=5,msg="颇多"}
	}
	str ={
		"你把《洗髓经》翻来翻去，竟然没看懂:(",
		"你把《洗髓经》翻开，仔细阅读，似乎获得%s收益。",
		"你把《洗髓经》看来看去，再难有所收益。"
	}
	level = GetLevel()
	if(level < 80) then  --等级太低，不让使用
		Msg2Player(str[1])
		return 1
	end
	if(times > 14) then --使用超过次数
		Msg2Player(str[3])
		return 1
	end
	if(level > 89) then --按等级分配潜能
		level = 89
	end
	index = floor((level -80)/2) +1
	AddProp(point[index].pot)
	SetTask(81,times+1)
	Msg2Player(format(str[2],point[index].msg))
	return 0
end

