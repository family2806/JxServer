--西南北区 峨嵋派 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("妙灵：本派弟子都是弱质女流，因此所使的兵刃大都轻便灵巧。", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令：门派兵器只卖给同门姐妹!")
	end
end;

function yes()
Sale(51)
end;

function no()
end;
