-- 学“劫富济贫”技能的乞丐
-- By: Dan_Deng(2003-08-22)
-- 给钱数第一次100，第二次200，第三次400...依此类推，估计8次(12800)之后还没学到的就没什么意义了，只能怨太命苦。

function main(sel)
	UTask_world16 = GetTask(16)
	if (UTask_world16 == 255) then			-- 任务已完成
		Talk(1,"","遇到好事!")
	else
		i = (2 ^ UTask_world16) * 100
		Say("祝你健康，可怜可怜我这个乞丐吧! ",2,"给你"..i.."银两./W53_pay","好吃懒做的家伙，一定不给/W53_no")
	end
end;

function W53_pay()
	UTask_world16 = GetTask(16)
	i = (2 ^ UTask_world16) * 100
	if (GetCash() >= i) then
		Pay(i)
		if (random(0,99) < 20) then			-- 20%机率学到“劫富济贫”技能
			Talk(3,"W53_prise","多谢你的好心，想学一些好玩的游戏吗? ","好玩的游戏? ","对的. ")
		else
			SetTask(16,UTask_world16 + 1)
		end
	else
		Talk(1,"","现在我没有零钱 ")
	end
end;

function W53_no()
	Talk(1,"","你没有心意，菩萨不会保佑.")
end;

function W53_prise()
	AddNote("施舍乞丐，学到技能劫富济贫' ")
	Msg2Player("施舍乞丐，学到技能劫富济贫' ")
	if (HaveMagic(400) == -1) then		-- 必须没有技能的才给技能
		AddMagic(400,1)
	end
	SetTask(16,255)
end;
