--五毒教 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("我们不要太重视这个，最好的装备正是使用灵活.", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","教主有令: 门派的装备不能卖给外人")
	end
end;

function yes()
	Sale(79)
end;

function no()
end;
