--少林派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("出家人不能铺张，这些衣帽都是由各位师兄弟做的.", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令，本派装备只卖给同门")
	end
end;

function yes()
Sale(70)
end;

function no()
end;
