-------------------------------------------------------------------------
-- FileName		:	posthouse.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-05 16:28:14
-- Desc			:	ËÍÐÅÈÎÎñ³µ·ò½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --°üº¬Íæ¼ÒÈÎÎñÊý¾Ý±í¸ñµÄÀà
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua") --°üº¬Íæ¼ÒËÀÍö½Å±¾
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷


--³µ·ò´¦ÉèÖÃÈÎÎñ±äÁ¿1201£¬1202£¬1203ÖÐµÄÒ»¸öÎª20
function messenger_wagoner()
--	Uworld1201 = nt_getTask(1201)
--	Uworld1202 = nt_getTask(1202)
	Uworld1203 = nt_getTask(1203)
	Uworld1204 = nt_getTask(1204)
--	
--	if ( messenger_gettime() == 10 ) then
--		Msg2Player("¶Ô²»×¡°¡£¬Äã½ÓµÄÐÅÊ¹ÈÎÎñÒÑ¾­¹ýÆÚÁË£¬ÔÛÃ»°ì·¨ËÍÄú¿©¡£")
--		return
--	end
--	
--	if ( Uworld1201 ~= 0 ) then
--		if ( Uworld1201 == 10 ) then
--			Say("½øÈëµØÍ¼Âð£¿",2,"ÊÇµÄ/messenger_flywagoner","²»ÁË/no")
--		elseif ( Uworld1201 == 30 ) then
--			for i=1,getn(citygo) do 
--				if ( Uworld1204 == citygo[i][2]) then
--					Msg2Player("¶Ô²»Æð£¬Äã»¹ÓÐÐÅÊ¹ÈÎÎñÒÑ¾­Íê³Éµ«ÊÇÃ»ÓÐÌá½»£¬ÇëÏÈÈ¥"..citygo[i][4].."æäÕ¾½»ÈÎÎñ¡£")
--				end
--			end
--		end
--	elseif ( Uworld1202 ~= 0 ) then
--		if ( Uworld1202 == 10 ) then
--			Say("½øÈëµØÍ¼Âð£¿",2,"ÊÇµÄ/messenger_templewagoner","²»ÁË/no")
--		elseif ( Uworld1202 == 30 ) then
--			for i=1,getn(citygo) do   --±í¸ñÓ¦¸ÃÓÐËù²»Í¬£¿£¿
--				if ( Uworld1204 == citygo[i][2]) then   --£¿£¿
--					Msg2Player("¶Ô²»Æð£¬Äã»¹ÓÐÐÅÊ¹ÈÎÎñÒÑ¾­Íê³Éµ«ÊÇÃ»ÓÐÌá½»£¬ÇëÏÈÈ¥"..citygo[i][4].."æäÕ¾½»ÈÎÎñ¡£") --£¿£¿
--				end
--			end
--		end
	if ( Uworld1203 ~= 0 ) then
		if ( Uworld1203 == 10 or Uworld1203 == 20 or Uworld1203 == 21 ) then
			Say("Cã muèn vµo khu vùc kh«ng?",2,"Muèn/messenger_storewagoner","Kh«ng muèn/no")
		elseif ( Uworld1203 == 30 ) then
			for i=1,getn(citygo) do   --±í¸ñÓ¦¸ÃÓÐËù²»Í¬£¿£¿
				if ( Uworld1204 == citygo[i][2]) then   --£¿£¿
					Msg2Player("Xin lçi! NhiÖm vô TÝn Sø cña b¹n ®· hoµn thµnh nh­ng ch­a giao tr¶, mêi b¹n ®i giao tr¶ nhiÖm vô."..citygo[i][4].."Giao nhiÖm vô ë DÞch tr¹m") --£¿£¿
				end
			end
		end
	else
		Msg2Player("Xin l­îng thø, ng­¬i vÉn ch­a nhËn ®­îc nhiÖm vô §­a Tin, h·y t×m DÞch Quan nhËn nhiÖm vô tr­íc ®·")
	end
end

--function messenger_flywagoner()
--	SetRevPos(80,40)
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(387,1582,3137)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(388,1582,3137)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(389,1582,3137)
--	end
--end
--
--function messenger_templewagoner()
--	SetRevPos(176,70)
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(390,1312,3198)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(391,1312,3198)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(392,1312,3198)
--	end
--end

function messenger_storewagoner()
	SetRevPos(11,10)
	
	NewWorld(395,1417,3207)
	
--	if ( GetLevel() >=60 ) and ( GetLevel() <= 89 ) then
--		NewWorld(393,1417,3207)
--	elseif ( GetLevel() >=90 ) and ( GetLevel() <= 119 ) then
--		NewWorld(394,1417,3207)
--	elseif ( GetLevel() >= 120 ) then
--		NewWorld(395,1417,3207)
--	end

end