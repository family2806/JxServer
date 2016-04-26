--中原北区 宋金战场 金军重生点军医
--李欣 2004-10-14

function main(sel)
if (GetCurCamp() == 2) then
	SetFightState(0)
	Say("将军需要买什么吗?", 2, "买药/yes", "不买/no")
else
	Talk(1,"","看你贼眉鼠眼，想骗我卖给你大金国的神药给你啊?")
end;
end;

function yes()
Sale(53)
end;

function no()
end;