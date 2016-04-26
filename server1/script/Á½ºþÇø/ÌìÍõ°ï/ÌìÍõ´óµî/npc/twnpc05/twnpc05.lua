--description: 天王帮天护法路云远 天王帮40级任务
--author: yuanlan	
--date: 2003/4/26
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
--Dan_Deng(2003-07-25), 加入重返门派任务
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)重新设计重返门派与镇派绝学相关（取消与此脚本相关部份）

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 40*256) and (GetLevel() >= 40) then
			Talk(2, "L40_get", "路老护法，看您老人家愁闷不展，有什么为难的事吗?", "我属下弟子吴刚适才在湖边不小心被一种剧毒无比的赤链蛇咬伤，生命危在旦夕，我已经用内力为他驱毒，但是毒气攻心，不能尽除，听说只有<color=Red>巴陵县<color>的<color=Red>吴神医<color>能够医治....")
		elseif (UTask_tw == 40*256+50) and (HaveItem(93) == 1) and (HaveItem(94) == 1) then
			L40_prise()
		elseif (UTask_tw > 40*256+20) and (UTask_tw < 50*256) then					--已经接到40级任务，尚未完成
			Talk(1,"","求到解药了吗?")
		elseif (UTask_tw >= 50*256) then					--已经完成40级任务，尚未出师
			Talk(1,"","你这孩子不仅武功不错，心地也蛮好的，老头子我很喜欢!")
		else										--尚未接40级任务
			Talk(1,"","现今是长江后浪推前浪，我们这些老头子都不顶用罗!")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk(1,"","时世造英雄，如今天下群雄并起，人才济济，望你好自为之，将来成就一番惊天动地的作为")
	else
		Talk(1,"","本帮南抗宋朝，北抗金兵。帮主一个女人带我们发展的这么好真的是不容易!")
	end
end;

function L40_get()
	Say("你可以到巴陵县找<color=Red>吴神医<color>求解药吗?", 2, "属下愿意/L40_get_yes", "属下有别的事情/L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","好，你快去快回")
	SetTask(3, 40*256+20)
	SetTask(14,0)
	AddNote("在天王大殿见到路云远接受<color=red>找解药任务<color>, 到巴陵县找吴神医求药. ")
	Msg2Player("在天王大殿见到路云远接受找解药任务, 到巴陵县找吴神医求药. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","太好了，有这些要吴刚就有救了。都不知道要怎么感谢您!")
	DelItem(93)
	DelItem(94)
	SetRank(47)
	SetTask(3, 50*256)
--	AddMagic(40)
	add_tw(50)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("把两味药交给路云远，完成任务，被封为水道统领，学会乱还击")
	AddNote("把两味药交给路云远，完成任务，被封为水道统领")
end;
