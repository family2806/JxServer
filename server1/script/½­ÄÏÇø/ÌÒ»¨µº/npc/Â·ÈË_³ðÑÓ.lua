-- 江南区 桃花岛 丐帮 路人_仇延.lua
-- by: Dan_deng(2004-05-15)
-- 为丐帮弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 8) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","仇延：仇延最近得一奇遇，也学了些奇门功夫，看小兄弟根质不错，指点你几招吧。")
--	elseif (Uworld137 == 28) then		-- 已经更新过技能
--		Talk(1,"","仇延：小兄弟根质奇佳，若能勤练必有大成。小兄弟你先行一步，我要在此抓住那个金国奸细，后会有期。")
--	else										-- 非天王的
		Talk(1,"","这个金国奸细, 我一定不会放过他的")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(8)
	if (GetTask(128) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(128) >= 0) then		-- 有镇派绝学技能
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
	add_gb(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,28)
	Talk(1,"UpdateSkill","小兄弟英才出众。如果想在这练功就继续。我会去抓住前面的那个金国奸细。一会见！")
end
