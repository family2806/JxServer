-- 江南区 桃花岛 天王 路人_谢保义.lua
-- by: Dan_deng(2004-05-15)
-- 为天王弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 3) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","谢保义：小兄弟，你练的好象不是很好啊。来来，我帮你顺顺功夫。")
--	elseif (Uworld137 == 23) then		-- 已经更新过技能
--		Talk(1,"","谢保义：你在这里多呆一段时间，对你的修为大有好处。")
--	else										-- 非天王的
		Talk(1,"","什么国仇什么家恨，几百年后仍只是梦!")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(3)
	if (GetTask(121) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(42) >= 0) then		-- 有镇派绝学技能
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
	add_tw(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,23)
	Talk(1,"UpdateSkill","好极了!你专心练功, 一定会很深厚的! ")
end
