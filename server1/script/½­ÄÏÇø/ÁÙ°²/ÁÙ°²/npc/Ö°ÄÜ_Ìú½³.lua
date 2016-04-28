-- ÁÙ°²¡¡Ö°ÄÜ¡¡Ìú½³
-- by£ºDan_Deng(2003-09-16)
--update:zhaowenyi(2005-02-20)Ôö¼Ó×ÏÉ«¼°»Æ½ð×°±¸ÖýÔì

Include("\\script\\global\\global_tiejiang.lua")


TIEJIANG_DIALOG = "<dec><npc> c¨n nµy thî rÌn cöa hµng lµ tõ ta tæ phô kia ®ång løa l­u l¹i , ®· cã chót niÖm ®Çu , ë n¬i nµy tr­íc khi an trong thµnh còng h¬i cã máng tªn , xin hái muèn mua chót g× nha ? ";
function main()
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(1);  				--µ¯³ö½»Ò×¿ò
end;

