-- 扬州 路人NPC 柳大爷（丐帮入门任务）
-- by：Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld30 == 10) and (HaveItem(72) == 0) then		--入门任务中并且没有该物品
		Say("要怎么表扬呢 ",4,"财富 /prise_1","儿孙. /prise_2","功名/prise_3","离开/prise_exit")
	else					--在普通对话中给一点点任务提示。
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","柳大爷：全扬州最有钱的就是那些盐商了！")
		elseif (i == 1) then
			Talk(1,"","柳大爷：你可知道咱们扬州城最漂亮的地方是哪里？不是官老爷的宅第，而是那些盐商修的园子！那些园林的景色就跟画里面的一样，你想都想不到！")
		else
			Talk(1,"","我的一生就是这个梦想了。哈哈，看起来我是世上最幸福的人了")
		end
	end
end;

function prise_1()
	Talk(2,"","老爷，看你就知道您是富贵之人，家财万卷!","不错不错。虽然我吃喝不愁，但是家境一般，最开心的是儿孙孝顺")
end;

function prise_2()
	Talk(4,"","老爷，看您就知道您是富贵之人，一定是出生名家","哈哈，不错，不错。我不愁吃穿，但是，现在苦尽甘来，儿孙孝顺。我可以在祖宗面前自豪了。","老爷，可以给我一根您的胡须吗?","真是奇怪，想要我的胡须做什么？不管这么说，你和我有缘，行，送你!")
	AddEventItem(72)
	Msg2Player("你获得一根胡须 . ")
	AddNote("你获得一根胡须 ")
end;

function prise_3()
	Talk(2,"","这位老爷，看您就知道您学识渊博。","我志气不高，到现在还没有功名，你过奖了，我不好意思!")
end;

function prise_exit()
end;
