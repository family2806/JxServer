Include([[\script\global\ÌØÊâÓÃµØ\ÃÎ¾³\npc\Â·ÈË_ÅÑÉ®.lua]])
Include("\\script\\item\\levelup_item.lua")
Include("\\script\\global\\head_qianzhuang.lua")
Include("\\script\\global\\systemconfig.lua")
IncludeLib("SETTING")

TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr> ®éc c« kiÕm :<link>"
function cg_getnextdate(oldday, num) --»ñµÃolddayµÄµÚnum ngµy µÄ ngµy ÆÚ£¬±ÈÈç060227µÄµÚ5 ngµy Îª060304
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	
	while (nDay > TBMONTH[nMonth]) do
		nDay = nDay - TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function chuangong_main()
	-- VN_MODIFY_20060427
	if (1) then
		Say("Sè liÖu sai lÇm .", 0)
		return
	end
	
	if (gb_GetModule("TruyÒn c«ng ") ~= 1) then
		Say("¶Ô²»Æğ£¬TruyÒn c«ng ¹¦ÄÜÔİÊ±¹Ø±Õ£¬ÔÙ´Î¿ª·ÅÊ±¼ä¾Í¹Ø×¢¹Ù·½¹«¸æ!", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say("§éc c« kiÕm "..GetName().." ®· l©u kh«ng gÆp , h«m nay t×m ta cã chuyÖn g× ? ",3, "ÎÒÏë´òÌı¹ØÓÚTruyÒn c«ng µÄÊÂÇé¡£/chuangong_info", "ÎÒÏëÈ¡ÏûÉÏ´ÎµÄTruyÒn c«ng ÉêÇë!/cg_undo", "Ta ch¼ng qua lµ tíi b¸i pháng mét c¸i minh chñ ng­¬i mµ th«i . /OnCancel")
	else
		Say("§éc c« kiÕm "..GetName().." ®· l©u kh«ng gÆp , h«m nay t×m ta cã chuyÖn g× ? ",2, "ÎÒÏë´òÌı¹ØÓÚTruyÒn c«ng µÄÊÂÇé¡£/chuangong_info", "Ta ch¼ng qua lµ tíi b¸i pháng mét c¸i minh chñ ng­¬i mµ th«i . /OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("TruyÒn c«ng ") ~= 1) then
		Say("¶Ô²»Æğ£¬TruyÒn c«ng ¹¦ÄÜÔİÊ±¹Ø±Õ£¬ÔÙ´Î¿ª·ÅÊ±¼ä¾Í¹Ø×¢¹Ù·½¹«¸æ!", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.."·²ÊÇÓÎÀú½­ºşÒÑ¾Ã£¬µÈ¼¶´Ó100¼¶µ½160¼¶µÄÈË£¬ÎÒ¶¼¿ÉÒÔ°ïËû°ÑÒ»ÉíµÄ¹¦Á¦×ª³ÉÒ»¿Å'ÔªÉñµ¤'£¬Ò»¸ö10¼¶ÒÔÏÂÃ»ÈëÃÅÅÉÓÖÃ»°İ¹ıÊ¦µÄÈËÖ»Òª³ÔÁËÕâ¿Å'ÔªÉñµ¤'±ãÄÜ»ñµÃTruyÒn c«ng ÈËµÄÒ»Éí¹¦Á¦£¬µ±È»Ò»¸ö´«Íê¹¦µÄÈËÎä¹¦Ò²²»ÖÁÓÚÈ«·Ï£¬²»¹ıÒ²¾ÍÊ£ÏÂ80¼¶µÄË®Æ½ÁË¡£¶øÇÒÎÒÄÜÁ¦ÓĞÏŞ£¬µÈ¼¶Ô½¸ßµÄÈËÔ½ÄÑ½«ÆäÎä¹¦×ª»¯Îª'ÔªÉñµ¤'£¬±ÈÈçÒ»¸ö100~120µÄÈËÎïTruyÒn c«ng Ê±¾­Ñé»áËğºÄ5%£¬121~150¼¶»áËğºÄ10%£¬¶ø150¼¶ÒÔÉÏ»áËğºÄ20%£¬<color=yellow>´òÌıÕâĞ©ÄÑµÀĞÖµÜÄãÏëTruyÒn c«ng £¿<color>", 2, "§óng vËy , ta ®· du lŞch giang hå ®· l©u , gÇn nhÊt muèn tho¸i Èn . /chuangong_do", "DÜ nhiªn kh«ng ph¶i , ch¼ng qua lµ tíi hái th¨m mét chót mµ th«i . /OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.."TruyÒn c«ng µÄ×¼±¸ÒÑ¾­ºÃÁË."..itemstr..".\n ÄãÈ·¶¨ÒªTruyÒn c«ng Âğ£¿ÕâÒ»´«¿É¾Í²»ÄÜ»ØÍ·ÁË°¡£¡<enter>6 th¸ng 20 ngµy ºó½«ÔİÊ±¹Ø±ÕTruyÒn c«ng ÉêÇë£¬6 th¸ng 29 ngµy 24£º00ºó½«ÔİÊ±¹Ø±ÕTruyÒn c«ng ¹¦ÄÜ¡£", 3, "§óng vËy , lßng ta ı ®· quyÕt . /chuangong_dosure","²»£¬ÎÒÏëÈ¡ÏûTruyÒn c«ng £¡/cg_undo", "Chê ta suy nghÜ thªm mét ®o¹n ngµy ®i . /OnCancel");
	else
		Describe(strimg.."ÎÒÕıÔÚ×¼±¸TruyÒn c«ng ËùĞèÒªµÄ²ÄÁÏ£¬ÎÒÒªµ½ "..(num2datestr(applytime)).." sau míi cã thÓ chuÈn bŞ xong ,", 2, "ThËt lµ phiÒn to¸i minh chñ liÔu , v·n bèi ë chç nµy c¸m ¬n /OnCancel", "²»£¬ÎÒÏëÈ¡ÏûTruyÒn c«ng £¡/cg_undo");
	end
end



function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.." n¨m "..month.." th¸ng "..day.." ngµy "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.." ta ®Õn "..num2datestr(nowday).."¾Í¿ÉÒÔ×¼±¸ºÃ°ïÄãTruyÒn c«ng ÁË£¬ÄãÕæµÄ²»Ïë´«Âğ£¿<enter>6 th¸ng 20 ngµy ºó½«ÔİÊ±¹Ø±ÕTruyÒn c«ng ÉêÇë£¬6 th¸ng 29 ngµy 24£º00ºó½«ÔİÊ±¹Ø±ÕTruyÒn c«ng ¹¦ÄÜ¡£",2,"ÊÇµÄ£¬ÎÒ²»ÏëTruyÒn c«ng ÁË£¡/cg_undo_sure", "Kh«ng , ta cßn lµ muèn truyÖn , míi võa råi nhÊt thêi khÈn tr­¬ng nãi sai råi mµ th«i . /OnCancel")
	else
		Describe(strimg.."ÄãÃ»ÓĞ¸úÎÒËµ¹ıÒªTruyÒn c«ng °¡¡£Ã»Ëµ¹ıÓÖÔõÃ´È¡ÏûÄØ£¿",1,"KÕt thóc ®èi tho¹i /OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.." ®­îc råi , vËy nh÷ng thø nµy tµi liÖu ta tr­íc thu l¹i , nÕu nh­ lÇn sau muèn truyÖn lêi cña n÷a chuÈn bŞ ®i ",1,"C¸m ¬n minh chñ /OnCancel")
end

function chuangong_do()
	local nEndLevel = GetLevel()
	local nRestExp = GetExp()
	if (nEndLevel < 100) then
		Describe(strimg.."ºÇºÇ£¬ÕâÎ»Ğ¡ĞÖµÜ£¬ÒÔÄãÏÖÔÚµÄ¹¦Á¦ËÆºõ»¹²»×ãÒÔ´«¸ø±ğÈËÄØ¡£TruyÒn c«ng ĞèÒª<color=yellow>100¼¶<color>ÒÔÉÏ£¬Äã»¹ÊÇÈ¥¶àÄ¥Á·Ä¥Á·°É¡£",1,"H¶o ta biÕt /OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.."ºÇºÇ£¬ÕâÎ»ĞÖµÜ£¬³¬¹ı160¼¶ÒÔÉÏÊÇ²»ÄÜTruyÒn c«ng µÄ¡£",1,"H¶o ta biÕt /OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.."ÒÔÄãÏÖÔÚµÄÎä¹¦ĞŞÎª,Èç¹ûTruyÒn c«ng µÄ»°½«×ª»¯ÎªÒ»¸ö<color=yellow>µÈ¼¶:"..fPerc.."<color> ®İch nguyªn thÇn ®an "
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..",²»¹ıÎÒĞèÒª×¼±¸Ò»¸öĞÇÆÚ,ÄãÔÚÕâ¶ÎÆÚ¼äËæÊ±¿ÉÒÔÀ´È¡ÏûTruyÒn c«ng £¬±Ï¾¹Ò»¸öÈËÁ·Îäµ½Õâ¸ö³Ì¶È²»ÈİÒ×£¬ÇëÄãÔÚÕâ¶ÎÊ±¼äºÃºÃ¿¼ÂÇ¿¼ÂÇ°É",2,"Minh chñ , ta ®· quyÕt t©m quy Èn , ngµi cã thÓ b¾t ®Çu chuÈn bŞ /chuangong_doprepair1","Nh­ vËy a , vËy ta suy nghÜ mét chót n÷a trë l¹i ®i . /OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog("[TruyÒn c«ng ]£º"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." Ìá³öTruyÒn c«ng ÉêÇë£¡")
	Describe(strimg.."ºÃ£¡ÄÇÎÒ¼´¿Ì×¼±¸ÄãµÄTruyÒn c«ng ÊÂÒË£¬Ò»¸öĞÇÆÚºó<color=yellow>"..num2datestr(nextday).."<color>ÄãÔÙÀ´£¬ÎÒ¸øÄãÕıÊ½TruyÒn c«ng £¡µ±È»ÄãÒ²ËæÊ±¿ÉÒÔÀ´ÎÒÕâÀïÈ¡ÏûTruyÒn c«ng ¡£", 1,"C¸m ¬n minh chñ , vËy ta mét tuÇn lÔ sau trë l¹i /OnCancel")
	Msg2Player("ÄãÒÑ³É¹¦ÉêÇëTruyÒn c«ng £¬Ò»ÖÜºóÔÙÀ´ÕÒ¶À¹Â½£¿ÉÒÔÕıÊ½½øĞĞTruyÒn c«ng £¬²¢»ñµÃÔªÉñµ¤£¡Ò²¿ÉËæÊ±ÕÒ¶À¹Â½£È¡ÏûTruyÒn c«ng ÉêÇë£¡")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("ÄãµÄµÈ¼¶Ğ¡ÓÚ100¼¶»ò³¬¹ı160¼¶²»ÄÜTruyÒn c«ng £¡",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("¶Ô²»Æğ£¬TruyÒn c«ng Ê±£¬ÉíÉÏ²»ÄÜ×°ÈÎºÎµÄ×°±¸£¬ÇëÍÑÏÂ×°±¸ÔÙTruyÒn c«ng °É£¡",0)
		return
	end
	Describe(strimg.."TruyÒn c«ng ĞèÒªÖ§¸¶2ÕÅÒøÆ±£¬ÄãÊÇ·ñÒÑ¾­·ÅÈë±³°ü£¿Õâ»ØÕæµÃÒªTruyÒn c«ng ÁË£¬ÄãÈ·¶¨ÒªTruyÒn c«ng Âğ£¿",2, "2 tÊm ng©n phiÕu ®· chuÈn bŞ xong , x¸c ®Şnh /chuangong_doit1", "Ta suy nghÜ thªm mét chót /OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("ÄãµÄµÈ¼¶Ğ¡ÓÚ100¼¶»ò³¬¹ı160¼¶²»ÄÜTruyÒn c«ng £¡",0)
		return
	end
	Describe(strimg.."ÔÙÈ·¶¨Ò»´Î£¡×¢Òâ£ºTruyÒn c«ng Íê³Éºó£¬ÄãµÄ½ÇÉ«½«»á×Ô¶¯¶ÏÏß¡£ÖØĞÂµÇÈëºó£¬ÔÚ±³°üÖĞ¼´»á´æÔÚÔªÉñµ¤Ò»Ã¶¡£",2, "X¸c ®Şnh /chuangong_doit", "Ta suy nghÜ thªm mét chót /OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("ÄãµÄµÈ¼¶Ğ¡ÓÚ100¼¶»ò³¬¹ı160¼¶²»ÄÜTruyÒn c«ng £¡",0)
		return
	end
	local result = qz_use_silver(2, "£ÛTruyÒn c«ng £İ")
	if ( result == 0) then
		Describe(strimg.."ÄãµÄ±³°üÖĞÃ»ÓĞ2ÕÅÒøÆ±£¬ÎÒ²»ÄÜ¸øÄãTruyÒn c«ng £¡", 1, "Oh , thËt xin lçi , ta trë vÒ chuÈn bŞ /OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = "[TruyÒn c«ng ]£º"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." TruyÒn c«ng ³É¹¦£¡Level:"..GetLevel().." Exp:"..GetExp();
	
	
	DoClearSkillCore()
	DoClearPropCore()
	UpdateSkill()
	local endlevel = GetLevel()
	local restexp = GetExp()
	
	ST_LevelUp(80 - endlevel)
	local param5 = chuangong_item(endlevel, restexp)
	logstr = logstr.." ItemParam5:"..param5
	WriteLog(logstr)
end

function chuangong_item(level,restexp)
	if (restexp <0) then
		restexp = 0
	end
	
	nIt = AddItem(6,1,1061,1,0,0,0)
	SetItemMagicLevel(nIt, 1, level)
	SetItemMagicLevel(nIt, 2, restexp)

	m1 = GetByte(restexp, 3)
	m2 = GetByte(restexp, 4)
	m = m1
	m = SetByte(m1, 2, m2)
	
	n1 = SetByte(restexp, 3,0)
	n =  SetByte(n1, 4, 0)

	SetItemMagicLevel(nIt, 3, m)
	SetItemMagicLevel(nIt, 4, n)
	SetItemMagicLevel(nIt, 5, FileName2Id(GetName()))
	SyncItem(nIt)
	return GetItemParam(nIt, 5)
end

function OnCancel()
end