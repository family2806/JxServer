--中原北区 天忍教 卖兵器的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("塔里罕：这些武器都是大金国最好的工匠打造的，绝对一流。", 2, "交易/yes", "不交易/no");
	else
		Talk(1,"","教主有令，本教武器只能卖给忠诚弟子.")
	end
end;

function yes()
Sale(60)
end;

function no()
end;
