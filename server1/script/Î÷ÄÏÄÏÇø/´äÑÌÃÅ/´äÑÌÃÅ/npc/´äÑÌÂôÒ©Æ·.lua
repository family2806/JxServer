--翠烟门 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("装备里的珍贵药品越多，就越有益", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","门主有令，本门药品只卖给同门.")
	end
end;

function yes()
Sale(68)
end;

function no()
end;
