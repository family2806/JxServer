--ÖĞÔ­±±Çø ËÎ½ğÕ½³¡ ËÎ¾ü¾üÒ½
--ËÕÓî

function main(sel)
	if (GetCurCamp() == 1) then
		Say("Tham gia trËn chiÕn h·y tù ch¨m sãc b¶n th©n, mua thuèc kh«ng?", 2, "Mua thuèc/yes", "Kh«ng mua/no")
	else
		Talk(1,"","Gi¸n ®iÖp ®©y ­? VÖ binh ®©u råi!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;