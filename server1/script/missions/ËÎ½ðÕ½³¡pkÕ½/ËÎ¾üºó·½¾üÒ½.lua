--ÖĞÔ­±±Çø ËÎ½ğÕ½³¡ ËÎ¾üÖØÉúµã¾üÒ½
--ÀîĞÀ 2004-10-14

function main(sel)
if (GetCurCamp() == 1) then
	SetFightState(0)
	Say("Tham gia trËn chiÕn h·y tù ch¨m sãc b¶n th©n, mua thuèc kh«ng?", 2, "Mua thuèc/yes", "Kh«ng mua/no")
else
	Talk(1,"","Cã gi¸n ®iÖp")
end;
end;

function yes()
Sale(53)
end;

function no()
end;