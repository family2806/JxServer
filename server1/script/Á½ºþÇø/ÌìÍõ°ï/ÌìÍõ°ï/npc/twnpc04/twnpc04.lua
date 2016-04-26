--description: 天王帮左使古柏　天王30级任务
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if ((UTask_tw == 30*256) and (GetLevel() >= 30) and (GetFaction() == "tianwang")) then
			Say("说起来真是倒霉，我前些日子去了一趟<color=Red>燕子洞<color>,结果不小心把<color=Red>天王令<color>. 给弄丢了，天王令是本帮信物，如果落到居心叵测的人手上，后果不堪设想!..", 2, "帮助寻找天王令/L30_get_yes", "不关我事!/L30_get_no")
		elseif (UTask_tw == 30*256+20) and (HaveItem(145) == 1 ) then
			L30_prise()
		elseif (UTask_tw > 30*256) and (UTask_tw < 40*256) then					--已经接到30级任务，尚未完成
			Talk(1,"","<color=Red>天王令<color>是在<color=Red>苗岭燕子洞<color>丢失的，如果你能帮我找回来，我保举你做掌舵头领.")
		elseif (UTask_tw >= 40*256) then					--已经完成30级任务，尚未出师
			Talk(1,"","好兄弟！你帮了我一个大忙!")
		else
			Talk(1,"","我们北抗金兵，南防宋朝，两边作战都不容易")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk(1,"","出师之后不要忘记常回师门看看兄弟们")
	else
		Talk(1,"","别看帮主是个女流之辈，可是治理本帮恩威并施、赏罚分明，大家心中都挺敬畏她的.")
	end
end;

function L30_get_yes()
	Talk(1,"","<color=Red>天王令<color>是在<color=Red>苗岭燕子洞<color>丢失的，如果你能帮我找回来，我保举你做掌舵头领.")
	SetTask(3, 30*256+20)
	AddNote("在西天殿门接<color=red>天王令任务<color>, 到燕子洞找天王令")
	Msg2Player("在西天殿门接天王令任务, 到燕子洞找天王令")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","其实天王令在翠烟洞被强盗弄丢了，幸运的是又找找回来了，不然的话会被帮主责怪的，你真是帮了我一个大忙。本使说话算话，一定封你做掌舵首领.")
	DelItem(145)
	SetRank(46)
	SetTask(3, 40*256)
--	AddMagic(37)
--	AddMagic(35)
--	AddMagic(31)
	add_tw(40)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("把天王令交给古柏，完成天王令任务。被封为：掌舵首领。学会八方斩，阳关三叠，行云诀. ")
	AddNote("回来天王岛把天王令交给古柏，完成任务，被封为：掌舵首领")
end;
