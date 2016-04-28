IncludeLib("FILESYS")

tangburan = "\\settings\\maps\\Î÷±±±±Çø\\M¹c Cao QuËt\\tangburanboss.txt"

wangzuo = "\\settings\\maps\\¶«±±Çø\\Ä®±±²İÔ­\\wangzuoboss.txt"
qingxiaoshitai = "\\settings\\maps\\¶«±±Çø\\Ä®±±²İÔ­\\qingxiaoshitaiboss.txt"
shansinan = "\\settings\\maps\\¶«±±Çø\\Ä®±±²İÔ­\\shansinanboss.txt"

yanxiaoqian = "\\settings\\maps\\ÖĞÔ­±±Çø\\·çÁê¶É±±°¶\\yanxiaoqianboss.txt"
baiyingying = "\\settings\\maps\\ÖĞÔ­±±Çø\\·çÁê¶É±±°¶\\baiyingyingboss.txt"
herenwo = "\\settings\\maps\\ÖĞÔ­±±Çø\\·çÁê¶ÉÄÏ°¶\\herenwoboss.txt"

xuanjizi = "\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjiziboss.txt"
xuanjuedashi = "\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjuedashiboss.txt"

hanmeng = "\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\hanmengboss.txt"

DAMAHUFILE = "\\settings\\maps\\damahuboss.txt"
DAMAHUMAP = {321, 321, 322, 340, 322, 340, 321}
DAMAHUID = {
			{751, 0},
			{752, 0},
			{753, 1},
			{754, 1},
			{755, 2},
			{756, 2},
			{757, 3},
			{758, 3},
			{759, 4},
			{760, 4}
			}


function main()
	--19:30 
	if (tonumber(date("%H")) == 19) then
		mb_mapindex = SubWorldID2Idx(341)
		if (mb_mapindex >= 0 ) then
			posx3, posy3 = getadata(qingxiaoshitai)--Ä®±±²İÔ­	19£º30
			AddNpcEx(743, 95, 2, mb_mapindex, posx3*32, posy3*32, 1, "Çå¾øÊ¦Ì«", 1)		
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS3¡°Çå¾øÊ¦Ì«¡±ÓÚÄ®±±²İÔ­x£º"..posx3..",y£º".. posy3)
		end

		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx5, posy5 = getadata(yanxiaoqian)--·çÁê¶É±±°¶336	--ÖĞÔ­±±Çø		19£º30
			AddNpcEx(744, 95, 2, fl_mapindex, posx5*32, posy5*32, 1, "æÌÏşÙ»", 1)		
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS5¡°æÌÏşÙ»¡±ÓÚ·çÁê¶É±±°¶x£º"..posx5..",y£º".. posy5)
		end
	
		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx7, posy7 = getadata(herenwo)--·çÁê¶ÉÄÏ°¶336	--ÖĞÔ­±±Çø	19£º30
			AddNpcEx(745, 95, 3, fl_mapindex, posx7*32, posy7*32, 1, "ºÎÈËÎÒ", 1)			
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS7¡°ºÎÈËÎÒ¡±ÓÚ·çÁê¶ÉÄÏ°¶x£º"..posx7..",y£º".. posy7)	
		end;
	
		cbn_mapindex = SubWorldID2Idx(321)--Tr­êng B¹ch s¬n Nam 321		--¶«±±Çø		19£º30
		if (cbn_mapindex >= 0) then
			posx8, posy8 = getadata(xuanjizi)
			AddNpcEx(747, 95, 4, cbn_mapindex, posx8*32, posy8*32, 1, "è¯çá×Ó", 1)		
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS8¡°è¯çá×Ó¡±ÓÚTr­êng B¹ch s¬n Nam x£º"..posx8..",y£º".. posy8)	
		end
	end
	
	--21:00
	if (tonumber(date("%H")) == 21) then
		mb_mapindex = SubWorldID2Idx(341)--Ä®±±²İÔ­	21£º00
		if (mb_mapindex >= 0 ) then
			posx4, posy4 = getadata(shansinan)
			AddNpcEx(746, 95, 4, mb_mapindex, posx4*32, posy4*32, 1, "µ¥Ë¼ÄÏ", 1)		
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS4¡°µ¥Ë¼ÄÏ¡±ÓÚÄ®±±²İÔ­x£º"..posx4..",y£º".. posy4)
		end;
	
		fl_mapindex = SubWorldID2Idx(336)--·çÁê¶É±±°¶	21£º00
		if (fl_mapindex >= 0 ) then
			posx6, posy6 = getadata(baiyingying)
			AddNpcEx(742, 95, 1, fl_mapindex, posx6*32, posy6*32, 1, "°×Ó¨Ó¨", 1)		
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS6¡°°×Ó¨Ó¨¡±ÓÚ·çÁê¶É±±°¶x£º"..posx6..",y£º".. posy6)
		end

		xsy_mapindex = SubWorldID2Idx(342)		--Î÷É½Óì342		½­ÄÏÇø		21£º00
		if (xsy_mapindex >= 0) then
			posx10, posy10 = getadata(hanmeng)
			AddNpc(748, 95, xsy_mapindex, posx10*32, posy10*32, 1, "º«ÃÉ", 1)
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS9¡°º«ÃÉ¡±ÓÚÎ÷É½Óìx£º"..posx10..",y£º".. posy10)
		end
		
		damahu_boss()	--»Æ½ğboss§¹i M· Hæ £¬Ëæ»ú³öÏÖÔÚM¹c Cao QuËt¡¢Tr­êng B¹ch s¬n Nam ¡¢Tr­êng B¹ch s¬n B¾c
	end
	
	--23:00
	if (tonumber(date("%H")) == 23) then
		mg_mapindex = SubWorldID2Idx(340)--M¹c Cao QuËt340	--Î÷±±±±Çø	23£º00
		if (mg_mapindex >= 0 ) then
			posx1, posy1 = getadata(tangburan)
			AddNpcEx(741, 95, 1, mg_mapindex, posx1*32, posy1*32, 1, "ÌÆ²»È¾", 1)		
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS1¡°ÌÆ²»È¾¡±ÓÚM¹c Cao QuËtx£º"..posx1..",y£º".. posy1)
		end;

		mb_mapindex = SubWorldID2Idx(341)--Ä®±±²İÔ­341	--¶«±±	23£º00
		if (mb_mapindex >= 0 ) then
			posx2, posy2 = getadata(wangzuo)
			AddNpcEx(739, 95, 0, mb_mapindex, posx2*32, posy2*32, 1, "Íõ×ô", 1)			
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS2¡°Íõ×ô¡±ÓÚÄ®±±²İÔ­x£º"..posx2..",y£º".. posy2)
		 end
	 
		cbb_mapindex = SubWorldID2Idx(322)--Tr­êng B¹ch s¬n B¾c322		--¶«±±Çø		23£º00
		if (cbb_mapindex >= 0) then
			posx9, posy9 = getadata(xuanjuedashi)
			AddNpcEx(740, 95, 0, cbb_mapindex, posx9*32, posy9*32, 1, "Ğş¾õ´óÊ¦", 1)	
			WriteLog("Thêi gian"..date("%H%M%S").."£º²úÉú»Æ½ğBOSS9¡°Ğş¾õ´óÊ¦¡±ÓÚTr­êng B¹ch s¬n B¾cx£º"..posx9..",y£º".. posy9)
		end
	end
end
	
		
		
function getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function damahu_boss()
	--Ëæ»ú´ÓÈı¸öµØÍ¼³é³öÒ»¸ö
	local d = tonumber(date("%d"))
	local m = tonumber(date("%m"))
	local y = tonumber(date("%y"))
	local w = tonumber(date("%W"))
	local xx = tonumber(date("%w"))
	local ss = d + m + y + w + xx
	local zz = mod(xx, 7)
	if (zz == 0) then
		zz = 7
	end
	damahu_mapid = DAMAHUMAP[zz]
    damahu_mapindex = SubWorldID2Idx(damahu_mapid)
    if (damahu_mapid == 321) then
    	mapname = "Tr­êng B¹ch s¬n Nam "
    	file = "\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjiziboss.txt"
   elseif (damahu_mapid == 322) then
    	mapname = "Tr­êng B¹ch s¬n B¾c"
    	file = "\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjuedashiboss.txt"
    elseif (damahu_mapid == 340) then
    	mapname = "M¹c Cao QuËt"
    	file = "\\settings\\maps\\Î÷±±±±Çø\\M¹c Cao QuËt\\tangburanboss.txt"
    end
    
    if (damahu_mapindex >= 0) then
    --Ëæ»úÉèÖÃ§¹i M· Hæ µÃÎåĞĞÊôĞÔ¡¢ºÍÄ£°æid
	rannum = random(10)
    	posx,posy =getadata(file)
    	local npcidx = AddNpcEx(DAMAHUID[rannum][1], 95, DAMAHUID[rannum][2], damahu_mapindex, posx*32, posy*32, 1, "§¹i M· Hæ ", 1)
    	SetNpcDeathScript(npcidx, "\\script\\missions\\boss\\bossdeath.lua");
	WriteLog("Thêi gian"..date("%H%M%S")..": ³öÏÖ»Æ½ğBOSS'§¹i M· Hæ ' mapid:"..damahu_mapid..", täa ®é x:"..posx..", y:".. posy..". §¹i M· Hæ ID ÊÇ"..DAMAHUID[rannum][1]..", thuéc tİnh ngò hµnh:"..DAMAHUID[rannum][2])
	AddGlobalNews("§¹i M· Hæ ³öÏÖÔÚ"..mapname.." ("..floor(posx/8)..","..floor(posy/16)..")")
	end
end
