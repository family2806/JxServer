--五毒教 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("本派原本不用生命力取胜，因为当知道运用这种武器就绝世无双", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","教主有令:门派的兵器不能卖给外人")
	end
end;

function yes()
	Sale(78)
end;

function no()
end;
