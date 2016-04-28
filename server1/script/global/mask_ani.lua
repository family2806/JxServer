

ItemType	=	{{"Y phôc ","ChiÕc nhÉn ","Gi©y chuyÒn ","Giµy ","§ai l­ng ","C¸i mò ","Thñ tr¹c ","Ngäc béi "},{1,2,1,1,1,1,1,1}}

function hello()

	Say("BiÕn biÕn biÕn , thÓ nghiÖm vui vÎ v« h¹n  ng­¬i nghÜ cã ­ng ¸nh m¾t cña  lang ®İch lç tai  hïng ®İch lùc l­îng  trë thµnh vua b¸ch thó sao ? ta chç nµy lµ cã thÓ ®Ó cho ng­¬i ­íc m¬ trë thµnh sù thËt . ",3,"ThËt cã thÇn kú nh­ vËy sao ? ta còng muèn coi trém mét chót /exchange_mask", "Cã ı tø , nãi nghe mét chót ®i /about","Chí kho¸c l¸c , ta míi kh«ng tin ®©y /no")

end

function exchange_mask()

	GiveItemUI( "Thiªn kú b¸ch qu¸i ®éng vËt tó ", "Ngµi cÇn chuÈn bŞ trõ vò khİ bªn ngoµi ®İch mét bé <color=blue> mµu xanh da trêi thuéc tİnh <color> trang bŞ (9 mãn ) cïng <color=blue>20 v¹n <color> l­îng b¹c , th× cã nhÊt ®Şnh c¬ héi lÊy ®­îc mét thÇn kú mÆt n¹ . xin chó ı , ®æi mÆt n¹ v« luËn lµ hay kh«ng thµnh c«ng , trang bŞ cïng kiÕm hiÖp tiÒn còng sÏ biÕn mÊt , xin kh«ng cÇn cÇm cùc phÈm . ", "exchange_mask_Confirm", "onCancel" );
	
end

function exchange_mask_Confirm( nCount )

	isItemType = {0,0,0,0,0,0,0,0}
	if ( nCount ~= 9 ) then
		Say("Xin/mêi n÷a cÈn thËn kiÓm tra mét c¸i , ngµi cho ta trang bŞ kh«ng phï hîp yªu cÇu nga ",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
			if ( ItemGenre ~= 0 ) then
				Say("Xin/mêi n÷a cÈn thËn kiÓm tra mét c¸i , ngµi cho ta trang bŞ kh«ng phï hîp yªu cÇu nga ",0)
				return 0
			elseif ( DetailType == 0 ) then
				Say("X«ng x¸o giang hå kh«ng dÔ dµng a , nghÜa sÜ cßn lµ xin/mêi thu håi vò khİ phßng th©n cho tháa ®¸ng ",0)
				return 0
			elseif ( DetailType == 10 ) then
				Say("Mét ®­êng b«n ba mÖt nhäc , nghÜa sÜ so víi ta cµng cÇn ph¶i c¸ cìi ngùa nha ",0)
				return 0
			elseif ( DetailType == 11 ) then
				Say("Ta ®©y mÆt n¹ nhiÒu ®©y , vËy th× ng­¬i m×nh cÇm tèt l¾m ",0)
				return 0
			elseif ( DetailType > 11 ) then
				Say("Xin/mêi n÷a cÈn thËn kiÓm tra mét c¸i , ngµi cho ta trang bŞ kh«ng phï hîp yªu cÇu nga ",0)
				return 0
			else
				if ( magictype == 0 ) then
					Say("Muèn ta bu«n b¸n nhiÒu n¨m , c¸i nµy b¹ch trang bŞ còng muèn ngu dèt lÉn vµo v­ît qua kiÓm tra , kh«ng cã cöa ",0)
					return 0
				else
					isItemType[DetailType - 1] = isItemType[DetailType - 1] + 1
				end
			end
		end
	end
	if ( (ItemType[2][1] == isItemType[1]) and (ItemType[2][2] == isItemType[2]) and (ItemType[2][3] == isItemType[3]) and (ItemType[2][4] == isItemType[4]) and (ItemType[2][5] == isItemType[5]) and (ItemType[2][6] == isItemType[6]) and (ItemType[2][7] == isItemType[7]) and (ItemType[2][8] == isItemType[8]) ) then
		onPay = 200000
		if ( GetCash() < onPay ) then
			Say("MÆt cña ta cô còng kh«ng mét lo¹i n÷a/råi , 20 v¹n l­îng coi nh­ lµ tiÖn nghi cña ng­¬i , chê cã tiÒn trë l¹i ®i ",1,"H¶o , ta trë vÒ lÊy tiÒn ®i , xin nhí ph¶i nhÊt ®Şnh cho ta l­u mét nga ")
			return 0
		end
		for i = 1, nCount do
		
			nItemIndex = GetGiveItemUnit( i )
			k = RemoveItemByIndex( nItemIndex )
			if ( k ~= 1 ) then
				Say("ChuyÖn g× x¶y ra , ng­¬i lµm sao cã thÓ g¹t ta ®©y ? ",0)
				return 0
			end
			
		end
		Pay( onPay )
		iGive = random (1,400000)
		if ( iGive < 10000 ) then
			AddItem(0,11,23,0,0,0,0)     --¶«±±»¢
			Say("D¹/õ  vËt cña ng­¬i qu¶ thËt kh«ng tÖ , ta nhËn , c¸i mÆt n¹ nµy sÏ lµ cña ng­¬i ",0)
			
		elseif ( iGive < 20000 ) then
			AddItem(0,11,31,0,0,0,0)     --Ñ©ÀÇ
			Say("D¹/õ  vËt cña ng­¬i qu¶ thËt kh«ng tÖ , ta nhËn , c¸i mÆt n¹ nµy sÏ lµ cña ng­¬i ",0)
		elseif ( iGive < 40000 ) then
			AddItem(0,11,38,0,0,0,0)     --×ØĞÜ
			Say("D¹/õ  vËt cña ng­¬i qu¶ thËt kh«ng tÖ , ta nhËn , c¸i mÆt n¹ nµy sÏ lµ cña ng­¬i ",0)
		elseif ( iGive < 50000 ) then
			AddItem(0,11,61,0,0,0,0)     --½ğË¿ºï
			Say("D¹/õ  vËt cña ng­¬i qu¶ thËt kh«ng tÖ , ta nhËn , c¸i mÆt n¹ nµy sÏ lµ cña ng­¬i ",0)
		elseif ( iGive < 60000 ) then
			AddItem(0,11,63,0,0,0,0)     --Ñ©¹Ö
			Say("D¹/õ  vËt cña ng­¬i qu¶ thËt kh«ng tÖ , ta nhËn , c¸i mÆt n¹ nµy sÏ lµ cña ng­¬i ",0)
		elseif ( iGive < 70000 ) then
			AddItem(0,11,65,0,0,0,0)     --Ã·»¨Â¹
			Say("D¹/õ  vËt cña ng­¬i qu¶ thËt kh«ng tÖ , ta nhËn , c¸i mÆt n¹ nµy sÏ lµ cña ng­¬i ",0)
		elseif ( iGive < 80000 ) then
			AddItem(0,11,66,0,0,0,0)     --°×Öí
			Say("D¹/õ  vËt cña ng­¬i qu¶ thËt kh«ng tÖ , ta nhËn , c¸i mÆt n¹ nµy sÏ lµ cña ng­¬i ",0)
		else
			Say(" lóc nµy tíi phiÒn ta , ng­¬i nhÊt ®Şnh lµ b¹ch bËn rén mét cuéc ",1,"Coi lµ ta xui xÎo . chê ng­¬i t©m t×nh tèt ®iÓm l¹i tíi t×m ng­¬i ®i /no")

		end
	else
		Talk(1,"","Xin/mêi n÷a cÈn thËn kiÓm tra mét c¸i , ngµi cho ta trang bŞ kh«ng phï hîp yªu cÇu nga £¡")
	end
	
end

function about()

	Say("ÄúĞèÒª×¼±¸³ıÎäÆ÷ÍâµÄÒ»Ì×<color=red>À¶É«ÊôĞÔ<color>×°±¸(9¼ş)ºÍ<color=red>20Íò<color>Á½Òø×Ó£¬¾ÍÓĞÒ»¶¨µÄ»ú»áµÃµ½Ò»¸öÉñÆæµÄ¶¯ÎïÃæ¾ß£¬°üÀ¨£º½ğµñ¡¢Ñ©ÀÇ¡¢¶«±±»¢¡¢Ñ©¹Ö¡¢×ØĞÜ¡¢°×Öí¡¢Ã·»¨Â¹ºÍ½ğË¿ºï¡£ÄúĞèÒª×¼±¸µÄ9¼ş×°±¸·Ö±ğÎª£ºC¸i mò ¡¢Y phôc ¡¢§ai l­ng ¡¢»¤Íó/Thñ tr¹c ¡¢»¤Éí·û/Gi©y chuyÒn ¡¢Ngäc béi /ÏãÄÒ¡¢ÉÏChiÕc nhÉn ¡¢ÏÂChiÕc nhÉn ¡¢Giµy ¡£²»¹ıÇë×¢Òâ£¬¶Ò»»Ãæ¾ßÎŞÂÛÊÇ·ñ³É¹¦,×°±¸ºÍ½£ÏÀ±Ò¶¼»áÏûÊ§¡£",1,"Nga , ta hiÓu , c¸m ¬n /no")
end


function no()

end
