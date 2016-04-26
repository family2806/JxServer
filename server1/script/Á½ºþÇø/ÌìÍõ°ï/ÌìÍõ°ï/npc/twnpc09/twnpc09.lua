--description: 天王帮地护法夏诚　天王50级任务
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 50*256) and (GetLevel() >= 50) then
			Say("最近水寨里盛传洞庭湖出现<color=Red>水怪<color>，害死了附近许多渔民，搞得人心惶惶，你愿意去调查一下这件事吗？", 2, "愿意/L50_get_yes", "请另派其他人/L50_get_no")
		elseif (UTask_tw == 50*256+20) and (HaveItem(95) == 1) then
			L50_prise()
		elseif (UTask_tw > 50*256) and (UTask_tw < 60*256) then					--已经接到50级任务，尚未完成
			Talk(1,"","有好几个人看见<color=Red>水怪<color>曾在<color=Red>东边<color>的湖面出没过，东边码头附近有个<color=Red>通往洞庭湖底的山洞<color>，我怀疑洞中有古怪!")
		else					--已经完成50级任务，尚未出师（缺省对话）
			Talk(1,"","如今天下局势纷乱，但愿天佑本帮")
		end
	elseif (UTask_tw >= 70*256) then							--已经出师
		Talk("一日为兄弟，终生是手足，你要多保重")
	else
		Talk(1,"","近来湖面上常泛出五彩奇芒，不知是凶是吉")
	end
end;

function L50_get_yes()
	Talk(1,"","有好几个人看见<color=Red>水怪<color>曾在<color=Red>东边<color>的湖面出没过，东边码头附近有个<color=Red>通往洞庭湖底的山洞<color>，我怀疑洞中有古怪!")
	SetTask(3, 50*256+20)
	AddNote("到号令台东边见夏诚，领<color=Red>水怪任务<color>, 到洞庭湖下面去看看虚实吧. ")
	Msg2Player("到号令台东边见夏诚，领水怪任务，到洞庭湖下面去看看虚实吧")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","这块五彩石不仅可以安定人心，还可以为本帮带来福祉。真是天佑本帮啊!")
	DelItem(95)
	SetTask(3, 60*256)
	SetRank(48)
--	AddMagic(42)
	add_tw(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("完成水怪任务，成为护教将军，学会武功金钟罩. ")
	AddNote("回到天王帮，把五彩石交给夏诚完成任务，成为护教将军. ")
end;
