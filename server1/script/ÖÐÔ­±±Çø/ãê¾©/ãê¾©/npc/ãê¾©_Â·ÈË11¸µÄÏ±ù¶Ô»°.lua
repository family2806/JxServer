-------------------------------------------------------------------------
-- FileName		:	汴京_路人11傅南冰对话.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 15:22:45
-- Desc			:	中原北区 汴京府 路人11傅南冰对话
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")

function main(sel)
	Uworld75 = nt_getTask(75)
	U75_sub4 = nt_getTask(55)
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 ~= 0 ) then
		funanbing()
	elseif (Uworld75 == 10) and (U75_sub4 < 10) then		-- 任务中，接取子任务
		if (HaveItem(384) == 1) then
			nt_setTask(55,10)
			AddNote("任务：去扬州买金陵春给傅南冰.")
			Msg2Player("任务：去扬州买金陵春给傅南冰.")
			Talk(1,""," 现在学武功来做什么？想学也行，去扬州给我买金陵春?.")
		else
		 	Talk(1,""," 连一封信也没有，只是口说无凭，我怎么相信你?")
		end
	elseif (Uworld75 == 10) and (U75_sub4 == 10) then		-- 子任务完成判断
		if (HaveItem(77) == 1) then
			DelItem(77)
			nt_setTask(55,20)
			AddNote("任务：完成买酒任务")
			Msg2Player("任务：完成买酒任务")
			Talk(1,"","哈哈，酒，金陵春真是好酒。行，我同意! ")
		else
			Talk(1,"","金陵春还没买回来吗?")
		end
	else
		Talk(1,"","傅南冰：今朝有酒今朝醉，管他谁做天子谁称臣！")
	end
end;
