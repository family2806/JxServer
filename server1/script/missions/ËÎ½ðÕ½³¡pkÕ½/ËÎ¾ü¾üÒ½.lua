--中原北区 宋金战场 宋军军医
--苏宇

function main(sel)
	if (GetCurCamp() == 1) then
		Say("不怕牺牲的兵才是好兵，出门打仗要保重身体，买点药吗？", 2, "买药/yes", "不买/no")
	else
		Talk(1,"","哪来的奸细！卫兵快把此人拿下！")
	end
end;

function yes()
Sale(53)
end;

function no()
end;