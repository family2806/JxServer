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
		Say("ThËt xin lçi , truyÒn c«ng chøc n¨ng t¹m thêi t¾t , lÇn n÷a më ra thêi gian liÒn chó ı quan ph­¬ng th«ng b¸o !", 0)
		return 
	end
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		Say("§éc c« kiÕm "..GetName().." ®· l©u kh«ng gÆp , h«m nay t×m ta cã chuyÖn g× ? ",3, "Ta muèn hái th¨m liªn quan tíi truyÒn c«ng chuyÖn cña t×nh . /chuangong_info", "Ta muèn hñy bá lÇn tr­íc ®İch truyÒn c«ng th©n thØnh !/cg_undo", "Ta ch¼ng qua lµ tíi b¸i pháng mét c¸i minh chñ ng­¬i mµ th«i . /OnCancel")
	else
		Say("§éc c« kiÕm "..GetName().." ®· l©u kh«ng gÆp , h«m nay t×m ta cã chuyÖn g× ? ",2, "Ta muèn hái th¨m liªn quan tíi truyÒn c«ng chuyÖn cña t×nh . /chuangong_info", "Ta ch¼ng qua lµ tíi b¸i pháng mét c¸i minh chñ ng­¬i mµ th«i . /OnCancel")
	end
end

function chuangong_info()
	if (gb_GetModule("TruyÒn c«ng ") ~= 1) then
		Say("ThËt xin lçi , truyÒn c«ng chøc n¨ng t¹m thêi t¾t , lÇn n÷a më ra thêi gian liÒn chó ı quan ph­¬ng th«ng b¸o !", 0)
		return 
	end
	local nowday = tonumber(date("%y%m%d"))
	local applytime = GetTask(TV_LAST_APPLY_TIME)
	if (applytime == 0) then
		Describe(strimg.." phµm lµ du lŞch giang hå ®· l©u , cÊp bËc tõ 100 cÊp ®Õn 160 cÊp ng­êi cña , ta còng cã thÓ gióp h¾n ®em mét th©n c«ng lùc chuyÓn thµnh mét viªn ' nguyªn thÇn ®an ' , mét 10 cÊp trë xuèng kh«ng cã vµo m«n ph¸i l¹i kh«ng b¸i s­ ng­êi cña chØ cÇn ¨n råi viªn nµy ' nguyªn thÇn ®an ' liÒn cã thÓ ®¹t ®­îc truyÒn c«ng ng­êi mét th©n c«ng lùc , dÜ nhiªn mét truyÖn hoµn c«ng ng­êi cña vâ c«ng còng kh«ng vÒ phÇn toµn phÕ , bÊt qu¸ còng liÒn cßn d­ l¹i 80 cÊp ®İch tµi nghÖ . h¬n n÷a n¨ng lùc ta cã h¹n , cÊp bËc cµng cao ng­êi cña cµng khã ®em vâ c«ng chuyÓn hãa thµnh ' nguyªn thÇn ®an ' , tû nh­ mét 100~120 ng­êi cña vËt truyÒn c«ng lóc kinh nghiÖm sÏ hao tæn 5% , 121~150 cÊp sÏ hao tæn 10% , mµ 150 cÊp trë lªn sÏ hao tæn 20% , <color=yellow> hái th¨m nh÷ng thø nµy ch¼ng lÏ huynh ®Ö ng­¬i nghÜ truyÒn c«ng ? <color>", 2, "§óng vËy , ta ®· du lŞch giang hå ®· l©u , gÇn nhÊt muèn tho¸i Èn . /chuangong_do", "DÜ nhiªn kh«ng ph¶i , ch¼ng qua lµ tíi hái th¨m mét chót mµ th«i . /OnCancel");
	elseif (nowday >= applytime ) then
		Describe(strimg.." truyÒn c«ng ®İch chuÈn bŞ ®· tèt l¾m ."..itemstr..".\n ng­¬i nhÊt ®Şnh ph¶i truyÒn c«ng sao ? c¸i nµy mét truyÖn coi nh­ kh«ng thÓ quay ®Çu l¹i a <enter>6 th¸ng 20 ngµy sau ®em t¹m thêi t¾t truyÒn c«ng th©n thØnh , 6 th¸ng 29 ngµy 2400 sau ®em t¹m thêi t¾t truyÒn c«ng chøc n¨ng . ", 3, "§óng vËy , lßng ta ı ®· quyÕt . /chuangong_dosure","Kh«ng , ta muèn hñy bá truyÒn c«ng /cg_undo", "Chê ta suy nghÜ thªm mét ®o¹n ngµy ®i . /OnCancel");
	else
		Describe(strimg.." ta ®ang chuÈn bŞ truyÒn c«ng cÇn thiÕt ®İch tµi liÖu , ta ph¶i "..(num2datestr(applytime)).." sau míi cã thÓ chuÈn bŞ xong ,", 2, "ThËt lµ phiÒn to¸i minh chñ liÔu , v·n bèi ë chç nµy c¸m ¬n /OnCancel", "Kh«ng , ta muèn hñy bá truyÒn c«ng /cg_undo");
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
		Describe(strimg.." ta ®Õn "..num2datestr(nowday).." liÒn cã thÓ chuÈn bŞ xong gióp ng­¬i truyÒn c«ng liÔu , ng­¬i thËt kh«ng muèn truyÖn sao ? <enter>6 th¸ng 20 ngµy sau ®em t¹m thêi t¾t truyÒn c«ng th©n thØnh , 6 th¸ng 29 ngµy 2400 sau ®em t¹m thêi t¾t truyÒn c«ng chøc n¨ng . ",2,"§óng vËy , ta kh«ng muèn truyÒn c«ng liÔu /cg_undo_sure", "Kh«ng , ta cßn lµ muèn truyÖn , míi võa råi nhÊt thêi khÈn tr­¬ng nãi sai råi mµ th«i . /OnCancel")
	else
		Describe(strimg.." ng­¬i kh«ng cã ®· nãi víi ta muèn truyÒn c«ng a . ch­a nãi qua nh­ thÕ nµo hñy bá ®©y ? ",1,"KÕt thóc ®èi tho¹i /OnCancel")
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
		Describe(strimg.." a a , vŞ tiÓu huynh ®Ö nµy , lÊy ng­¬i b©y giê ®İch c«ng lùc tùa hå cßn ch­a ®ñ ®Ó lÊy truyÒn cho ng­êi kh¸c ®©u . truyÒn c«ng cÇn <color=yellow>100 cÊp <color> trë lªn , ng­¬i hay lµ ®i nhiÒu ma luyÖn ma luyÖn ®i . ",1,"H¶o ta biÕt /OnCancel")
		return
	end
	if (nEndLevel >= 160) then
		Describe(strimg.." a a , vŞ huynh ®Ö nµy , v­ît qua 160 cÊp trë lªn lµ kh«ng thÓ truyÒn c«ng ®İch . ",1,"H¶o ta biÕt /OnCancel")
		return
	end
	
	local nLevelFullExp = tonumber(GetTabFileData(FILE_LEVEL, nEndLevel+ 1, 2))
	local fPerc = format("%.2f", (nEndLevel)+(nRestExp/nLevelFullExp))
	
	local str = strimg.." lÊy ng­¬i b©y giê ®İch vâ c«ng tu vi , nÕu nh­ truyÒn c«ng lêi cña ®em chuyÓn hãa thµnh mét <color=yellow> cÊp bËc :"..fPerc.."<color> ®İch nguyªn thÇn ®an "
	str = str..client_main(nEndLevel, nRestExp)
	Describe(str..", bÊt qu¸ ta cÇn chuÈn bŞ mét tuÇn lÔ , ng­¬i ë ®©y ®o¹n trong lóc tïy thêi cã thÓ tíi hñy bá truyÒn c«ng , dï sao mét ng­êi luyÖn vâ ®Õn c¸i tr×nh ®é nµy kh«ng dÔ dµng , mêi/xin ng­¬i ë n¬i nµy ®o¹n thêi gian suy nghÜ thËt kü c©n nh¾c ®i ",2,"Minh chñ , ta ®· quyÕt t©m quy Èn , ngµi cã thÓ b¾t ®Çu chuÈn bŞ /chuangong_doprepair1","Nh­ vËy a , vËy ta suy nghÜ mét chót n÷a trë l¹i ®i . /OnCancel")
end

function chuangong_doprepair1()
	local nowday = tonumber(date("%y%m%d"))
	local nextday = cg_getnextdate(nowday, 7)
	SetTask(TV_LAST_APPLY_TIME , nextday);
	WriteLog("[ truyÒn c«ng ]"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." nãi lªn truyÒn c«ng th©n thØnh ")
	Describe(strimg.." h¶o  vËy ta lËp tøc chuÈn bŞ ng­¬i truyÒn c«ng sù nghi , mét tuÇn lÔ sau <color=yellow>"..num2datestr(nextday).."<color> ng­¬i trë l¹i , ta cho ng­¬i chİnh thøc truyÒn c«ng  dÜ nhiªn ng­¬i còng tïy thêi cã thÓ tíi ta chç nµy hñy bá truyÒn c«ng . ", 1,"C¸m ¬n minh chñ , vËy ta mét tuÇn lÔ sau trë l¹i /OnCancel")
	Msg2Player("Ng­¬i ®· thµnh c«ng th©n thØnh truyÒn c«ng , mét tuÇn lÔ sau trë l¹i t×m ®éc c« kiÕm cã thÓ chİnh thøc tiÕn hµnh truyÒn c«ng , còng ®¹t ®­îc nguyªn thÇn ®an  còng cã thÓ tïy thêi t×m ®éc c« kiÕm hñy bá truyÒn c«ng th©n thØnh ")
end

function chuangong_dosure()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("CÊp bËc cña ng­¬i İt h¬n 100 cÊp hoÆc v­ît qua 160 cÊp kh«ng thÓ truyÒn c«ng ",0)
		return
	end
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		Say("ThËt xin lçi , truyÒn c«ng lóc , trªn ng­êi kh«ng thÓ gi¶ bé bÊt kú ®İch trang bŞ , xin/mêi cëi xuèng trang bŞ n÷a truyÒn c«ng ®i ",0)
		return
	end
	Describe(strimg.." truyÒn c«ng cÇn tr¶ 2 tÊm ng©n phiÕu , ng­¬i cã hay kh«ng ®· bá vµo tói ®eo l­ng ? lóc nµy thËt ph¶i h¬n truyÒn c«ng liÔu , ng­¬i nhÊt ®Şnh ph¶i truyÒn c«ng sao ? ",2, "2 tÊm ng©n phiÕu ®· chuÈn bŞ xong , x¸c ®Şnh /chuangong_doit1", "Ta suy nghÜ thªm mét chót /OnCancel")
end

function chuangong_doit1()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("CÊp bËc cña ng­¬i İt h¬n 100 cÊp hoÆc v­ît qua 160 cÊp kh«ng thÓ truyÒn c«ng ",0)
		return
	end
	Describe(strimg.." n÷a x¸c ®Şnh mét lÇn  chó ı  truyÒn c«ng sau khi hoµn thµnh , ng­¬i vai trß sÏ tù ®éng ®o¹n tuyÕn . lÇn n÷a ®¨ng vµo sau , ë l­ng trong tói x¸ch tøc sÏ tån t¹i nguyªn thÇn ®an mét qu¶ . ",2, "X¸c ®Şnh /chuangong_doit", "Ta suy nghÜ thªm mét chót /OnCancel")
end

function chuangong_doit()
	if (GetLevel() < 100 or GetLevel() >= 160) then
		Say("CÊp bËc cña ng­¬i İt h¬n 100 cÊp hoÆc v­ît qua 160 cÊp kh«ng thÓ truyÒn c«ng ",0)
		return
	end
	local result = qz_use_silver(2, " truyÒn c«ng ")
	if ( result == 0) then
		Describe(strimg.." l­ng cña ng­¬i trong tói x¸ch kh«ng cã 2 tÊm ng©n phiÕu , ta kh«ng thÓ cho ng­¬i truyÒn c«ng ", 1, "Oh , thËt xin lçi , ta trë vÒ chuÈn bŞ /OnCancel")	
		return
	elseif (result ~= 1) then
		return 
	end
	SetTask(TV_LAST_APPLY_TIME, 0)
	
	local nowday = tonumber(date("%y%m%d"))
	
	local logstr = "[ truyÒn c«ng ]"..nowday.." Acc:"..GetAccount().."Role:"..GetName().." truyÒn c«ng thµnh c«ng Level:"..GetLevel().." Exp:"..GetExp();
	
	
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