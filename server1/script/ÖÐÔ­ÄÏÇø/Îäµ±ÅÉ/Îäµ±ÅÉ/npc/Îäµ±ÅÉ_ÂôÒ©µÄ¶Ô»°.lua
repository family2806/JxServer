--中原南区 武当派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("明月：这些药丸都是用武当山上土生土长的草药制成的，既能止血疗伤，又能强身健体。", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令，道具只卖给本帮.")
	end
end;

function yes()
Sale(65);  			
end;

function no()
end;






