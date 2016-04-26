-- 江南区 桃花岛 少林 路人_空惠.lua
-- by: Dan_deng(2004-05-15)
-- 为少林弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 7) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","空惠：老衲此番下山，意欲寻找救世之法，在此相遇也是机缘巧合。")
--	elseif (Uworld137 == 27) then		-- 已经更新过技能
--		Talk(1,"","空惠：贪痴嗔怒，枉斋破戒。今后行事，勿要忘记门规戒律，谨记掌门教诲。")
--	else										-- 非天王的
		Talk(1,"","善哉!这就是劫数，都是天命, 苦难只是其中的一劫而已. ")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(7)
	if (GetTask(122) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(21) >= 0) then		-- 有镇派绝学技能
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
	add_sl(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,27)
	Talk(1,"UpdateSkill","如果虚心时时都怀念人心，因为行善之人就不必为老衲费心血了. ")
end
