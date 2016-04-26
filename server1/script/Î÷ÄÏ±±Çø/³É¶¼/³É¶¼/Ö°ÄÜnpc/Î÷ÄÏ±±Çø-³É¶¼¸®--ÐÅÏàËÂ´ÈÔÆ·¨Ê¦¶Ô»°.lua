--西南北区 成都府 信相寺慈海大师对话
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em <10) then				--没有加入峨嵋派
Talk(4, "", "慈云法师：施主，看你是一个习武之人，来到成都，是想拜访峨眉，还是想前往蜀南竹海？", "倘若施主果真有此打算，不妨先听老衲的几句逆耳之言。", "嵋派清晓师太与本寺住持是方内知交，她为人慈和，不会难为你。但她门下的几位俗家弟子武功高强，你若要上峨嵋，必须通过她们的考验才行。", "至于蜀南竹海的唐门，老衲劝你还是不要去了。唐门中人行事诡秘、亦正亦邪，唐门四周机关重重，要想闯过竹海，恐怕凶多吉少……")
	elseif (UTask_em == 40*256+50) then 		--峨嵋派40级任务
		UTask_emsub02 = GetByte(GetTask(29),2)
		if (UTask_emsub02 == 0) then 
			Say("阿弥陀佛！原来是峨嵋派的女侠，贵派掌门清晓师太佛理通透，想必门下弟子佛学的造诣亦不浅，老僧不自量力，想考教考教!", 2, "请大师指点/L40_V2_Q1", "晚辈还有别的事 /no")
		elseif (UTask_emsub02 == 3) then
			L40_V2_Q1()
		elseif (UTask_emsub02 == 5) then
			L40_V2_Q2()
		elseif (UTask_emsub02 == 7) then
			L40_V2_Q3()
		else
			if (HaveItem(167) == 0) then
				AddEventItem(167)
				Talk(1,"","女侠果然不愧是峨眉弟子，这里有个护身符，请收下!")
			else
				Talk(1,"","峨嵋女侠的佛学造诣与武学造诣一样不俗，老僧佩服!")
			end
		end
	elseif ((UTask_em == 50*256+50) and (HaveItem(23) == 1)) then		--峨嵋派50级任务
		Talk(5, "","慈云法师：阿弥陀佛！女侠有什么事吗?","在下奉师尊之命，向贵寺送来贺礼，劳烦大师问贵寺慈海方丈通报一声.","多谢尊师美意，不过贫僧也不知方丈现在何处，正在担心他的安危.","不知发生了何事?","说来奇怪，方丈今早接了一封书信后，就去了后院，直到现在也没有出来，也不知发生了什么事.")
		SetTask(1, 50*256+60)
		AddNote("和慈云法师谈话后知道慈海大师去了后院. ")
		Msg2Player("和慈云法师谈话后知道慈海大师去了后院. ")
	elseif (UTask_em == 50*256+60) then
		Talk(1,"","说来奇怪，方丈今早接了一封书信后，就去了后院，直到现在也没有出来，也不知发生了什么事.")
	elseif (UTask_em >= 50*256+80) and (GetFaction() == "emei") then
		Talk(1,"","多谢女侠救了方丈，峨眉女侠果然名不虚传.")
	elseif (UTask_em == 70*256) then
		Talk(1,"","女侠日后行走江湖，有什么需要本寺帮忙的只管开口，本寺定当倾力相助.")
	else
		Say("慈云法师：尊师还好吗？")	--加入峨嵋派后的非任务对话
	end
end;

function no()
	Talk(1,"","那老僧就不打扰女侠了.")
end;

function L40_V2_Q1()
	Say("佛教是在哪朝哪代传入中土的?", 4, "战国/ /f1", "汉代 /L40_V2_Q2", "唐代 /f1", "明代 /f1")
end;

function f1()
	Say("阿弥陀佛！看来女侠对佛学的了解还不够深啊. ")
	SetTask(29, SetByte(GetTask(29),2,3))
end;

function L40_V2_Q2()
	Say("很好。女侠知道唐朝到天竺取经的高僧是谁吗?", 4, "辩机/f2", "鉴真/f2", "一行/f2", "玄奘/L40_V2_Q3")
end;

function f2()
	Say("女侠是不是记错了?", 0)
	SetTask(29, SetByte(GetTask(29),2,5))
end;

function L40_V2_Q3()
	Say("不错，贵派所处峨眉山乃天下四大佛山之一，女侠知不知道下面哪个不属于四大佛山?", 4, "普陀山/f3", "九华山/f3", "嵩山/L40_V2_prise", "五台山/f3")
end;

function f3()
	Say("难道尊师没有告诉过你们吗?", 0)
	SetTask(29, SetByte(GetTask(29),2,7))
end;

function L40_V2_prise()
	Talk(1,"","峨嵋弟子的佛学造诣果然与武学造诣一样不俗，老僧佩服，这块鹰睛护身符送给女侠，聊表心意!")
	AddEventItem(167)
	SetTask(29, SetByte(GetTask(29),2,10))
	AddNote("拿到鹰睛护身符. ")
	Msg2Player("拿到鹰睛护身符 . ")
end;
