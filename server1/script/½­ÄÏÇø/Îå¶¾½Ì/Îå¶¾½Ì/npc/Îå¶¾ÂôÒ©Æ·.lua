--五毒教 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("虽然本派功夫以毒为主，但是妙手回春的好药也有不少，想要试试看吗", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","教主有令: 你的药不能卖给外人")
	end
end;

function yes()
Sale(80)
end;

function no()
end;
