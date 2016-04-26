-- 汴京 路人NPC 辛弃疾（少林入门任务）
-- by：Dan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(122) == 0)) then		--入门任务进行中
		Say("人生没有人不会遇到危险，过了，就能练到坚强的性格",2,"我认为，那是己所不欲勿施于人/enroll_S2_A","在路上看到不平之事，不能袖手旁观，这才是侠义 /enroll_S2_B")
	else
		Talk(1,"","努力，为国为民，为天下百姓")
	end
end;

function enroll_S2_A()
	Say("人生没有人不会遇到危险，过了，就能练到坚强的性格",3,"努力，为国为民，为天下百姓/enroll_S2_wrongA","让我想想，找最好的解决办法/enroll_S2_correct","尽管自己获利，也不要伤害到他人 /enroll_S2_wrongA")
end;

function enroll_S2_B()
	Say("这里有500两白银，请收下!",3,"多谢 /enroll_S2_wrongB","我可以帮你什么？/enroll_S2_wrongB","真是不敢麻烦/enroll_S2_correct")
end;

function enroll_S2_correct()
	Talk(1,"","看来我和你有缘，送你广藿香")
	AddEventItem(122)
	Msg2Player("获得广藿香")
	AddNote("回答辛弃疾的问题，获得广藿香 ")
end;

function enroll_S2_wrongA()
	Talk(1,"","人生没有人不会遇到危险，过了，就能练到坚强的性格")
end;

function enroll_S2_wrongB()
	Talk(1,"","你见钱就眼开，怎么能发挥正气，你真是让我失望!")
end;
