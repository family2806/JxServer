-- 路人_沈驹 南岳镇 卖特殊马(80级马)的NPC脚本
-- By Dan_Deng(2003-11-10)

Include("\\script\\tong\\tong_header.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

function main()
	UWorld97 = GetTask(97)
	str, result = GetTong()	
--	if (UWorld97 >= 10) then		-- 已经买过
--		Talk(1,"","沈驹：你一定要好好对待马儿，每天要给它洗澡，豆饼里面要掺上精面......")
	if (UWorld97 < 100) and (result == 1) and (GetTongFigure() == TONG_MASTER) then			-- 是帮主，没有享受过优惠买马
		SetTaskTemp(17,1000)
	else								-- 普通买马
		SetTaskTemp(17,1500)
--		Talk(1,"","沈驹：千里马常有，而伯乐不常有。徒呼！奈何！")
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<#><npc>大侠养马很多年，只看一眼就知道好不好!"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog:AddOptEntry("那时是你叫我?", horse_get);

	tbDailog:Show();
end

function horse_get()
	Talk(4,"sele_color","英雄请留步. ","兄台, 有什么要指教的","在下是沈驹﹗, 现在有一匹宝马，可以飞走千里. 这位英雄风采不凡, 一定是高手。大侠的宝马不曾被匹夫驯服. ","让我试试看你的宝马,,, ")
end

function sele_color()
	Say("英雄看! ",6,"这不是乌云踏雪吗!/buy_black","这不是赤兔宝马吗! /buy_red","这不是绝影吗! /buy_cyan","这不是的卢吗! /buy_yellow","这不是照夜玉狮子吗! /buy_white","这是什么马?我学识有限/buy_none")
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
	Talk(1,"","一帮之主，是师长级的人物最后怎么也不知道这个是什么马？真不好意思，看来你看错了!")
end

function the_buy(i)
	SetTaskTemp(49,i)
	x = GetTaskTemp(17)
	if (x == 1000) then
		Say("没错! 你真是英雄. 在下本来不想卖这匹马, 但现在正急需1000 两, 看英雄也真的喜欢它因此克制住内心的不舍卖给英雄, 希望英雄可以善待它。",2,"我一定好好对它/buy_yes","一时去哪找这么多钱/buy_no")
	else
		Say("没错! 你真是英雄. 在下本来不想卖这匹马, 但现在正急需1500 两, 看英雄也真的喜欢它因此克制住内心的不舍卖给英雄, 希望英雄可以善待它",2,"我一定好好对它/buy_yes","一时去哪找这么多钱/buy_no")
	end
end

function buy_yes()
	x = GetTaskTemp(17)
	if (GetCash() >= x * 10000) then
		i = GetTaskTemp(49)
		if (x == 1000) then			-- 是优惠价买的，为变量赋值，并且记住买的是什么颜色马
			SetTask(97,100+i)
		end
		Pay(x * 10000)
		AddItem(0,10,5,i,0,0,0)
		Talk(1,"","马儿啊马儿! 从今往后你就跟着这位英雄了，一定要听话啊!")
	else
		Talk(1,"","我现在身上银两不够，你先拿着这些钱!")
	end
end

function buy_no()
	Talk(1,"","难道是这些钱让英雄为难了")
end
