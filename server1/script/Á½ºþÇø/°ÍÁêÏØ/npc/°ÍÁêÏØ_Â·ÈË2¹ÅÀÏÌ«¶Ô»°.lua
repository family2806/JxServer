IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
--Include("\\script\\global\\writeaddressdialog.lua")

local tbFaction =
{
	[1] =
	{
		szShowName = "������",
		szFaction = "shaolin",
		nShortFaction = "sl",
		tbSkill = {318, 319, 321, 709, 1055, 1056, 1057},
		tbEquip =
		{
			{
				szFaction = "ȭ����",
				nFirstEquipId = 2285,
				tbEquipName =
				{
					"�׻�֮�ռ�����", "�׻�֮�ռ�ɮñ", "�׻�֮�ռ��Ͻ�", "�׻�֮�ռû���", "�׻�֮�ռ�����",
					"�׻�֮�ռ�����", "�׻�֮�ռò���", "�׻�֮�ռ�ɮЬ", "�׻�֮�ռ���׹", "�׻�֮�ռ��½�",
				},
			},
			{
				szFaction = "������",
				nFirstEquipId = 2295,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮����ɮñ", "�׻�֮�����Ͻ�", "�׻�֮��������", "�׻�֮��������",
					"�׻�֮��������", "�׻�֮����ɮ��", "�׻�֮����ɮЬ", "�׻�֮������׹", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "������",
				nFirstEquipId = 2305,
				tbEquipName =
				{
					"�׻�֮Ħ������", "�׻�֮Ħ��ɮñ", "�׻�֮Ħ���Ͻ�", "�׻�֮Ħ�Ụ��", "�׻�֮Ħ������",
					"�׻�֮Ħ������", "�׻�֮Ħ��䵶", "�׻�֮Ħ��ɮЬ", "�׻�֮Ħ����׹", "�׻�֮Ħ���½�",
				},
			},
		},
	},
	[2] =
	{
		szShowName = "������",
		szFaction = "tianwang",
		nShortFaction = "tw",
		tbSkill = {322, 325, 323, 708, 1058, 1059, 1060},
		tbEquip =
		{
			{
				szFaction = "������",
				nFirstEquipId = 2315,
				tbEquipName =
				{
					"�׻�֮������", "�׻�֮�����", "�׻�֮�����Ͻ�", "�׻�֮��������", "�׻�֮��������",
					"�׻�֮������", "�׻�֮���ⴸ", "�׻�֮����ѥ", "�׻�֮������", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "ǹ����",
				nFirstEquipId = 2325,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮�����", "�׻�֮�����Ͻ�", "�׻�֮��������", "�׻�֮��������",
					"�׻�֮������", "�׻�֮����ǹ", "�׻�֮����ѥ", "�׻�֮������׹", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "������",
				nFirstEquipId = 2335,
				tbEquipName =
				{
					"�׻�֮쮷�����", "�׻�֮쮷��", "�׻�֮쮷��Ͻ�", "�׻�֮쮷�����", "�׻�֮쮷�����",
					"�׻�֮쮷���", "�׻�֮쮷籦��", "�׻�֮쮷�ѥ", "�׻�֮쮷���׹", "�׻�֮쮷��½�",
				},
			},
		},
	},
	[3] =
	{
		szShowName = "����",
		szFaction = "tangmen",
		nShortFaction = "tm",
		tbSkill = {339, 302, 342, 710, 1069, 1070, 1071},
		tbEquip =
		{
			{
				szFaction = "�ɵ�����",
				nFirstEquipId = 2405,
				tbEquipName =
				{
					"�׻�֮��Ӱ����", "�׻�֮��Ӱ��", "�׻�֮��Ӱ�Ͻ�", "�׻�֮��Ӱ����", "�׻�֮��Ӱ����",
					"�׻�֮��Ӱ��", "�׻�֮��Ӱ�ɵ�", "�׻�֮��Ӱ��", "�׻�֮��Ӱ��׹", "�׻�֮��Ӱ�½�",
				},
			},
			{
				szFaction = "������",
				nFirstEquipId = 2415,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮�����", "�׻�֮�����Ͻ�", "�׻�֮���⻤��", "�׻�֮��������",
					"�׻�֮�����", "�׻�֮�����", "�׻�֮������", "�׻�֮����׹", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "������",
				nFirstEquipId = 2425,
				tbEquipName =
				{
					"�׻�֮�������", "�׻�֮��𷢹�", "�׻�֮����Ͻ�", "�׻�֮�����", "�׻�֮�������",
					"�׻�֮������", "�׻�֮������", "�׻�֮�����", "�׻�֮�����׹", "�׻�֮����½�",
				},
			},
		},
	},
	[4] =
	{
		szShowName = "�嶾��",
		szFaction = "wudu",
		nShortFaction = "wu",
		tbSkill = {353, 355, 711, 1066, 1067},
		tbEquip =
		{
			{
				szFaction = "���嶾",
				nFirstEquipId = 2385,
				tbEquipName =
				{
					"�׻�֮��ɰ����", "�׻�֮��ɰ����", "�׻�֮��ɰ�Ͻ�", "�׻�֮��ɰ����", "�׻�֮��ɰ����",
					"�׻�֮��ɰ��װ", "�׻�֮��ɰ����", "�׻�֮��ɰѥ", "�׻�֮��ɰ��׹", "�׻�֮��ɰ�½�",
				},
			},
			{
				szFaction = "���嶾",
				nFirstEquipId = 2395,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮���鷢��", "�׻�֮�����Ͻ�", "�׻�֮���黤��", "�׻�֮��������",
					"�׻�֮������װ", "�׻�֮���鱦��", "�׻�֮����ѥ", "�׻�֮������׹", "�׻�֮�����½�",
				},
			},
		},
	},
	[5] =
	{
		szShowName = "������",
		szFaction = "emei",
		nShortFaction = "em",
		tbSkill = {380, 328, 712, 1061, 1062, 1114},
		tbEquip =
		{
			{
				szFaction = "����ü",
				nFirstEquipId = 2345,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮���Ʒ���", "�׻�֮�����Ͻ�", "�׻�֮���ƻ���", "�׻�֮��������",
					"�׻�֮����ɴ��", "�׻�֮���Ƴ���", "�׻�֮����ѥ", "�׻�֮��������", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "�ƶ�ü",
				nFirstEquipId = 2355,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮���񷢴�", "�׻�֮�����Ͻ�", "�׻�֮������", "�׻�֮��������",
					"�׻�֮������", "�׻�֮�������", "�׻�֮����ѥ", "�׻�֮��������", "�׻�֮�����½�",
				},
			},
		},
	},
	[6] =
	{
		szShowName = "������",
		szFaction = "cuiyan",
		nShortFaction = "cy",
		tbSkill = {336, 337, 713, 1063, 1065},
		tbEquip =
		{
			{
				szFaction = "������",
				nFirstEquipId = 2365,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮������", "�׻�֮�����Ͻ�", "�׻�֮������", "�׻�֮��������",
					"�׻�֮������", "�׻�֮���ձ���", "�׻�֮����ѥ", "�׻�֮��������", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "�ڴ���",
				nFirstEquipId = 2375,
				tbEquipName =
				{
					"�׻�֮�ò�����", "�׻�֮�ò���", "�׻�֮�ò��Ͻ�", "�׻�֮�ò���", "�׻�֮�ò�����",
					"�׻�֮�ò���", "�׻�֮�ò�ԧ�쵶", "�׻�֮�ò�ѥ", "�׻�֮�ò�����", "�׻�֮�ò��½�",
				},
			},
		},
	},
	[7] =
	{
		szShowName = "ؤ��",
		szFaction = "gaibang",
		nShortFaction = "gb",
		tbSkill = {357, 359, 714, 1073, 1074},
		tbEquip =
		{
			{
				szFaction = "��ؤ��",
				nFirstEquipId = 2435,
				tbEquipName =
				{
					"�׻�֮��������", "�׻�֮����ͷ��", "�׻�֮�����Ͻ�", "�׻�֮��������", "�׻�֮��������",
					"�׻�֮����ؤ��", "�׻�֮��������", "�׻�֮����ѥ", "�׻�֮������׹", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "��ؤ��",
				nFirstEquipId = 2445,
				tbEquipName =
				{
					"�׻�֮�ͽ�����", "�׻�֮�ͽ�ͷ��", "�׻�֮�ͽ��Ͻ�", "�׻�֮�ͽ令��", "�׻�֮�ͽ�����",
					"?׻�֮�ͽ��?", "�׻�֮�ͽ���", "�׻�֮�ͽ�ѥ", "�׻�֮�ͽ���׹", "�׻�֮�ͽ��½�",
				},
			},
		},
	},
	[8] =
	{
		szShowName = "���̽�",
		szFaction = "tianren",
		nShortFaction = "tr",
		tbSkill = {361, 362, 715, 1075, 1076},
		tbEquip =
		{
			{
				szFaction = "ս����",
				nFirstEquipId = 2455,
				tbEquipName =
				{
					"�׻�֮��ڤ��Ȧ", "�׻�֮��ڤ��", "�׻�֮��ڤ�Ͻ�", "�׻�֮��ڤ����", "�׻�֮��ڤ����",
					"�׻�֮��ڤ��", "�׻�֮��ڤǹ", "�׻�֮��ڤѥ", "�׻�֮��ڤ��", "�׻�֮��ڤ�½�",
				},
			},
			{
				szFaction = "ħ����",
				nFirstEquipId = 2465,
				tbEquipName =
				{
					"�׻�֮ɷ������", "�׻�֮ɷ�׹���", "�׻�֮ɷ���Ͻ�", "�׻�֮ɷ�׻���", "�׻�֮ɷ������",
					"�׻�֮ɷ�׼���", "�׻�֮ɷ�׵�", "�׻�֮ɷ��ѥ", "�׻�֮ɷ����", "�׻�֮ɷ���½�",
				},
			},
		},
	},
	[9] =
	{
		szShowName = "�䵱��",
		szFaction = "wudang",
		nShortFaction = "wd",
		tbSkill = {365, 368, 716, 1078, 1079},
		tbEquip =
		{
			{
				szFaction = "���䵱",
				nFirstEquipId = 2475,
				tbEquipName =
				{
					"�׻�֮������", "�׻�֮������", "�׻�֮�����Ͻ�", "�׻�֮������", "�׻�֮��������",
					"�׻�֮��������", "�׻�֮������", "�׻�֮������", "�׻�֮��������", "�׻�֮�����½�",
				},
			},
			{
				szFaction = "���䵱",
				nFirstEquipId = 2485,
				tbEquipName =
				{
					"�׻�֮������", "�׻�֮������", "�׻�֮�����Ͻ�", "�׻�֮������", "�׻�֮��������",
					"�׻�֮������", "�׻�֮������", "�׻�֮������", "�׻�֮��������", "�׻�֮�����½�",
				},
			},
		},
	},
	[10] =
	{
		szShowName = "������",
		szFaction = "kunlun",
		nShortFaction = "kl",
		tbSkill = {372, 375, 717, 1080, 1081},
		tbEquip =
		{
			{
				szFaction = "������",
				nFirstEquipId = 2495,
				tbEquipName =
				{
					"�׻�֮�������", "�׻�֮�����", "�׻�֮����Ͻ�", "�׻�֮�����", "�׻�֮�������",
					"�׻�֮�����", "�׻�֮�����", "�׻�֮���ѥ", "�׻�֮�����", "�׻�֮����½�",
				},
			},
			{
				szFaction = "������",
				nFirstEquipId = 2505,
				tbEquipName =
				{
					"�׻�֮��˪��", "�׻�֮��˪����", "�׻�֮��˪�Ͻ�", "�׻�֮��˪����", "�׻�֮��˪����",
					"�׻�֮��˪����", "�׻�֮��˪����", "�׻�֮��˪ѥ", "�׻�֮��˪��", "�׻�֮��˪�½�",
				},
			},
		},
	},
}

local tbEquipFreeCell =
{
	{2, 1}, {2, 2}, {1, 1}, {1, 2}, {2, 1}, --�������������Ͻ䣬��������
	{2, 3}, {2, 4}, {2, 2}, {1, 2}, {1, 1}, --���������ѥ�ӣ���׹���½�
}

local tbFactionSeries =
{
	[1] = {1, 2},
	[2] = {3, 4},
	[3] = {5, 6},
	[4] = {7, 8},
	[5] = {9, 10},
}

local tbFreeItem =
{
	{szName="�����������", tbProp={6,1,1781,1,0,0}, tbParam={60}},
	{szName="Ь��ͼ", tbProp={6,1,298,1,0,0}},
	{szName="�߼��Ի͹�", tbProp={6,1,1075,1,0,0}},
	{szName="��ս���", tbProp={6,1,2006,1,0,0}},
	{szName="ʮȫ��", tbProp={6,1,1399,1,0,0}},
	{szName="�׵��ر�", tbProp={6,1,2805,1,0,0}},
	{szName="�ν����", tbProp={6,1,1477,1,0,0}},
	{szName="Ǭ��������", tbProp={6,1,2894,1,0,0}},
	{szName="����", tbProp={6,1,2517,1,0,0}},
	{szName="������", tbProp={6,1,2349,1,0,0}},
	{szName="�׻���", tbProp={6,1,2357,1,0,0}},
	{szName="������", tbProp={6,1,2370,1,0,0}},
	{szName="����", tbProp={0,10,18,1,0,0}, nWidth=2, nHeigth=3},
}

local tbGMAccount = {"sccddp", "sccddp", "sccddp", "sccddp", "sccddp"}

function main()
	dialog_main()
end
function reload()
	LoadScript ("\\script\\global\\·��_���.lua")
	LoadScript ("\\script\\global\\��������.lua")
end
--=========================================================================================	
IncludeLib("FILESYS")

tangburan = "\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"

wangzuo = "\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"
qingxiaoshitai = "\\settings\\maps\\������\\Į����ԭ\\qingxiaoshitaiboss.txt"
shansinan = "\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"

yanxiaoqian = "\\settings\\maps\\��ԭ����\\����ɱ���\\yanxiaoqianboss.txt"
baiyingying = "\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"
herenwo = "\\settings\\maps\\��ԭ����\\������ϰ�\\herenwoboss.txt"

xuanjizi = "\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"
xuanjuedashi = "\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"

hanmeng = "\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"

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
	
function BigBoss()
	--19:30 
	--if (tonumber(date("%H")) == 19) then
		mb_mapindex = SubWorldID2Idx(341)
		if (mb_mapindex >= 0 ) then
			posx3, posy3 = getadata(qingxiaoshitai)--Į����ԭ	19��30
			AddNpcEx(743, 95, 2, mb_mapindex, posx3*32, posy3*32, 1, "���ʦ̫", 1)		
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS3�����ʦ̫����Į����ԭx��"..posx3..",y��".. posy3)
         AddGlobalNews("���ʦ̫������Į����ԭ("..floor(posx3/8)..","..floor(posy3/16)..")")		
		end

		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx5, posy5 = getadata(yanxiaoqian)--����ɱ���336	--��ԭ����		19��30
			AddNpcEx(744, 95, 2, fl_mapindex, posx5*32, posy5*32, 1, "����ٻ", 1)		
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS5������ٻ���ڷ���ɱ���x��"..posx5..",y��".. posy5)
		AddGlobalNews("��Сٻ�����ڷ���ɱ��� ("..floor(posx5/8)..","..floor(posy5/16)..")")
		end
	
		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx7, posy7 = getadata(herenwo)--������ϰ�336	--��ԭ����	19��30
			AddNpcEx(745, 95, 3, fl_mapindex, posx7*32, posy7*32, 1, "������", 1)			
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS7�������ҡ��ڷ�����ϰ�x��"..posx7..",y��".. posy7)	
		AddGlobalNews("�����ҳ����ڷ�����ϰ�("..floor(posx7/8)..","..floor(posy7/16)..")")
		end;
	
		cbn_mapindex = SubWorldID2Idx(321)--����ɽ��321		--������		19��30
		if (cbn_mapindex >= 0) then
			posx8, posy8 = getadata(xuanjizi)
			AddNpcEx(747, 95, 4, cbn_mapindex, posx8*32, posy8*32, 1, "�����", 1)		
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS8������ӡ��ڳ���ɽ��x��"..posx8..",y��".. posy8)	
		AddGlobalNews("����ӳ����ڳ���ɽ��("..floor(posx8/8)..","..floor(posy8/16)..")")
		end
	--end
	
	--21:00
	--if (tonumber(date("%H")) == 21) then
		mb_mapindex = SubWorldID2Idx(341)--Į����ԭ	21��00
		if (mb_mapindex >= 0 ) then
			posx4, posy4 = getadata(shansinan)
			AddNpcEx(746, 95, 4, mb_mapindex, posx4*32, posy4*32, 1, "��˼��", 1)		
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS4����˼�ϡ���Į����ԭx��"..posx4..",y��".. posy4)
           AddGlobalNews("��˼�ϳ�����Į����ԭ("..floor(posx4/8)..","..floor(posy4/16)..")")		
		end;
	
		fl_mapindex = SubWorldID2Idx(336)--����ɱ���	21��00
		if (fl_mapindex >= 0 ) then
			posx6, posy6 = getadata(baiyingying)
			AddNpcEx(742, 95, 1, fl_mapindex, posx6*32, posy6*32, 1, "��ӨӨ", 1)		
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS6����ӨӨ���ڷ���ɱ���x��"..posx6..",y��".. posy6)
		AddGlobalNews("��ӨӨ�����ڷ���ɱ���("..floor(posx6/8)..","..floor(posy6/16)..")")
		end

		xsy_mapindex = SubWorldID2Idx(342)		--��ɽ��342		������		21��00
		if (xsy_mapindex >= 0) then
			posx10, posy10 = getadata(hanmeng)
			AddNpc(748, 95, xsy_mapindex, posx10*32, posy10*32, 1, "����", 1)
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS9�����ɡ�����ɽ��x��"..posx10..",y��".. posy10)
		AddGlobalNews("���ɳ�������ɽ�� ("..floor(posx10/8)..","..floor(posy10/16)..")")
		end
		
		damahu_boss()	--�ƽ�boss���������������Ī�߿ߡ�����ɽ�ϡ�����ɽ��
	--end
	
	--23:00
	--if (tonumber(date("%H")) == 23) then
		mg_mapindex = SubWorldID2Idx(340)--Ī�߿�340	--��������	23��00
		if (mg_mapindex >= 0 ) then
			posx1, posy1 = getadata(tangburan)
			AddNpcEx(741, 95, 1, mg_mapindex, posx1*32, posy1*32, 1, "�Ʋ�Ⱦ", 1)		
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS1���Ʋ�Ⱦ����Ī�߿�x��"..posx1..",y��".. posy1)
		AddGlobalNews("�Ʋ�Ⱦ������Ī�߿� ("..floor(posx1/8)..","..floor(posy1/16)..")")
		end;

		mb_mapindex = SubWorldID2Idx(341)--Į����ԭ341	--����	23��00
		if (mb_mapindex >= 0 ) then
			posx2, posy2 = getadata(wangzuo)
			AddNpcEx(739, 95, 0, mb_mapindex, posx2*32, posy2*32, 1, "����", 1)			
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS2����������Į����ԭx��"..posx2..",y��".. posy2)
		 AddGlobalNews("����������Į����ԭ ("..floor(posx2/8)..","..floor(posy2/16)..")")
		end
	 
		cbb_mapindex = SubWorldID2Idx(322)--����ɽ��322		--������		23��00
		if (cbb_mapindex >= 0) then
			posx9, posy9 = getadata(xuanjuedashi)
			AddNpcEx(740, 95, 0, cbb_mapindex, posx9*32, posy9*32, 1, "������ʦ", 1)	
			WriteLog("ʱ��"..date("%H%M%S").."�������ƽ�BOSS9��������ʦ���ڳ���ɽ��x��"..posx9..",y��".. posy9)
		AddGlobalNews("������ʦ�����ڳ���ɽ��("..floor(posx9/8)..","..floor(posy9/16)..")")
		end
	--end
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
	--�����������ͼ���һ��
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
    	mapname = "����ɽ��"
    	file = "\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"
   elseif (damahu_mapid == 322) then
    	mapname = "����ɽ��"
    	file = "\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"
    elseif (damahu_mapid == 340) then
    	mapname = "Ī�߿�"
    	file = "\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"
    end
    
    if (damahu_mapindex >= 0) then
    --������ô������������ԡ���ģ��id
	rannum = random(10)
    	posx,posy =getadata(file)
    	local npcidx = AddNpcEx(DAMAHUID[rannum][1], 95, DAMAHUID[rannum][2], damahu_mapindex, posx*32, posy*32, 1, "����", 1)
    	SetNpcDeathScript(npcidx, "\\script\\missions\\boss\\bossdeath.lua");
	WriteLog("ʱ��"..date("%H%M%S")..": ���ֻƽ�BOSS'����' mapid:"..damahu_mapid..", ����x:"..posx..", y:".. posy..". ����ID ��"..DAMAHUID[rannum][1]..", ��������:"..DAMAHUID[rannum][2])
	AddGlobalNews("����������"..mapname.." ("..floor(posx/8)..","..floor(posy/16)..")")
	end
end



--==========================================================================================

Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

function dmcreattongtest()
local strTongName = GetTongName()
local tszTitle = "��ӭ���뽣����Ե <color=yellow>������<color> ϵͳ��"
if (strTongName == nil or strTongName == "") then
	Say(tszTitle,4,"���㴴���������/dmcreatetong","�������������/dmjointong","�������/dmcreateit","�����Ի�")
else
	Say(tszTitle,0)
end	
end

function dmcreatetong()	
if  GetCamp() ~= 4 then
		SetCamp(4)
		SetCurCamp(4)
		AddRepute(100000)
		AddLeadExp(1000000)
		AddLeadExp(1000000)

		AddLeadExp(1000000)

		AddEventItem(195)
		Earn(1000000)
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
Msg2Player("<color=yellow>�����ɹ����ɽ��а�ᴴ����<color>")
else
end
end

function dmjointong()
if  GetCamp() ~= 4 then

		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end

		SetCamp(4)
		SetCurCamp(4)
Msg2Player("<color=yellow>�����ɹ����ɽ��а�ᴴ����<color>")
else
end
end

function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("���������ˣ�����������İ�ᣬ���������ҵ�ɡ�" ,2,"��ʼ����/Direct_CreateTong","�ٵ�һ��/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "��ң����������ˣ�������Ҫ������������һ����Ϊ�������ɳ�Ϊһ�������أ�", "���������ˣ�������Ҫȷ���Լ�ӵ����Ӧ���������������3����ҵ�����16��־ͬ����֮����֧Ԯ�㣬������Ҳ�޷���������������Գ�֮Ϊ�������ڡ���", "���������ˣ������κ�ʱ�������İ����������16��֮�󣬽�������������İ�����½��п��飬���������Ȳ��ָܻ���16�����ϣ�����ͬ����Ȼ���������İ�ᡣ", "���������ˣ����������㹻���쵼������Ӱ����֮�󣬾�ֻҪ�ҵ�һ���؄e����Ʒ��Ϊ�����������˵��ս���Ϸ���ɱ�п��Եõ�������", "��ң�������������˵��ѽ���", "���������ˣ�ԭ�����Ѿ�ӵ�����ˡ�������Ȼ������Ϊ��")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "���������ˣ�����뽨���Լ��İ�ᣬ��ҪΪ����������ʱ�侫������Ѫ���в��ɰ�;���ϡ�")
		else
			Talk(6,"", "���������ˣ����ʽ��������ʲô���������������Ľ���������", "���������ˣ�����������Ѿ���ʦ������������������㲻�������κΰ���У��ٴ���Ҫ����һ���Ľ���������������ͳ��������С��30����", "���������ˣ��ﵽ����ЩҪ�����ֻҪ��ս���ϻ��һ���������Դ���Ϊ��������Ϳ����˽�������ˡ�", "���������ˣ�������Ҫע����ǣ���Ҫȷ���Լ�ӵ����Ӧ��Ӱ�������쵼�������������3����ҵ�����16��־ͬ����֮����֧���㣬������Ҳ�޷�������������ͨ����֮Ϊ�������ڡ���", "���������ˣ������κ�ʱ�������İ����������16�˵Ļ�����������������İ�����½��п��飬���������Ȳ��ָܻ���16�����ϣ�����ͬ����Ȼ���������İ�ᡣ", "��?������ˣ���󣬿�������õ�������������Ҫ�����ʽ��������Ŀ��Ŭ���ɣ������ˣ?")
		end
	end
end

function create_pay()
	Say("���������ˣ���ô����ֻҪ���㹻���ʽ��ð����ܹ���ת�����Ϳ����ˣ�����˵�и�100�������Ӱɡ�" ,2,"û���}�����Ѿ���100����������/create_pay_yes","̫��Ǯ�ˣ���һ���в���/create_pay_no")

--	Say("���������ˣ���ô����ֻҪ���㹻���ʽ��ð����ܹ���ת�����Ϳ����ˣ�����˵�и�100�������Ӱɡ�" ,2,"û���}��?��Ѿ��?00����������/create_pay_yes","̫��Ǯ?ˣ���һ���в��?create_pay_no")
end
function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)				-- �շ�
		DelItem(195)			-- ɾ����ص���
		SetTask(99,1)				-- �����ϱ�ǣ�ͬʱ����Ϊ�����еĵ�һ���ˣ����������ˣ���
		Direct_CreateTong()		-- ��ʼ����
		
	else
		Talk(1,"", "���������ˣ���ά�ְ������������������Ǻܷ�Ǯ�ģ��������Ҳ�ּۻ��ۣ����Ϸ��������ǲ�Ҫ����ĺá�")	end
end


function Direct_CreateTong()
	CreateTong(1)				-- ��������Ի��򣬽����ű�����
end

--==========================================================================================

function dialog_main()
	local szTitle = "<npc>����Ⱥ��ս�Ϻ�����������ҫ���ݣ�6�±�����ʽ��������ʹ�ߴ�����ɽ��ʿ�ڴ˻�ӭ��·Ӣ�ۺ��ܣ���ʿ�ǿ���������Ҫ����������������鵤��ҩ��"
	local tbOpt =
	{
		{"���ϵͳ����", dmcreattongtest},
		{"��Ҫ������190��", level_up_to190},
		{"��Ҫת��", transfer},
		{"��Ҫѡ��ְҵ�������Ӧ��150����", choose_faction},
		{"��Ҫ��ȡ�׻���װ", show_faction},
      --  {"��ȡBOSS����", gm_functionboss},
		{"ˢ�ƽ���Ʒ", shua_wp},
		{"ˢ��Ʒ", shua_w},
		{"ˢ���", shua_m},
		{"�ٻ�BOSS", BigBoss},
		{"���ؽű�GM", reload},
        {"תGM�˺�", gm_function},
		{"��Ҫ��ȡ��Ʒ", show_item},
		{"��Ҫϴ��", clear_attibute_point},	
		{"ˢǮ", qian},	
		{"�����Ի�"},
	}
	local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
	if szAccount == %tbGMAccount[i] then
			tinsert(tbOpt, 1, {"תGM�˺�", gm_function})
			tinsert(tbOpt, 1, {"��ȡBOSS����", gm_functionboss})
			tinsert(tbOpt, 1, {"��Ҫ������190��", level_up_to190})
			tinsert(tbOpt, 1, {"��Ҫ��ȡ��Ʒ", show_item})
			tinsert(tbOpt, 1, {"��Ҫ��ȡ�׻���װ", show_faction})
			tinsert(tbOpt, 1, {"��Ҫϴ��", clear_attibute_point})
			break
		end
	end
	CreateNewSayEx(szTitle, tbOpt)
end

function gm_functionboss()
	--for i =1,10 do
		AddItem(6,1,3083,0,0,0)
--	end
end

function shua_wp()
--AskClientForNumber("wupinbianhao",0,"��������Ʒ���")nCount,
--AskClientForString("shuabyids","",1,50,"��������Ʒ����")
AskClientForNumber("wupinbianhao", 0, 10000, "����ƽ���Ʒ���")
end
function shua_w()
--AskClientForNumber("wupinbianhao",0,"��������Ʒ���")
--AskClientForString("shuabydis","",0,100,"��������Ʒ���")
AskClientForNumber("shuabydis", 0, 20000, "������Ʒ���")
end
function shuabydis(IDS)
AddItem(6,1,IDS,0,0,0)
end
function shua_m()
--AskClientForNumber("wupinbianhao",0,"��������Ʒ���")
--AskClientForString("shuabydis","",0,100,"��������Ʒ���")
AskClientForNumber("bianhao", 0, 20000, "������Ʒ���")
end
function bianhao(ID)
AddItem(0,11,ID,0,0,0)
end
function wupinbianhao(nEquipeId)
AddGoldItem(0,nEquipeId)
end
function qian()
Earn(100000000)
end

function gm_function()
	local nCurLevel = GetLevel()
	if nCurLevel < 150 then
		ST_LevelUp(150 - nCurLevel)
	end
	--SetFightState(0)
	--SetCamp(6)
	--SetCurCamp(6)
	AddMagic(732, 1)--˲��
	AddMagic(733, 1)--����
	if CalcFreeItemCellCount() >= 1 then
		local tbItem = {szName="����Ȩ��", tbProp={6,1,2766,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem, "gm�˺���ȡ����", 1)
	end
end

function level_up_to190()
	local nCurLevel = GetLevel()
	if nCurLevel >= 199 then
		if ST_IsTransLife() == 1 then
			Talk(1, "", "���Ѿ�190����")
		else
			Talk(1, "", "��ת����������")
		end
		return
	end
	local nAddLevel = 200 - nCurLevel
	ST_LevelUp(nAddLevel)
end

function transfer()
	if ST_IsTransLife() == 1 then
		Talk(1, "", "���Ѿ�ת����������ת")
		return
	end
	if GetLevel() < 190 then
		Talk(1, "", "�ȼ��ﵽ190����ת��")
		return
	end
	if (GetCash() <= 100000000) then
		Talk(1, "", "ת����Ҫ1��jxb���������û����ô��Ǯ���ܹ��������ɡ�")
		return
	end
	Pay(100000000)
	ST_DoTransLife()
end

function check_faction()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

function choose_faction()
	if check_faction() ~= 1 then
		Talk(1, "", "���Ѿ������������")
		return
	end
	local nSeries = GetSeries() + 1
	local tbOpt = {}
	for i=1, getn(%tbFactionSeries[nSeries]) do
		local nIndex = %tbFactionSeries[nSeries][i]
		tinsert(tbOpt, {%tbFaction[nIndex].szShowName, set_faction, {nIndex}})
	end
	tinsert(tbOpt, {"������һ��", dialog_main})
	tinsert(tbOpt, {"�����Ի�"})
	CreateNewSayEx("<npc>һ���������ɾͲ��ɸ��ģ��뿼�����", tbOpt)
end

function set_faction(nIndex)
	local szTitle = format("<npc>����һ��ѡ�������޸ģ�ֻ���Ըý�ɫ������ȷ��Ҫ����<color=yellow>%s<color>������", %tbFaction[nIndex].szShowName)
	local tbOpt =
	{
		{"ȷ��", do_set_faction, {nIndex}},
		{"������һ��", choose_faction},
		{"���ٿ���һ��"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function do_set_faction(nIndex)
	if check_faction() ~= 1 then
		Talk(1, "", "���Ѿ������������")
		return
	end
	local nResult = SetFaction(%tbFaction[nIndex].szFaction)
	if nResult == 0 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", %tbFaction[nIndex].nShortFaction, 0)
	for i=1, getn(%tbFaction[nIndex].tbSkill) do--90��120��150������
		AddMagic(%tbFaction[nIndex].tbSkill[i], 20)
	end
	AddMagic(210, 1)--һ���Ṧ
	Talk(1, "KickOutSelf", format("���ѳɹ�����%s", %tbFaction[nIndex].szShowName))
end

function show_faction()
	if check_faction() == 1 then
		Talk(1, "", "�������ɺ�ſ���ȡװ��")
		return
	end
	local nFactionId = GetLastFactionNumber() + 1
	local tbOpt = {}
	local tbSubFaction = %tbFaction[nFactionId].tbEquip
	for i=1, getn(tbSubFaction) do
		tinsert(tbOpt, {tbSubFaction[i].szFaction, show_equip, {nFactionId, i}})
	end
	tinsert(tbOpt, {"������һ��", dialog_main})
--	tinsert(tbOpt, {" ����Ի?})
	tinsert(tbOpt, {"�����Ի�"})
	CreateNewSayEx("<npc>��ѡ������", tbOpt)
end

function show_equip(nFactionId, nSubFactionId)
	local tbEquip = %tbFaction[nFactionId]["tbEquip"][nSubFactionId]
	local tbEquipName = tbEquip["tbEquipName"]
	local nFirstEquipId = tbEquip["nFirstEquipId"]
	local tbOpt = {}
	for i=1, getn(tbEquipName) do
		tinsert(tbOpt, {tbEquipName[i], get_equip, {i, nFirstEquipId + i - 1}})
	end
	tinsert(tbOpt, {"������һ��", show_faction})
	tinsert(tbOpt, {"�����Ի�"})
	local szTitle = format("<npc>���¾���%s�İ׻���װ", tbEquip.szFaction)
	CreateNewSayEx(szTitle, tbOpt)
end

function get_equip(nIndex, nEquipId)
	local nWidth = %tbEquipFreeCell[nIndex][1]
	local nHeigth = %tbEquipFreeCell[nIndex][2]
	if CountFreeRoomByWH(nWidth, nHeigth) < 1 then
		Talk(1, "", format("������Ҫ1��%dx%d�ı����ռ�", nWidth, nHeigth))
		return
	end
	AddGoldItem(0, nEquipId)
end

function show_item()
	local tbOpt = {}
	local nCount = getn(%tbFreeItem)
	local szOption = ""
	for i=1, nCount-1 do
		szOption = format("��ȡ%s", %tbFreeItem[i].szName)
		tinsert(tbOpt, {szOption, get_item, {i}})
	end
	szOption = format("��ȡ%s", %tbFreeItem[nCount].szName)
	tinsert(tbOpt, {szOption, get_single_item, {nCount}})
	tinsert(tbOpt, {"��ȡԪ��װ��", get_normal_item})
	tinsert(tbOpt, {"������һ��", dialog_main})
	tinsert(tbOpt, {"�����Ի�"})
	CreateNewSayEx("<npc>�Ϸ�������������Ʒ����ȡ", tbOpt)
end


function get_normal_item()
	local tbOpt =
	{
		{"����ү�����", cszb},
		{"�˰�֮��", xb_jz},
		{"����֮��", zy_jz},
		{"�з�֮��", sf_jz},
		{"ɽ��֮��", sh_jz},
		{"�ۻ�֮��", dh_jz},
		{"����֮��", tz_jz},
		{"�������", sz_jz},
		{"���Բ��֮��", jz08},
		{"���Բ��֮�䣨�£�", jz08x},
		{"������һ��", dialog_main},
		{"�����Ի�"},
	}
	CreateNewSayEx("<npc>�Ϸ�������������Ʒ����ȡ", tbOpt)
end

function cszb()
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
end
function xb_jz()
	AddGoldItem(0, 508)
end	
function zy_jz()
	AddGoldItem(0, 509)
end	
function sf_jz()
	AddGoldItem(0, 510)
end	
function sh_jz()
	AddGoldItem(0, 511)
end	
function dh_jz()
	AddGoldItem(0, 530)
end	
function tz_jz()
	AddGoldItem(0, 531)
end	
function sz_jz()
	AddGoldItem(0, 498)
end	
function jz08()
	AddGoldItem(0, 428)
end	
function jz08x()
	AddGoldItem(0, 3541)
end	

function get_item(nIndex)
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0, nMaxCount, "��������ȡ����", {get_item_back, {nIndex}})
end

function get_item_back(nIndex, nCount)
	if nCount <= 0 then
		return
	end
	if CalcFreeItemCellCount() < nCount then
		Talk(1, "", format("������Ҫ<color=yellow>%d<color>�������ռ�", nCount))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", %tbFreeItem[nIndex].szName)
	tbAwardTemplet:GiveAwardByList(%tbFreeItem[nIndex], szLogTitle, nCount)
end

function get_single_item(nIndex)
	local tbItem = %tbFreeItem[nIndex]
	if CountFreeRoomByWH(tbItem.nWidth, tbItem.nHeigth) < 1 then
		Talk(1, "", format("������Ҫ1��%dx%d�ı����ռ�", tbItem.nWidth, tbItem.nHeigth))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", tbItem.szName)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTitle)
end

function clear_attibute_point()
	local tbOpt =
	{
		{"ϴ���ܵ�", clear_skill},
		{"ϴǱ�ܵ�", clear_prop},
		{"������һ��", dialog_main},
		{"�����Ի�"},
	}
	CreateNewSayEx("<npc>�����Ҫϴ����", tbOpt)
end

function clear_skill()
	local tbOpt =
	{
		{"ȷ��", do_clear_skill},
		{"���ٿ���һ��"},
		{"������һ��", clear_attibute_point},
	}
	CreateNewSayEx("<npc>��ȷ�����Ҫ��ϴ���ܵ���", tbOpt)
end

function do_clear_skill()
	local i = HaveMagic(210)		-- �Ṧ�������
	local j = HaveMagic(400)		-- ���ٸ���ƶ���������
	local n = RollbackSkill()		-- ������ܲ��������м���?㣨�����Ṧ�����⼼�ܣ?
	local x = 0
	if (i ~= -1) then i = 1; x = x + i end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
	if (j ~= -1) then x = x + j end
	local rollback_point = n - x			-- �Ѽ��ܵ㵱�����е�������������?۳��Ṧ�?
	if (rollback_point + GetMagicPoint() < 0) then		-- ���ϴ���˸���������0��Ϊ�Ժ���ϴ�㱣?��?
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210, i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
	if (j ~= -1) then AddMagic(400, j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
	Msg2Player("ϴ��ɹ�������ǰ�ѷ����"..rollback_point.."�㼼�ܵ�������·����ˡ�")
	KickOutSelf()
end

function clear_prop()
	local tbOpt =
	{
		{"ȷ��", do_clear_prop},
		{"���ٿ���һ��"},
		{"������һ��", clear_attibute_point},
	}
	CreateNewSayEx("<npc>��ȷ�����Ҫ��ϴǱ�ܵ���", tbOpt)
end

function do_clear_prop()
	local base_str = {35,20,25,30,20}			-- �����������������ֵ
	local base_dex = {25,35,25,20,15}
	local base_vit = {25,20,25,30,25}
	local base_eng = {15,25,25,20,40}
	local player_series = GetSeries() + 1

	local Utask88 = GetTask(88)
	AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))			-- ���ѷ���Ǳ�����ã�task(88)��������ֱ�ӽ��������������ȣ�
	AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
	AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
	AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end

function write_info()
	tbInputDialog:InputServer()
end