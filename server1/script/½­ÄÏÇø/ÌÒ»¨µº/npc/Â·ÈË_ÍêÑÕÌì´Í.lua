-- 江南区 桃花岛 天忍 路人_完颜天赐.lua
-- by: Dan_deng(2004-05-15)
-- 为天忍弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 4) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","完颜天赐：哼，看见岛上那个臭叫化了没？若不是这小子一路追杀，想我堂堂金国四王子，怎么会沦落到流落荒岛的地步！你小子过来，我现在指点你几手，放机伶些，一有什么消息就马上回去报告！")
--	elseif (Uworld137 == 24) then		-- 已经更新过技能
--		Talk(1,"","完颜天赐：你小子识相点，功夫也学了，还不快滚回去办事！")
--	else										-- 非天王的
		Talk(1,"","哼！那个臭叫花子。我堂堂金国王子怎么会被他害成这样. ")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(4)
	if (GetTask(127) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(150) >= 0) then		-- 有镇派绝学技能
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
	add_tr(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,24)
	Talk(1,"UpdateSkill","可以了! 就照我吩咐的做！有好消息就快回来告诉我")
end
