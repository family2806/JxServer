--中原北区 汴京府 酒楼老板对话（少林50级任务）
-- Update: Dan_Deng(2003-10-25)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+20) and (HaveItem(123) == 0) then		-- 50级任务进行中
		Say("第一烧鸡酒，京城第一酒，只要500两!",2,"买/buy","不买 /no")
	else
		Talk(1,"","酒楼老板：客官要喝酒么？要喝酒可以，不过我得事先声明，我这儿开的是酒馆，只管喝酒，莫论国事，要论国事请另找别的地儿，省得给我找麻烦！")
	end
end;

function buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(123)
		Msg2Player("在酒楼买到一只烧鸡 ")
		AddNote("在酒楼买到一只烧鸡 ")
	else
		Talk(1,"","客官，留下鸡。请回家带钱来哦! ")
	end
end

function no()
end
