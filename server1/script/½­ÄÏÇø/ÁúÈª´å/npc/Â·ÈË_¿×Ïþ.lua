--龙泉村 路人 孔晓
--龙泉村新手任务：后爹好不好
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 3) then		-- 任务中
		Talk(5,"W18_step","孔晓!你是不是很讨厌你后爹?","你为什么这么说?","不是吗?","当然不是! 他是一个好人. 对我母亲很好!","真是这样吗？这样的话就太好了，如果知道是这样的话他肯定很高兴")
	else				-- 非任务对话
		Talk(1,"","之前每个人都看不起我母亲，自从得到了他的保护之后就有所改变")
	end
end;

function W18_step()
	SetTask(18,6)
	Talk(1,"","?")
	AddNote("已经知道了孔晓的心思，立即去告诉他使他安心")
	Msg2Player("已经知道了孔晓的心思，立即去告诉他使他安心")
end
