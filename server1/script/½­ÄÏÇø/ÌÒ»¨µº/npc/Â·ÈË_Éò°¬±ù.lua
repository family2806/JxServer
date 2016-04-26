-- 江南区 桃花岛 翠烟 路人_沈艾冰.lua
-- by: Dan_deng(2004-05-15)
-- 为翠烟弟子及其出师弟子更新技能

Include("\\script\\global\\skills_table.lua")

function main()
--	Uworld137 = GetTask(137)
--	if (Uworld137 == 6) then			-- 允许更新技能
--		del_all_skill()
--		Talk(1,"skills_update","沈艾冰：妹妹，世间好男儿何处可寻唉，罢罢罢。翠烟门的姐妹们，可不能让旁人们看了笑话，妹妹在外行走了这么久，不知本门功夫是否有些进步，让姐姐帮你探一探。")
--	elseif (Uworld137 == 26) then		-- 已经更新过技能
--		Talk(1,"","沈艾冰：妹妹功夫已炉火纯青，无需姐姐指点了，也希望你能找到自己的好归宿。")
--	else										-- 非天王的
		Talk(1,"","云飘纱；桃花岛月光梦袄；桃花岛，头头桃色，小桃红消")
--	end
end

function skills_update()			-- 先根据任务等级删除、重新加入技能，然后补回技能点
	UTask = GetTask(6)
	if (GetTask(126) == 255) then		-- 学会了90级技能
		the_lvl = 90
	elseif (HaveMagic(111) >= 0) then		-- 有镇派绝学技能
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
	add_cy(the_lvl)			-- 加回应学会的技能
	-- 自身技能点总数 = (等级-1) + 加技能任务 + 加技能道具 - 现有未分配点数				（回体技能？）
	MagicPoint_total = GetLevel() + GetByte(GetTask(86),2) + GetByte(GetTask(80),1) - GetMagicPoint() - 1
	AddMagicPoint(MagicPoint_total)
	SetTask(137,26)
	Talk(1,"UpdateSkill","很多地反你还没有练习对，但也无大碍。只要牢记口诀就会成功。. ")
end
