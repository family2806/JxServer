--西南北区 江津村 路人1吴老爹对话
--江津村新手任务：吴老爹的药
--suyu
-- Update: Dan_Deng(2003-08-11)

function main(sel)
	UTask_world21 = GetTask(49);
	if ((UTask_world21 == 0) and (GetLevel() >= 3)) then		-- 任务启动
		Say("咳，咳，我这咳嗽就是止不住，唉，也不知道红梅什么时候回来，是时候该去药房抓药了，咳咳咳", 2, "帮忙/yes", "不帮忙/no")
	elseif (UTask_world21 == 1) then
		if (HaveItem(179) == 1) then		--判断玩家是否拿到药
			Talk(1,"","谢谢，赶明儿，我叫红梅给你做双鞋!")
			DelItem(179)		--删掉玩家身上的药
			SetTask(49, 3)
			AddNote("帮老吴拿回10个川贝丸，吴红梅送一双鞋谢恩")
			Msg2Player("帮老吴拿回10个川贝丸，吴红梅送一双鞋谢恩")
		else
			Talk(1,"","你可以去药店郎中那里问问，就从这里往西走，没几步就到了，咳咳……记好了是十颗川贝丸，麻烦你了!")
		end
	else				-- 非任务对话
		Talk(1,"","吴老爹：我和老太婆的身体都不好，闺女为了照顾我们，到现在还没有找婆家，我们做爹娘的真是对不住她呀！")
	end
end;

function yes()
	Talk(1,"","吴老爹：你可以去药店郎中那里问问，就从这里往西走，没几步就到了，咳咳……记好了是十颗川贝丸，麻烦你了。")
	SetTask(49, 1)
	AddNote("接任务，帮吴老爷去药店拿药")
	Msg2Player("接任务，帮吴老爷去药店拿药")
end;

function no()
end;
