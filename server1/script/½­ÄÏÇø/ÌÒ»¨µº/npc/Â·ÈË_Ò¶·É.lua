-- 江南区 桃花岛 昆仑 路人_叶飞.lua
-- by: Dan_deng(2004-05-15)
-- 为昆仑弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 9) then			-- 允许更新技能
--		del_all_skill()
--		Talk(4,"skills_update","叶飞：哎，一边是不可违抗的师命，一边却是日夜牵挂的心上人，我……我该如何是好？","玩家：师兄……","叶飞：师父本令我来寻找奇门秘笈，以牵制掌门，但一想到夕颜的笑，我就觉得两下为难。","叶飞：唉，或许跟你说得太多了，再晚回去，师父定会责罚。这些是师父教给我的心法，或许与掌门所授有所不同，你可以看看，过后请自行销毁。")
--	elseif (Uworld137 == 29) then		-- 已经更新过技能
--		Talk(1,"","叶飞：你先回去吧，我自有主张。")
--	else										-- 非天王的
		Talk(1,"","就这样吧,先回去休息吧,我自有办法!")
--	end
end

function skills_flush()			-- 刷新技能
	UTask = GetTask(9)
	if (GetTask(130) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(182) >= 0) then		-- 有镇派绝学技能
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
	add_kl(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数 （“回体术”现在没开，以后再加）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,29)
	Talk(1,"UpdateSkill","就这样吧,先回去休息吧,我自有办法!")
end
