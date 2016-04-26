-- 翠烟门 翠烟门弟子2 入门任务
-- by：Dan_Deng(2003-07-25)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--入门任务
		if (HaveItem(106) == 1) then
			enroll_prise()
		else
			Say("没有 <color=Red>情花<color>, 不能过花魁阵。姐姐真的想过阵?",2,"这次我没有准备好/U36_uncompleted","我继续闯阵/no")
		end
	elseif (GetFaction() == "cuiyan") then			-- 本门弟子
		Say("师妹在花魁阵练功?想离开花魁阵吗？",2,"好，多谢姐姐/U36_leave","不需要，我还要继续练功/no")
	elseif (UTask_cy == 70*256) then			-- 已出师
		Talk(1,"","原来是师姐，好久不见!")
	else
		Talk(1,"","欢迎来翠烟门.")
	end
end;

function enroll_prise()
	Talk(1,"U36_leave","恭喜你已经闯过本派挑战，现在我们是好师妹了! ")
	DelItem(106)			-- 情花
	i = ReturnRepute(20,29,5)		-- 缺省声望，最大无损耗等级，每级递减
	AddRepute(i)
	Uworld36 = SetByte(GetTask(36),2,127)
	SetTask(36,Uworld36)
	AddNote("完成花魁阵任务，成为<color=Red>记名弟子 color> ")
	Msg2Player("完成花魁阵任务，成为记名弟子 ")
end;

function U36_uncompleted()
	Talk(1,"U36_leave","欢迎师妹在任何时间来闯阵!")
end

function U36_leave()
--	SetPos(304,1498)
	SetPos(340,1456)
end

function no()
end
