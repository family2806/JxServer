-- ÁÙ°² Â·ÈËNPC ÕÅ¿££¨Ø¤°ï50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(3) == 1 then
		allbrother_0801_FindNpcTaskDialog(3)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld75 = GetTask(75)
	U75_sub5 = GetTask(56)
	if (UTask_gb == 50*256+20) and (HaveItem(139) == 0) then		--´ø×Å50¼¶ÈÎÎñ
		Talk(5,"L50_Step1","Tr­¬ng ®¹i nh©n! Chóng ta l¹i gÆp nhau","LÇn tr­íc may nh?c?qu?bang hiÖp nghÜa gióp ®ì! Kh«ng biÕt lÇn nµy t¹i h?c?th?gióp ®­îc g?","Bang ch?ph¸i ta mang bøc ®Şa ®å cña Trung Nguyªn giao ®Õn cho Hoµng Th­îng. Nh­ng kh«ng c?lÖnh bµi nªn kh«ng th?vµo ®­îc Hoµng cung","VËy kh«ng lo! ?®©y ta c?lÖnh bµi. Xin c?cÇm lÊy m?dïng","§a t?Tr­¬ng ®¹i nh©n!")
	elseif (UTask_gb == 50*256+30) then
		Talk(5,"L50_Step2","Tr­¬ng ®¹i nh©n! §©y l?lÖnh bµi th«ng hµnh! Xin göi l¹i cho ngµi!","Sao råi! §· gÆp ®­îc Hoµng th­îng ch­a?","Hoµng th­îng th?ch­a gÆp. Nh­ng m?c?gÆp mét v?l?Tµo c«ng c«ng, «ng ta l?ng­êi th©n tİn cña Hoµng th­îng. Ta ®· giao cho «ng Êy!","Ai da! §¹i s?kh«ng thµnh råi! Ng­¬i cßn c?®iÒu ch­a biÕt, g?Tµo c«ng c«ng nµy vèn c?quan h?mËt thiÕt víi bän Kim quèc. Hoµng th­îng ®· kh«ng cßn tin dïng «ng ta n÷a. B©y gi?®Şa ®å l¹i r¬i vµo tay «ng ta. E r»ng s?l¹i s¾p c?®¹i häa","ThËt kh«ng ng? §· vµo ®Õn hoµng cung råi vËy m?l¹i cßn b?lõa! Tr­¬ng ®¹i nh©n ®õng lo! Ta s?®i ®o¹t l¹i bøc ®Şa ®å ®ã!")
	elseif (UTask_gb == 50*256+50) then		--´Ë´¦²»ÔÙ¼ì²âÁ½ÑùÎïÆ·ÊÇ·ñ´æÔÚ£¬¸öÈË¾õµÃ²»ÊÇºÜÓĞÒâÒå£¬¶øÇÒÒ²Ê¡ÁË²»ÉÙ¹¤×÷Á¿
		Talk(3,"L50_Step3","Ta ®· ®o¹t l¹i bøc ®Şa ®å nµy. LÇn nµy xin giao l¹i cho Tr­¬ng ®¹i nh©n! Khi nµo Hoµng th­îng l©m triÒu xin h·y giao tËn tay cho Hoµng Th­îng","Còng ®­îc. LÇn nµy ta s?v?s?thŞnh tr?cña triÒu ®×nh m?hµnh ®éng","L?ng­êi Tèng Quèc,cÇn ph¶i nh?vËy! T¹i h?c¸o t? ")
	elseif (UTask_gb >= 50*256+20) and (UTask_gb < 50*256+40) and (HaveItem(139) == 0) then
		AddEventItem(139)
		Msg2Player("L¹i nhËn ®­îc lÖnh bµi ®i vµo Hoµng cung ")
		Talk(1,"","LÖnh bµi th«ng hµnh b?mÊt råi? Kh«ng sao! Ta vÉn cßn mét c¸i. ")
	elseif (Uworld75 == 10) and (U75_sub5 < 10) then		-- È­ÇãÌìÏÂÈÎÎñÖĞ£¬½ÓÈ¡×ÓÈÎÎñ
		if (HaveItem(384) == 1) then
			SetTask(56,10)
			AddNote("NhËn nhiÖm v?tiÕp theo: Gióp Tr­¬ng TuÊn t×m 5 miÕng Ng©n L­îng kho¸ng ")
			Msg2Player("NhËn nhiÖm v?tiÕp theo: Gióp Tr­¬ng TuÊn t×m 5 miÕng Ng©n L­îng kho¸ng ")
			Talk(1,"","Ta còng kh«ng muèn lµm kh?ng­¬i. §óng lóc ta còng ®ang ®Şnh ch?t¹o mét chiÕc ¸o gi¸p míi. Ng­¬i h·y ®i t×m gióp ta 5 miÕng L­îng Ng©n Kho¸ng")
		else
		 	Talk(1,"","§Õn c?mét bøc th?tİn còng kh«ng c?ch?l?nãi miÖng.Ta lµm sao c?th?tin ng­¬i?")
		end
	elseif (Uworld75 == 10) and (U75_sub5 == 10) then		-- ×ÓÈÎÎñÍê³ÉÅĞ¶Ï
		if (GetItemCount(118) >= 5) then
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			DelItem(118)
			SetTask(56,20)
			AddNote("T×m ®­îc 5 miÕng Ng©n L­îng kho¸ng: §· hoµn thµnh nhiÖm v?")
			Msg2Player("T×m ®­îc 5 miÕng Ng©n L­îng kho¸ng: §· hoµn thµnh nhiÖm v?")
			Talk(1,"","TiÓu b»ng h÷u lµm viÖc thËt c?n¨ng lùc. TiÒn ®å s?réng m?")
		else
			Talk(1,"","H×nh nh?kho¸ng th¹ch vÉn cßn thiÕu! C?lªn! C?lªn!")
		end
	else
		Talk(1,"","Tê tuÊn  thËt vÊt v¶ cã c¬ héi thi triÓn tay ch©n , nh­ng lµ l¹i kh¾p n¬i chİ tröu . ai ")
	end
end;

function L50_Step1()
	AddEventItem(139)
	AddNote("L¹i nhËn ®­îc lÖnh bµi ®i vµo Hoµng cung ")
	Msg2Player("L¹i nhËn ®­îc lÖnh bµi ®i vµo Hoµng cung ")
end

function L50_Step2()
	DelItem(139)
	SetTask(8,50*256+40)
	AddNote("LËp tøc ®i lÊy l¹i bøc ®Şa ®å Trung Nguyªn ")
	Msg2Player("LËp tøc ®i lÊy l¹i bøc ®Şa ®å Trung Nguyªn ")
end

function L50_Step3()
	SetTask(8,50*256+60)
	DelItem(199)
	AddNote("§· giao bøc ®Şa ®å Trung Nguyªn ®ã cho Tr­¬ng TuÊn råi! ")
	Msg2Player("§· giao bøc ®Şa ®å Trung Nguyªn ®ã cho Tr­¬ng TuÊn råi! ")
end
