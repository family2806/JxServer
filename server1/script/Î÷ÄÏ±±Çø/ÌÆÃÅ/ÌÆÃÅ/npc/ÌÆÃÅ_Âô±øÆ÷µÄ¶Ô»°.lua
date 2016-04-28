--Î÷ÄÏ±±Çø ÌÆÃÅ Âô±øÆ÷µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("Nh÷ng binh khİ nµy ®Òu do 'Phßng ¸m khİ' vµ 'Phßng háa khİ' bæn m«n ta chÕ t¹o, kh«ng ë n¬i nµo cã!", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","M«n chñ cã lÖnh, binh khİ cña bæn m«n kh«ng thÓ b¸n cho ng­êi ngoµi!")
	end
end;

function yes()
Sale(54)
end;

function no()
end;
