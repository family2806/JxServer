--昆仑派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("仙丹圣药，道教正统仙丹这里都有", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令：药品只能卖给同门.")
	end
end;

function yes()
Sale(77)
end;

function no()
end;
