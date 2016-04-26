--description: 天忍教火堂堂主
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4);
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 10*256) and (GetLevel() >= 10) then
			Say("本教第二层的<color=Red>七杀洞<color>里关押了<color=Red>七个死囚<color>，他们都是本教的叛徒，如果你能够打败这七个家伙，得到<color=Red>七块七杀令牌的碎片<color>，就可以晋级为本教的无影杀手，你有没有胆量去闯七杀洞啊？", 2, "闯七杀洞 /L10_get_yes", "暂时不闯/L10_get_no")
--		elseif (UTask_tr == 10*256+50) and (HaveItem(51) == 1) and  HaveItem(52) == 1 and HaveItem(53) == 1 and HaveItem(54) == 1 and HaveItem(55) == 1 and HaveItem(56) == 1 and (HaveItem(57) == 1) then
		elseif (UTask_tr == 10*256+50) then		-- 修改任务完成条件（2003-09-27）
			i = check_token()
			if (i >= 3) then
				Talk(1,"L10_prise","很好，进七杀洞下够人数才能出来，反之，你有什么事就自己处理")
			else
				Talk(1,"","怎么样，一个小小的考验也做不好吗?")
			end
		elseif (UTask_tr < 20*256) then								--尚未接10级任务
			Talk(1,"","不要以为加入本教就安稳了，本教不收富裕的人!")
		else
			Talk(1,"","你刚刚加入弟子，强中自有强中手，你要小心!")
		end
	else
		Talk(1,"","只有强者才能生存下来，强者胜弱者，未练好的人将被他人消灭，都是自己的选择，不要怪他人.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>七杀令牌<color> 一起有七块，分在<color=Red>7名死囚身上 color>, 你只用拿到3块就行.")
	SetTask(4, 10*256+50)
	AddNote("接七杀洞任务：进入七杀洞拿到3块七杀令牌七杀令牌. ")
	Msg2Player("接七杀洞任务：进入七杀洞拿到3块七杀令牌七杀令牌. ")
end;

function L10_get_no()
	Talk(1,"","做好了来见我!")
end;

function L10_prise()
	SetTask(4, 20*256)
	SetRank(56)
--	AddMagic(132)
--	AddMagic(131)
--	AddMagic(136)
	add_tr(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("你被封为无影杀手，学到天忍矛法，天忍刀法，火防莲花. ")
	AddNote("把七杀令牌带给堂主，完成七杀洞任务，升级为无影杀手")
end;

function check_token()
	i = 0
	if (HaveItem(51) == 1) then
		i = i + 1
		DelItem(51)
	end
	if (HaveItem(52) == 1) then
		i = i + 1
		DelItem(52)
	end
	if (HaveItem(53) == 1) then
		i = i + 1
		DelItem(53)
	end
	if (HaveItem(54) == 1) then
		i = i + 1
		DelItem(54)
	end
	if (HaveItem(55) == 1) then
		i = i + 1
		DelItem(55)
	end
	if (HaveItem(56) == 1) then
		i = i + 1
		DelItem(56)
	end
	if (HaveItem(57) == 1) then
		i = i + 1
		DelItem(57)
	end
	return i
end;
