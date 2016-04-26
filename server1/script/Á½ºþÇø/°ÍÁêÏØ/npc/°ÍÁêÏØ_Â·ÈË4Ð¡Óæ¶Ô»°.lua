--两湖区 巴陵县 路人4小渔对话
--巴陵县新手任务：小渔的爹爹
--suyu
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world18 = GetTask(46);
	if (UTask_world18 == 0) then		-- 任务启动
		Say("小渔：呜呜……我爹昨天打鱼遇上大风雨，被淋病了，现在还发烧呢。爹的病还没好，又不能打鱼，我们吃什么啊。你能帮我去求求吴神医么？吴神医是个大好人，他一定会帮我们的。",2,"帮忙/yes","不帮/no")
	elseif(UTask_world18 == 1) then		-- 任务完成
		if(HaveItem(180) == 1) then
			Talk(1,"","小渔：啊！这就是枇杷丸？这下子爹爹的病很快就会好起来的。你真是个大好人，这双鞋是我娘做的，你一定要收下呀。")
			DelItem(180)
			SetTask(46, 2)
			AddNote("将枇杷丸交给小渔，完成任务。")
			Msg2Player("将枇杷丸交给小渔，完成任务。")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
			if(GetSex() == 0) then
				AddItem(0, 5, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("得到草鞋。")
			else
				AddItem(0, 5, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("得到绣鞋。")
			end
			AddRepute(5)		-- 加声望6点
			Msg2Player("你的江湖声望提升了5点")
		else
			SetTask(46, 1)
			Talk(1,"","小渔：还没有找到枇杷丸么？爹爹的病可怎么办呀，呜呜呜……")
		end
	else							-- 非任务状态
		if (random(0,1) == 0) then
			Talk(1,"","小渔：我爹爹是洞庭湖的渔民，每天都要到湖上去撒网捕鱼，如果遇到了刮风下雨，有时会好几天都回不了家呢。")
		else
			Talk(1,"","小渔：爹很疼我，可是他老说如果我是男孩子就好了，那样我就可以帮他捕鱼了。")
		end
	end
end;

function yes()
	Talk(1,"","我记得以前听大夫说得要枇杷丸才可以治好高烧，可是我们穷人哪儿买得起啊。")
	SetTask(46, 1)
	Msg2Player("接到任务：小渔的爹爹病了，帮他去买枇杷丸回来治病")
	AddNote("接到任务：小渔的爹爹病了，帮他去买枇杷丸回来治病")
end;

function no()
	Talk(1,"","小渔：我要在这里继续等好心人。")
end;
