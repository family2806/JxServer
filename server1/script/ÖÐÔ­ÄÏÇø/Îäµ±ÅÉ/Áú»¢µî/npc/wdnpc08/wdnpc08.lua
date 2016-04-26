--description: 武当派单思南　武当50级任务
--author: yuanlan
--date: 2003/5/16
--Dan_Deng(2003-07-22), 加入门派任务的等级要求
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wd = GetTask(5)
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
		if (UTask_wd == 50*256) and (GetLevel() >= 50) then		-- 50级任务启动
			Say("本派弟子以侠义行走天下，身为武当弟子，理应日行一善。最近在<color=Red>天心洞<color> 出现一群盗匪，为首的叫<color=Red>铁棘<color>.他们专门抢劫来往的商旅", 2, "义不容辞 /L50_get_yes", "恐怕很难接任务/L50_get_no")
		elseif (UTask_wd == 50*256+80) then 			-- 50级任务完成
			Talk(2, "L50_prise", "弟子已将所得的银两要全部捐给襄阳城的穷苦老百姓.", "做得很好，不愧为本派弟子! ")
		elseif (UTask_wd > 50*256) and (UTask_wd < 50*256+50) then					--50级任务第一节，尚未完成
			Talk(1,"","土匪的藏身之处在<color=Red>天心洞<color>, 为首的叫<color=Red>铁棘<color>. 记得带全部<color=Red>银两<color> 捐给穷苦的人<color=Red>襄阳<color>. ")
		elseif (UTask_wd >= 50*256+50) and (UTask_wd < 60*256) then					--50级任务第二节，尚未完成
			AddNote("回到武当山，去龙虎殿找单思南，知道要把盗匪处所得全部银两，都送给襄阳城里最穷的是住在城北的邓家嫂子. ")
			Msg2Player("把盗匪处所得全部银两，都送给襄阳城里最穷的是住在城北的邓家嫂子. ")
			Talk(1,"","听说在 <color=Red>襄阳<color> 最穷的人是<color=Red>邓家嫂子<color>, 你带 <color=Red>全部银两<color> 送给她.")
		else					--已经完成50级任务，尚未出师
			Talk(1,"","我平生喜欢交接有情有义之人，大爷出江湖，行侠仗义.")
		end
	elseif (UTask_wd >= 70) then									--已经出师
		Talk(1,"","人生不用太伤感，天下之大，有我容身之处。希望你保重! ")
	else
		Talk(1,"","天下纷乱，虎狼合群，祸害世间，我是学武之人，怎能袖手旁观，怎能配得上侠义二字。")
	end
end;

function L50_get_yes()
	Talk(1,"","很好，但是，不要忘记把 <color=Red>银两<color> 捐给最穷的百姓<color=Red>襄阳<color>.")
	SetTask(5, 50*256+20)
	AddNote("在龙虎殿见到单思南，接行善任务，去天心伏牛山为民除害. ")
	Msg2Player("在龙虎殿见到单思南，接行善任务，去天心伏牛山为民除害. ")
end;

function L50_get_no()
	Talk(1,"","为民除暴是学武之人的责任，为什么你推辞？")
end;

function L50_prise()
	SetRank(12)
	SetTask(5, 60*256)
--	AddMagic(157)
	add_wd(60)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜，你成为掌经道人，学到坐忘无我. ")
	AddNote("回到武当派龙虎殿，复命单思南，完成日行一善任务，成为掌经道人")
end;
