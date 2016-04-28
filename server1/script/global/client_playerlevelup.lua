--Creator:yfeng
--Date:2004-9-6
--Comm:¿Í»§¶ËÉı¼¶ÌáÊ¾ĞÅÏ¢

STRTAB_LEVELUP={
	[2]="<> chóc mõng ng­¬i lªn tíi 2 cÊp  ng­¬i cã thÓ ®Õn th«n bªn ngoµi t×m vò s­ häc tËp khinh c«ng liÔu . ",
	[5]="<> chóc mõng ng­¬i lªn tíi 5 cÊp  ng­¬i ®· kh«ng hÒ n÷a yÕu kh«ng khái phong , cã thÓ ®i ®¹i thµnh thŞ gÆp mét chót ®êi mÆt . ",
	[10]="<> chóc mõng ng­¬i lªn tíi 10 cÊp  ng­¬i ®· cã nhÊt ®Şnh c«ng ®Ó , cã thÓ vµo ph¸i b¸i s­ häc nghÖ liÔu . tay míi trong th«n cã c¸c ®¹i m«n ph¸i ®İch m«n ®å , bän hä sÏ dÉn ng­¬i vµo ph¸i , s­ m«n sÏ cã nhiÖm vô chê ng­¬i . vµo ph¸i sau liÒn cã thÓ ë m«n ph¸i b¨ng tÇn trong t¸n gÉu . ®ång thêi , ng­¬i cã thÓ cïng ng­êi kh¸c pk liÔu , cßn cã thÓ ë thµnh trÊn trong bµy s¹p b¸n ®å . ",
	[20]="<> chóc mõng ng­¬i lªn tíi 20 cÊp  ng­¬i ®· sÏ liÔu thiªn lı truyÒn ©m , cã thÓ ë thµnh phè b¨ng tÇn trong t¸n gÉu . h¬n n÷a , ng­¬i cã thÓ cìi m· liÔu , c¸c ®¹i thµnh thŞ ®Òu cã m· phiÕn tö . ng­¬i ®· lµ thµnh ng­êi liÔu , cã thÓ kÕt h«n , mang theo ng­¬i mét nöa kia ®i giang t©n th«n ®İch nguyÖt l·o n¬i ®ã thµnh th©n ®i . ®ång thêi kh«ng nªn quªn trë vÒ chuyÕn s­ m«n , cã nhiÖm vô míi chê ng­¬i nga ",
	[30]="<> chóc mõng ng­¬i lªn tíi 30 cÊp  ng­¬i thiªn lı truyÒn ©m c¶nh giíi cao h¬n , cã thÓ trªn ®êi giíi b¨ng tÇn trong t¸n gÉu . ®ång thêi kh«ng nªn quªn trë vÒ chuyÕn s­ m«n , cã nhiÖm vô míi chê ng­¬i nga ",
	[40]="<> chóc mõng ng­¬i lªn tíi 40 cÊp  ng­¬i cã thÓ tham gia tèng kim ®¹i chiÕn , tèng kim chiÕn tr­êng ë vµo t­¬ng d­¬ng cïng Chu tiªn trÊn gi÷a . ®ång thêi kh«ng nªn quªn trë vÒ chuyÕn s­ m«n , cã nhiÖm vô míi chê ng­¬i nga ",
	[50]="<> chóc mõng ng­¬i lªn tíi 50 cÊp  ng­¬i cã thÓ ®i tÈy tñy ®¶o liÔu , ë n¬i nµo ng­¬i cã thÓ t¾m r¬i tiÒm n¨ng ®iÓm cïng kü n¨ng ®iÓm , c¸c ®¹i thµnh thŞ ®İch phu xe cã thÓ dÉn ng­¬i ®i . ®ång thêi kh«ng nªn quªn trë vÒ chuyÕn s­ m«n , cã 50 cÊp nhiÖm vô cïng xuÊt s­ nhiÖm vô chê ng­¬i nga ",
	[60]="<> ng­¬i cã thÓ lµm trë vÒ s­ nhiÖm vô , hoµn thµnh nhiÖm vô sau cã thÓ häc ®­îc trÊn ph¸i tuyÖt häc ",
}

function main(lvl)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	if ( GetLevel() == 30 ) then
		if ( Uworld1001 == 60 ) and ( Uworld1002 == 60 ) and ( Uworld1003 == 108) then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 30 cÊp ®İch chİnh ph¸i , trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 60 ) and ( Uworld1002 == 60 )  then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 30 cÊp ®İch chİnh ph¸i , trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1001,80)
			nt_setTask(1003,109)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 30 cÊp ®İch chİnh ph¸i , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 30 cÊp ®İch trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 60 ) then
			nt_setTask(1001,80)
			SendTaskOrder("Ngµi thu ®­îc 30 cÊp ®İch chİnh ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 60 ) then
			nt_setTask(1002,80)
			SendTaskOrder("Ngµi thu ®­îc 30 cÊp ®İch trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1003 == 108) then
			nt_setTask(1003,109)
			SendTaskOrder("Ngµi thu ®­îc 30 cÊp ®İch tµ ph¸i trËn doanh nhiÖm vô . ")
		end
	elseif ( GetLevel() == 40 ) then
		if ( Uworld1001 == 130 ) and ( Uworld1002 == 110 ) and ( Uworld1003 == 208 ) then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 40 cÊp ®İch chİnh ph¸i , trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 130 ) and ( Uworld1002 == 110 )  then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 40 cÊp ®İch chİnh ph¸i , trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 130 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1001,150)
			nt_setTask(1003,209)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 40 cÊp ®İch chİnh ph¸i , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 110 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 40 cÊp ®İch trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 130 ) then
			nt_setTask(1001,150)
			SendTaskOrder("Ngµi thu ®­îc 40 cÊp ®İch chİnh ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 110 ) then
			nt_setTask(1002,130)
			SendTaskOrder("Ngµi thu ®­îc 40 cÊp ®İch trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1003 == 208 ) then
			nt_setTask(1003,209)
			SendTaskOrder("Ngµi thu ®­îc 40 cÊp ®İch tµ ph¸i trËn doanh nhiÖm vô . ")
		end
	elseif ( GetLevel() == 50 ) then
		if ( Uworld1001 == 200 ) and ( Uworld1002 == 180 ) and ( Uworld1003 == 328) then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch chİnh ph¸i , trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 200 ) and ( Uworld1002 == 180 )  then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch chİnh ph¸i , trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 200 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1001,220)
			nt_setTask(1003,329)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch chİnh ph¸i , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 180 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 200 ) then
			nt_setTask(1001,220)
			SendTaskOrder("Ngµi thu ®­îc 50 cÊp ®İch chİnh ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 180 ) then
			nt_setTask(1002,200)
			SendTaskOrder("Ngµi thu ®­îc 50 cÊp ®İch trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1003 == 328 ) then
			nt_setTask(1003,329)
			SendTaskOrder("Ngµi thu ®­îc 50 cÊp ®İch tµ ph¸i trËn doanh nhiÖm vô . ")
		end
	elseif ( GetLevel() == 60 ) then
		if ( Uworld1001 == 270 ) and ( Uworld1002 == 240 ) and ( Uworld1003 == 408 ) then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch chİnh ph¸i , trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 270 ) and ( Uworld1002 == 240 )  then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch chİnh ph¸i , trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 270 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1001,290)
			nt_setTask(1003,409)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch chİnh ph¸i , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 240 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("Ngµi ®ång thêi thu ®­îc 50 cÊp ®İch trung lËp , tµ ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1001 == 270 ) then
			nt_setTask(1001,290)
			SendTaskOrder("Ngµi thu ®­îc 50 cÊp ®İch chİnh ph¸i trËn doanh nhiÖm vô . ")
		elseif ( Uworld1002 == 240 ) then
			nt_setTask(1002,260)
			SendTaskOrder("Ngµi thu ®­îc 50 cÊp ®İch trung lËp trËn doanh nhiÖm vô . ")
		elseif ( Uworld1003 == 408 ) then
			nt_setTask(1003,409)
			SendTaskOrder("Ngµi thu ®­îc 50 cÊp ®İch tµ ph¸i trËn doanh nhiÖm vô . ")
		end
	else
		return Msg2Player(STRTAB_LEVELUP[lvl])
	end
end
