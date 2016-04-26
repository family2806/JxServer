--description: 新手村_李豫
--author: wangzg	
--date: 2003/7/21
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) 修改装备属性生成方式
-- Update: Dan_Deng(2003-09-20) 为何VSS上未更新？重写修改任务流程

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world69=GetTask(69)
	if ((UTask_world69 == 0) and (GetLevel() >= 5)) then
		Talk(3, "select", "唉，衣带渐宽终不悔，为伊消得人憔悴","这位大哥，你有心上人了?","唉，只可惜她从来不对我有任何表示，为什么这个世界上有我这么悲惨的人?")
	elseif (UTask_world69 == 4) then
		Talk(4,"W69_step2","春香出一个提给你：衣带渐宽终不悔，这句诗的作者柳永又叫什么?","我实在是想不出来!","怎么会这么简单的问题也不会?","真不好意思，你可以帮我吗?")
	elseif (UTask_world69 == 8) then
		Talk(2, "prise", "春香姑娘已经接受了你的信物，还请你到她家做客，恭喜恭喜!","这个戒指是我的一点心意，请你收下！")
	elseif (UTask_world69 == 2) then
		Talk(1,"","她叫春香，住在镇子的东边。这把荷花扇是我的信物，麻烦你帮我交给她.")
	elseif (UTask_world41==10) then
		Talk(1,"","春香既温柔又贤惠，能娶到她是什么都比不上的!")
	else
		Talk(1,"","事件谁这么多情!")
	end
end

function select()
	Say("你能帮我向她转达心意吗?", 2, "我可以帮你和她说. /yes", "这个忙我帮不上. /no")
end;

function yes()
	Talk(1,"","她叫春香，住在镇子的东边。这把荷花扇是我的信物，麻烦你帮我交给她.")
	AddEventItem(190)
	Msg2Player("接任务：帮李豫传达心意给春香，带李豫的信物荷花扇给春香. ")
	SetTask(69,2)
	AddNote("接任务：帮李豫传达心意给春香，带李豫的信物荷花扇给春香. ")
end

function no()
end

function W69_step2()
	Talk(1,"","遵命!")
	SetTask(69,6)
	AddNote("李豫回答不出问题，你帮他回答. ")
	Msg2Player("李豫回答不出问题，你帮他回答. ")
end

function prise()
	SetTask(69,10)
	AddRepute(7)		-- 声望加7点
	AddNote("把春香的回答带给李豫，任务完成. ")
	Msg2Player("把春香的回答带给李豫，任务完成. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (random(0,3) == 0) then
		AddItem(0, 3, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("得到黄玉戒指")
	else
		AddItem(0, 3, 0, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("得到石戒指")
	end
	Msg2Player("你的江湖名节增加7个点 ")
end
