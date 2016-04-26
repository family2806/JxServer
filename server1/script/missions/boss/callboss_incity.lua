Include("\\script\\lib\\basic.lua");
QY_GOLDBOSS_DPOS_INFO = {
					[739]	= {"����",		739, 	95,	341,	0,	"\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"},
					[740]	= {"������ʦ", 	740, 	95,	322, 	0, 	"\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"},
					[741]	= {"�Ʋ�Ⱦ", 	741, 	95, 336, 	1, 	"\\settings\\maps\\��ԭ����\\������ϰ�\\herenwoboss.txt"},
					[742]	= {"��ӨӨ", 	742, 	95, 336,	1, 	"\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
					[743]	= {"���ʦ̫", 	743, 	95, 341, 	2, 	"\\settings\\maps\\������\\Į����ԭ\\qingxiaoshitaiboss.txt"},
					[744]	= {"��Сٻ", 	744, 	95, 336, 	2, 	"\\settings\\maps\\��ԭ����\\����ɱ���\\yanxiaoqianboss.txt"},
					[745]	= {"������", 	745, 	95, 321, 	3, 	"\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"},
					[746]	= {"��˼��", 	746, 	95, 341, 	4, 	"\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					[747]	= {"�����", 	747, 	95, 340, 	4, 	"\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"},
					[748]	= {"����", 		748, 	95, 342, 	1, 	"\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"},
					[565]	= {"��ľ�",	565, 	95, 227, 	3,	"\\settings\\maps\\��������\\ɳĮ�Թ�\\duanmuruiboss.txt"},
					[582]	= {"������", 	582, 	95, 181, 	1,	"\\settings\\maps\\������\\��ˮ���Թ�\\lanyiyiboss.txt"},
					[567]	= {"������", 	567, 	95, 181, 	2,	"\\settings\\maps\\������\\��ˮ���Թ�\\zhonglingxiuboss.txt"},
					[583]	= {"�ϲ���", 	583, 	95, 341, 	3,	"\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"},
					[1365]	= {"���Ѵ�ʦ", 	1365, 	95, 342, 	0, 	"\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
					[1368]	= {"������", 	1368, 	95, 875, 	4,	"\\settings\\maps\\��������\\ɳĮ�Թ�\\qinglianziboss.txt"},
					[1366]	= {"�Ʒ���", 	1366, 	95, 342, 	1, 	"\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
					[1367]	= {"�����", 	1367,	95, 342,	4, 	"\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
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
			-- �ƽ�BOSS����
			SetNpcParam(npcindex, 1, 1); -- �Ƿ���19:30�Ļƽ�BOSS
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
		-- �ƽ�BOSS����
		SetNpcParam(npcindex, 1, 1); -- �Ƿ���19:30�Ļƽ�BOSS
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "AddGoldBossCount", 0);
	end
end

QY_NEWBOSS_FIXURE_INFO = {
	[1] = {
					--Name					ID,LEVEL,SERVERS,MAPID,X,Y,	NORMALX,NORMALY,SZMSG
					{"����Ӣ������",	1194,95,0,	181,1635*32,3077*32,	1632*32,3065*32,"���ָ��� - ����Ӣ��- ��������ˮ��!"},
					{"׷����ʿ",			1195,95,1,	319,1671*32,3761*32,	1666*32,3747*32,"���Ÿ���- ׷����ʿ- �����������!"},
					{"��������",			1198,95,2,	167,1571*32,3107*32,	1559*32,3116*32,"���̸���-��������- �����ڵ��ɽ!"},
					{"��¥��������",1199,95,3,	123,1621*32,3329*32,	1620*32,3343*32,"����ؤ�� - ������- �������ϻ���!"},
					{"�ŵ���",				1201,95,4,	 90,1789*32,3391*32,	1789*32,3376*32,"�䵱����-�ŵ���- �����ڷ�ţɽ!"},
									},
	[2] = {
					{"�ǻ��Ů��",		1202,95,4,	 41,2042*32,2911*32,	2037*32,2896*32,"���ظ��� - �ǻ��Ů��- �����ڷ�ţɽ��!"},
					{"�����㡩�����̡�",1200,95,3,  21,2527*32,4197*32,	2518*32,4205*32,"���̸��� - �������� - ���������ɽ!"},
					{"��սѪ",				1197,95,2,	  9,2288*32,5762*32,	2278*32,5747*32,"��ü����- ��սѪ - �����ڳ���Դͷ!"},
					{"����Ҳ�������",1196,95,1,	 93,1626*32,3187*32,	1620*32,3181*32,"�嶾����- ����- �����ڼ��ն�!"},
					{"%����%",				1193,95,0,	 70,1798*32,3153*32,	1781*32,3153*32,"��������-����ȺӢ- ����������ɽ!"},
									},

}
QY_NORMALBOSS_INFO	=
{
	[1]	= {n_level = 90, 	n_series = 1,	n_npcid = 523,	n_mapid = 25,	tb_coords = {{531,300}, {482,331}},	sz_name = "������"},
	[2]	= {n_level = 90, 	n_series = 2, 	n_npcid = 513,	n_mapid = 13,	tb_coords = {{285,302}, {218,312}},	sz_name = "����"},
	[3]	= {n_level = 90, 	n_series = 4, 	n_npcid = 511,	n_mapid = 81,	tb_coords = {{219,210}, {232,191}},	sz_name = "������"},
	[4]	= {n_level = 90,	n_series = 1, 	n_npcid = 1358, n_mapid = 183,	tb_coords = {{204,214}, {183,167}},	sz_name = "����а��"},
	[5]	= {n_level = 90,	n_series = 2, 	n_npcid = 1360, n_mapid = 154,	tb_coords = {{39,107}, {69,82}}, 	sz_name = "������"},
	[6]	= {n_level = 90,	n_series = 3, 	n_npcid = 1361, n_mapid = 115,	tb_coords = {{195,205},{180,176}},	sz_name = "����ɱ��"},
	[7]	= {n_level = 90,	n_series = 0, 	n_npcid = 1356, n_mapid = 59, 	tb_coords = {{188,195},{237,192}}, 	sz_name = "���콫��"},
	[8]	= {n_level = 90,	n_series = 3, 	n_npcid = 1362, n_mapid = 45, 	tb_coords = {{208,202},{199,192}}, 	sz_name = "ʮ������"},
	[9]	= {n_level = 90,	n_series = 4, 	n_npcid = 1364,	n_mapid = 131,	tb_coords = {{173,208},{202,190}}, 	sz_name = "������"},
	[10]= {n_level = 90,	n_series = 0, 	n_npcid = 1355,	n_mapid = 103,	tb_coords = {{180,220},{199,180}}, 	sz_name = "��ͨ"},
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
			WriteBossLog(format("%s:%s,%d,%d,%d", "С�ƽ�BOSS", szname, nmap, nx, ny));
		end
	end
	SubWorld = nOldSubWorld;
end;

function WriteBossLog(szLog)
	WriteLog("[CALLBOSS FIXURE]\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t")..szLog);
end;

------------ ���Ƿָ���----------------------------------------------
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
