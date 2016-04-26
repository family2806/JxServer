--中原北区 天忍教 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("禹狄：这些都是宫里的宫女们亲手缝制的，瞧瞧，手工多精细——", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","教主有令，本教装备只能卖给忠诚弟子.")
	end
end;

function yes()
Sale(61)
end;

function no()
end;
