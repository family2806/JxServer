--description: 两湖区 巴陵县 酒店老板对话 天王入门任务
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\timerhead.lua")

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld38 == 20) then 							--天王帮入门任务
Talk(4, "", "玩家：老板，你这里什么酒最好？", "酒店老板：本地最好的酒非<color=Red>“蓬莱春”<color>莫属，只是酿造这种酒很费功夫，而且原料也很难找，所以价钱不便宜。", "玩家：只要酒好就行，我想买一坛，要多少银子？", "酒店老板：银子再多也没用，本店已经很久没有酿造这种酒了，因为缺少原料<color=Red>灵芝<color>、<color=Red>玄参<color>和<color=Red>何首乌<color>。如果你能弄到这三种原料，我就帮你酿制一坛。听说这三种药材生长在<color=Red>武陵山的东北部<color>，只不过那里有很多吃人的怪兽，所以没人敢去送死。")
		SetTask(38,SetByte(GetTask(38),1,40))
		AddNote("和巴陵县酒馆老板对话，知道要找3种原料酿酒：灵芝，玄参，何首乌.")
		Msg2Player("知道要找3种原料酿酒：灵芝，玄参，何首乌. ")
	elseif (Uworld38 == 40) then
		if (HaveItem(116) == 1) and (HaveItem(135) == 1) and (HaveItem(144) == 1) then
			if (GetTimerId() > 0) then		-- 另有计时器在运行中
				Talk(1,"","你身上有紧急的任务，还要乱跑")
				return
			end
			Talk(2,"","老板! 我们已找够3种原料了，你帮我酿蓬莱春吧!","好的，但是要1个小时才可以. ")
			DelItem(116)
			DelItem(135)
			DelItem(144)
			SetTask(38,SetByte(GetTask(38),1,60))
			SetTimer(1 * CTime * FramePerSec, 1)									--开启计时器
			AddNote("回来巴陵县酒馆，带上原料，知道要等一小时. ")
			Msg2Player("带上原料，知道要等一小时. ")
		else
			Talk(1,"","听说这三种药材生长在<color=Red>武陵山的东北部<color>，只不过那里有很多吃人的怪兽，所以没人敢去送死. ")
		end
	elseif (Uworld38 == 60) then			-- 为计时器容错加入手动超时处理
		i = GetRestSec(1)
		if (i > 0) then
			Talk(1,"","时间还没到，酒还没有酿好，你还要等: "..i.."秒, ")
		else
			StopTimer()						--结束计时
			SetTask(38,SetByte(GetTask(38),1,80))
			TWenroll_getitem()
		end
	elseif (Uworld38 == 80) and (HaveItem(90) == 0) then
		TWenroll_getitem()
	elseif (Uworld38 >= 80) then		-- 完成此任务后
		Talk(1,"","本店的蓬莱春不是徒有虚名的")
	else
		Talk(1,"","酒店老板：我们这儿是著名的鱼米之乡，河产丰富，客官要吃点什么鲜货？喝点什么酒？")
	end
end;

function TWenroll_getitem()
	AddEventItem(90)
	Msg2Player("拿到一壶蓬莱春. ")
--	SetTask(3, 8)
	AddNote("一小时后，回来酒馆拿蓬莱春. ")
end
