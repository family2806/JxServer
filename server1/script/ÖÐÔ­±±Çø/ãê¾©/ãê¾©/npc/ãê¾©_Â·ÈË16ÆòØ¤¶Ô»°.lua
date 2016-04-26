--description: 中原北区 汴京府 路人16乞丐对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	Uworld38 = GetByte(GetTask(38),2)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),4)
		if (UTask_trsub60 == 0) then 
			DelItem(131)			--处理重接任务后，玩家捡起任务道具的情况
			Say("赏几个小钱吧 ! ", 2, "给 /yes1", "不给! /no")
		elseif (UTask_trsub60 == 2) then 
			Say("赏几个小钱吧! ", 2, "给 /yes2", "不给! /no")
		elseif (UTask_trsub60 == 4) then 
			Say("赏几个小钱吧! ", 2, "给 /yes3", "不给! /no")
		elseif (UTask_trsub60 == 10) then
			if (HaveItem(131) == 0) then
				AddEventItem(131)
				Talk(1,"","这把剑不值什么钱，但是也是我的一片心意，你不要推辞?!")
			else
				Talk(1,"","看来你倒不是一个沽名钓誉的伪善之辈，好，小叫化交了你这个朋友!")
			end
		end
	elseif (Uworld38 == 10) then		-- 少林入门任务进行中
		if ((HaveItem(121) == 1) and (HaveItem(122) == 1) and (HaveItem(218) == 1)) then		-- 赤铜矿、广藿香、坚晶石
			Say("只要给我你身上的3件东西就行",2,"给你 /SLenroll_S4_yes","只是骗人而已，坚决不给 /no")
		else
			Talk(1,"","这位大侠，钱途无量，请施舍一点银两吧!")
		end
	elseif ((Uworld38 == 20) and (HaveItem(219) == 0)) then		--任务中，证明书信丢了
		Talk(2,"","我看你志气不凡!","没问题! 我给你写封信就行.")
		AddEventItem(219)
	elseif (UTask_tr > 60*256+20) then
		Talk(1,"","看来你倒不是一个沽名钓誉的伪善之辈，好，小叫化交了你这个朋友!")
	else
		Talk(1,"","乞丐：大侠，有酒吗？求你赏我一口酒喝吧！我可以没饭吃，可不能没酒喝啊。")
--		Talk(1,"","乞丐：大侠，有酒吗？求你赏我一口酒喝吧！我可以没饭吃，可不能没酒喝啊。")
	end
end;

function SLenroll_S4_yes()
	Talk(1,"","看来你倒不是一个沽名钓誉的伪善之辈，好，小叫化交了你这个朋友!")
	DelItem(121)
	DelItem(122)
	DelItem(218)
	AddEventItem(219)
	Uworld38 = SetByte(GetTask(38),2,20)
	SetTask(38,Uworld38)
	Msg2Player("从乞丐手中获得一封信. ")
	AddNote("从乞丐手中获得一封信. ")
end;

function yes1()
	if (GetCash() >= 10) then
		Pay(10)
		Talk(1,"","只给这么点啊？哼！这么小气! ")
		SetTask(28, SetByte(GetTask(28),4,2))
	else
		Talk(1,"","不好意思，我带的钱不够.")
	end
end;

function yes2()
	if (GetCash() >= 50) then
		Pay(50)
		Talk(1,"","哼！别以为我是乞丐就好打发! ")
		SetTask(28, SetByte(GetTask(28),4,4))
	else
		Talk(1,"","我已经没钱啦!.")
	end
end;

function yes3()
	if (GetCash() >= 100) then
		Pay(100)
		Talk(1,"","我送你这把剑，算是一点心意，你不要推辞!")
		AddEventItem(131)
		Msg2Player("获得灭魂剑 ")
		SetTask(28, SetByte(GetTask(28),4,10))
		AddNote("在汴京遇到一个乞丐，连续施舍3次，获得灭魂剑")
	else
		Talk(1,"","我真是力不从心 ! ")
	end
end;

function no()
Say("乞丐：这世上为富不仁者真多啊！", 0);
end;
