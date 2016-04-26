--丐帮 卖装备的弟子对话

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("作为丐帮弟子，需要苦练，维护正义", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","帮主有令：本门所有装备不能卖给外人")
	end
end;

function yes()
Sale(73)
end;

function no()
end;
