-- 江南区 桃花岛 武当 路人_冯君衡.lua
-- by: Dan_deng(2004-05-15)
-- 为武当弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 5) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","冯君衡：道家之法，发乎心止乎心，随念而就。若太拘泥于武功套路，反而难以体会到其中的境界。所谓步罡九宫八卦、二十八宿五星纲，师弟皆不用太过在意。若能掌握到其中的意念所在，则武功大成。就象如此，这般……")
--	elseif (Uworld137 == 25) then		-- 已经更新过技能
--		Talk(1,"","冯君衡：话尽于此，请师弟回去慢慢体会罢。")
--	else										-- 非天王的
		Talk(1,"","我这有点问题,不要打扰我!")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(5)
	if (GetTask(129) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(166) >= 0) then		-- 有镇派绝学技能
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
	add_wd(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,25)
	Talk(1,"UpdateSkill","你先回去休息,我会有办法的!")
end
