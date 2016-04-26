--西南北区 唐门 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("唐缺：这些兵刃都是本门暗器房和火器房打造的，在别处可不多见啊。", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","门主有令，本门兵器不得卖给外人!")
	end
end;

function yes()
Sale(54)
end;

function no()
end;
