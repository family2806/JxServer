-- ½­ÄÏÇø ÁÙ°² Â·ÈË_ÁÙ°²¹«²î.lua £¨ÏûÃğ²É»¨ÔôÈÎÎñ£©
-- By: Dan_Deng(2004-05-27)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld43 = GetTask(43)
--	if (Uworld43 < 10) and (GetLevel() >= 70) and (GetReputeLevel(GetRepute()) >= 6) then
		--		Say(10713 ,2,"¼éÒù¸¾Å®ÄËÊ®¶ñ²»ÉæÖ®×ï£¬ÎÒ¼ÈÖªÏş£¬×ÔÈ»Òª¹Ü¡£/U43_get","Ã»ÓĞ/no")
	if (Uworld43 == 40) and (HaveItem(381) == 1) then
		Talk(6,"U43_40","Qña nhiªn kh«ng ngoµi dù ®o¸n cña ta. §¸m tÆc Th¸i Hoa nµy vèn l?bän ?L«i V©n tr¹i -do M¹c Kh«ng NguyÖt cÇm ®Çu","L?c¸i tªn M¹c Kh«ng NguyÖt 'V¹n hoa chóng trung qu? phiÕn diÖp bÊt thiÖp th©n' ®ã sao?!","Chİnh l?h¾n! Vèn xu¸t th©n t?mét 'hµo téc ph?qu?, tiªu tiÒn hoang ph? Sau khi ng­êi tiÒn nhiÖm cña L«i V©n tr¹i qua ®êi, h¾n tiÕp nhËn t?nghiÖp. Nh­ng kh«ng ph¸t huy ®­îc, ng­îc l¹i cßn gi¶i t¸n s¬n tr¹i, lµm mét 'l?tÆc ®éc hµnh'. Khinh c«ng cña h¾n tuyÖt k? tr­íc gi?ch­a ai c?th?b¾t ®­îc. H¾n ®· h¹i kh«ng biÕt bao nhiªu ng­êi con g¸i trinh b¹ch'. ","Nãi nh?vËy, nghÜa l?Sai ®¹i nh©n ®· d?ra ®­îc hµnh tung cña h¾n råi?","NÕu ®¬n gi¶n nh?vËy th?ta ®· kh«ng cÇn ®Õn ng­¬i gióp søc. Ng­êi nµy ®Õn - ®i kh?liÖu. Ch¾c ch¾n h¾n ®ang muèn ®i t×m hai chiÕc 'V©n, L«i th­îc ' (th­îc: ch×a khãa) nµy ®Ó m?cöa lín! Ng­¬i ®· c?trong tay mét chiÕc 'L«i th­îc'råi! Theo nh?ta tİnh to¸n th?chiÕc cßn l¹i hiÖn ®ang ?trong tay cña tr¹i ch?V©n B?¦ng. ","Ta s?®i t×m chiÕc cßn l¹i. Kh«ng tr?ng­êi nµy th?kh«ng biÕt bao nhiªu c?g¸i n÷a s?b?lµm nhôc")
	elseif (Uworld43 == 80) and (HaveItem(382) == 1) then
		Talk(1,"U43_80","Qña nhiªn kh«ng ngoµi dù ®o¸n cña ta, M¹c Kh«ng NguyÖt hiÖn ®ang Èn nÊp ?trong thµnh L©m An nµy. Ng­¬i h·y chŞu kh?t×m cho thËt k?l­ìng. Theo ta ­íc ®o¸n th?h¾n ®ang ?quanh vïng T©y H?")
	elseif (Uworld43 == 10) then
		Talk(1,"","L©u nh?vËy m?vÉn ch­a t×m ®­îc t«ng tİch g?cña bän Th¸i Hoa tÆc ?")
	elseif (Uworld43 == 20) then
		Talk(1,"","Kh«ng t×m ®­îc doanh tr¹i cña chóng ? NÕu t×m ®­îc chiÕc 'V©n th­îc' th?tÊt t×m ®­îc n¬i bän chóng ®ang tr?Èn")
	else
		Talk(1,"","C«ng sai  thiªn tö d­íi ch©n , sao cho tiªu tiÓu gi­¬ng oai . cã ai d¸m can ®¶m ë tr­íc khi an lµm gian ph¹m khoa ®İch , ngµn v¹n kh«ng muèn r¬i vµo trong tay ta ")
	end
end;

function U43_get()
	Talk(1,"","Tèt! Theo ta ®iÒu tra ®­îc theo bän tÆc Th¸i Hoa nµy t?cho m×nh l?phong l­u, thİch s?dông qu¹t. Chóng ®· tõng xuÊt hiÖn ?Thôc s¬n. N¬i ®ã vèn l?s¬n tr¹i cña bän kiÕp ph?L«i V©n. Tr­íc tiªn ng­¬i h·y vµo nói Thôc s¬n ®Ó t×m gÆp L«i B?Lang ch? H¾n tÊt ®· biÕt chuyÖn nµy. C?®iÒu, ng­êi nµy vèn nham hiÓm, ®éc ¸c. Ng­¬i ph¶i nªn cÈn thËn ®Ò phßng")
	SetTask(43,10)
	AddNote("NhËn nhiÖm v?do C«ng Sai thµnh L©m An ñy th¸c: Tiªu diÖt bän tÆc Th¸i Hoa. §i d?th¸m t×nh h×nh cña chóng. Chóng ®· g©y ra liªn tiÕp nhiÒu v?¸n gÇn ®©y. ")
	Msg2Player("NhËn nhiÖm v?do C«ng Sai thµnh L©m An ñy th¸c: Tiªu diÖt bän tÆc Th¸i Hoa. §i d?th¸m t×nh h×nh cña chóng. Chóng ®· g©y ra liªn tiÕp nhiÒu v?¸n gÇn ®©y. ")
end;

function U43_40()
	SetTask(43,50)
	Msg2Player("Sau ®ã l¹i ®i t×m V©n B?­ng ch?®Ó ®o¹t lÊy chiÕcV©n th­îc (ch×a khãa) ")
end

function U43_80()
	SetTask(43,90)
	Msg2Player("T×m n¬i M¹c Kh«ng NguyÖt ®ang tr?Èn ?L©m An ")
end

function no()
end;
