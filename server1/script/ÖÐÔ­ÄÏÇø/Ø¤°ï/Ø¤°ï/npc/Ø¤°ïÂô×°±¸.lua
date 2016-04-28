--Ø¤°ï Âô×°±¸µÄµÜ×Ó¶Ô»°

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("Th©n lµ ®Ö tö C¸i Bang, cÇn ph¶i gian khæ rÌn luyÖn ®Ó b¶o vÖ chİnh nghÜa", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Bang chñ cã lÖnh: trang bŞ cña bæn m«n kh«ng ®­îc b¸n cho ng­êi ngoµi")
	end
end;

function yes()
Sale(73)
end;

function no()
end;
