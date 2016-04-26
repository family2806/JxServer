--中原北区 朱仙镇 路人双双的对话
--朱仙镇新手任务: 找手环
--by Dan_Deng(2003-07-21)
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world40 = GetTask(68)
	if ((UTask_world40 == 0) and (GetLevel() >= 6)) then		--任务启动
		Say("我把娘留我的手环弄丢了，怎么都找不到，那可是我最喜欢的手环.", 2, "我帮你找/yes", "真是麻烦/no")
	elseif ((UTask_world40 == 3) and (HaveItem(191) == 1)) then		-- 完成任务
		DelItem(191)
		Talk(2,"finish_select","这是你的手环么?","是的，太谢谢你了，请收下我的一点心意吧")
	elseif (UTask_world40 <= 3) then		-- 任务中的普通对话
		Talk(1,"","希望可以找回我的手环. ")
	else
		i = random(0,2)
		if (i==0) then
			Talk(1,"","那是我娘留个我的，我很喜欢")
		elseif (i==1) then
			Talk(1,"","去年我娘得病过世了，只留下这个手环.")
		else
			Talk(1,"","小女子好想娘啊 ")
		end
	end
end;

function yes()
	SetTask(68,1)
	Msg2Player("接任务：帮助双双找到手环. ")
	AddNote("接任务：帮助双双找到手环. ")
end;

function no()
	Talk(1,"","不懂手环丢落在哪里了?")
end;

function finish_select()
	Say("这是200两，请收下.", 2, "接受. /finish_a","拒绝 /finish_b")
end;

function finish_a()
	Talk(1,"","多谢 ")
	Earn(200)
	SetTask(68,4)
	AddRepute(7)
	Msg2Player("完成任务：帮助双双找到手环，获得200两白银. ")
	AddNote("完成任务：帮助双双找到手环，获得200两白银. ")
	Msg2Player("你的江湖名望增加7点")
end;

function finish_b()
	Talk(2,"","人在江湖，互相帮助是应该的，你不要太客气","你真是一位侠义之士，小女子有一条牛皮腰带，送给你防身吧 .")
	SetTask(68,5)
	AddRepute(9)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
	AddItem(0,6,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
	Msg2Player("完成任务：帮助双双找到手环，获得一条牛皮腰带. ")
	AddNote("完成任务：帮助双双找到手环，获得一条牛皮腰带. ")
	Msg2Player("你的名望增加9点 ")
end;
