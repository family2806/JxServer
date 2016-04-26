--丐帮 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("这里所有的药品都是丐帮兄弟做的", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","帮主有令：本门所有的药品不能卖给外人")
	end
end;

function yes()
	Sale(74)
end;

function no()
end;
