--description: 新手村_春香
--author: wangzg	
--date: 2003/7/21
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-20)

function main()
	UTask_world69=GetTask(69)
	if (UTask_world69 == 2) and (HaveItem(190) == 1) then
		Talk(4,"W69_step1","春香姑娘，有人叫我把这个交给你","这个...是谁给你的?","姑娘仔细想想，一定知道送这礼物的人.","这样的话...那个人常念着'衣带渐宽终不悔'的诗句，但是他不知道作者柳永叫什么，对吗?")
	elseif (UTask_world69 == 6) then
		Say("你是怎么回答的？诗句衣带渐宽终不悔的作者柳永还叫什么?",4,"柳七变/W69_false","柳变/W69_false","柳七/W69_true","柳三变/W69_false")
	else
		Talk(1,"","我生在这，长在这，不知道外面的世界是什么样子.")
	end
end;

function W69_step1()
	DelItem(190)
	SetTask(69,4)
	AddNote("把莲花交给春香转达李豫对她的心意。春香提示：衣带渐宽终不悔，这句诗的作者柳永又叫什么?  ")
	Msg2Player("把莲花交给春香转达李豫对她的心意。春香给你出个题：衣带渐宽终不悔，这句诗的作者柳永又叫什么? ")
end

function W69_true()
	Talk(1,"","好了，你告诉他：明天到我家做客!")
	SetTask(69,8)
	AddNote("回答正确，春香请你转告给李豫明天到她家玩. ")
	Msg2Player("回答正确，春香请你转告给李豫明天到她家玩. ")
end

function W69_false()
	Talk(1,"","错了，给你点时间想想")
	Msg2Player("你回答错误，加油，别浪费了李豫的深情")
end
