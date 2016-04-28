--  GetGlbValue(9)  ¼ÇÂ¼Ê±¼ähour
--  GetGlbValue(8)  ¼ÇÂ¼ÁìÈ¡´ÎÊı
--  GetTask(615)    ¼ÇÂ¼Ò»Ğ¡Ê±ÄÚÊÇ·ñÓĞÁì¹ı½±
--  Ê¥µ®Ê÷ËÍÀñ»î¶¯£¬Ã¿Ğ¡Ê±Ã¿Ì¨·şÎñÆ÷ËÍ13¸öÀñÎï£¬Ã¿ÈËÃ¿Ğ¡Ê±Ö»ÄÜÁìÈ¡Ò»¸ö
--  ´Ë»î¶¯´Ó12ÔÂ22ÈÕ³ÖĞøµ½1ÔÂ11ÈÕ


function main()

	iRand = random(1,300)
	if ( iRand < 100 ) then
		Say("Ng­¬i ë ®©y c©y gi¸ng sinh cho phĞp mét nguyÖn , ®ét nhiªn ph¸t hiÖn trªn c©y nhiÒu mét chiÕu lÊp l¸nh ®İch ®å ",2,"ThËt biÕt ®iÒu , ta ®Õn xem nh×n nh×n /present","Ta cßn lµ chuyªn t©m høa nguyÖn ®i /no")
	else
		Say("Nhµ ch¬i  thËt lµ ®Ñp ®İch c©y gi¸ng sinh nha , ë chç nµy cho phĞp ®İch nguyÖn nhÊt ®Şnh cã thÓ thùc hiÖn ",0)
	end

end

function present()

	local nLastTime = GetGlbValue(9)
	local nQuantity = GetGlbValue(8)
	local Utask615 = GetTask(615)
	local nHour = tonumber( date( "%m%d%H" ) )
	local nMinute = tonumber( date( "%M") )
	
	if ( nLastTime == 0 and mod( nHour , 100 ) ~= 0 and nMinute < 30 ) then
		SetGlbValue(9,nHour - 1)
		SetGlbValue(8,0)
		AddLocalNews("* * * «ng giµ n« en l¹i ®ang c©y gi¸ng sinh th­îng th¶ thËt lµ nhiÒu lÔ vËt , mäi ng­êi mau ®i xem mét chót nha * * *")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("* * * «ng giµ n« en l¹i ®ang c©y gi¸ng sinh th­îng th¶ thËt lµ nhiÒu lÔ vËt , mäi ng­êi mau ®i xem mét chót nha * * *")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 14 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("Kh«ng muèn lßng tham nga , ®em c¬ héi nh­êng cho nh÷ng b»ng h÷u kh¸c ®i ",0)
	else
		Say("Thø tèt nh¸y m¾t liÒn bŞ c­íp xong råi , xin/mêi mét canh giê sau trë l¹i thö mét chót vËn khİ ®i ",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("Oa  lµ mét ®ãa hoa hång nga , ta muèn ®em nã ®­a cho ta thİch nhÊt ng­êi cña . ")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("Di  lµ mét ph¸o b«ng còng , ta tíi ®Ó cho mäi ng­êi xem ®i . ")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("Nga ? lµ mét Thiªn S¬n ngäc lé ®©y , chØ mong nã cã thÓ cho ta mang ®Õn may m¾n . ")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("H¾c  mét tr¨m qu¶ lé , ta ®ang cÇn nã ®©y . ")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("A ? mét hoa quÕ r­îu oh , ta muèn ®i t×m b»ng h÷u cïng nhau chia xÎ c¸i nµy mü vŞ ®İch r­îu ")
	end

end

function no()
end
