-- TimerHead.lua
-- By: Dan_Deng(2003-08-23) ¼ÆÊ±Æ÷Ïà¹Ø¹¤¾ß

FramePerSec = 18			-- Ã¿ gi©y Ö¡Êıµ±×÷³£Á¿´¦Àí
CTime = 600					-- Ã¿ c¸ canh giê °´600 gi©y £¨10·ÖÖÓ£©¼ÆËã

function GetRestSec(i)		-- Ö±½Ó·µ»Ø¼ÆÊ±Æ÷Ê£Óà gi©y Êı
	return floor(GetRestTime(i) / FramePerSec)
end;

function GetRestCTime(i)			-- »ñÈ¡¼ÆÊ±Æ÷Ê£ÓàÊ±¼ä£¬´óÓÚÒ» c¸ canh giê Ê±°´ÖĞ¹úÊ±¼ä×ª»»
	x = floor(GetRestTime(i) / FramePerSec)
	if (x < CTime) then		-- ²»×ãÒ» c¸ canh giê 
		y = x.." gi©y "
	else
		y = floor(x / CTime).." c¸ canh giê "
	end
	return y
end;

function GetTimerTask(i)			-- Í¨¹ı¼ÆÊ±Æ÷IDºÅ½âÎöÏàÓ¦ÈÎÎñ
	
end