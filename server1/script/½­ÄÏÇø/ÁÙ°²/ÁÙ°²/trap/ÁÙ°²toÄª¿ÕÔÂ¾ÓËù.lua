
function main()
	Uworld43 = GetTask(43)
	if (Uworld43 == 90) and (HaveItem(381) == 1) and (HaveItem(382) == 1) then
		SetTask(43,100)
		DelItem(381)
		DelItem(382)
		Talk(7,"U43_go","救命! 救命!","住手!","大胆! 竟敢干涉本公子的事?","你就是一个无耻下流之徒! 你还要害多少人啊?","哈哈哈，朝廷腐败。战乱四起。谁都想生活舒适。连皇上都不管我，你还想插手吗?","别说废话!来吧!","哼！想做英雄？看看你有什么本领?")
	elseif (Uworld43 == 100) then
		Talk(1,"U43_go","哈哈，要不是我手下留情你怎么还会留命到现在. ")
	elseif (Uworld43 == 90) then			-- 任务中，道具丢了不让进的提示
		Talk(1,"","你已尝试很久了，但是门依旧没有开！只听见女孩的呼叫声!")
		Msg2Player("没有云雷两把钥匙你是无法进去制止他的. ")
	end
end

function U43_go()
	SetFightState(1)
	NewWorld(233, 1597,3207)
end
