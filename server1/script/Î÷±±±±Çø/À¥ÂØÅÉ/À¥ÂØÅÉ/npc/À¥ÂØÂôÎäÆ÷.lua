--昆仑派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("本派弟子注重修炼符咒道法，对兵器武功不是很精通", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令：兵器只能卖给同门.")
	end
end;

function yes()
	Sale(75)
end;

function no()
end;
