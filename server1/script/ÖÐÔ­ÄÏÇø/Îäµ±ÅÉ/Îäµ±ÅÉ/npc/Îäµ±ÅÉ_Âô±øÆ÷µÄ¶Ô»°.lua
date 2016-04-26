--中原南区 武当派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("华衡：本派弟子皆擅长使剑，看看有没有适合你用的宝剑——", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令，道具只卖给本帮.")
	end
end;

function yes()
Sale(63)
end;

function no()
end;
