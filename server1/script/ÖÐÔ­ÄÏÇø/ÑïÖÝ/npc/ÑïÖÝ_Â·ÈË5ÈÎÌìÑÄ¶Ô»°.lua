-- 扬州 路人NPC 任天涯（入门任务）
-- by：Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(73) == 0)) then		--入门任务中并且没有该物品
		Say("要表扬谁呢?",4,"小孩. /prise_1","相貌/prise_2","功名/prise_3","离开/prise_exit")
	else					--在普通对话中给一点点任务提示。
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","苦读，可是屡试不中，我已经心灰意冷了，也许我天生就不是考功名的料。")
		elseif (i == 1) then
			Talk(1,"","任天涯：我还是去学一门手艺养活自己，老老实实做一个平头百姓算了。")
		else
			Talk(1,"","十年寒酸无人问，一举成名天下知，是否要等我成名的那一天才能想妻儿之事?")
		end
	end
end;

function prise_1()
	Talk(2,"","这位兄弟，看你相貌，就知道你有福气，子孙满堂?!"," 小生家境贫寒，至今未娶，古人云：不孝有三，以后我怎么有脸面对祖宗？")
end;

function prise_2()
	Talk(2,""," 这位兄弟，看你相貌，就知道你有福气，子孙满堂?!","你不要开玩笑了，正因为我从小到大这么丑陋，所以，没有女孩愿意嫁给我。为什么世间女子都喜欢以相貌嫁人呢?")
end;

function prise_3()
	Talk(2,""," 这位兄弟，看你相貌，就知道你有福气，子孙满堂?!","人生很难遇到知音，你真是我的知己。小生没有什么能送的，只有这把扇子，送给你做见面礼")
	AddEventItem(73)
	Msg2Player("任天涯送你一把扇子 ")
	AddNote("任天涯送你一把扇子 ")
end;

function prise_exit()
end;
