-- 江南区 桃花岛 峨嵋 路人_静慈.lua
-- by: Dan_deng(2004-05-15)
-- 为峨嵋弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 1) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","静慈：师侄远道而来，若觉得拳脚功夫上有何不明之处，大可询问。")
--	elseif (Uworld137 == 21) then		-- 已经更新过技能
--		Talk(1,"","静慈：虽有几处修习不对，倒也不是什么大碍，照刚才口诀所言，勤加修习即可。师侄独身在外，万事皆要小心。")
--	else										-- 非天王的
		Talk(1,"","不知道20年前的那场打乱现在还有谁记得? ")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(1)
	if (GetTask(125) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(252) >= 0) then		-- 有镇派绝学技能
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
	add_em(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,21)
	Talk(1,"UpdateSkill","你练的有些地方还不对，但是也没有什么大碍. 只要牢记这些口诀就可以成功. ")
end
