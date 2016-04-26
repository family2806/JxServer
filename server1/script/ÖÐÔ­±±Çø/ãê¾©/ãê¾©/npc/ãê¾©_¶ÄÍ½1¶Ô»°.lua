--description: 中原北区 汴京府 赌徒1对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) and (HaveItem(129) == 0) then
		Talk(8, "select", "老子的手气怎么这么背，赌一盘输一盘！老子已经输得倾家荡产了，只剩下这柄一文不值的断剑!", "断剑！老兄，你这把断剑卖不卖?", "卖！当然卖！你别看这把剑模样不起眼，其实用来切切菜还是蛮不错的！你可真有眼光啊!", "你要多少钱?", "不贵不贵，才500两银子!", "什么？你简直是在敲诈嘛?", "你看我已经穷得身无分文了，就算帮帮忙，让我用这一百两去翻本嘛!", "好吧，如果不是为了完成任务，我才不上你的当呢) ")
	elseif (UTask_tr > 60*256+20) then 
		Talk(1,"","我没有什么可以卖了!")
	else
		Talk(1,"","赌徒：我已经好几天没吃没喝了，输光了家当，回到家里又被老婆打了出来。")
	end
end;

function select()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(129)
	Msg2Player("得到断剑“转魄”。")
		AddNote("到达汴京赌场，花500两买了把断剑 ")
	else
		Talk(1,"","原来也是个穷鬼，难道想骗我的宝剑不成")
	end
end;
