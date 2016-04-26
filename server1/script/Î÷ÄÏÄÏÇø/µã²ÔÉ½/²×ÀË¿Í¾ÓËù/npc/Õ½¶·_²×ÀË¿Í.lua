function OnDeath(sel)
	Uworld42 = GetTask(42)
	if (Uworld42 == 70) then
		Talk(8,"U42_prise","哈哈，好小子，没想到你也这么厉害","前辈过奖了!","人生如梦，醒来吧。这几个年轻人没有得罪我的地方，你带他们走吧!","多谢前辈!","小子，记得珍惜自己拥有的，失去了，悔恨都来不及了，我在全家有难的时候沉迷武功，达到绝世武功又能怎样？还不如和子孙过平凡的日子.","在下记住了","这几个小孩需要教导。我平生学得很多了，你也要学习，做很多善事，算是帮我积功德.","多谢前辈!")
		Msg2Player("打败苍浪客 ")
		NewWorld(167,1400,2974)
	end
end;

function U42_prise()
	SetTask(42,255)
	AddProp(2)
	Ubonus86 = GetTask(86) + 1					-- 记录任务奖励了2点潜能(第一字节+1)
	if (GetByte(Ubonus86,1) >= 250) then		-- 容错：上限为250点
		Ubonus86 = 250
	end
	SetTask(86,Ubonus86)
	
	i = random(30,35)
	AddRepute(i)
	Msg2Player("领悟奔雷，你的潜能增加2点")
	Msg2Player("<#> 失踪小孩任务：救失踪小孩，完成任务。你的名望增加 "..i.."<#> 点.")
	AddNote("失踪小孩任务：救失踪小孩，完成任务。你的名望增加  ")
end
