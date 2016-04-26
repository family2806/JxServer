--丐帮 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("本帮打狗棒名扬天下，所有的兵器，这里都有", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","帮主有令：本门兵器不能卖给外人")
	end
end;

function yes()
	Sale(72)
end;

function no()
end;
