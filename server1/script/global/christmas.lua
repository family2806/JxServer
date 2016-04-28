-- mÇm mãng ¡¢±ù¾§¡¢Ê¥µ®Ê÷
--renbin



seed_name	={
		" may m¾n ",
		" hoa hång ",
		" thñy tinh ",
		" hoµng kim "
		}

crystal_name	={
		" vì vôn ",
		" b×nh th­êng ",
		" v« h¹ ",
		" hoµn mü "
		}

seed_sow	={0,0,0,0,0,0}



function main()

	Say("¤ng giµ n« en : gi¸ng sinh vui vÎ  l¹i tíi t×m ta muèn lÔ vËt ®i ? dÜ nhiªn , ta cho tíi b©y giê sÏ kh«ng ®Ó cho c¸c ng­¬i thÊt väng . bÊt qu¸ , n¨m nay ®İch lÔ vËt cã chót ®Æc biÖt nga , chØ cÇn ng­¬i dông t©m tµi båi , th× cã cã thÓ dùng dôc ra xinh ®Ñp c©y gi¸ng sinh , ta lÔ vËt liÒn giÊu ë nh÷ng thø nµy trªn c©y . véi vµng ®i thu tËp <color=red> b¨ng tinh <color> cïng <color=red> gi¸ng sinh mÇm mãng <color> ®i , hµnh ®éng ph¶i nhanh nga ",4,"Ta muèn ®Ò luyÖn b¨ng tinh /upg_crystal","Ta muèn t­íi rãt gi¸ng sinh mÇm mãng /sow_seed","ThËt tèt qu¸ , nhanh lªn nãi cho ta biÕt lµm g× nha /christ_help","A a , kh«ng cã sao , ta cè ı tíi hái hËu ngµi ®İch /no")

end


function christ_help()

	Say("¤ng giµ n« en  ng­¬i cÇn tíi tr­íc d· ngo¹i ®i thu tËp mét İt <color=red> bÓ tan tµnh b¨ng tinh <color> cïng <color=red> gi¸ng sinh mÇm mãng <color> . ta cã thÓ gióp ng­¬i <color=red> ®Ò luyÖn b¨ng tinh <color> cïng <color=red> t­íi rãt mÇm mãng <color> . ",3," liªn quan tíi b¨ng tinh ®İch ®µo ®­îc cïng ®Ò luyÖn /bingjing"," liªn quan tíi mÇm mãng ®İch ®µo ®­îc cïng t­íi rãt /zhongzi","Ta ®· biÕt , c¸m ¬n /no")

end

function bingjing()
	Say("Ê¥µ®ÀÏÈË£º±ù¾§ÓĞ<color=red>ÆÆËé±ù¾§<color>¡¢<color=red> b×nh th­êng ±ù¾§<color>¡¢<color=red> v« h¹ ±ù¾§<color>ºÍ<color=red> hoµn mü ±ù¾§<color>ËÄÖÖ¡£ÄãÔÚÒ°ÍâÖ»ÄÜ²É¼¯µ½<color=red>ÆÆËé±ù¾§<color>£¬ÎÒÄÜ°ïÄãÌáÁ¶³ÉÆäËûÈıÖÖ¡£",2,"B¨ng tinh ®İch ®µo ®­îc /bjcj","B¨ng tinh ®İch ®Ò luyÖn /bjtl")

end


function bjcj()

	Talk(2,"","Ê¥µ®ÀÏÈË£º<color=red> vì vôn ±ù¾§<color>²É¼¯µØ·Ö±ğÎª£º\n<color=red>ºì<color>£­·ïÏè³ÇÍâ¡¢ÓÀÀÖÕòÍâ¡¢Ñãµ´É½\n<color=red>»Æ<color>£­³É¶¼³ÇÍâ¡¢½­½ò´åÍâ¡¢°×Ë®¶´\n<color=red>×Ï<color>£­ÏåÑô³ÇÍâ¡¢°ÍÁêÏØÍâ¡¢ÎäÁêÉ½","<color=red> b¹ch <color> D­¬ng Ch©u bªn ngoµi thµnh  ®¹o h­¬ng th«n bªn ngoµi  la tiªu s¬n \n<color=red> xanh biÕc <color> biÖn kinh thµnh bªn ngoµi  Chu tiªn trÊn bªn ngoµi  kiÕm c¸c t©y nam \n<color=red> lam <color> thµnh §¹i Lı bªn ngoµi  th¹ch cæ ngoµi trÊn  phôc l­u ®éng . ")
	
end

function bjtl()

	Talk(3,"","Ê¥µ®ÀÏÈË£º±ù¾§µÄÌáÁ¶Ë³ĞòÎª£º<color=red>ÆÆËé±ù¾§<color>-><color=red> b×nh th­êng ±ù¾§<color>-><color=red> v« h¹ ±ù¾§<color>-><color=red> hoµn mü ±ù¾§<color>¡£","Ng­¬i cÇn chuÈn bŞ <color=red> mét bé ngang hµng cÊp ®İch 6 s¾c b¨ng tinh ( hång  hoµng  lam  tö  xanh biÕc  b¹ch )<color> , ta th× cã cã thÓ gióp ng­¬i ®Ò luyÖn ra mét viªn ®¼ng cÊp cao h¬n ®İch b¨ng tinh . ","B¨ng tinh cÊp bËc cµng cao , t­íi rãt ra ngoµi mÇm mãng th× cµng cô cã ma lùc , båi dôc ra ngoµi c©y gi¸ng sinh liÒn cã h¬n phong phó lÔ vËt . ")
	
end

function zhongzi()

	Say("Ê¥µ®ÀÏÈË£º mÇm mãng ÓĞ<color=red>Ê¥µ® mÇm mãng <color>¡¢<color=red>Ê¥µ® may m¾n  mÇm mãng <color>¡¢<color=red>Ê¥µ® hoa hång  mÇm mãng <color>¡¢<color=red>Ê¥µ® thñy tinh  mÇm mãng <color>ºÍ<color=red>Ê¥µ® hoµng kim  mÇm mãng <color>ÎåÖÖ¡£ÄãÔÚÒ°ÍâÖ»ÄÜ²É¼¯µ½<color=red>Ê¥µ® mÇm mãng <color>£¬ÎÒÄÜ°ïÄã½½¹à³ÉÆäËûËÄÖÖ¡£",2,"MÇm mãng ®İch ®µo ®­îc /zzcj","MÇm mãng ®İch t­íi rãt /zzjg")

end

function zzjg()

	Talk(3,"","¤ng giµ n« en  bèn lo¹i <color=red> b¨ng tinh <color> t­íi rãt <color=red> gi¸ng sinh mÇm mãng <color> , lµ cã thÓ lÊy ®­îc cã thÓ ph¸t triÓn thµnh c©y gi¸ng sinh ®İch bèn lo¹i mÇm mãng . "," mÇm mãng µÄ½½¹à·½Ê½Îª£º\n\n<color=red>ÈÎÒâ6¸ö vì vôn ±ù¾§<color>£«<color=red>Ê¥µ® mÇm mãng <color>£½<color=red>Ê¥µ® may m¾n  mÇm mãng <color>\n<color=red>ÈÎÒâ6¸ö b×nh th­êng ±ù¾§<color>£«<color=red>Ê¥µ® mÇm mãng <color>£½<color=red>Ê¥µ® hoa hång  mÇm mãng <color>","\n\n<color=red>ÈÎÒâ6¸ö v« h¹ ±ù¾§<color>£«<color=red>Ê¥µ® mÇm mãng <color>£½<color=red>Ê¥µ® thñy tinh  mÇm mãng <color>\n<color=red>ÈÎÒâ6¸ö hoµn mü ±ù¾§<color>£«<color=red>Ê¥µ® mÇm mãng <color>£½<color=red>Ê¥µ® hoµng kim  mÇm mãng <color>¡£")

end

function zzcj()

	Talk(1,"","¤ng giµ n« en <color=red> gi¸ng sinh mÇm mãng <color> ®İch ®µo ®­îc ®Şa ph­¬ng cã  tr­íc khi an bªn ngoµi thµnh  nam nh¹c ngoµi trÊn  long tuyÒn th«n bªn ngoµi  thËp ®¹i m«n ph¸i phô cËn  Hoa S¬n  hoa ®µo nguyªn . ")
	
end


-----------------------ÌáÁ¶±ù¾§-----------------------

function upg_crystal()

	Say("¤ng giµ n« en  muèn ®Ò luyÖn c¸i g× b¨ng tinh ®©y ? bÊt qu¸ , xin chó ı , kh«ng ph¶i lµ mçi lÇn còng sÏ thµnh c«ng nga , nÕu nh­ ®Ò luyÖn thÊt b¹i , ta chØ cã thÓ tr¶ l¹i cho ng­¬i <color=red> mét nguyªn liÖu <color> . ",2,"ÌáÁ¶ b×nh th­êng ±ù¾§(2000Á½)/crystal_medi","Ta suy nghÜ l¹i mét chót /no")

end

function crystal_medi()

	local on_pay = 2000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,468,1,1)>=1) and CalcEquiproomItemCount(4,469,1,1)>=1 and CalcEquiproomItemCount(4,470,1,1)>=1 and CalcEquiproomItemCount(4,471,1,1)>=1 and CalcEquiproomItemCount(4,472,1,1)>=1 and CalcEquiproomItemCount(4,473,1,1)>=1) then
			ConsumeEquiproomItem(1,4,468,1,1)
			ConsumeEquiproomItem(1,4,469,1,1)
			ConsumeEquiproomItem(1,4,470,1,1)
			ConsumeEquiproomItem(1,4,471,1,1)
			ConsumeEquiproomItem(1,4,472,1,1)
			ConsumeEquiproomItem(1,4,473,1,1)
			i_medi = random(1,12000)
			if ( i_medi < 1000 ) then
				AddEventItem(474)
				Msg2Player("Ng­¬i lÊy ®­îc mét ºìÉ« b×nh th­êng ±ù¾§")
				Pay(on_pay)
			elseif ( i_medi < 2000 ) then
				AddEventItem(475)
				Msg2Player("Ng­¬i lÊy ®­îc mét »ÆÉ« b×nh th­êng ±ù¾§")
				Pay(on_pay)
			elseif ( i_medi < 3000 ) then
				AddEventItem(476)
				Msg2Player("Ng­¬i lÊy ®­îc mét À¶É« b×nh th­êng ±ù¾§")
				Pay(on_pay)
			elseif ( i_medi < 4000 ) then
				AddEventItem(477)
				Msg2Player("Ng­¬i lÊy ®­îc mét ×ÏÉ« b×nh th­êng ±ù¾§")
				Pay(on_pay)
			elseif ( i_medi < 5000 ) then
				AddEventItem(478)
				Msg2Player("Ng­¬i lÊy ®­îc mét ÂÌÉ« b×nh th­êng ±ù¾§")
				Pay(on_pay)
			elseif ( i_medi < 6000 ) then
				AddEventItem(479)
				Msg2Player("Ng­¬i lÊy ®­îc mét °×É« b×nh th­êng ±ù¾§")
				Pay(on_pay)
			else
				Msg2Player("ThËt xin lçi , ®Ò luyÖn thÊt b¹i , hy väng lÇn sau cã thÓ thµnh c«ng . ngµn v¹n kh«ng muèn bu«ng tha cho nga ")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(468)
				elseif (i_back < 3000) then
					AddEventItem(469)
				elseif (i_back < 4000) then
					AddEventItem(470)
				elseif (i_back < 5000) then
					AddEventItem(471)
				elseif (i_back < 6000) then
					AddEventItem(472)
				else
					AddEventItem(473)
				end
			end
			check_again(468)	--Is there enough crystals
		
		else
			Talk(1,"","¶Ô²»Æğ£¬ÔÙ×ĞÏ¸¼ì²é¿´¿´£¬ĞèÒªÒ»Ì×6ÖÖÑÕÉ«µÄ vì vôn ±ù¾§Å¶¡£")
		end
	else
		Talk(1,"","ThËt xin lçi , ng©n l­îng kh«ng ®ñ nha , mau trë vÒ lÊy ®i . ")
	end

end


function crystal_high()

	local on_pay = 10000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,474,1,1)>=1) and CalcEquiproomItemCount(4,475,1,1)>=1 and CalcEquiproomItemCount(4,476,1,1)>=1 and CalcEquiproomItemCount(4,477,1,1)>=1 and CalcEquiproomItemCount(4,478,1,1)>=1 and CalcEquiproomItemCount(4,479,1,1)>=1) then
			ConsumeEquiproomItem(1,4,474,1,1)
			ConsumeEquiproomItem(1,4,475,1,1)
			ConsumeEquiproomItem(1,4,476,1,1)
			ConsumeEquiproomItem(1,4,477,1,1)
			ConsumeEquiproomItem(1,4,478,1,1)
			ConsumeEquiproomItem(1,4,479,1,1)
			i_high = random(1,18000)
			if ( i_high < 1000 ) then
				AddEventItem(480)
				Msg2Player("Ng­¬i lÊy ®­îc mét ºìÉ« v« h¹ ±ù¾§")
				Pay(on_pay)
			elseif ( i_high < 2000 ) then
				AddEventItem(481)
				Msg2Player("Ng­¬i lÊy ®­îc mét »ÆÉ« v« h¹ ±ù¾§")
				Pay(on_pay)
			elseif ( i_high < 3000 ) then
				AddEventItem(482)
				Msg2Player("Ng­¬i lÊy ®­îc mét À¶É« v« h¹ ±ù¾§")
				Pay(on_pay)
			elseif ( i_high < 4000 ) then
				AddEventItem(483)
				Msg2Player("Ng­¬i lÊy ®­îc mét ×ÏÉ« v« h¹ ±ù¾§")
				Pay(on_pay)
			elseif ( i_high < 5000 ) then
				AddEventItem(484)
				Msg2Player("Ng­¬i lÊy ®­îc mét ÂÌÉ« v« h¹ ±ù¾§")
				Pay(on_pay)
			elseif ( i_high < 6000 ) then
				AddEventItem(485)
				Msg2Player("Ng­¬i lÊy ®­îc mét °×É« v« h¹ ±ù¾§")
				Pay(on_pay)
			else
				Msg2Player("ThËt xin lçi , ®Ò luyÖn thÊt b¹i , hy väng lÇn sau cã thÓ thµnh c«ng . ngµn v¹n kh«ng muèn bu«ng tha cho nga ")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(474)
				elseif (i_back < 3000) then
					AddEventItem(475)
				elseif (i_back < 4000) then
					AddEventItem(476)
				elseif (i_back < 5000) then
					AddEventItem(477)
				elseif (i_back < 6000) then
					AddEventItem(478)
				else
					AddEventItem(479)
				end
			end
			check_again(474)	--Is there enough crystals
		
		else
			Talk(1,"","¶Ô²»Æğ£¬ÔÙ×ĞÏ¸¼ì²é¿´¿´£¬ĞèÒªÒ»Ì×6ÖÖÑÕÉ«µÄ b×nh th­êng ±ù¾§Å¶¡£")
		end
	else
		Talk(1,"","ThËt xin lçi , ng©n l­îng kh«ng ®ñ nha , mau trë vÒ lÊy ®i . ")
	end

end
	


function crystal_perfect()

	local on_pay = 100000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,480,1,1)>=1) and CalcEquiproomItemCount(4,481,1,1)>=1 and CalcEquiproomItemCount(4,482,1,1)>=1 and CalcEquiproomItemCount(4,483,1,1)>=1 and CalcEquiproomItemCount(4,484,1,1)>=1 and CalcEquiproomItemCount(4,485,1,1)>=1) then
			Pay ( on_pay )
			ConsumeEquiproomItem(1,4,480,1,1)
			ConsumeEquiproomItem(1,4,481,1,1)
			ConsumeEquiproomItem(1,4,482,1,1)
			ConsumeEquiproomItem(1,4,483,1,1)
			ConsumeEquiproomItem(1,4,484,1,1)
			ConsumeEquiproomItem(1,4,485,1,1)
			i_perfect = random(1,30000)
			if ( i_perfect < 6000 ) then
				AddEventItem(486)
				WriteLog(date("%H%M%S").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().."£¬µÃµ½Ò»¸ö hoµn mü ±ù¾§¡£")
				Msg2Player("¹§Ï²Ng­¬i lÊy ®­îc mét  hoµn mü ±ù¾§£¬¸Ï¿ì°ÑËü½½¹à³É hoµng kim  mÇm mãng °É£¡")
			else
				Msg2Player("ThËt xin lçi , ®Ò luyÖn thÊt b¹i , hy väng lÇn sau cã thÓ thµnh c«ng . ngµn v¹n kh«ng muèn bu«ng tha cho nga ")
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(480)
				elseif (i_back < 3000) then
					AddEventItem(481)
				elseif (i_back < 4000) then
					AddEventItem(482)
				elseif (i_back < 5000) then
					AddEventItem(483)
				elseif (i_back < 6000) then
					AddEventItem(484)
				else
					AddEventItem(485)
				end
			end
			check_again(480)	--Is there enough crystals
			
		else
			Talk(1,"","¶Ô²»Æğ£¬ÔÙ×ĞÏ¸¼ì²é¿´¿´£¬ĞèÒªÒ»Ì×6ÖÖÑÕÉ«µÄ v« h¹ ±ù¾§Å¶£¡")
		end
	else
		Talk(1,"","ThËt xin lçi , ng©n l­îng kh«ng ®ñ nha , mau trë vÒ lÊy ®i . ")
	end

end

function check_again(i_item)

	local on_pay = 2000
	if ( i_item == 474 )	then
		on_pay = 10000
	elseif ( i_item == 480 )	then
		on_pay = 100000
	end
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,i_item,1,1)>=1) and CalcEquiproomItemCount(4,i_item + 1,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 2,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 3,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 4,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 5,1,1)>=1)	then
			if ( i_item == 468 )	then
				Say("Ê¥µ®ÀÏÈË£ºÄã»¹Ïë¼ÌĞøÌáÁ¶ b×nh th­êng ±ù¾§Âğ£¿",2,"Tèt /crystal_medi","§îi l¸t n÷a råi h·y nãi /no")
			elseif ( i_item == 474 )	then
				Say("Ê¥µ®ÀÏÈË£ºÄã»¹Ïë¼ÌĞøÌáÁ¶ v« h¹ ±ù¾§Âğ£¿",2,"Tèt /crystal_high","§îi l¸t n÷a råi h·y nãi /no")
			else
				Say("Ê¥µ®ÀÏÈË£ºÄã»¹Ïë¼ÌĞøÌáÁ¶ hoµn mü ±ù¾§Âğ£¿",2,"Tèt /crystal_perfect","§îi l¸t n÷a råi h·y nãi /no")
			end
		end
	end
end




-----------------------ÌáÁ¶±ù¾§½áÊø-----------------------


------------------------½½¹à mÇm mãng -------------------------

function sow_seed()

	Say("Ng­¬i muèn t­íi rãt lo¹i nµo mÇm mãng ? chØ cÇn ng­¬i mang ®ñ råi ®Çy ®ñ nguyªn liÖu cïng phİ dông , liÒn nhÊt ®Şnh cã thÓ t­íi rãt thµnh c«ng . ",3,"½½¹àÊ¥µ® may m¾n  mÇm mãng (3000Á½)/do_sow_seed","½½¹àÊ¥µ® hoa hång  mÇm mãng (1ÍòÁ½)/do_sow_seed","Ta suy nghÜ mét chót ®i /no")

end

function do_sow_gold()

	local on_pay = 1000000
	if ( GetCash() >= on_pay ) then
		if ( CalcEquiproomItemCount(4,486,1,1)>=6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			ConsumeEquiproomItem(6,4,486,1,1)
			ConsumeEquiproomItem(1,4,487,1,1)
			Pay( on_pay )
			i_goldseed = random(1,18000)
			if ( i_goldseed < 20000 ) then		--100%rate
				AddItem(6,1,145,1,0,0,0)
				Talk(1,"","Chóc mõng ng­¬i ! ®Ò luyÖn thµnh c«ng ! nhanh ®i cïng b»ng h÷u cïng nhau båi dôc c¸i nµy hiÕm quı ®İch mÇm mãng ®i  båi d­ìng thµnh c«ng lµ cã thÓ nhËn ®­îc ta tÆng lÔ vËt n÷a/råi ")
				Msg2Player("Ng­¬i lÊy ®­îc mét "..seed_name[4].." mÇm mãng ")
				WriteLog(date("%H%M%S").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().."£¬µÃµ½Ò»¸öÊ¥µ® hoµng kim  mÇm mãng ")
				AddGlobalNews(GetName().."´ÓÊ¥µ®ÀÏÈË´¦»ñµÃÁË* hoµng kim  mÇm mãng *£¬ÎÒÃÇÔ¤×£ËûÔçÈÕÅàÓı³ö hoµng kim Ê¥µ®Ê÷£¬µÃµ½ hoµng kim ×°±¸¡£")
			else
				Talk(1,"","Nga , ®Ò luyÖn thÊt b¹i , tiÕp tôc cè g¾ng a !")
			end
		else
			Talk(1,"","¶Ô²»Æğ£¬ÔÙ×ĞÏ¸¼ì²é¿´¿´£¬ĞèÒª6¿Å hoµn mü ±ù¾§ºÍÒ»¸öÊ¥µ® mÇm mãng ²ÅÄÜ½½¹à¡£")
		end
	else
		Talk(1,"","ThËt xin lçi , ng©n l­îng kh«ng cã mang ®ñ nha , mau trë vÒ lÊy ®i . ")
	end
			

end


function do_sow_seed(nsel)

	nsel1 = nsel
	nsel = nsel * 6
	local on_pay = 2000
	if ( nsel1 == 0 ) then
		on_pay = 3000
	elseif ( nsel1 == 1 ) then
		on_pay = 10000
	else
		on_pay = 100000
	end
	seed_sow[1] = CalcEquiproomItemCount(4,nsel + 468,1,1)
	seed_sow[2] = CalcEquiproomItemCount(4,nsel + 469,1,1)
	seed_sow[3] = CalcEquiproomItemCount(4,nsel + 470,1,1)
	seed_sow[4] = CalcEquiproomItemCount(4,nsel + 471,1,1)
	seed_sow[5] = CalcEquiproomItemCount(4,nsel + 472,1,1)
	seed_sow[6] = CalcEquiproomItemCount(4,nsel + 473,1,1)
	nTotal = seed_sow[1] + seed_sow[2] + seed_sow[3] + seed_sow[4] + seed_sow[5] + seed_sow[6]
	if ( GetCash() >= on_pay ) then
		if ( nTotal >= 6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			Pay ( on_pay )
			nTimes = 6
			for s = 1, 6 do
				if ( seed_sow[s] >= nTimes ) then
						ConsumeEquiproomItem(nTimes,4,nsel + 467 + s,1,1)
					break
				else
					nTimes = nTimes - seed_sow[s]
						ConsumeEquiproomItem(seed_sow[s],4,nsel + 467 + s,1,1)
				end
			end
			ConsumeEquiproomItem(1,4,487,1,1)
			AddItem(6,1,nsel1 + 142,1,0,0,0)
			Talk(1,"","¹§Ï²Äã! ½½¹à³É¹¦! ¿ìÈ¥ºÍÅóÓÑÒ»ÆğÅàÓıÕâ¸öÕäÆæµÄ mÇm mãng °É£¡ÅàÑø³É¹¦ÁË¾ÍÄÜÊÕµ½ÎÒËÍµÄÀñÎïÀ²!!")
			Msg2Player("Ng­¬i lÊy ®­îc mét "..seed_name[nsel1 + 1].." mÇm mãng ")
		else
			Talk(1,"","¶Ô²»Æğ£¬ÔÙ×ĞÏ¸¼ì²é¿´¿´£¬ĞèÒª6¸ö"..crystal_name[nsel1 + 1].."±ù¾§ºÍÒ»¸öÊ¥µ® mÇm mãng ²ÅÄÜ½½¹à¡£")
		end
	else
		Talk(1,"","ThËt xin lçi , ng©n l­îng kh«ng ®ñ nha , mau trë vÒ lÊy ®i . ")
	end

end





------------------------½½¹à mÇm mãng ½áÊø-------------------------


function no()

	Talk(1,"","C¸m ¬n ng­¬i cßn nhí râ ta , chóc ng­¬i ngµy lÔ vui vÎ ")

end