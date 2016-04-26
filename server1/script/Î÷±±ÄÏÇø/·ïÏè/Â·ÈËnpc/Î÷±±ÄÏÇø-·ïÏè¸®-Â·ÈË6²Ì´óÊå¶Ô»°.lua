--西北南区 凤翔府 路人6蔡大叔对话　（拳倾天下任务）
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub3 = GetTask(54)
	if (Uworld75 == 10) and (U75_sub3 < 10) then		-- 任务中，接取子任务
		if (HaveItem(384) == 1) then
			SetTask(54,10)
			AddNote("到少林的木人巷帮助蔡大叔找金莲花. ")
			Msg2Player("到少林的木人巷帮助蔡大叔找金莲花. ")
			Talk(1,"","遗憾的是我一生研究学习但是也没有孩子。听说在少林的木人巷有金莲花，可以帮助我有孩子")
		else
		 	Talk(1,"","现在连影子都不见，只是传进你耳朵的话怎么能信呢？")
		end
	elseif (Uworld75 == 10) and (U75_sub3 == 10) then		-- 子任务完成判断
		if (HaveItem(26) == 1) then
			DelItem(26)
			SetTask(54,20)
			AddNote("找到金莲花，完成任务. ")
			Msg2Player("找到金莲花，完成任务. ")
			Talk(1,"","哈哈！这就是传说中的玉佩吧？好小子，谢谢你.")
		else
			Talk(1,"","还没找到金莲花吗? ")
		end
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","蔡大叔：俺们老蔡家几代单传，可俺到现在还没个男崽，咋对得住列祖列宗？")
		else
			Talk(1,"","蔡大叔：不孝有三，无后为大呀！")
		end
	end
end;
