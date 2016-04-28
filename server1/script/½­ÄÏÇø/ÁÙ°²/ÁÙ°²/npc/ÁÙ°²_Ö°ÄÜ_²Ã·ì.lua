-- ÁÙ°²µÄ²Ã·ì£¬¿ÉÒÔÂò»éÀñ¼ª·þ
-- By: Dan_Deng(2003-12-29)
-- GetTask(67): µÚ24×ÖÎ»Îª»é·ñ±ê¼Ç£¬µÚ1×ÖÎ»ÎªÊÇ·ñÒÑÂò¼ª·þ

function main(sel)
	Uworld67 = GetTask(67)
	if (GetBit(Uworld67,24) == 1) then			-- ÒÑ»é
		if (GetBit(Uworld67,1) == 0) then		-- ÉÐÎ´Âò¹ý£¬¿ÉÒÔÂò»éÀñ·þ
			if (GetSex() == 0) then					-- ÄÐ¶Ô»°£¬ÂòÄÐ×°
				Talk(1,"buy_sale","¤ng ch? Nghe v?ta nãi l?phôc ®¸m c­íi nh?«ng tr?danh thiªn h? b©y gi?c?b¸n kh«ng? ")
			else
				Talk(1,"buy_sale","¤ng ch? V¸y c­íi nh?«ng cùc k?®Ñp,lÇn nµy c?hµng kh«ng vËy? ")
			end
		else
			Talk(1,"","QuÇn ¸o lÇn tr­íc mua ?bæn tiÖm mÆc vÉn võa vÆn ch? Nh?nãi víi b¹n b?th©n thÝch cña ng­¬i nh?")
		end
	else
		Talk(1,"","Tµi v¸  kh«ng ph¶i lµ ta nãi kho¸c , nhµ ta c¸c lo¹i c¸t kh¸nh lÔ phôc lµ trªn ®êi tèt nhÊt , cã g× cÇn lóc nhÊt ®Þnh nhí th¨m a ")
	end
end

function buy_sale()
	Say("?®©y ta chuyªn may quÇn ¸o l?phôc, ®­¬ng nhiªn lo¹i nµo còng c? ch?l?gi?tiÒn h¬i ®¾t mét chót, cÇn 88888 l­îng. ",2,"Ngµy ®¹i h? ®­¬ng nhiªn Ta muèn mua mét b? /buy_yes","Kh«ng cÇn ®©u, ta ch­a lµm ®¸m c­íi /no")
end

function buy_yes()
	if (GetCash() >= 88888) then
		Pay(88888)
		if (GetSex() == 0) then
			AddItem(0,2,28,1,random(0,4),0,0)
		else
			AddItem(0,2,28,4,random(0,4),0,0)
		end
		Uworld67 = GetTask(67)
		Uworld67 = SetBit(Uworld67,1,1)
		SetTask(67,Uworld67)
		Talk(1,"","Kh«ng thµnh vÊn ®Ò, s?gãi l¹i cho kh¸c quan ngay, nh©n th?chóc kh¸ch quan tr¨m n¨m h¹nh phóc!")
	else
		Talk(1,"","Kh«ng ph¶i l?ng­êi giµu c? th?®õng ®ßi hái mÊy th?l?nghi nµy. Muèn g? kiÕm ®ñ tiÒn ®· råi h½ng ®Õn mua!")
	end
end

function no()
end
