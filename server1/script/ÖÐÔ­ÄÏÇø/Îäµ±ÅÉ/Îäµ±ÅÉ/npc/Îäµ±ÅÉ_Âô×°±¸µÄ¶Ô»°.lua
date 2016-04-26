--中原南区 武当派 卖装备的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("玉树：轻便飘逸的衣衫谁会不喜欢？挑一件吧？", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令，道具只卖给本帮.")
	end
end;

function yes()
Sale(64)
end;

function no()
end;
