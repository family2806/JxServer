--中原北区 宋金战场 宋军重生点军医
--李欣 2004-10-14

function main(sel)
if (GetCurCamp() == 1) then
	SetFightState(0)
	Say("壮士应该买些伤药防身，战场生死难料!", 2, "买药 /yes", "不买/no")
else
	Talk(1,"","来人，快来抓间谍")
end;
end;

function yes()
Sale(53)
end;

function no()
end;