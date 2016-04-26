--description: 峨嵋派妙隐 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
--	player_Faction = GetFaction()
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 10*256) and (GetLevel() >= 10) then		--10级任务启动
			Talk(5,"L10_talk2", "佛祖，弟子有罪，请佛祖责罚弟子，不要去降罪于他....", "师姐，看你面带愁容，有什么事吗?", "说来话长--我出家为尼之前，原本有一个幸福美满的家庭，不料宋金打仗，我相公被当作壮丁拉到了前线，一去数年，了无音讯。", "后来听说他死在了沙场上，我伤心欲绝，削发为尼，原打算就此度过残生，谁曾想到，我相公他竟没有死!", "他回来后苦苦哀求我还俗，可是我曾发誓此生皈依佛门，怎能因为贪恋红尘而违背在佛祖面前许下的誓言？我、我真是有罪! ")
		elseif (UTask_em == 10*256+20) and (HaveItem(18) == 0) then			-- 铜镜丢了
			AddEventItem(18)
			Talk(1,"","哎呀，这个小鬼，半面铜镜还没拿就跑了!")
			Msg2Player("获得半面铜镜. ")
		elseif ((UTask_em == 10*256+60) and (HaveItem(20) == 1)) then					--得到修复好的完整铜镜
			Talk(2, "", "妙隐师姐，瞧，铜镜已经修好了！破镜都能重圆，更何况相爱的人呢？如果佛祖知道你们的真情，一定不会怪你的!", "谢谢你，师妹！请你帮我把这个修补好的铜镜交给相公，如果他愿意等我三年，三年后，我一定回到他的身边，但是在这三年里，我要潜心修行，以祈求佛祖的谅解")
			SetTask(1,10*256+70)
			AddNote("回峨眉接妙隐的任务，带铜镜给她的相公. ")
			Msg2Player("回峨眉接妙隐的任务，带铜镜给她的相公. ")
		elseif ((UTask_em == 10*256+70) and (HaveItem(20) == 0)) then		-- 任务中，铜镜“又”丢了
			AddEventItem(20)
			Talk(1,"","妙隐：小鬼，忘记带铜镜了!")
		elseif (UTask_em == 10*256+80) then
			Talk(2,"L10_prise","铜镜已交给你相公了，大哥说永远等你回来", "师妹，我真不知该怎么谢你!")
		else   					--已经完成10级任务（缺省对话）
			Talk(1,"","师妹，我真不知该怎么谢你!")
		end
	elseif (UTask_em >= 70*256) then								--已经出师
		Talk(1,"","师妹，你就要下山了吗？多多保重.")
	else
		Talk(1,"","弟子有罪，请佛祖责罚弟子，不要去降罪于他....")
	end
end;

function L10_talk2()
	Talk(3,"L10_get","师姐，不用怪自己，要怪就怪人生无常，.", "如果我不还俗，他也不会离开峨眉。他说每天都会在山下等我，希望我回心转意。我该怎么办？我心如乱麻", "师姐，你的心事到底是怎么了？你还爱他吗?")
end;

function L10_get()
	Say("如果此生缘分就这样了，我怎么敢勉强，那年他从军，把铜镜一分为二，作为信物，以便日后相见，难道破镜能圆吗?", 2, "让我看看. /L10_get_yes", "没有办法/L10_get_no")
end;

function L10_get_yes()
	Talk(1, "select1", "破镜未必不能重圆，师姐，你把那<color=Red>半面铜镜<color>给我，我到<color=Red>成都<color>找<color=Red>铁匠<color>试试，看看有什么办法!")
end;

function select1()
	Talk(1,"","真能行吗？好吧，<color=Red>另半面铜镜<color>在我<color=Red>相公<color>那儿，他就在<color=Red>山脚下的树林<color>里.")
	AddEventItem(18)
	Msg2Player("接峨眉妙隐任务，获得半面铜镜. ")
	SetTask(1,10*256+20)
	AddNote("见在正殿的尼姑妙隐(273, 311) , 接 <color=Red>铜镜任务<color>. 获得半面铜镜. ")
end;

function L10_get_no()
end;

function L10_prise()
	SetRank(14)
	SetTask(1,20*256)
--	AddMagic(77)
--	AddMagic(79)
	add_em(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你升为舞衣尼，学到峨眉剑法. ")
	AddNote("回峨眉派，复命妙隐，完成铜镜任务. ")
end;
