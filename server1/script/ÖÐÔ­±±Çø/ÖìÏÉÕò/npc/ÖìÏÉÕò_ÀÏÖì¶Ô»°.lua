--description: 新手村_老朱
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==2) then
		Talk(3, "select", "你是老朱？", "有什么事?", "你夫人叫你回去")
	elseif (UTask_world46==10) then
		Talk(1,"","我想通了，这几年生活不容易，没有事就不要打扰我.")
	else
		Talk(1,"","小兄弟，不要听她说，被女人管，怎么能有太平的日子?")
	end
end

function select()
	Say(" 嗝～别提那个母夜叉，我做什么事情她都要管，我不就喝点酒么？嗝～?", 2, "劝/reason","不关心别人夫妻的事/no")
end

function reason()
	Talk(2, "prise", "十年修得同船渡，百年修得共枕眠，能做夫妻，缘分难得，你还是回去和你娘子和好吧."," 算了，都是老夫老妻了，我也不和她斗气了.")
end;

function prise()
	Talk(1,"","我等会就回去，我这里有点金创药，看你十个习武之人，就送给你吧.")
	SetTask(74,10)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddRepute(5)
	AddNote("成功说服老朱回家，完成任务")
	Msg2Player("成功说服老朱回家，完成任务")
	Msg2Player("获得3包金疮药 ")
	Msg2Player("你的名望增加5点")
end

function no()
end
