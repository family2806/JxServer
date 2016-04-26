--西南北区 唐门 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("唐轻：本门弟子身法轻灵，不仅因为所习的乃是独门绝学，还得益于这些轻便的装备——", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","门主有令，本门装备只卖给同门!")
	end
end;

function yes()
Sale(55)
end;

function no()
end;
