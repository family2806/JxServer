--冰穴迷宫 冰牢出口 trap
-- by：Dan_Deng(2003-07-31)

function main(sel)
	if (GetTask(9) == 50*256+128) and (HaveItem(10) == 1) then
		Msg2Player("你离开大牢之后关上门")
--		SetPos()
	else
		Msg2Player("你要是拿不到那个狂人的头发就不能出去! ")
	end
end;
