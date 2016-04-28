--½­ÄÏÇø\ÁÙ°²\ÁÙ°²\npc\Â·ÈË_ÕÅĞ¡Èª.lua 
--by xiaoyang (2004\4\20)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld121 = GetTask(121)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld121 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld38 == 127) and (GetFaction() ~= "tianwang") then
		Talk(3,"Uworld121_get","Xin chµo vŞ b»ng h÷u!","T¹i h¹ ng­ìng mé tµi nghÖ lµm kĞo cña Tr­¬ng gia ®· l©u, h«m nay t­¬ng kiÕn, qña lµ tiÕng ®ån kh«ng sai","Kh«ng biÕt c¸c h?c?th?gióp cho mét viÖc kh«ng?","S½n sµng!")
	elseif (Uworld121 == 10) and (HaveItem(373) == 0) then
		Talk(1,"","Ta còng rÊt phôc c¸c h? KĞo ch­a lÊy ®· véi ®i! GÆp thÇn tiªn còng ch­a ch¾c ®· véi nh?vËy!")
		AddEventItem(373)
		Msg2Player("TiÕp nhËn lÊy kĞo cña Tr­¬ng TiÓu TuyÒn ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Nh?ta 3 ®êi ®Òu rÌn kĞo, vèn còng c?chót tiÕng t¨m ?vïng nµy. Cha ta muèn ta k?thõa t?nghiÖp, sau nµy s?m?thªm mét x­ëng rÌn kĞo, nh­ng ta kh«ng ®ång ?")
		else
			Talk(1,"","Tê tiÓu tuyÒn  nhµ ta ba ®êi ®Òu lµ ®¸nh chÕ c©y kĞo ®İch , ë tr­íc khi an thµnh còng cã chót danh tiÕng , cha vÉn muèn ®Ó cho ta thõa kÕ nghiÖp cha , t­¬ng lai còng lµm mét c©y kĞo t­îng , nh­ng ta kh«ng muèn . ")
		end
	end
end

function Uworld121_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","Kh«ng ®­îc! Xem c¸i b?d¹ng kh«ng c¶n ®­îc gi?cña ng­¬i th?ch¾c kh«ng lµm ®­îc chuyÖn nµy")
	else
		Say("?®©y c?mét c©y kĞo ®· ®­îc tinh luyÖn. Mong nh?c¸c h?chuyÓn gióp ®Õn cho S?gi?H?M?TuyÕt ®¹i nh©n ?Thóy Yªn m«n",2,"Sím ®· nghe Danh tiÕng cña H?TiªnT? LÇn nµy thËt lµm c?héi ngµn vµng ®Ó ®­îc t­¬ng kiÕn /Uworld121_getjd","Nh­ng ta v?c¸i g?m?ph¶i ®i xa nh?vËy? Huèng h?ta v?c¸c h?l¹i ch­a tõng quen biÕt! Xin lçi! Ta thËt kh«ng th?gióp ®­îc! /Uworld121_no") --ÈÎÎñÆô¶¯
	end
end

function Uworld121_getjd()
	AddEventItem(373)
	Msg2Player("NhËn lÊy kĞo cña Tr­¬ng TiÓu TuyÒn ")
	AddNote("NhËn lÊy kĞo sau ®ã ®i th¼ng vÒ h­íng Thóy Yªn m«n ")
	SetTask(121,10) --ÉèÖÃÈÎÎñ±äÁ¿Îª10
end

function Uworld121_no()
end
