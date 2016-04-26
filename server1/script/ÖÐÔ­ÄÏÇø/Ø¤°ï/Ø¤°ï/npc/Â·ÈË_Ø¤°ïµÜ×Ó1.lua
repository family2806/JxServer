-- 丐帮 路人NPC 丐帮弟子1 20级任务
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 20*256) and (GetLevel() >= 20) and (GetFaction() == "gaibang") then		--20级任务
		Say("那孟远才仗着自己是孟长老的侄子，平时在帮中兄弟面前老是飞扬跋扈。刚刚明明是他理亏，却仗势欺人，结果被他打了一顿，真是气人。 ",2,"教训逆子/L20_get_yes","正人行道 /L20_get_no")
	elseif (UTask == 20*256+10) then
		Talk(1,"","你一定要小心，这个孟远才仗着自己是孟长老的侄子才敢这样欺负人")
	else
		Talk(1,"","孟远才经常欺负比自己辈分低的人，真是气人 ")
	end
end;

function L20_get_yes()
	Talk(3,"after_get","真是岂有此理，孟远才现在在哪里?","好像在西边的树林里，你千万不要去惹他，如果得罪了孟长老就麻烦了! "," 你放心，我一定给你讨回公道! ")
end;

function after_get()
	SetTask(8,20*256+10)
	AddNote("接到20级任务：教训孟远才 ")
	Msg2Player("接到20级任务：教训孟远才 ")
end

function L20_get_no()
	Talk(2,"","兄弟，忍一忍吧，这样不是更好吗?","哎! ")
end;
