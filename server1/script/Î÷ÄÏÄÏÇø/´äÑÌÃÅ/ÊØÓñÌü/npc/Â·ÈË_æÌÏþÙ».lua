-- 翠烟门 嫣晓倩 20级任务、40级任务
-- by：Dan_Deng(2003-07-26)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- 任务相关以及门派对话
		if (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--20级任务进行中
			if (GetTimerId() == 8) then
				StopTimer()								--解毒了
				Msg2Player("你中的毒还没解")
				Talk(1,"L20_check","师妹快过来，我帮你解毒.")
			else
				L20_check()
			end
		elseif (UTask_cy == 20*256) and (GetLevel() >= 20) then		--20级任务
			Say("嫣晓倩：本门养了许多金蜂，这些金蜂要吃一种特殊的花蜜－－大曼陀罗花的花蜜。最近花蜜用完了，你能帮我采十株花回来吗? ",2,"可以!/L20_get_yes","弟子工夫还差，恐怕做不到/L20_get_no")
		elseif (UTask_cy == 40*256+30) then							--40级任务完成
			L40_prise()
		elseif ((UTask_cy == 40*256) and (GetLevel() >= 40)) then		--40级任务启动
			Say("听说大理城有一个恶霸，专门强抢民女，不知害死了多少无辜少女，你愿意去除掉这个人间败类吗?",2,"这次我将为民除害 /L40_get_yes","弟子工夫还差，恐怕做不到/L40_get_no")
		elseif (UTask_cy > 40*256) and (UTask_cy < 50*256) then		--40级任务进行中
			Talk(1,"","他有很多手下，师妹要小心!")
		else
			Talk(1,"","男人没有什么好的，师妹要小心，他做的事都不是什么好事.")
		end
	else
		Talk(1,"","男人没有好的! ")
	end
end;

function L20_get_yes()
	Talk(3,"","曼陀罗花开在西北的一个山坡上。你采花的时候要小心，大曼陀罗花有剧毒，因此必须在限定时间内采到花，否则会中毒而死. ","在短时间内摘到10朵花真是麻烦.","所以师妹摘到10朵后要快点回来")
	SetTask(6,20*256+10)
	AddNote("去摘10朵大曼陀罗花，小心花有毒，在短时间内要摘到10朵带回来")
	Msg2Player("去摘10朵大曼陀罗花，小心花有毒，在短时间内要摘到10朵带回来")
end;

function L20_get_no()
end;

function L20_check()
	i = GetItemCount(1)
	for j = 1, i do DelItem(1) end			-- 检查有没有10朵花
	if (i >= 10) then		--如果有10个则完成任务
		Talk(1,"","<#> 嫣晓倩:"..i.."<#> 大曼陀罗花已经够了，师妹真是有本事，可以成为二品花使了")
		SetTask(6,30*256)
		SetRank(33)
--		AddMagic(269)
		add_cy(30)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
		Msg2Player("恭喜你升为翠烟门二品花使，学到冰心倩影武功. ")
		AddNote("摘到10朵大曼陀罗花，完成任务，升为二品花使")
	else
		Talk(2,"","嫣晓倩：但是你还没有采够十朵大曼陀罗花呀，没有一次采够十朵是没有用的.","请师妹再重新跑一趟吧.")
		SetTask(6,20*256+10)
	end
end;

function L40_get_yes()
	Talk(1,"","好，这事就交给你.")
	SetTask(6,40*256+10)
	AddNote("接任务：教训大理城内的恶霸 ")
	Msg2Player("接任务：教训大理城内的恶霸")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(2,"","师姐，我已经救出了所有被恶霸抓走的女孩子，还狠狠地教训了他，他再也不敢为非作歹了!","咱们翠烟门的弟子只要出手，就没有办不成的事，你的本领真是越来越强了，继续努力吧 ")
	SetTask(6,50*256)
	SetRank(77)
--	AddMagic(100)
	add_cy(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你升为翠烟门花神使者，学到护体寒冰. ")
	AddNote("救出了所有被恶霸抓走的女孩子，还狠狠地教训了他，完成40级任务，升为翠烟门花神使者")
end;
