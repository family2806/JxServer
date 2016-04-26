--description: 成都野外野猪 世界任务
--author: yuanlan	
--date: 2003/4/1

function OnDeath()
	Uworld11 = GetTask(11)
	if (Uworld11 < 255) and (Uworld11 >= 1) and (random(0,99) < 10) then		-- 任务中，10%几率
		if (Uworld11 < 10) then					-- 到达十只后不再计数
			Uworld11 = Uworld11 + 1
			SetTask(11,Uworld11)
			Msg2Player("我已杀死一只扰乱村民的野猪了，目前一起杀了"..(Uworld11 - 1).."只 ")
		else
			SetTask(11,100)
			Msg2Player("我已经杀了10只野猪，可以回去复命了")
		end
	end
end;
