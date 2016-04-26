--description: 中原南区 襄阳府 路人8邓家嫂子对话 武当派50级任务
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 50*256+50) then 
		Talk(3, "select", "邓家嫂子：屋里已经快揭不开锅了，小伢天天叫饿，我这个做娘的见了真是心疼。", "玩家：大嫂，这里有一万两银子，你快拿着，只要有我们武当弟子在，你们以后就不会再挨饿受冻了！", "邓家嫂子：哎呀，我真是遇到活菩萨啦，我不是在做梦吧？现在还有这样的好人！")
	elseif (UTask_wd > 50*256+50) then
		Talk(1,"","邓家嫂子：武当山上的那些大侠真是我们穷苦人家的救命活菩萨啊，要不是他们常常接济，我们母子早就饿死了！")
	else
		Talk(1,"","邓家嫂子：屋里已经快揭不开锅了，小伢天天叫饿，我这个做娘的见了真是心疼。")
	end
end;

function select()
	if (GetCash() >= 10000) then
		Pay(10000)
	Msg2Player("将强盗打劫的一万两银子全部送给了邓家嫂子。")
		SetTask(5, 50*256+80)
		AddNote("将强盗打劫的一万两银子全部送给了邓家嫂子 ")
	else
		Talk(1,"","玩家：糟糕，那一万两银子被我用了，这可如何是好？我得再去筹点银子")
		AddNote("银两不够，去赚钱先. ")
	end
end;
