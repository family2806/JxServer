-- 临安 路人NPC 小太监（丐帮50级任务）
-- by：Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+40) then				--带着50级任务
		Talk(2,"L50_pay","什么人?","我是曹公公的亲戚，从家乡带了点东西孝敬他老人家，麻烦您通报一声!")
	else
		Talk(1,"","小太监：走开走开，不要在皇宫前面晃来晃去的！")
	end
end;

function L50_pay()
	Say("亲戚! 什么亲戚? 既然是来孝敬的怎么不知道打点?",2,"贿赂3000两银两! /L50_pay_yes","不给/L50_pay_no")
end;

function L50_pay_yes()
	if (GetCash() >= 3000) then
		Pay(3000)
		Talk(1,"after_pay","知道知道！这是3000两，孝敬您喝酒的!")
	else
		Talk(1,"","真小气！快走!")
	end
end;

function after_pay()
	NewWorld(177, 1569, 3169)
	Msg2Player("贿赂3000给小太监,他让你进御花园了")
	Talk(1,"","恩，这还差不多，曹公公现在在御花园，你去那里找他!")
end

function L50_pay_no()
end;
