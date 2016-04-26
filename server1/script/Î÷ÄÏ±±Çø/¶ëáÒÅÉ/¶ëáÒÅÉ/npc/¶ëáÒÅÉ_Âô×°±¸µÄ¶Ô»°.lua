--西南北区 峨嵋派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("妙心：这些衣裙鞋帽可都是本派的姊妹们一针一线亲手缝制而成的，精细得很哪——", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令：门派装备只卖给同门姐妹!")
	end
end;

function yes()
Sale(52)
end;

function no()
end;
