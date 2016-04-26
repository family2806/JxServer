--少林派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("虽然说本派武功能强身健体，但是也有生病的时候，所以，需要有各种药品.", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令，本派药品只卖给同门")
	end
end;

function yes()
Sale(71)
end;

function no()
end;
