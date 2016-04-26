-- special_horse.lua 卖特殊马(80级马)的NPC脚本
-- By Dan_Deng(2003-11-10)

function main()
	UWorld97 = GetTask(97)
	if (UWorld97 == 10) then		-- 已经买过
		Talk(1,"","沈驹：你一定要好好对待马儿，每天要给它洗澡，豆饼里面要掺上精面......")
	elseif (UWorld97 == 1) and (IsTongMaster() == 1) then			-- 可以买马
		Talk(4,"sele_color","沈驹：这位英雄请留步。","玩家：兄台有什么事？","逃驹：在下沈驹，现下有一匹千里良驹出让，看这位英雄气宇不凡，定是开宗立派的大宗师，在下的宝马当不辱没了英雄名头。","玩家：我看看你的“宝马”......")
	else
		Talk(1,"","沈驹：千里马常有，而伯乐不常有。徒呼！奈何！")
	end
end

function sele_color()
	Say("沈驹：英雄请看：",6,"这不是乌云踏雪么！/buy_black","这不是赤兔宝马么！/buy_red","这不是绝影么！/buy_cyan","这不是的卢么！/buy_yellow","这不是照夜玉狮子么！/buy_white","这是什么马？恕厅下眼拙不识。/buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","沈驹：一帮之主，宗师人物怎会不识如此宝马良驹？抱歉，看来在下是认错人了。")
end

function the_buy(i)
	SetTaskTemp(49,i)
	Say("沈驹：不错，英雄果然识得！在下本也舍不得就此卖了它，但是现下急需300万两银子，看英雄是真伯乐，忍痛割爱，望英雄千万好生善待于它。",2,"没问题，我一定不会亏待它的/buy_yes","这一时半会间又上哪去筹这笔钱呢？/buy_no")
end

function buy_yes()
	if (GetCash() >= 3000000) then
		i = GetTaskTemp(49)
		Pay(3000000)
		AddItem(0,10,5,i,0,0,0)
		SetTask(97,100+i)			-- 变量赋值，并且记住买的是什么颜色马
		Talk(1,"","沈驹：马儿呀马儿，今后你就跟随这位英雄了，一定要乖乖的呀。")
	else
		Talk(1,"","玩家：我现在身上银两带得不够，你且稍待。")
	end
end

function buy_no()
	Talk(1,"","沈驹：唉，当真要一文钱难倒英雄汉吗？")
end
