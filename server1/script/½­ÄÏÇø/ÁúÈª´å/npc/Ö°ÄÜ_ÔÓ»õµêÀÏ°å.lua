--龙泉村 职能 杂货店老板
--龙泉村新手任务：后爹好不好、阳春白雪羹
-- By: Dan_Deng(2003-09-03)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\global_zahuodian.lua");


function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 0) then 		--“后爹好不好”任务启动
		Talk(4,"W18_get","诶! 真倒霉!","你又遇到烦心的事情了?","说起来也真丢人！我和一个女的结婚一年了！她是改嫁的，带着一个孩子。诶！我真是不知道小孩子想什么。只知道他很讨厌我 ","可能是因为你太敏感了！直接问他想要什么会不会好一点")
	elseif (UTask_world18 == 6) then		-- “后爹好不好”任务完成
		Talk(1,"W18_prise","我已经问过那个小孩了，他绝对没有讨厌你，你放心吧!")
	elseif (GetTask(20) == 5) and (HaveItem(231) == 0) then		-- “阳春白雪羹”任务进行中并且没有此道具
		if (UTask_world18 == 10) then			-- 已完成“后爹好不好”任务
			Talk(1,"","阳春灵芝？这种灵芝现在很少见了。但是我这里还有一点。你帮我一个忙我就把灵芝全部送给你")
			AddEventItem(231)
			AddNote("得到杂货老板送的阳春灵芝")
			Msg2Player("得到杂货老板送的阳春灵芝")
		else
			local buttons = store_sel_village_extend();
			tinsert(buttons, 1, "买阳春灵芝/W20_buy");
			Say("阳春灵芝？这种灵芝现在很少见了。但是我这里还有一点。只要500两白银",getn(buttons),buttons);
		end
	else
		local buttons = store_sel_village_extend();
		Say("我之前原是一名商人，结交了很多朋友。之后打乱，哪里都看见战争。因此我只好安居在这",getn(buttons),buttons)
	end
end;

function W18_get()
	local buttons = store_sel_village_extend();
	tinsert(buttons, 1, "算了这样我帮你问问/W18_get_yes");
	Say("但是.但是我还是失败! 只是一个小孩也得不到他的心",getn(buttons),buttons)
end

function W18_get_yes()
	SetTask(18,3)
	Talk(1,"","这就太好了！我将在这等你的好消息！")
	AddNote("接任务：帮助老板去问孔晓的心意")
	Msg2Player("接任务：帮助老板去问孔晓的心意")
end

function W18_prise()
	Talk(1,"","这样就太好了！真的太感谢你了！这是一点心意！望你收下")
	SetTask(18,10)
	AddNote("向杂货老板说孔晓的想法，完成任务。")
	Msg2Player("向杂货老板说孔晓的想法，完成任务。")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("得到一件粗布衣")
	else
		AddItem(0, 2, 13, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("得到百褶裙.")
	end
	AddRepute(5)
	Msg2Player("你的名望增加了5点")
end

function W20_buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(231)
		AddNote("买到阳春灵芝.")
		Msg2Player("买到阳春灵芝.")
		Talk(2,"","这个灵芝真是贵","一分钱一分货。你不会吃亏的!")
	else
		Talk(1,"","卖的真贵，我哪来那么多钱啊")
	end
end

function yes()
	Sale(29)
end;

function no()
end;
