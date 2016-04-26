-- 龙门镇-古阳洞-机关3(世界任务“救小娟”)
-- by：Dan_Deng(2004-03-03)

function main(sel)
	Uworld41 = GetTask(41)
	if (GetByte(Uworld41,1) == 30) and (HaveItem(352) == 1) then		-- 任务中，有“机关钥匙”，人未救出
		if (GetBit(Uworld41,11) == 0) then				-- 机关当前为关闭
			Say("机关现在是关闭的状态，你要把它打开吗？",2,"打开/Turn_On","继续保持关闭/Turn_Off")
		else
			Say("机关现在是打开的状态，你要把它关闭吗？",2,"继续保持打开/Turn_On","关闭/Turn_Off")
		end
	end
end

function Turn_On()
--	Talk(1,"","机关打开了。")
	Msg2Player("机关打开了。")
	Cur_Switchs = SetBit(GetTask(41),11,1)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Turn_Off()
--	Talk(1,"","机关关闭了。")
	Msg2Player("机关关闭了。")
	Cur_Switchs = SetBit(GetTask(41),11,0)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Check_Switch()
	Cur_Switchs = GetByte(GetTask(41),2)
	Set_Switchs = GetByte(GetTask(41),3)
	if (Cur_Switchs == Set_Switchs) then			-- 能够一致，救出小娟
		Uworld41 = SetByte(GetTask(41),1,100)
		SetTask(41,Uworld41)
		DelItem(352)						-- 成功后则删除钥匙
		Talk(1,"","解除机关，你成功地救出了小娟。")
		Msg2Player("你已经解除了机关，救出小娟。")
	else
		Msg2Player("但是你回到黑牢试着推了推门，却依然纹丝不动。")
	end
end
