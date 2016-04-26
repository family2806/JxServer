--description: 中原北区 汴京府 路人12孙秀才对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),2)
		if (UTask_trsub60 == 0) then 
			DelItem(128)			--处理重接任务后，玩家捡起任务道具的情况
			AddNote("在西北城汴京，坐着喝孙秀才猜字")
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 2) then
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 3) then
			L60_sub2_Q2()
		elseif (UTask_trsub60 == 4) then 
			L60_sub2_Q3()
		elseif (UTask_trsub60 == 5) then 
			L60_sub2_Q4()
		elseif (UTask_trsub60 == 6) then 
			L60_sub2_Q5()
		elseif (UTask_trsub60 == 10) and (HaveItem(128) == 0) then		-- 道具丢失
			AddEventItem(128)
			Talk(1,"","在下很佩服阁下的聪明才智，请收下此剑，不要推辞! ")
		else
			Talk(1,"","佩服，佩服!")
		end
	else
		i = random(0,3)
		if (i == 0) then
			Talk(1,"","国破山河在，城春草木深。感时花溅泪，恨别鸟惊心。”唉！可怜啊可怜!         ")
		elseif (i == 1) then
			Talk(1,"","烟笼寒水月笼沙，夜泊秦淮近酒家。商女不知亡国恨，隔江犹唱后庭花。”唉！可悲啊可悲! ")
		elseif (i == 2) then
			Talk(1,"","秦时明月汉时关，万里长征人未还。但使龙城飞将在，不教胡马渡阴山！”唉！可叹啊可叹! ")
		else
			Talk(1,"","烟柳画桥，风帘翠幕，参差十万人家。……重湖叠巘清佳。有三秋桂子，十里荷花。”唉！可恨啊可恨！——如果不是因为这首词，金人恐怕也不会起兵南侵吧")
		end
	end
end

function L60_sub2_Q1()
	Say("小生有几个字谜，在冥思苦想不得其解，不知你猜不猜得出：“床前明月光”是个什么字？ ", 3, "晃/no1", "旷/yes1", "胆/no1")
end;

function no1()
	SetTask(28, SetByte(GetTask(28),2,2))
	Talk(1,"","第一个字你能猜到啊?")
end;

function L60_sub2_Q2()
	Say("还有第二个字: 有脚快如风 点火有声音 加水茶沏成 长草花将放”是什么字呢？", 3, "仓/no2", "仑/no2", "包//L60_sub2_Q3")
end;

function no2()
	SetTask(28, SetByte(GetTask(28),2,3))
	Talk(1,"","非也，非也 ")
end;

function L60_sub2_Q3()
	Say("可以了，第三个字: 不正只为晚节屈”又是个什么字？", 3, "丐/yes3", "歪/no1", "疋/ /no3")
end;

function no3()
	SetTask(28, SetByte(GetTask(28),2,4))
	Talk(1,"","我看不是这样!")
end;

function L60_sub2_Q4()
	Say("Th?ch?th?4: '点点萤火照江边”又是个什么字？", 3, "浊/no2", "淡/yes4", "烫/no4")
end;

function no4()
	SetTask(28, SetByte(GetTask(28),2,5))
	Talk(1,"","好像不对是吗?")
end;

function L60_sub2_Q5()
	Say("最后的字才难猜! “庭前残月对映，影下雁阵一行”这个字可就难猜啦。", 3, "廖/yes5", "寥/no1", "膺/no5")
end;

function no5()
	SetTask(28, SetByte(GetTask(28),2,6))
	Talk(1,"","最后还是没完! ")
end;

function L60_sub2_prise()
	Talk(1,"","佩服，小生很高兴与你做朋友，小生的祖父是武家，到小生就弃武学文，祖父留下这把剑，但是，对于小生")
	AddEventItem(128)
	SetTask(28, SetByte(GetTask(28),2,10))
	AddNote("猜中孙秀才所有的字谜，获得断水刀")
	Msg2Player("获得断水刀 ")
end;
