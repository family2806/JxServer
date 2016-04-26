--两湖区 天王帮 卖装备的帮众对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("天王帮众：本帮兄弟们整日东奔西跑的，总不能没有一两套好装备吧？", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","帮主有令：本帮兵器只卖给同门兄弟")
	end
end;

function yes()
Sale(58);  			
end;

function no()
end;






