-- 五毒 路人NPC 墨蛛寨主桑珠 10级任务
-- by：Dan_Deng(2003-08-05)

-- 修改后与邪教主线相关的桑珠脚本
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- 新任务系统与邪教主线相关的脚本 --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

		
	if (myTaskValue==150) then
		task_level30_14();
		return
	end


-- 新任务系统与邪教主线相关的脚本 --


	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 10*256+10) then		--10级任务进行中
			i = GetItemCount(86)
			if (i >= 10) and (HaveItem(220) == 1) then
				Talk(1,"L10_prise","桑寨主，这是你要的蜘蛛和砒霜")
			else
				Talk(1,"","毒物还不够，怎么这么慢，快点!")
			end
		elseif ((UTask_wu == 10*256) and (GetLevel() >= 10)) then		--10级任务
			Say("老身练功材料不足了，你到雁荡山上给我抓十只蜘蛛，再去买10包砒霜来",2,"遵命!/L10_get_yes","在下还有事在身!/L10_get_no")
		else							-- 常规对话
			Talk(1,"","他 抓走我儿子的情景还历历在目。让我抓到他我要抽了他的骨，之后用他的身体来练蜘蛛毒。我要让他痛苦，求生不能，求死不得!")
		end
	else
		Talk(1,"","不知我儿子现在怎么样了，是否平安无事。")
	end

end;

function L10_get_yes()
	Talk(1, "", "快去快回！我等着要!")
	SetTask(10,10*256+10)
	AddNote("帮助桑珠找到10只蜘蛛和100包砒霜.")
	Msg2Player("帮助桑珠找到10只蜘蛛和100包砒霜.")
end;

function L10_get_no()
	Talk(1,"","真是的! 真是不可信!")
end;

function L10_prise()
	Talk(1,"","很好! 你快出去!不要妨碍我练功!")
	DelItem(220)
	for i = 1, GetItemCount(86) do DelItem(86) end
	SetTask(10,20*256)
	SetRank(50)
--	AddMagic(62)
--	AddMagic(60)
--	AddMagic(67)
	add_wu(20)			-- 调用skills_table.lua中的函数，参数为学到多少级技能。
	Msg2Player("恭喜你! 你晋升为夺魂散人! 学得武功：五毒刀法、五毒棒法、五毒掌法、九天贯雷.")
	AddNote("帮助桑珠找到蜘蛛和砒霜.被封为夺魂散人。")
end;
