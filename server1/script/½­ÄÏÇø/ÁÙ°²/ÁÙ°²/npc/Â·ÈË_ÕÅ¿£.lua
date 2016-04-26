-- 临安 路人NPC 张浚（丐帮50级任务）
-- by：Dan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(3) == 1 then
		allbrother_0801_FindNpcTaskDialog(3)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld75 = GetTask(75)
	U75_sub5 = GetTask(56)
	if (UTask_gb == 50*256+20) and (HaveItem(139) == 0) then		--带着50级任务
		Talk(5,"L50_Step1","张大人，我们又见面了","上次多亏贵帮仗义相助，不知这次有什么需要我帮忙的?","帮主派我来送《中原地形图》给皇上，可是没有通行令牌，根本进不了皇宫","别着急，我这里有令牌，你拿去用吧","多谢张大人!")
	elseif (UTask_gb == 50*256+30) then
		Talk(5,"L50_Step2","张大人，这是通行令牌，完璧归赵!","怎么样？见到皇上了吗?","皇上没见到，不过见到了一个曹公公，他是皇上的亲信，我把图交给了他!","哎呀！大事不好！你有所不知，这个曹公公素来和金国暗中交好，只是仗着皇上宠信，所以无人奈何得了他，如今山河社稷图落在了他的手上，岂不是糟糕","没想到进了皇宫反而被骗，张大人别急，我这就去把图夺回来!")
	elseif (UTask_gb == 50*256+50) then		--此处不再检测两样物品是否存在，个人觉得不是很有意义，而且也省了不少工作量
		Talk(3,"L50_Step3","我已经把《中原地形图》夺了回来，此图还是交给张大人，由张大人在上朝时呈给皇上吧","也好！你这次可是为朝廷办了一件大好事啊","身为宋人，理应如此，在下告辞! ")
	elseif (UTask_gb >= 50*256+20) and (UTask_gb < 50*256+40) and (HaveItem(139) == 0) then
		AddEventItem(139)
		Msg2Player("得到进入皇宫令牌")
		Talk(1,"","通行令牌丢失了？不要紧，我还有一块. ")
	elseif (Uworld75 == 10) and (U75_sub5 < 10) then		-- 拳倾天下任务中，接取子任务
		if (HaveItem(384) == 1) then
			SetTask(56,10)
			AddNote("接子任务: 帮张浚找到5口银矿")
			Msg2Player("接子任务: 帮张浚找到5口银矿")
			Talk(1,"","我也不想难为他. 到时我一定造一件新的甲衣给他. 你还是去帮我找5口银两矿")
		else
		 	Talk(1,"","光是用嘴说可信吗?我为什么要信你？")
		end
	elseif (Uworld75 == 10) and (U75_sub5 == 10) then		-- 子任务完成判断
		if (GetItemCount(118) >= 5) then
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			SetTask(56,20)
			AddNote("找到5口银矿: 已完成任务")
			Msg2Player("找到5口银矿: 已完成任务")
			Talk(1,"","小朋友做事真有能力！加油加油！")
		else
			Talk(1,"","好像矿石还不够，加油加油!")
		end
	else
		Talk(1,"","张俊：好不容易有了机会施展手脚，可是却处处挚肘。唉！")
	end
end;

function L50_Step1()
	AddEventItem(139)
	AddNote("又得到进入皇宫的令牌")
	Msg2Player("又得到进入皇宫的令牌")
end

function L50_Step2()
	DelItem(139)
	SetTask(8,50*256+40)
	AddNote("立即去拿中原地图")
	Msg2Player("立即去拿中原地图")
end

function L50_Step3()
	SetTask(8,50*256+60)
	DelItem(199)
	AddNote("已把中原地图交给张俊! ")
	Msg2Player("已把中原地图交给张俊! ")
end
