--description: 天王帮渔妇荷嫂
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(205) == 1 then
		allbrother_0801_FindNpcTaskDialog(205)
		return 0;
	end
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40级任务
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 3) then		-- 子任务启动
			Talk(1,"","我男人出湖捕鱼，这几天就要回家了，他最爱喝银耳莲子汤，不巧家里的莲子都用完了，我现在正忙着洗衣，你能帮我去巴陵县杂货店买些莲子回来吗?")
			SetTask(14, 5)
			AddNote("在天王岛水寨见到渔妇荷嫂帮她到巴陵县杂货店买些莲子回来")
			Msg2Player("在天王岛水寨见到渔妇荷嫂帮她到巴陵县杂货店买些莲子回来")
		elseif (UTask_tw40sub == 5) then
			if (HaveItem(148) == 1) then		-- 子任务完成
				Talk(1,"","谢谢你帮我买回了莲子，这3个鸡蛋送给你")
				DelItem(148)
				AddEventItem(149)
				Msg2Player("得到3个鸡蛋")
				SetTask(14, 7)
				AddNote("把莲子交给荷嫂，得到3个鸡蛋")
			else
				Talk(1,"","在巴陵县百货店有莲子卖")
			end
		elseif (UTask_tw40sub == 7) then
			if (HaveItem(149) == 0) then
				AddEventItem(149)
				Talk(2,"","荷嫂! 我不小心把鸡蛋打碎了了, 嫂子可以再给我几个吗?","看你很担心啊，这里还有3个鸡蛋，送给你!")
			else
				Talk(1,"","银耳莲子汤快做好了，怎么还没有看见他回来啊")
			end
		elseif (UTask_tw40sub == 0) then
			Talk(1,"","谁能够把我的莲子买回来就太好了")
		else
			Talk(1,"","我老公怎么现在还没有回来")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","我男人是个老实人，到现在还只是个副道领，不知什么时候才能出人头地!")
		else
			Talk(1,"","在本帮的众多护法里，路老护法对属下们最宽容，夏护法话最少，王前使为人最耿直，杨右使最精明能干，古左使嘛……做人最圆滑,")
		end
	end
end;
