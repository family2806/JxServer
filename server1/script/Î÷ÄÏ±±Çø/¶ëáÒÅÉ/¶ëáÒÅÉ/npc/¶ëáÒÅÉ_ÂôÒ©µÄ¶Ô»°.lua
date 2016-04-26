--西南北区 峨嵋派 卖药的弟子对话
-- Update: Dan_Deng(2003-08-21) 加入卖道具只卖给本帮
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(208) == 1 then
		allbrother_0801_FindNpcTaskDialog(208)
		return 0;
	end
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("妙洁：峨眉山上的草药可多了，本派弟子用这些草药制成了许多疗伤的神药，要不要看看？", 2, "交易/yes", "不交易/no")
	else
		Talk(1,"","掌门有令：门派药品只卖给同门姐妹!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;
