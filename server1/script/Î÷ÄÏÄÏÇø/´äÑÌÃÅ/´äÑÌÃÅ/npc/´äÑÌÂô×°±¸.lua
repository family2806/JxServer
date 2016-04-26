--翠烟门 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("想看各姐妹缝衣服吗？外面买不到的.", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","门主有令，本门装备只卖给同门.")
	end
end;

function yes()
Sale(67)
end;

function no()
end;
