-- ÁÙ°²¡¡Â·ÈË¡¡¾Æ¹í
-- by£ºDan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
	i = random(0,6)
	Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 ~= 0 ) then
		branch_zuihan()
	else
		if (i == 0) then
			Talk(1,"","Töu quû  tÊn trung phÇn r­îu , r­îu dŞch tinh khiÕt trong suèt , mïi th¬m ng¸t nh· óc , nhËp khÈu thuÇn hËu miªn nhu mµ cam liÖt , h¬n vŞ nhÑ nhµng khoan kho¸i , trë vÒ chç du tr­êng . ")
		elseif (i == 1) then
			Talk(1,"","Töu quû  miªn tróc kiÕm nam xu©n , r­îu dŞch trong suèt trong suèt , h­¬ng th¬m nång nÆc , mïi r­îu thuÇn hËu , thuÇn cïng trë vÒ ngät , r­îu thÓ ®Çy ®Æn , mïi th¬m hiÖp ®iÒu , thanh liÖt tŞnh tho¶i m¸i , d­ h­¬ng du tr­êng . ")
		elseif (i == 2) then
			Talk(1,"","Töu quû  ThiÓm T©y t©y ph­îng r­îu , r­îu dŞch thanh l­îng trong suèt , thuÇn h­¬ng ph©n ph­¬ng , thanh mµ kh«ng ®¹m , nång mµ kh«ng diÔm , trë vÒ chç tho¶i m¸i , phong c¸ch ®Æc biÖt . cã chua mµ kh«ng s¸p , khæ mµ kh«ng niªm , h­¬ng kh«ng gay mòi , cay kh«ng sang hÇu , uèng sau trë vÒ cam  vŞ l©u mµ di ph­¬ng chi hay . ")
		elseif (i == 3) then
			Talk(1,"","Töu quû  tu©n nghÜa t¸p r­îu , r­îu dŞch trong suèt trong suèt , mïi th¬m u nh· th­ thİch , võa cã ®¹i khóc r­îu ®İch nång nÆc h­¬ng th¬m , l¹i cã tiÓu khóc r­îu ®İch nhu miªn  thuÇn cïng  trë vÒ ngät , cßn cã ®¹m nh· th­ thİch ®İch mïi thuèc cïng ngon miÖng ®İch vi chua , nhËp khÈu thuÇn cïng nång nÆc , uèng sau cam tho¶i m¸i vŞ tr­êng . ")
		elseif (i == 4) then
			Talk(1,"","Töu quû  Quı Ch©u mao ®µi , r­îu chÊt tinh l­îng trong suèt , h¬i cã mµu vµng , t­¬ng h­¬ng thuÇn phøc u óc , lµm ng­êi ta say mª , s­ëng nghi ngê kh«ng uèng , mïi th¬m x«ng vµo mòi , vui vÎ s­íng uèng , miÖng ®Çy sinh h­¬ng , uèng sau ly kh«ng , l­u h­¬ng lín h¬n , kĞo dµi kh«ng tiªu tan . khÈu vŞ u nh· nh½n nhôi , r­îu thÓ ®Çy ®Æn thuÇn h­¬ng , trë vÒ chç du tr­êng , mao h­¬ng kh«ng døt . ")
		elseif (i == 5) then
			Talk(1,"","Töu quû  töu quû ta trän ®êi lín nhÊt t©m nguyÖn chİnh lµ uèng liÒn thiªn h¹ r­îu ngon , chØ cÇn cã thÓ ®¹t nµy t©m nguyÖn , dï chÕt kh«ng tiÕc . ")
		else
			Talk(1,"","Töu quû  ph¶i biÕt , phÈm r­îu chİnh lµ cuéc sèng mét lo¹i chİ cao ®İch c¶nh giíi , ai  nãi ng­¬i còng kh«ng hiÓu . ")
		end
	end
end;
