IncludeLib("FILESYS")
IncludeLib("RELAYLADDER")
IncludeLib("TITLE")
IncludeLib("ITEM")

BID_DATA = "\\data\\tongbid.dat"
LEVELTOP10 = "\\data\\bestlevel.dat"
LEADER_MEMBER = "\\data\\leadmember.dat"
BID_LEADER = "\\data\\bidleader.dat"

TITLETIME = 30 * 24 * 60 * 60 * 18
FRAME2TIME = 18
TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TRYOUT_TIMER_2 = 4 * 60 * 60 * FRAME2TIME; --Ϊ4Сʱ

MATCH_TIMER_1 = 10 * FRAME2TIME; --5�빫��һ��ս��
MATCH_TIMER_2 = 10 * 60 * FRAME2TIME; --Ϊ10����

CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

Faction = {
			{"\\data\\shaolin_top5.dat", "ShaoLin_Top5", "����"},
			{"\\data\\tianwang_top5.dat", "TianWang_Top5", "����"},
			{"\\data\\tangmen_top5.dat", "TangMen_Top5", "����"},
			{"\\data\\wudu_top5.dat", "Wudu_Top5", "�嶾"},
			{"\\data\\emei_top5.dat", "EMei_Top5", "��ü"},
			{"\\data\\cuiyan_top5.dat", "CuiYan_Top5", "����"},
			{"\\data\\gaibang_top5.dat", "GaiBang_Top5", "ؤ��"},
			{"\\data\\tianren_top5.dat", "TianRen_Top5", "����"},
			{"\\data\\wudang_top5.dat", "WuDang_Top5", "�䵱"},
			{"\\data\\kunlun_top5.dat", "KunLun_Top5", "����"}
		  }
FactionTitle = {
				"���ִ�����ָ���",
				"���ִ����������",
				"���ִ�����Ÿ���",
				"���ִ���嶾����",
				"���ִ���ü����",
				"���ִ����̸���",
				"���ִ��ؤ�����",
				"���ִ�����̸���",
				"���ִ���䵱����",
				"���ִ�����ظ���",
				}
CP_TASKID_REGIST = 1083		--1����������9��ȡ����Ԥѡ���ʸ�
CP_TASKID_POINT = 1084		--��¼Ԥѡ���÷�
CP_TASKID_TITLE = 1085		--9����¼��ȡ�þ���Ȧ�ʸ�
CP_TASKID_BID = 1086		--
CP_TASKID_ENEMY = 1087		--Ԥ��ʱ���ֵ���Ӫ��
CP_TASKID_ROUND = 1088		--�����Ĵ���
CP_TASKID_WIN = 1089		--Ӯ�Ĵ���
CP_TASKID_LOSE = 1090		--��Ĵ������������䣬���޷���¼
CP_TASKID_TIE = 1091		--ƽ�ֵĴ���
CP_TASKID_FLAG = 1092		--�����˳������ı�ǣ�����һ�볡ʱˢ��
CP_TASKID_BACKCONT = 1093	--���ڲ���Ͷ�����Ҹ���Ͷ���ܽ��ж���ȡ����
CP_TASKID_LOGOUT = 1094		--Ϊ 0 ʱ���������˳���Ϊ 1 ʱ��ʾ�������˳����統����δ�������ݡ�������ԭ��
CP_CASH = 100000
CP_MAXROUND = 30
CP_PLNUM_LIMT = 10
CP_PLNUM_LIMT_ESPECIAL = 4	--�嶾�����š������������� ����4��
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}
CP_MAPTAB = {
				{396, 397, "����"},
				{398, 399, "����"},
				{400, 401, "����"},
			 	{402, 403, "�嶾"},
			 	{404, 405, "��ü"},
			 	{406, 407, "����"},
			 	{408, 409, "ؤ��"},
			 	{410, 411, "����"},
			 	{412, 413, "�䵱"},
			 	{414, 415, "����"}
			 }
			 
CP_AWARD_ITEM = {
					{"��ˮ��", {4, 239}, 10},
					{"��ˮ��", {4, 238}, 10},
					{"��ˮ��", {4, 240}, 10},
					{"�ɺ챦ʯ", {4, 353}, 10},
					{"4��������ʯ", {6, 1, 147, 4, 0, 0}, 5},
					{"5��������ʯ", {6, 1, 147, 5, 0, 0}, 100},
					{"6��������ʯ", {6, 1, 147, 6, 0, 0}, 300},
					{"��Ե¶", {6, 1, 124, 1, 0, 0}, 100},
					{"�и�Ե¶", {6, 1, 123, 1, 0, 0}, 200},
					{"С��Ե¶", {6, 1, 122, 1, 0, 0}, 400},
					{"�ɲ�¶", {6, 1, 71, 1, 0, 0}, 1000},
					{"��ɽ��¶", {6, 1, 72, 1, 0, 0}, 1125},
					{"��׾���", {6, 1, 130, 1, 0, 0}, 200},
					{"õ�廨", {6, 0, 20, 1, 0, 0}, 1700},
					{"������ӡ��", {6, 1, 18, 1, 0, 0}, 1700},
					{"���������", {4, 489}, 300},
					{"����", {6, 0, 11, 1, 0, 0}, 1700},
				}

CP_FORBID_ITEM = {
					{	"������", {6, 1, 218, 1, 0, 0}, 511	},
					{	"������", {6, 1, 219, 1, 0, 0}, 512	},
					{	"�շ���", {6, 1, 220, 1, 0, 0}, 513	},
					{	"������", {6, 1, 221, 1, 0, 0}, 514	},
					{	"������", {6, 1, 222, 1, 0, 0}, 515	},
					{	"�����", {6, 1, 223, 1, 0, 0}, 516	},
					{	"�׷���", {6, 1, 224, 1, 0, 0}, 517	},
					{	"������", {6, 1, 225, 1, 0, 0}, 518	},
					{	"������", {6, 1, 226, 1, 0, 0}, 519	},
					{	"������", {6, 1, 227, 1, 0, 0}, 520	},
					{	"������", {6, 1, 228, 1, 0, 0}, 521	},
					{	"�չ���", {6, 1, 229, 1, 0, 0}, 522	},
					{	"������", {6, 1, 230, 1, 0, 0}, 523	},
					{	"������", {6, 1, 231, 1, 0, 0}, 524	},
					{	"����", {6, 1, 232, 1, 0, 0}, 525	},
					{	"�׹���", {6, 1, 233, 1, 0, 0}, 526	},
					{	"������", {6, 1, 234, 1, 0, 0}, 527	},
					{	"������", {6, 1, 235, 1, 0, 0}, 528	},
					{	"�̺쵤", {6, 1, 115, 1, 0, 0}, 450	},
					{	"������", {6, 1, 116, 1, 0, 0}, 451	},
					{	"������", {6, 1, 117, 1, 0, 0}, 453	},
					{	"�ڶ���", {6, 1, 118, 1, 0, 0}, 454	},
					{	"�ڱ���", {6, 1, 119, 1, 0, 0}, 455	},
					{	"�ڻ���", {6, 1, 120, 1, 0, 0}, 456	},
					{	"������", {6, 1, 121, 1, 0, 0}, 457	},
					{	"������", {6, 0, 1, 1, 0, 0}, 256	},
					{	"������", {6, 0, 2, 1, 0, 0}, 257	},
					{	"������", {6, 0, 3, 1, 0, 0}, 258	},
					{	"������", {6, 0, 4, 1, 0, 0}, 259	},
					{	"������", {6, 0, 5, 1, 0, 0}, 260	},
					{	"������", {6, 0, 6, 1, 0, 0}, 261	},
					{	"������", {6, 0, 7, 1, 0, 0}, 262	},
					{	"�׷���", {6, 0, 8, 1, 0, 0}, 263	},
					{	"�����", {6, 0, 9, 1, 0, 0}, 264	},
					{	"�׷���", {6, 0, 10, 1, 0, 0}, 265	},
					{	"��������", {6, 0, 60, 1, 0, 0}, 401	},
					{	"�����±�", {6, 0, 61, 1, 0, 0}, 402	},
					{	"�ɰ��±�", {6, 0, 62, 1, 0, 0}, 403	},
					{	"�ٹ�¶", {6, 1, 73, 1, 0, 0}, 442	},
					{	"������", {6, 1, 19, 1, 0, 0}, 442	},
					{"�ƽ���",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\championship\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\championship\\trap\\trap_placetolinan.lua"
CP_BEGIN_BID_DATE = 5051200
CP_END_BID_DATE = 5051412
CP_UPTO_TRYOUT = 5051620
CP_END_TRYOUT = 5052224

CP_HELP_TRYOUT = {
					"<color=yellow>���ִ��Ԥѡ����������<color>, ѡ�� <color=yellow>ǰ5<color> ��ÿ�������вμӡ�ȫ�����ִ�ᡯ��ʮ������Ԥѡѡ��. Ԥѡ����16/5��22/5. ÿ��20:00��24:00����; ����ʱ��5����; ����ʱ��10����.",
					"Ԥѡ����ʼ֮��90�����µ���ҿ��������ִ�ᶷ���б������μӱ����������Ҫ��10���������ѡ�ÿ����ұ���֮�������Բμӱ���"..CP_MAXROUND.." ��. ����������ĳɼ������⣬����ȡ��������ı����ʸ�,���Ǳ�ȡ�������ʸ�����ﲻ���ټ�����������.",
					"Ԥѡ������ϵͳ�еĻ���ѡ��ǰ5��.��ұ���ʱ"..CP_MAXROUND.."�����ϣ�ʤһ����3�֣���1����1�֣���1�����÷֡���5��23��, ϵͳ����ѡ�������ɻ�����ߵ�5����Ҳμӡ�ȫ�����ִ�ᡯ'",
					"�μӹ�����ÿ���μӱ�������Ҷ�������ȡһ���Ľ�����ÿ�μ�һ�ֽ��õ�һ���Ľ���������֮�⣬��һ����Եõ�������Ʒ������������ʯ����Ե¶��ˮ��) "
				}
				
CP_HELP_BID = {
				"<color=yellow>�����������������<color>, һ����Ҫ�����ſ��Ե�������μ�ȫ����ӵ�����. ���ļ�ÿ��������100������ÿ����100����Ϊ��λ���ӡ�����ʱ���Ǵ�2005��5��12��12�㿪ʼ��5��14�ս���.",
				"�����μӾ��Ŀ�������ߵ��ˣ�����������۸� ��֪���Լ��ĳ��ۡ���5��14��12�㣬������ߵİ�����Ϊ�����������ӣ�ͬʱ�õ�����ӵ����ſ����о�����.����ʧ��Ҫ�����������쾺�۷�.ÿ�������50��������֤���Ǯһֱ�㹻",
				"����ӿ��Էַ�29�����־������Ƹ���������������������Ա�������.�����ս��������ʸ����ҾͲ��������ʸ��ˡ�"
				}

CP_HELP_FINAL = "<color=yellow>���ִ��<color>, �ɸ��������90�������1�Ӳμ�ȫ�������ִ�ᡣ���У�10�������������ʮ����֣�50����ʮ�����ɵ�ǰ5����������;����30���н�ѡ��1��������ӡ���������ʸ������ʣ�µ�29����˭���ʸ�μ����յı�����"

function transtoplace()
Say("���������������Ԥѡ��Բ�����������ڿ��Ե���������������Ա���������������ȡ��Ӧ�ĳƺš������ڴ����ִ��Ŀ�ʼ.", 0)
do return end
	if (GetLevel() < 90) then
		Say("��Ҫ��90�����ϲſ��Խ������ִ�����������������!", 0)
		return
	end
	if (GetLastFactionNumber() == -1) then
		Say("������������: ֻ��10�����ɵ��˲ſ��Բμ����ִ�ᣬ��������ʿ���ܲμӡ�����10������֮��ſ��Բμӱ���!", 0)
		return
	elseif(nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		Msg2Player("�㻹û�б���������������������Ա�������μӱ���!")
		NewWorld(176, 1444, 3256)
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--�嶾
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ؤ��
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--�䵱
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--����
		end
		Talk(1, "", "���ѽ������ִ���������뵽��ս�� (189, 188) , (191, 190) , (185, 187) ��μ���ֱ���!")
	end
end

function checkmap(flag)
	local mapid = SubWorldIdx2ID(SubWorld)
	local ladder = 0
	if (mapid == 397 or mapid == 396) then
		mapname = "����"
		ladder = 10120
	elseif (mapid == 399 or mapid == 398) then
		mapname = "����"
		ladder = 10121
	elseif (mapid == 401 or mapid == 400) then
		mapname = "����"
		ladder = 10122
	elseif (mapid == 403 or mapid == 402) then
		mapname = "�嶾"
		ladder = 10123
	elseif (mapid == 405 or mapid == 404) then
		mapname = "��ü"
		ladder = 10124
	elseif (mapid == 407 or mapid == 406) then
		mapname = "����"
		ladder = 10125
	elseif (mapid == 409 or mapid == 408) then
		mapname = "ؤ��"
		ladder = 10126
	elseif (mapid == 411 or mapid == 410) then
		mapname = "����"
		ladder = 10127
	elseif (mapid == 413 or mapid == 412) then
		mapname = "�䵱"
		ladder = 10128
	elseif (mapid == 415 or mapid == 414) then
		mapname = "����"
		ladder = 10129
	end
	if (flag == 1) then
		return mapname
	elseif(flag == 2) then
		return ladder
	end
end

function help_bid()
	Talk(1, "help_bid_2", CP_HELP_BID[1])
end

function help_bid_2()
	Talk(2, "", CP_HELP_BID[2], CP_HELP_BID[3])
end
function help_tryout()
	Talk(2, "help_tryout_2", CP_HELP_TRYOUT[1], CP_HELP_TRYOUT[2])
end;

function help_tryout_2()
	Talk(2, "", CP_HELP_TRYOUT[3], CP_HELP_TRYOUT[4])
end

function help_final()
	Talk(1, "", CP_HELP_FINAL)
end

function help_championship()
	Say("�����������ı�?", 4, "�������������/help_bid", "���������������Ԥѡ��/help_tryout", "���ִ��/help_final", "��֪����!/OnCancel")
end

function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 1
	end
	return nil
end

function AddAword(level, fac, result)
	local awardpro = {}
	if (level >120) then
		level = 120
	end
	aword = (700 + floor((level * 4 - 350) / 5) * 100) * 60 * fac
	AddOwnExp(aword)
	if( result == 0 )then
		return
	end
	for i = 1, getn(CP_AWARD_ITEM) do
		awardpro[i] = CP_AWARD_ITEM[i][3]
	end
	numth = randByProbability(awardpro)
	if (getn(CP_AWARD_ITEM[numth][2]) == 6 ) then
		AddItem(CP_AWARD_ITEM[numth][2][1], CP_AWARD_ITEM[numth][2][2], CP_AWARD_ITEM[numth][2][3], CP_AWARD_ITEM[numth][2][4], CP_AWARD_ITEM[numth][2][5], CP_AWARD_ITEM[numth][2][6])
	else
		AddEventItem(CP_AWARD_ITEM[numth][2][2])
	end
	Msg2Player("��õ�1��"..CP_AWARD_ITEM[numth][1])
end

function randByProbability(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 1009 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- ��������״̬
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_gettask(nTaskID)
	return GetTask(nTaskID)
end


------------------------------------------------------------------------------------------
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
	return TabFile_GetRowCount(mapfile) - 1
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row + 1, col))
	end
end
------------------------------------------------------------------------------------
-- ��һ���ļ�
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--����ļ��е�szSection��key��ֵ
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--�����ļ��е�szSection��keyֵΪszValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
function Sort_Point(array)
	local orgindex = PlayerIndex
	local point_1 = 0
	local point_2 = 0
	local wincount_1 = 0
	local wincount_2 = 0
	local winrate_1 = 0
	local winrate_2 = 0
	for i = 1, getn(array) do
		for j = getn(array), 2, -1 do
			PlayerIndex = array[j]
			point_1 = nt_gettask(CP_TASKID_ROUND)
			wincount_1 = nt_gettask(CP_TASKID_WIN)
			if (point_1 == 0 or wincount_1 == 0) then
				winrate_1 = 0
			else
				winrate_1 = wincount_1/point_1
			end
			
			PlayerIndex = array[j - 1]
			point_2 = nt_gettask(CP_TASKID_ROUND)
			wincount_2 = nt_gettask(CP_TASKID_WIN)
			if (point_2 == 0 or wincount_2 == 0) then
				winrate_2 = 0
			else
				winrate_2 = wincount_2/point_2
			end
			
			if (winrate_1 > winrate_2) then
				a = array[j]
				array[j] = array[j - 1]
				array[j - 1] = a
			end
		end
	end
	PlayerIndex = orgindex
	return array
end

function OnCancel()
end
