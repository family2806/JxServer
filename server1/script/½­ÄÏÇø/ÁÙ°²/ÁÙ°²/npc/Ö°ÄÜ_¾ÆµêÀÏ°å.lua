-- ÁÙ°²¡¡Ö°ÄÜ¡¡¾ÆµêÀÏ°å
-- by£ºDan_Deng(2003-09-16)

function main()
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Qu¸n r­îu l·o b¶n  mêi kh¸ch quan bªn trong ngåi , muèn uèng chót g× r­îu ? ")
	elseif (i == 1) then
		Talk(1,"","Qu¸n r­îu l·o b¶n  chóng ta tr­íc khi an thŞnh s¶n tªn r­îu , hµng n¨m r­îu thuÕ còng v× c¶ n­íc thø nhÊt . chóng ta tr­íc khi an ®İch r­îu cïng n¬i kh¸c bÊt ®ång , ch­ng cÊt r­îu ®İch nguån n­íc ®Õn tõ víi T©y hå , v× vËy nhËp khÈu hÕt søc thanh liÖt cam tho¶i m¸i . ")
	else
		Talk(1,"","Qu¸n r­îu l·o b¶n  chóng ta Tóy tiªn lÇu tæ næi danh r­îu gäi lµ “ t©y tö ngäc cÊt ” , kh¸ch quan cã muèn hay kh«ng nÕm thö mét chót ? ")
	end
end;
