-- 扬州 路人NPC 孙员外（入门任务）
-- by：Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(75) == 0)) then		--入门任务中并且没有该物品
		Say("需要奖励谁呢?",4,"朋友 /prise_1","财富 /prise_2","小孩. /prise_3","离开/prise_exit")
	else					--在普通对话中给一点点任务提示。
		if (random(0,1) == 0) then
			Talk(1,"","这帮穷人整天来闹，一点我都不给!")
		else
			Talk(1,"","孙员外：是人都要吃盐，吃盐就离不开我们这些盐商，我做了十几年的盐道买卖，赚的钱三辈子都吃不完，哈哈哈！")
		end
	end
end;

function prise_1()
	Talk(2,"","这位老爷，看你就知道是个侠义之人。朋友哪里都有，真是第二个孟尝君"," 孟尝君算什么，他有多少钱？这些穷人每天都来乞讨，你也是一样。走，走，走! ! !")
end;

function prise_2()
	Talk(2,"","这位老爷，本地最富有，名声谁都知道。就连皇上也不能和你比。我祝你财源滚滚，烦恼越来越少。","这小子，最那么甜干嘛。行，算是今天我心情好。这个送给你!")
	AddEventItem(75)
	Msg2Player("孙员外送你字画 ")
	AddNote("孙员外送你字画   ")
end;

function prise_3()
	Talk(2,"","这位老爷真是有福相。想必一定富贵满堂","不要这么说，说来伤心。我今年50岁了，一个儿子也没有，多少产业以后不懂给谁?")
end;

function prise_exit()
end;
