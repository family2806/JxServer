--昆仑派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("说到天师道袍，本派做出来的当然是天下第一，连武当都想霸占本派的制法", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令：装备只能卖给同门.")
	end
end;

function yes()
Sale(76)
end;

function no()
end;
