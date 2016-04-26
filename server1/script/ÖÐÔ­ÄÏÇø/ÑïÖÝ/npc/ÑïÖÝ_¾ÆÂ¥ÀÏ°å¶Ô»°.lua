--中原南区 扬州府 酒楼老板对话（丐帮10级任务、丐帮90技能任务、拳倾天下任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+10) then		--10级任务中
		SetTask(8,10*256+20)
		Talk(4,"L10_buy","老板，我要买酒!","我这里别的没有，就是酒多，你要买什么酒?","惠泉酒、金陵春、百花酿、琼花露和双沟大曲.","哎哟，不巧，惠泉酒刚刚卖完，最后一坛被城里有名的酒鬼“醉半仙”给买走了。喏，他正在那儿喝得欢呢。其余四种酒倒是都有，不过因为都是名酒，所以价钱可不便宜哦!")
	elseif (UTask_gb >= 10*256+20) and (UTask_gb < 20*256) then		--　道具丢失处理
		if (HaveItem(77) == 0) then
			Say("金陵春又香又醉人, 只要400两，快来买咯!",2,"买/L10_buy_yes1","不买/L10_buy_no")
		elseif (HaveItem(78) == 0) then
			Say("百花酿香味浓郁, 只要400两，快来买咯!",2,"买/L10_buy_yes2","不买/L10_buy_no")
		elseif (HaveItem(79) == 0) then
			Say("琼花露香味扑鼻, 只要400两，快来买咯!",2,"买/L10_buy_yes3","不买/L10_buy_no")
		elseif (HaveItem(80) == 0) then
			Say("双沟大曲酒味浓厚, 只要400两，快来买咯!",2,"买/L10_buy_yes4","不买/L10_buy_no")
		else
			Talk(1,"","各种美酒，香飘百里，醉人心里!")
		end
	elseif (GetTask(128) == 10) and (HaveItem(76) == 0) then			-- 丐帮90技能任务
		Say("泉酒香浓，只要1000两，快来买!",2,"买/U128_10","不买/L10_buy_no")
	elseif (GetTask(75) == 10) and (GetTask(55) == 10) and (HaveItem(77) == 0) then			-- 拳倾天下任务
		Say("金陵春香浓，只要800两，快来买!",2,"买/U75_10","不买/L10_buy_no")
	else
		Talk(1,"","酒楼老板：扬州这地界，有美景，有美女，怎么能没有美酒？客官要喝点什么酒？")
	end
end;

function U75_10()
	if (GetCash() >= 800) then
		Pay(800)
		AddEventItem(77)
		Msg2Player("有金陵春")
	else
		L10_buy_noMoney()
	end
end

function U128_10()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(76)
		Msg2Player("有惠泉酒 ")
	else
		L10_buy_noMoney()
	end
end

function L10_buy()
	Say("除了4种酒，计客官1200 两! 想买吗?",2,"买/L10_buy_yes","不买/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1200) then
		Pay(1200)
		AddEventItem(77)
		AddEventItem(78)
		AddEventItem(79)
		AddEventItem(80)
		AddNote("有4种酒，惠泉酒、金陵春、百花酿、琼花露和双沟大曲 ")
		Msg2Player("有4种酒，惠泉酒、金陵春、百花酿、琼花露和双沟大曲 ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_no()
	Talk(1,"","开玩笑？抢劫啊？不买，绝对不买!")
end;

function L10_buy_yes1()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(77)
		Msg2Player("有金陵春 ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes2()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(78)
		Msg2Player("有百花春 ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes3()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(79)
		Msg2Player("有琼花露")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes4()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(80)
		Msg2Player("有双沟大曲 ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_noMoney()
	Talk(1,"","没有钱？那不行!")
end;
