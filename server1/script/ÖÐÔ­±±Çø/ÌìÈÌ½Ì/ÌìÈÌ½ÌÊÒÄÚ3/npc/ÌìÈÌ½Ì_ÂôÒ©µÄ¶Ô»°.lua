--中原北区 天忍教 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("祁佑：我们大金国的医术可不比宋国逊色，名医不少，好药也很多——", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","教主有令，本教药只能卖给忠诚弟子.")
	end
end;

function yes()
Sale(62)
end;

function no()
end;
