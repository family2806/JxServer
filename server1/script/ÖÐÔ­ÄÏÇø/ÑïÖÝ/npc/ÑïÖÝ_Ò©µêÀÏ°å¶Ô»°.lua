-- 中原南区 扬州府 药店老板对话（五毒40级任务）
-- Update：Dan_Deng 加入五毒任务（2003-10-12）

-- 炼制混元灵露
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(142) == 0) then 		--任务中
		Say("今天麝香的价格为500两而已!",
			4,
			"买到麝香/L40_buy_yes",
			"交易/yes",
			"我想炼制混元灵露 /refine",
			"不交易/no")
	else
		Say("药店老板：本店的药材货真价实，包治百病。",
			3,
			"交易/yes",
			"炼制混元灵露/refine",
			"不交易/no")
	end
end;

function L40_buy_yes()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(142)
		AddNote("买到麝香.")
		Msg2Player("买到麝香.")
	else
		Talk(1,"","这个价都买不了，给我出去!")
	end
end;

function yes()
Sale(96);  			--弹出交易框
end;

function no()
end;
