-- 昆仑 弟子 丫环 10级任务
-- by：Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 10*256+10) then		--10级任务进行中
			if (HaveItem(112)==1) and (HaveItem(113)==1) and (HaveItem(114)==1) and (HaveItem(115)==1) and (HaveItem(116)==1) then
				L10_prise()
			else
				Talk(1,"","Thu鑓  頲 h竔  ch璦?")
			end
		elseif ((UTask_kl == 10*256) and (GetLevel() >= 10)) then		--10级任务
			Say("咱们家小姐自幼体弱多病，每天都要喝一碗灵芝百草羹维生，昨儿个药材吃完了，碰巧专职采药的药童又生了重病，这可如何是好?",2,"帮助采药/L10_get_yes","力不从心 /L10_get_no")
		else
			Talk(1,"","小姐体质还这么弱，该怎么办?")
		end
	else
		Talk(1,"","昆仑派最干净的地方就是我家小姐的房间!")
	end
end;

function L10_get_yes()
	Talk(3,"L10_get_talk","姑娘别着急，我会去帮你把药采回来!","真的吗？那可太好了!","不知需要哪些药材?")
end

function L10_get_talk()
	Talk(1,"","需要采的药材有：紫苜蓿、地锦草、茜草、虎耳草和灵芝。这里面最难采的是灵芝，不仅数量十分稀少，而且生长的地方通常有许多灵兽守护，你可要多加小心！我们家药童平时都是去龙门镇东北的药王谷采药，听说哪里的药材挺多的!")
	SetTask(9,10*256+10)
	AddNote("到龙门镇东边的药王谷采紫苜蓿、地锦草、茜草、虎耳草和灵芝5种药. ")
	Msg2Player("到龙门镇东边的药王谷采紫苜蓿、地锦草、茜草、虎耳草和灵芝5种药. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","你真好，我告诉小姐提拔你")
	DelItem(112)
	DelItem(113)
	DelItem(114)
	DelItem(115)
	DelItem(116)
	SetTask(9,20*256)
	SetRank(20)
--	AddMagic(167)
--	AddMagic(168)
--	AddMagic(392)
--	AddMagic(171)
	add_kl(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你！已成为昆仑的奉剑弟子！学会昆仑刀法，昆仑剑法，羁绊符，清风符. ")
	AddNote("采药回来，见到小寒复命，升级成奉剑弟子")
end;
