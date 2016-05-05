--Á½ºþÇø tianwang°ï ÂëÍ·°ïÖÚ¶Ô»°

function main(sel)
	UTask_tw = GetTask(3);
	if (UTask_tw >= 60*256+20) and (GetFaction() == "tianwang") then
	Say("tianwang°ïÖÚ£ºÒª³öµºÈ¥ÄÄÀï£¿", 3, "Ba L¨ng huyÖn/yes", "Thanh Loa ®¶o/yes1", "Kh«ng rêi ®¶o /no")
	else
	Say("tianwang°ïÖÚ£ºÒª³öµºÈ¥ÄÄÀï£¿", 2, "Ba L¨ng huyÖn/yes", "Kh«ng rêi ®¶o /no")
	end
end;

function yes()
	if (GetFaction() == "tianwang") then						--Èç¹ûÍæ¼ÒÊÇtianwang°ïµÜ×Ó£¬×ø´¬²»ÊÕÇ®
		Say("tianwang°ïÖÚ£ºÐÖµÜ£¬×øºÃÁË£¡", 2, "§­îc råi! /ok1","Kh«ng rêi ®¶o /no")
	else
	Say("tianwang°ïÖÚ£º²»ÊÇ±¾°ïÐÖµÜ£¬×ø´¬¿É²»ÊÇÃâ·ÑµÄ¡£", 1, "§­îc. /ok2")
	end
end;

function yes1()
if (GetFaction() == "tianwang°ï") then						--Èç¹ûÍæ¼ÒÊÇtianwang°ïµÜ×Ó£¬×ø´¬²»ÊÕÇ®
	Say("tianwang°ïÖÚ£ºÇàÂÝµº¿É²»ºÃ´³£¬Äã×¼±¸ºÃÁËÂð£¿", 1, "ChuÈn bÞ xong råi /ok3")
else	
	Say("tianwang°ïÖÚ£º²»ÊÇ±¾°ïÐÖµÜ£¬×ø´¬¿É²»ÊÇÃâ·ÑµÄ¡£", 1, "ºÃ°É/ok4")
end;
end;

function no()
end;

function ok1()
NewWorld(53, 1793, 3159)						--»Ø°ÍÁêÏØ
SetFightState(1)							--×ª»»ÎªÕ½¶·×´Ì¬
end;

function ok2()
if (GetCash() >= 100) then						--²Î¿¼Öµ
	Pay(100)
	NewWorld(53, 1793, 3159)					--»Ø°ÍÁêÏØ
	SetFightState(1)						--×ª»»ÎªÕ½¶·×´Ì¬
else
	Say("tianwang°ïÖÚ£ºÃ»Ç®»¹µ½´¦ÂÒ¹ä£¿ÄãÊÇ³õ½ø½­ºþµÄ°É£¿", 0)		
end;
end;

function ok3()
NewWorld(68, 1634, 3242)						--È¥ÇàÂÝµº
SetFightState(1)							--×ª»»ÎªÕ½¶·×´Ì¬
end;

function ok4()
if (GetCash() >= 500) then						--²Î¿¼Öµ
	Pay(500)
	NewWorld(68, 1634, 3242)					--È¥ÇàÂÝµº
	SetFightState(1)						--×ª»»ÎªÕ½¶·×´Ì¬
else
	Say("tianwang°ïÖÚ£ºÃ»Ç®»¹µ½´¦ÂÒ¹ä£¿", 0)		
end;
end;
