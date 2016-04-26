--description: 新手村_盈盈
--author: wangzg	
--date: 2003/7/22
--72	UTask_world44
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world44=GetTask(72)
	if ((UTask_world44==0) and (GetLevel() >= 2)) then		-- 任务启动，需要2级以上
		Talk(3, "select", "怎向心绪，近日厌厌长似病。凤楼咫尺，佳期杳无定。展转无眠，粲枕冰冷。香虬烟断，是谁与把重衾整?", "?..这位姑娘，发生了什么事情，为何如此伤感 ", "唉，一言难尽......你可否帮我一个忙?")
	elseif (UTask_world44==2)  then
		Talk(1,"","我把这条丝帕送与我情郎张大元，并告诉他今晚三更，老地方，不见不散")
	elseif (UTask_world44==4) then		-- 任务完成
		Talk(7,"prise","张大元说他不认识你.","什么 .....已是断弦尤续，覆水难收，常向人前诵谈，空遗时传音耗。漫悔懊。此事何时坏了?","......姑娘，你还真有诗意!",", 唉，罢了罢了，这份回忆还是我自己留着吧.", "别灰心，世上的好男人多着呢.", "多谢你的好心，这双鞋送给你聊表心意，唉......寂寞深闺，柔肠一寸愁千缕.", "......")
	else
		Talk(1,"","人家夫妻双双，我怎么一个人这么苦?")
	end
end;

function select()
	Say("帮我把这条丝帕送与我情郎张大元，并告诉他今晚三更，老地方，不见不散", 2, "好，我帮你 /yes", "我有其他事/no")
end

function yes()
	AddEventItem(192)
	SetTask(72,2)
	AddNote("接任务：帮盈盈姑娘把丝帕送与情郎张大元. ")
	Msg2Player("接任务：帮盈盈姑娘把丝帕送与情郎张大元. ")
	Msg2Player("获得一条丝帕. ")
end

function no()
end

function prise()
	DelItem(192)
	SetTask(72,10)
	AddRepute(5)
	AddNote("告诉盈盈张大元的态度，劝她不要太伤心，完成任务")
	Msg2Player("告诉盈盈张大元的态度，劝她不要太伤心，完成任务")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (GetSex()== 0) then
		AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("获得一双草鞋 ")
	else
		AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("获得一双绣花鞋")
	end
	Msg2Player("你的名望增加5点")
end;
