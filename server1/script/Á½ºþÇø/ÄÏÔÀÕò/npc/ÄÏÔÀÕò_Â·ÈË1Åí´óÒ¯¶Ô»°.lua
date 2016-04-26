-- 南岳镇　路人　彭大爷 (名驹奔火任务)
-- 2004/4/17 名驹奔火任务 by fangjieying

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld76 = GetTask(76)
--	if (GetLevel() >= 60) and (Uworld76 == 0) then       -- 符合任务条件
--		Talk (8,"","玩家：老大爷，您的茶饮下一口便满嘴生津，困乏全无啊。","彭大爷：不瞒您说，小老儿几十年的功夫，都花在这上面了。","玩家：在下经年奔波，常受日毒之害，若能天天喝到您的凉茶，那真是一大快活。","彭大爷：莫非你是江湖中人？","玩家：不错，老大爷真是目光如炬。","彭大爷：哎呀！太好了。小兄弟，我见你英气逼人，又是江湖朋友。小老儿这有一件事想请你帮忙，若能成则你那日行之苦也自可解。","玩家：大爷您切莫折煞小子，有事尽管说。","彭大爷：小兄弟看我身边这匹马。")
--		SetTask(76,10)
--		Msg2Player("探查彭大爷身边的马")
	if (Uworld76 == 10) then
		Talk (1,"","探查彭大爷身边的马. ")
	elseif (Uworld76 == 20) then
		SetTask(76,25)
		Talk (3,"W76_get","毛色纯洁，身体强壮，疾奔如飞，真是匹好马啊. ","你真是有眼光，只是最近它生病了，需要快点治疗. ","可惜我不是医生，不能解决. ")
	elseif (Uworld76 == 25) then				-- 中断后重接任务的处理
		Talk(1,"W76_get","怎么样，同意帮我吗?")
	elseif (Uworld76 == 60) then
		Talk(1,"W76_prise","果然治好了，不懂该怎么感谢你!")
	elseif (Uworld76 == 30) then				-- 任务进行中
		if (HaveItem(393) == 0) then         -- 书信丢失处理
			Talk (1,"","不料你那么不小心，算了，我再写一封吧. ")
			AddEventItem(393)			-- 通用书信
		else
			Talk (1,"","小兄弟，它的病不能久等，要快点去")
		end
	elseif (Uworld76 == 70) then			-- 任务已经完成
		Talk(1,"","虽然它不会说，但是，我觉得它很像人")
	else
		Talk(1,"","彭大爷：年轻人，没事儿学点手艺，不要整天背着把剑打打杀杀的。")
	end
end

function W76_get()
	Say("不用小兄弟出手，我认识一个人，医术高明，希望你可以帮我!",2,"没问题，我一定帮你 /W76_get_yes","今天我有事，改天吧/no")
end

function W76_get_yes()                                        -- 任务启动
	Talk(2,"","Л好，我有封信，你拿给他，他一定来。他治好我的马后，我叫他教你医术，你和他有缘，此次一定行。")
	SetTask(76,30)
	AddEventItem(393)			-- 通用书信
	Msg2Player("收到一封信，去药王谷救马")
	AddNote("收到一封信，去药王谷救马")
end

function W76_prise()
	Talk(1,"","彭大爷不用客气，我也从中学到一些本事")
	SetTask(76,70)
	add_repute = ReturnRepute(40,70,3)			-- 声望奖励：最大40点，从70级起每级递减3%
	AddRepute(add_repute)
	Msg2Player("任务完成，你的名望增加"..add_repute.."点.")
	AddNote("治好马的病，完成任务")
end

function no()
end
