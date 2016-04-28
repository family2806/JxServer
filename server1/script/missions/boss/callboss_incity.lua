Include("\\script\\lib\\basic.lua");
QY_GOLDBOSS_DPOS_INFO = {
					[739]	= {"V­¬ng T¸ ",		739, 	95,	341,	0,	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\wangzuoboss.txt"},
					[740]	= {"HuyÒn Gi¸c §¹i S­ ", 	740, 	95,	322, 	0, 	"\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjuedashiboss.txt"},
					[741]	= {"§­êng BÊt NhiÔm", 	741, 	95, 336, 	1, 	"\\settings\\maps\\ÖÐÔ­±±Çø\\·çÁê¶ÉÄÏ°¶\\herenwoboss.txt"},
					[742]	= {"B¹ch Doanh Doanh", 	742, 	95, 336,	1, 	"\\settings\\maps\\ÖÐÔ­±±Çø\\·çÁê¶É±±°¶\\baiyingyingboss.txt"},
					[743]	= {"Thanh TuyÖt S­ Th¸i", 	743, 	95, 341, 	2, 	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\qingxiaoshitaiboss.txt"},
					[744]	= {"Yªn HiÓu Tr¸i", 	744, 	95, 336, 	2, 	"\\settings\\maps\\ÖÐÔ­±±Çø\\·çÁê¶É±±°¶\\yanxiaoqianboss.txt"},
					[745]	= {"Hµ Nh©n Ng· ", 	745, 	95, 321, 	3, 	"\\settings\\maps\\¶«±±Çø\\³¤°×É½Â´\\xuanjiziboss.txt"},
					[746]	= {"§¬n T­ Nam", 	746, 	95, 341, 	4, 	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\shansinanboss.txt"},
					[747]	= {"TuyÒn C¬ Tö ", 	747, 	95, 340, 	4, 	"\\settings\\maps\\Î÷±±±±Çø\\Äª¸ß¿ß\\tangburanboss.txt"},
					[748]	= {"Hµn M«ng", 		748, 	95, 342, 	1, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\hanmengboss.txt"},
					[565]	= {"§oan Méc DuÖ ",	565, 	95, 227, 	3,	"\\settings\\maps\\Î÷±±±±Çø\\É³Ä®ÃÔ¹¬\\duanmuruiboss.txt"},
					[582]	= {"Lam Y Y", 	582, 	95, 181, 	1,	"\\settings\\maps\\½­ÄÏÇø\\Á½Ë®¶´ÃÔ¹¬\\lanyiyiboss.txt"},
					[567]	= {"Chung Linh Tó ", 	567, 	95, 181, 	2,	"\\settings\\maps\\½­ÄÏÇø\\Á½Ë®¶´ÃÔ¹¬\\zhonglingxiuboss.txt"},
					[583]	= {"M¹nh Th­¬ng L­¬ng", 	583, 	95, 341, 	3,	"\\settings\\maps\\¶«±±Çø\\Ä®±±²ÝÔ­\\wangzuoboss.txt"},
					[1365]	= {"HuyÒn Nan §¹i S­", 	1365, 	95, 342, 	0, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
					[1368]	= {"Thanh Liªn Tö", 	1368, 	95, 875, 	4,	"\\settings\\maps\\Î÷±±±±Çø\\É³Ä®ÃÔ¹¬\\qinglianziboss.txt"},
					[1366]	= {"§­êng Phi YÕn", 	1366, 	95, 342, 	1, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
					[1367]	= {"Tõ §¹i Nh¹c", 	1367,	95, 342,	4, 	"\\settings\\maps\\½­ÄÏÇø\\Î÷É½Óì\\big_goldboss.txt"},
}
---------------------------------------------------------------------------------------------
function QY_MakeBoss_RandInCity(bossid, bosslvl, series, mapid, posx, posy, bossname, str)
	local mapidx = SubWorldID2Idx(mapid)
	if (mapidx < 0) then
		return
	end
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	if (npcindex > 0) then
		SetNpcDeathScript(npcindex, "\\script\\missions\\boss\\bossdeath.lua");
		WriteLog(date("%H:%M")..","..bossid..","..bosslvl..","..series..","..SubWorldIdx2ID(mapidx)..","..posx..","..posy..","..bossname)
		AddGlobalNews(str)

		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour == 19) then
			-- »Æ½ðBOSS¼ÆÊý
			SetNpcParam(npcindex, 1, 1); -- ÊÇ·ñÊÇ19:30µÄ»Æ½ðBOSS
			RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "AddGoldBossCount", 0);
		end
	end
	
end

function CallBossDown_Outter(bossid, str)
	local mapid = QY_GOLDBOSS_DPOS_INFO[bossid][4]
	mapidx = SubWorldID2Idx(mapid)
	if (mapidx < 0) then
		return
	end
	local bossname = QY_GOLDBOSS_DPOS_INFO[bossid][1]
	local bosslvl = QY_GOLDBOSS_DPOS_INFO[bossid][3]
	local series = QY_GOLDBOSS_DPOS_INFO[bossid][5]
	local filepos = QY_GOLDBOSS_DPOS_INFO[bossid][6]
	posx, posy = getadata(filepos)
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	SetNpcDeathScript(npcindex, "\\script\\missions\\boss\\bossdeath.lua");
	AddGlobalNews(str)
	WriteLog(date("%H:%M")..","..bossid..","..bosslvl..","..series..","..SubWorldIdx2ID(mapidx)..","..posx..","..posy..","..bossname)
	local nHour = tonumber(date("%H"));
	if (nHour == 19 and npcindex > 0) then
		-- »Æ½ðBOSS¼ÆÊý
		SetNpcParam(npcindex, 1, 1); -- ÊÇ·ñÊÇ19:30µÄ»Æ½ðBOSS
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "AddGoldBossCount", 0);
	end
end

QY_NEWBOSS_FIXURE_INFO = {
	[1] = {
					--Name					ID,LEVEL,SERVERS,MAPID,X,Y,	NORMALX,NORMALY,SZMSG
					{"Lo¹n thÕ anh hµo",	1194,95,0,	181,1635*32,3077*32,	1632*32,3065*32,"Cao thñ ThiÕu L©m - Lo¹n ThÕ Anh Hµo - xuÊt hiÖn t¹i L­ìng Thñy §éng!"},
					{"Truy mÖnh c­ sÜ",			1195,95,1,	319,1671*32,3761*32,	1666*32,3747*32,"ÌÆÃÅ¸ßÊÖ- Truy mÖnh c­ sÜ- ³öÏÖÔÚÁÙÓå¹Ø!"},
					{"Hå DiÖp Bèi Bèi",			1198,95,2,	167,1571*32,3107*32,	1559*32,3116*32,"´äÑÌ¸ßÊÖ-Hå DiÖp Bèi Bèi- ³öÏÖÔÚµã²ÔÉ½!"},
					{"Ngäc H¶i L©u",1199,95,3,	123,1621*32,3329*32,	1620*32,3343*32,"Cao thñ C¸i Bang - Ngäc H¶i Väng Ng· - xuÊt hiÖn t¹i L·o Hæ §éng!"},
					{"Cæ ®¹o phong",				1201,95,4,	 90,1789*32,3391*32,	1789*32,3376*32,"Îäµ±¸ßÊÖ-Cæ ®¹o phong- ³öÏÖÔÚ·üÅ£É½!"},
									},
	[2] = {
					{"Nh¶ Háa N÷ Nh©n",		1202,95,4,	 41,2042*32,2911*32,	2037*32,2896*32,"À¥ÂØ¸ßÊÖ - Nh¶ Háa N÷ Nh©n- ³öÏÖÔÚ·üÅ£É½Î÷!"},
					{"Thanh H­¬ng",1200,95,3,  21,2527*32,4197*32,	2518*32,4205*32,"Cao thñ Thiªn NhÉn - Hoa PhÊn Thanh H­¬ng - xuÊt hiÖn t¹i Thanh Thµnh S¬n!"},
					{"Nga Mi HuyÕt",				1197,95,2,	  9,2288*32,5762*32,	2278*32,5747*32,"¶ëÃ¼¸ßÊÖ- Nga Mi HuyÕt - ³öÏÖÔÚ³¤½­Ô´Í·!"},
					{"ThÇn Tiªn d· bÊt nh­ thö",1196,95,1,	 93,1626*32,3187*32,	1620*32,3181*32,"Cao thñ Ngò §éc - ThÇn Tiªn - xuÊt hiÖn t¹i TiÕn Cóc §éng!"},
					{"Thiªn V­¬ng",				1193,95,0,	 70,1798*32,3153*32,	1781*32,3153*32,"Cao thñ Thiªn V­¬ng - Thiªn V­¬ng QuÇn Anh - xuÊt hiÖn t¹i Vâ Di S¬n!"},
									},

}
QY_NORMALBOSS_INFO	=
{
	[1]	= {n_level = 90, 	n_series = 1,	n_npcid = 523,	n_mapid = 25,	tb_coords = {{531,300}, {482,331}},	sz_name = "LiÔu Thanh Thanh"},
	[2]	= {n_level = 90, 	n_series = 2, 	n_npcid = 513,	n_mapid = 13,	tb_coords = {{285,302}, {218,312}},	sz_name = "DiÖu Nh­ "},
	[3]	= {n_level = 90, 	n_series = 4, 	n_npcid = 511,	n_mapid = 81,	tb_coords = {{219,210}, {232,191}},	sz_name = "Tr­¬ng T«ng ChÝnh"},
	[4]	= {n_level = 90,	n_series = 1, 	n_npcid = 1358, n_mapid = 183,	tb_coords = {{204,214}, {183,167}},	sz_name = "T©y V­¬ng Tµ §éc"},
	[5]	= {n_level = 90,	n_series = 2, 	n_npcid = 1360, n_mapid = 154,	tb_coords = {{39,107}, {69,82}}, 	sz_name = "Do·n Thanh V©n"},
	[6]	= {n_level = 90,	n_series = 3, 	n_npcid = 1361, n_mapid = 115,	tb_coords = {{195,205},{180,176}},	sz_name = "H¾c Y S¸t Thñ"},
	[7]	= {n_level = 90,	n_series = 0, 	n_npcid = 1356, n_mapid = 59, 	tb_coords = {{188,195},{237,192}}, 	sz_name = "Ng¹o Thiªn T­íng Qu©n"},
	[8]	= {n_level = 90,	n_series = 3, 	n_npcid = 1362, n_mapid = 45, 	tb_coords = {{208,202},{199,192}}, 	sz_name = "ThËp Ph­¬ng C©u DiÖt"},
	[9]	= {n_level = 90,	n_series = 4, 	n_npcid = 1364,	n_mapid = 131,	tb_coords = {{173,208},{202,190}}, 	sz_name = "Thanh Y Tö"},
	[10]= {n_level = 90,	n_series = 0, 	n_npcid = 1355,	n_mapid = 103,	tb_coords = {{180,220},{199,180}}, 	sz_name = "TÞnh Th«ng"},
};

function CallBossDown_Fixure()
	for i = 1, getn(QY_NORMALBOSS_INFO) do
		local nlvl, nseries, nid, nmap, tb_coords, szname	= 	QY_NORMALBOSS_INFO[i].n_level, QY_NORMALBOSS_INFO[i].n_series,
																QY_NORMALBOSS_INFO[i].n_npcid, QY_NORMALBOSS_INFO[i].n_mapid,
																QY_NORMALBOSS_INFO[i].tb_coords, QY_NORMALBOSS_INFO[i].sz_name;
		local nworldidx = SubWorldID2Idx(nmap);
		
		if (nworldidx >= 0) then
			local nIdx		= random(getn(tb_coords));
			local nx, ny	= tb_coords[nIdx][1] * 8 * 32, tb_coords[nIdx][2] * 16 * 32;
			
			AddNpcEx(nid, nlvl, nseries, nworldidx, nx, ny, 1, szname, 1);
			WriteBossLog(format("%s:%s,%d,%d,%d", "BOSS tiÓu Hoµng Kim", szname, nmap, nx, ny));
		end
	end
	SubWorld = nOldSubWorld;
end;

function WriteBossLog(szLog)
	WriteLog("[CALLBOSS FIXURE]\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t")..szLog);
end;

------------ »¹ÊÇ·Ö¸îÏß----------------------------------------------
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
