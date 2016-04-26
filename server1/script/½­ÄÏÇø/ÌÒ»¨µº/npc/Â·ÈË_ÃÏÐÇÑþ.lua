-- 江南区 桃花岛 五毒 路人_孟星瑶.lua
-- by: Dan_deng(2004-05-15)
-- 为五毒弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 10) then			-- 允许更新技能
--		del_all_skill()
--		Talk(2,"skills_update","玩家：在下并非奉掌门之令而来，听闻师，师……姐在这岛上，特想前来请教。弟子觉得掌门所授武功似乎有不对之处，近日五经六脉之气，常有阻塞，恳请师姐指点。","孟星瑶：哼！师兄这奸人，连徒弟竟也不放过，五毒功夫最要紧的是诓骗二字，虚实委与，诱使对手分心，使毒发于无形之中。你若答应替我办事，我便指点你功夫。","玩家：弟子愿听差遣。")
--	elseif (Uworld137 == 30) then		-- 已经更新过技能
--		Talk(1,"","孟星瑶：武功我已经指点你了，希望你手脚利落些，早日事成。")
--	else										-- 非天王的
		Talk(1,"","我孟星瑶从不沉迷于王主之位。我师兄何必让人查这样查我呢. ")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(2)
	if (GetTask(124) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(75) >= 0) then		-- 有镇派绝学技能
		the_lvl = 70
	elseif (UTask >= 60*256) then		-- 已完成50级任务
		the_lvl = 60
	elseif (UTask >= 50*256) then		-- 已完成40级任务
		the_lvl = 50
	elseif (UTask >= 40*256) then		-- 已完成30级任务
		the_lvl = 40
	elseif (UTask >= 30*256) then		-- 已完成20级任务
		the_lvl = 30
	elseif (UTask >= 20*256) then		-- 已完成10级任务
		the_lvl = 20
	elseif (UTask >= 10*256) then		-- 已入门
		the_lvl = 10
	end
	add_wu(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,30)
	Talk(1,"UpdateSkill","我已经把武功都传给你了！加油练习！")
end
