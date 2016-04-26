--西南北区 成都府 路人23落魄子弟的对话 世界任务
--author: yuanlan	
--date: 2003/3/19


function main(sel)

i = random(0,4)									--触发买卖的机率是20%

if (i == 0) then  -- 暂时关闭
-- Say("落魄子弟：嗨，来瞅瞅我的宝贝，我一看就知道你是个识货的人，瞧瞧，这可是我的传家之宝啊，要不是手头实在紧得很，我还舍不得卖呢！", 2, "买/accept", "不买/refuse")
Say("落魄子弟：嗨，来瞅瞅我的宝贝，我一看就知道你是个识货的人，瞧瞧，这可是我的传家之宝啊！", 0)
return
end;

if (i == 1) or (i == 2) then  
Say("落魄子弟：看什么看！你在附近转了几圈了，别以为我不知道，你就是打我身上的宝贝主意！", 0)
return
end;

if (i == 3) or (i == 4) then  
Say("落魄子弟：别看我穿得不怎么样，告诉你，我可是名门之后，想当年……", 0)
return
end;

end;


function accept()

if (GetCash() >= 5000) then					--参考值
	j = random(0, 9)					--具体类别
	k = random(2, 8)					--等级，控制随机生成道具物品的价格范围为500至50000
	m = random(0, 4)					--系别
	if (j == 0) then 					--closeweapon
		n = random(0, 5)				--详细类别
		AddItem(0, 0, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 1) then 					--rangeweapon
		n = random(0, 2)				--详细类别
		AddItem(0, 1, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 2) then 					--armor
		n = random(0, 9)				--详细类别
		AddItem(0, 2, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 3) then 					--ring
		AddItem(0, 3, 0, k, m, 1)						
		Pay(5000)
	end
	if (j == 4) then 					--amulet
		n = random(0, 1)				--详细类别
		AddItem(0, 4, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 5) then 					--boots
		n = random(0, 3)				--详细类别
		AddItem(0, 5, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 6) then 					--belt
		n = random(0, 1)				--详细类别
		AddItem(0, 6, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 7) then 					--helm
		n = random(0, 8)				--详细类别
		AddItem(0, 7, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 8) then 					--cuff
		n = random(0, 1)				--详细类别
		AddItem(0, 8, n, k, m, 1)						
		Pay(5000)
	end
	if (j == 9) then 					--pendant
		n = random(0, 1)				--详细类别
		AddItem(0, 9, n, k, m, 1)						
		Pay(5000)
	end
else
	Say("落魄子弟：原来是个没有油水的！", 0)
end;

end;


function refuse()
Say("搞不好是个骗子。", 0);
end;
