--西南北区 唐门 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say(" 唐毒：本门绝春叟的医术可谓独步天下，他研制的这些药丸，嘿嘿，说是活死人肉白骨也不为过啊！", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","门主有令，本门药品不能卖给外人!")
	end
end;

function yes()
Sale(56)
end;

function no()
end;
