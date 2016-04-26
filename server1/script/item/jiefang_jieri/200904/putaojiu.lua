-- �ƺ�« by bel at 20090409 10��04

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

local tb_putaojiu_award	=
{
	[1]		= {szName="��ⱱ��֮��", nQuality=1, tbProp={0, 197}, nRate = 0.01},
	[2]		= {szName="����ŵ�֮��", nQuality=1, tbProp={0, 202}, nRate = 0.01},
	[3]		= {szName="��ɽѩ��", tbProp={6,1,1431,1,0,0}, nRate = 0.01},
	[4]		= {szName = "���浤",	tbProp = {6, 1, 1678, 1, 0, 0}, nRate = 0.01, tbParam = {1500000000}},
	[5]		= {szName = "Ѫ�浤",	tbProp = {6, 1, 1677, 1, 0, 0}, nRate = 0.02, tbParam = {1000000000}},
	[6]		= {szName = "���浤",	tbProp = {6, 1, 1676, 1, 0, 0}, nRate = 0.2,  tbParam = {500000000}},
	[7]		= {szName = "���ؿ�ʯ",	tbProp = {6, 1, 398, 1, 0, 0, 0},	nRate = 0.5},
	[8]		= {szName = "��ˮ��",	tbProp = {4, 239, 1, 1, 0, 0},	nRate = 3},
	[9]		= {szName = "��ˮ��",	tbProp = {4, 238, 1, 1, 0, 0},	nRate = 2},
	[10]	= {szName = "��ˮ��",	tbProp = {4, 240, 1, 1, 0, 0}, 	nRate = 2},
	[11]	= {szName = "���챦ʯ",	tbProp = {4, 353, 1, 1, 0, 0},	nRate = 4},
	[12]	= {szName = "���޺�",	tbProp = {6, 1, 23, 1, 0, 0},	nRate = 15},
	[13]	= {szName ="�����ľ�",	tbProp = {6, 1, 12, 1, 0, 0}, 	nRate = 2},
	[14]	= {szName = "ʳƷ��", 	tbProp = {6, 1, 2018, 1, 0, 0},	nRate = 16, nExpiredTime = jf0904_item_expiredtime},
	[15]	= {szName = "ˮƿ", 	tbProp = {6, 1, 2019, 1, 0, 0}, nRate = 10.266, nExpiredTime = jf0904_item_expiredtime},
	[16]	= {szName ="6��������ʯ",	tbProp = {6, 1, 147, 6, 0, 0}, nRate = 5},
	[17]	= {szName = "7��������ʯ",	tbProp = {6, 1, 147, 7, 0, 0}, nRate = 4},
	[18]	= {szName = "8��������ʯ", 	tbProp = {6, 1, 147, 8, 0, 0}, nRate = 1},
	[19]	= {szName = "������",		tbProp = {6, 0, 6, 1, 0, 0},	nRate = 5},
	[20]	= {szName = "������",		tbProp = {6, 0, 3, 1, 0, 0},	nRate = 5},
	[21]	= {szName = "������", 		tbProp = {6, 1, 2008, 1, 0, 0},	nRate = 0.3, nExpiredTime = jf0904_item_expiredtime},
	[22]	= {szName = "���丣������", tbProp = {6, 1, 1817, 1, 0, 0}, nRate = 20},
	[23] 	= {szName = "��ҵ֮�׻���˫����Ƭ(1/6)",	tbProp = {4, 1146, 1, 1, 0, 0},	nRate = 0.005},
	[24] 	= {szName = "��ҵ֮�׻���˫����Ƭ(2/6)",	tbProp = {4, 1147, 1, 1, 0, 0},	nRate = 0.005},
	[25] 	= {szName = "��ҵ֮�׻���˫����Ƭ(3/6)",	tbProp = {4, 1148, 1, 1, 0, 0},	nRate = 0.005},
	[26] 	= {szName = "��ҵ֮�׻���˫����Ƭ(4/6)",	tbProp = {4, 1149, 1, 1, 0, 0},	nRate = 0.005},
	[27] 	= {szName = "��ҵ֮�׻���˫����Ƭ(5/6)",	tbProp = {4, 1150, 1, 1, 0, 0},	nRate = 0.005},
	[28] 	= {szName = "��ҵ֮�׻���˫����Ƭ(6/6)",	tbProp = {4, 1151, 1, 1, 0, 0},	nRate = 0.005},
	[29]	= {szName = "ڤ��֮���ǻ�����Ƭ (1/6)",	tbProp = {4, 1194, 1, 1, 0, 0},	nRate = 0.004},
	[30]	= {szName = "ڤ��֮���ǻ�����Ƭ (2/6)",	tbProp = {4, 1195, 1, 1, 0, 0},	nRate = 0.004},
	[31]	= {szName = "ڤ��֮���ǻ�����Ƭ (3/6)",	tbProp = {4, 1196, 1, 1, 0, 0},	nRate = 0.004},
	[32]	= {szName = "ڤ��֮���ǻ�����Ƭ (4/6)", 	tbProp = {4, 1197, 1, 1, 0, 0},	nRate = 0.004},
	[33]	= {szName = "ڤ��֮���ǻ�����Ƭ (5/6)", 	tbProp = {4, 1198, 1, 1, 0, 0},	nRate = 0.004},
	[34]	= {szName = "ڤ��֮���ǻ�����Ƭ (6/6)", 	tbProp = {4, 1199, 1, 1, 0, 0},	nRate = 0.004},
	[35]	= {szName = "����֮����Ƥ������Ƭ  (1/6)",	tbProp = {4, 1091, 1, 1, 0, 0},	nRate = 0.01},
	[36]	= {szName = "����֮����Ƥ������Ƭ  (2/6)",	tbProp = {4, 1092, 1, 1, 0, 0},	nRate = 0.01},
	[37]	= {szName = "����֮����Ƥ������Ƭ  (3/6)",	tbProp = {4, 1093, 1, 1, 0, 0},	nRate = 0.01},
	[38]	= {szName = "����֮����Ƥ������Ƭ  (4/6)",	tbProp = {4, 1094, 1, 1, 0, 0},	nRate = 0.01},
	[39]	= {szName = "����֮����Ƥ������Ƭ  (5/6)",	tbProp = {4, 1095, 1, 1, 0, 0},	nRate = 0.01},
	[40]	= {szName = "����֮����Ƥ������Ƭ  (6/6)",	tbProp = {4, 1096, 1, 1, 0, 0},	nRate = 0.01},
	[41]	= {szName = "�Ŀ�֮����������Ƭ (1/6)",	tbProp = {4, 1134, 1, 1, 0, 0},	nRate = 0.004},
	[42]	= {szName = "�Ŀ�֮����������Ƭ  (2/6)",	tbProp = {4, 1135, 1, 1, 0, 0},	nRate = 0.004},
	[43]	= {szName = "�Ŀ�֮����������Ƭ  (3/6)",	tbProp = {4, 1136, 1, 1, 0, 0},	nRate = 0.004},
	[44]	= {szName = "�Ŀ�֮����������Ƭ  (4/6)", 	tbProp = {4, 1137, 1, 1, 0, 0},	nRate = 0.004},
	[45]	= {szName = "�Ŀ�֮����������Ƭ  (5/6)", 	tbProp = {4, 1138, 1, 1, 0, 0},	nRate = 0.004},
	[46]	= {szName = "�Ŀ�֮����������Ƭ  (6/6)", 	tbProp = {4, 1139, 1, 1, 0, 0},	nRate = 0.004},
	[47]	= {szName = "�޼�֮����˿����Ƭ (1/6)", 	tbProp = {4, 1158, 1, 1, 0, 0},	nRate = 0.008},
	[48]	= {szName = "�޼�֮����˿����Ƭ  (2/6)", 	tbProp = {4, 1159, 1, 1, 0, 0},	nRate = 0.008},
	[49]	= {szName = "�޼�֮����˿����Ƭ (3/6)", 	tbProp = {4, 1160, 1, 1, 0, 0},	nRate = 0.008},
	[50]	= {szName = "�޼�֮����˿����Ƭ  (4/6)", 	tbProp = {4, 1161, 1, 1, 0, 0},	nRate = 0.008},
	[51]	= {szName = "�޼�֮����˿����Ƭ  (5/6)", 	tbProp = {4, 1162, 1, 1, 0, 0},	nRate = 0.008},
	[52]	= {szName = "�޼�֮����˿����Ƭ  (6/6)", 	tbProp = {4, 1163, 1, 1, 0, 0},	nRate = 0.008},
	[53]	= {szName = "����֮�ļ�������Ƭ (1/6)", 	tbProp = {4, 1206, 1, 1, 0, 0}, nRate = 0.004},
	[54]	= {szName = "����֮�ļ�������Ƭ (2/6)", 	tbProp = {4, 1207, 1, 1, 0, 0}, nRate = 0.004},
	[55]	= {szName = "����֮�ļ�������Ƭ (3/6)", 	tbProp = {4, 1208, 1, 1, 0, 0}, nRate = 0.004},
	[56]	= {szName = "����֮�ļ�������Ƭ (4/6)", 	tbProp = {4, 1209, 1, 1, 0, 0}, nRate = 0.004},
	[57]	= {szName = "����֮�ļ�������Ƭ (5/6)", 	tbProp = {4, 1210, 1, 1, 0, 0}, nRate = 0.004},
	[58]	= {szName = "����֮�ļ�������Ƭ (6/6)", 	tbProp = {4, 1211, 1, 1, 0, 0}, nRate = 0.004},
	[59]	= {szName = "����֮ŭ�׷�����Ƭ (1/6)", 	tbProp = {4, 1260, 1, 1, 0, 0}, nRate = 0.03},
	[60]	= {szName = "����֮ŭ�׷�����Ƭ (2/6)", 	tbProp = {4, 1261, 1, 1, 0, 0},	nRate = 0.03},
	[61]	= {szName = "����֮ŭ�׷�����Ƭ(3/6)", 	tbProp = {4, 1262, 1, 1, 0, 0},	nRate = 0.03},
	[62]	= {szName = "����֮ŭ�׷�����Ƭ (4/6)", 	tbProp = {4, 1263, 1, 1, 0, 0},	nRate = 0.03},
	[63]	= {szName = "����֮ŭ�׷�����Ƭ (5/6)", 	tbProp = {4, 1264, 1, 1, 0, 0},	nRate = 0.03},
	[64]	= {szName = "����֮ŭ�׷�����Ƭ(6/6)", 	tbProp = {4, 1265, 1, 1, 0, 0},	nRate = 0.03},
	[65]	= {szName = "�ܻ�֮��ѩ����������Ƭ  (1/6)",	tbProp={4, 1176, 1, 1, 0, 0},	nRate = 0.003},
	[66]	= {szName = "�ܻ�֮��ѩ����������Ƭ  (2/6)", 	tbProp={4, 1177, 1, 1, 0, 0},	nRate = 0.003},
	[67]	= {szName = "�ܻ�֮��ѩ����������Ƭ  (3/6)", 	tbProp={4, 1178, 1, 1, 0, 0},	nRate = 0.003},
	[68]	= {szName = "�ܻ�֮��ѩ����������Ƭ  (4/6)", 	tbProp={4, 1179, 1, 1, 0, 0},	nRate = 0.003},
	[69]	= {szName = "�ܻ�֮��ѩ����������Ƭ  (5/6)", 	tbProp={4, 1180, 1, 1, 0, 0},	nRate = 0.003},
	[70]	= {szName = "�ܻ�֮��ѩ����������Ƭ  (6/6)", 	tbProp={4, 1181, 1, 1, 0, 0},	nRate = 0.003},
	[71]	= {szName = "˪��֮����ƴ���Ƭ (1/6)",	tbProp={4, 1272, 1, 1, 0, 0},	nRate = 0.007},
	[72]	= {szName = "˪��֮����ƴ���Ƭ (2/6)", 	tbProp={4, 1273, 1, 1, 0, 0}, 	nRate = 0.007},
	[73]	= {szName = "˪��֮����ƴ���Ƭ(3/6)", 	tbProp={4, 1274, 1, 1, 0, 0}, 	nRate = 0.007},
	[74]	= {szName = "˪��֮����ƴ���Ƭ (4/6)", 	tbProp={4, 1275, 1, 1, 0, 0}, 	nRate = 0.007},
	[75]	= {szName = "˪��֮����ƴ���Ƭ (5/6)", 	tbProp={4, 1276, 1, 1, 0, 0}, 	nRate = 0.007},
	[76]	= {szName = "˪��֮����ƴ���Ƭ(6/6)", 	tbProp={4, 1277, 1, 1, 0, 0}, 	nRate = 0.007},
	[77]	= {szName = "ħɷ֮����ӳѪ����Ƭ(1/6)", tbProp = {4, 1097, 1, 1, 0, 0},	nRate = 0.004},
	[78]	= {szName = "ħɷ֮����ӳѪ����Ƭ (2/6)", tbProp = {4, 1098, 1, 1, 0, 0},	nRate = 0.004},
	[79]	= {szName = "ħɷ֮����ӳѪ����Ƭ (3/6)", tbProp = {4, 1099, 1, 1, 0, 0},	nRate = 0.004},
	[80]	= {szName = "ħɷ֮����ӳѪ����Ƭ(4/6)", tbProp = {4, 1100, 1, 1, 0, 0},	nRate = 0.004},
	[81]	= {szName = "ħɷ֮����ӳѪ����Ƭ (5/6)", tbProp = {4, 1101, 1, 1, 0, 0},	nRate = 0.004},
	[82]	= {szName = "ħɷ֮����ӳѪ����Ƭ(6/6)", tbProp = {4, 1102, 1, 1, 0, 0},	nRate = 0.004},
	[83]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ(1/9) /9)",	tbProp = {4, 585, 1, 1, 0, 0},	nRate = 0.03},
	[84]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ (2/9) /9)",	tbProp = {4, 586, 1, 1, 0, 0},	nRate = 0.03},
	[85]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ (3/9) /9)", 	tbProp = {4, 587, 1, 1, 0, 0},	nRate = 0.03},
	[86]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ (4/9) /9)", 	tbProp = {4, 588, 1, 1, 0, 0},	nRate = 0.03},
	[87]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ (5/9) /9)", 	tbProp = {4, 589, 1, 1, 0, 0},	nRate = 0.03},
	[88]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ (6/9) /9)", 	tbProp = {4, 590, 1, 1, 0, 0},	nRate = 0.03},
	[89]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ (7/9) /9)", 	tbProp = {4, 591, 1, 1, 0, 0},	nRate = 0.03},
	[90]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ(8/9) /9)", 	tbProp = {4, 592, 1, 1, 0, 0},	nRate = 0.03},
	[91]	= {szName = "�Ŀ�֮��ħ�䵶��Ƭ (9/9) /9)", 	tbProp = {4, 593, 1, 1, 0, 0},	nRate = 0.03},
	[92]	= {szName = "��ħ֮�Ͻ����Ƭ (1/9) /9)",	tbProp = {4, 576, 1, 1, 0, 0},	nRate = 0.02},
	[93]	= {szName = "��ħ֮�Ͻ����Ƭ (2/9) /9)",	tbProp = {4, 577, 1, 1, 0, 0},	nRate = 0.02},
	[94]	= {szName = "��ħ֮�Ͻ����Ƭ (3/9) /9)", 	tbProp = {4, 578, 1, 1, 0, 0},	nRate = 0.02},
	[95]	= {szName = "��ħ֮�Ͻ����Ƭ (4/9) /9)", 	tbProp = {4, 579, 1, 1, 0, 0},	nRate = 0.02},
	[96]	= {szName = "��ħ֮�Ͻ����Ƭ(5/9) /9)", 	tbProp = {4, 580, 1, 1, 0, 0},	nRate = 0.02},
	[97]	= {szName = "��ħ֮�Ͻ����Ƭ (6/9) /9)", 	tbProp = {4, 581, 1, 1, 0, 0},	nRate = 0.02},
	[98]	= {szName = "��ħ֮�Ͻ����Ƭ (7/9) /9)", 	tbProp = {4, 582, 1, 1, 0, 0},	nRate = 0.02},
	[99]	= {szName = "��ħ֮�Ͻ����Ƭ (8/9) /9)", 	tbProp = {4, 583, 1, 1, 0, 0},	nRate = 0.02},
	[100]	= {szName = "��ħ֮�Ͻ����Ƭ (9/9) /9)", 	tbProp = {4, 584, 1, 1, 0, 0},	nRate = 0.02},
	[101]	= {szName = "��������Ƭ  (1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.02},
	[102]	= {szName = "��������Ƭ (2/9) /9)",	tbProp={4, 595, 1, 1, 0, 0},	nRate = 0.02},
	[103]	= {szName = "��������Ƭ (3/9) /9)",	tbProp={4, 596, 1, 1, 0, 0},	nRate = 0.02},
	[104]	= {szName = "��������Ƭ(4/9) /9)",	tbProp={4, 597, 1, 1, 0, 0},	nRate = 0.02},
	[105]	= {szName = "��������Ƭ (5/9) /9)",	tbProp={4, 598, 1, 1, 0, 0},	nRate = 0.02},
	[106]	= {szName = "��������Ƭ(6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.02},
	[107]	= {szName = "��������Ƭ (7/9) /9)",	tbProp={4, 600, 1, 1, 0, 0},	nRate = 0.02},
	[108]	= {szName = "��������Ƭ (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.02},
	[109]	= {szName = "��������Ƭ (9/9) /9)",	tbProp={4, 602, 1, 1, 0, 0},	nRate = 0.02},                            
	[110]	= {szName = "����֮����սѥ��Ƭ  (1/6)",	tbProp = {4, 1031, 1, 1, 0, 0}, nRate =	0.04},
	[111]	= {szName = "����֮����սѥ��Ƭ  (2/6)", 	tbProp = {4, 1032, 1, 1, 0, 0}, nRate =	0.04},
	[112]	= {szName = "����֮����սѥ��Ƭ  (3/6)", 	tbProp = {4, 1033, 1, 1, 0, 0}, nRate =	0.04},
	[113]	= {szName = "����֮����սѥ��Ƭ  (4/6)", 	tbProp = {4, 1034, 1, 1, 0, 0}, nRate =	0.04},
	[114]	= {szName = "����֮����սѥ��Ƭ  (5/6)", 	tbProp = {4, 1035, 1, 1, 0, 0}, nRate =	0.04},
	[115]	= {szName = "����֮����սѥ��Ƭ  (6/6)", 	tbProp = {4, 1036, 1, 1, 0, 0}, nRate =	0.04},
	[116]	= {szName = "����֮���߷�����Ƭ(1/6) /6)",	tbProp = {4, 825, 1, 1, 0, 0},	nRate = 0.04},
	[117]	= {szName = "����֮���߷�����Ƭ(2/6) /6)", 	tbProp = {4, 826, 1, 1, 0, 0}, 	nRate = 0.04},
	[118]	= {szName = "����֮���߷�����Ƭ(3/6) /6)", 	tbProp = {4, 827, 1, 1, 0, 0}, 	nRate = 0.04},
	[119]	= {szName = "����֮���߷�����Ƭ(4/6) /6)", 	tbProp = {4, 828, 1, 1, 0, 0}, 	nRate = 0.04},
	[120]	= {szName = "����֮���߷�����Ƭ (5/6) /6)", 	tbProp = {4, 829, 1, 1, 0, 0}, 	nRate = 0.04},
	[121]	= {szName = "����֮���߷�����Ƭ(6/6) /6)", 	tbProp = {4, 830, 1, 1, 0, 0}, 	nRate = 0.04},
	[122]	= {szName = "ڤ��֮аɲ������Ƭ (1/9) /9)", 	tbProp = {4, 648, 1, 1, 0, 0},	nRate = 0.02},
	[123]	= {szName = "ڤ��֮аɲ������Ƭ (2/9) /9)", 	tbProp = {4, 649, 1, 1, 0, 0},	nRate = 0.02},
	[124]	= {szName = "ڤ��֮аɲ������Ƭ (3/9) /9)", 	tbProp = {4, 650, 1, 1, 0, 0},	nRate = 0.02},
	[125]	= {szName = "ڤ��֮аɲ������Ƭ(4/9) /9)", 	tbProp = {4, 651, 1, 1, 0, 0},	nRate = 0.02},
	[126]	= {szName = "ڤ��֮аɲ������Ƭ (5/9) /9)", 	tbProp = {4, 652, 1, 1, 0, 0},	nRate = 0.02},
	[127]	= {szName = "ڤ��֮аɲ������Ƭ (6/9) /9)", 	tbProp = {4, 653, 1, 1, 0, 0},	nRate = 0.02},
	[128]	= {szName = "ڤ��֮аɲ������Ƭ (7/9) /9)", 	tbProp = {4, 654, 1, 1, 0, 0},	nRate = 0.02},
	[129]	= {szName = "ڤ��֮аɲ������Ƭ (8/9) /9)", 	tbProp = {4, 655, 1, 1, 0, 0},	nRate = 0.02},
	[130]	= {szName = "ڤ��֮аɲ������Ƭ (9/9) /9)", 	tbProp = {4, 656, 1, 1, 0, 0},	nRate = 0.02},
	[131]	= {szName = "����������Ƭ (1/9) /9)",	tbProp = {4, 657, 1, 1, 0, 0},	nRate = 0.004},
	[132]	= {szName = "����������Ƭ (2/9) /9)",	tbProp = {4, 658, 1, 1, 0, 0},	nRate = 0.004},
	[133]	= {szName = "����������Ƭ (3/9) /9)",	tbProp = {4, 659, 1, 1, 0, 0},	nRate = 0.004},
	[134]	= {szName = "����������Ƭ (4/9) /9)",	tbProp = {4, 660, 1, 1, 0, 0},	nRate = 0.004},
	[135]	= {szName = "����������Ƭ (5/9) /9)",	tbProp = {4, 661, 1, 1, 0, 0},	nRate = 0.004},
	[136]	= {szName = "����������Ƭ (6/9) /9)",	tbProp = {4, 662, 1, 1, 0, 0},	nRate = 0.004},
	[137]	= {szName = "����������Ƭ (7/9) /9)",	tbProp = {4, 663, 1, 1, 0, 0},	nRate = 0.004},
	[138]	= {szName = "����������Ƭ(8/9) /9)",	tbProp = {4, 664, 1, 1, 0, 0},	nRate = 0.004},
	[139]	= {szName = "����������Ƭ (9/9) /9)",	tbProp = {4, 665, 1, 1, 0, 0},	nRate = 0.004},
	[140]	= {szName = "����֮��ָ�ɵ���Ƭ (1/9)",	tbProp = {4, 980, 1, 1, 0, 0},	nRate =	0.03},
	[141]	= {szName = "����֮��ָ�ɵ���Ƭ (2/9)", 	tbProp = {4, 981, 1, 1, 0, 0},	nRate =	0.03},
	[142]	= {szName = "����֮��ָ�ɵ���Ƭ (3/9)", 	tbProp = {4, 982, 1, 1, 0, 0},	nRate =	0.03},
	[143]	= {szName = "����֮��ָ�ɵ���Ƭ (4/9)", 	tbProp = {4, 983, 1, 1, 0, 0},	nRate =	0.03},
	[144]	= {szName = "����֮��ָ�ɵ���Ƭ (5/9)", 	tbProp = {4, 984, 1, 1, 0, 0},	nRate =	0.03},
	[145]	= {szName = "����֮��ָ�ɵ���Ƭ(6/9)", 	tbProp = {4, 985, 1, 1, 0, 0},	nRate =	0.03},
	[146]	= {szName = "����֮��ָ�ɵ���Ƭ (7/9)", 	tbProp = {4, 986, 1, 1, 0, 0},	nRate =	0.03},
	[147]	= {szName = "����֮��ָ�ɵ���Ƭ (8/9)", 	tbProp = {4, 987, 1, 1, 0, 0},	nRate =	0.03},
	[148]	= {szName = "����֮��ָ�ɵ���Ƭ (9/9)", 	tbProp = {4, 988, 1, 1, 0, 0},	nRate =	0.03},
	[149]	= {szName ="���Ƕ����Ƭ (1/9) /9)", 	tbProp = {4, 666, 1, 1, 0, 0}, 	nRate = 0.02},
	[150]	= {szName ="���Ƕ����Ƭ (2/9) /9)", 	tbProp = {4, 667, 1, 1, 0, 0}, 	nRate = 0.02},
	[151]	= {szName ="���Ƕ����Ƭ (3/9) /9)", 	tbProp = {4, 668, 1, 1, 0, 0}, 	nRate = 0.02},
	[152]	= {szName ="���Ƕ����Ƭ (4/9) /9)", 	tbProp = {4, 669, 1, 1, 0, 0}, 	nRate = 0.02},
	[153]	= {szName ="���Ƕ����Ƭ (5/9) /9)", 	tbProp = {4, 670, 1, 1, 0, 0}, 	nRate = 0.02},
	[154]	= {szName ="���Ƕ����Ƭ (6/9) /9)", 	tbProp = {4, 671, 1, 1, 0, 0}, 	nRate = 0.02},
	[155]	= {szName ="���Ƕ����Ƭ (7/9) /9)", 	tbProp = {4, 672, 1, 1, 0, 0}, 	nRate = 0.02},
	[156]	= {szName ="���Ƕ����Ƭ (8/9) /9)", 	tbProp = {4, 673, 1, 1, 0, 0}, 	nRate = 0.02},
	[157]	= {szName ="���Ƕ����Ƭ(9/9) /9)", 	tbProp = {4, 674, 1, 1, 0, 0}, 	nRate = 0.02},
	[158]	= {szName = "ϴ�������Ƭ (1/6) /6)", 	tbProp = {4, 801, 1, 1, 0, 0},	nRate = 0.02},
	[159]	= {szName = "ϴ�������Ƭ (2/6) /6)", 	tbProp = {4, 802, 1, 1, 0, 0},	nRate = 0.02},
	[160]	= {szName = "ϴ�������Ƭ (3/6) /6)", 	tbProp = {4, 803, 1, 1, 0, 0},	nRate = 0.02},
	[161]	= {szName = "ϴ�������Ƭ(4/6) /6)", 	tbProp = {4, 804, 1, 1, 0, 0},	nRate = 0.02},
	[162]	= {szName = "ϴ�������Ƭ (5/6) /6)", 	tbProp = {4, 805, 1, 1, 0, 0},	nRate = 0.02},
	[163]	= {szName = "ϴ�������Ƭ (6/6) /6)", 	tbProp = {4, 806, 1, 1, 0, 0},	nRate = 0.02},
	[164]	= {szName = "������NЬ��Ƭ(1/6) /6)",tbProp = {4, 807, 1, 1, 0, 0},	nRate =	0.03},
	[165]	= {szName = "������NЬ��Ƭ(2/6) /6)",tbProp = {4, 808, 1, 1, 0, 0},	nRate =	0.03},
	[166]	= {szName = "������NЬ��Ƭ (3/6) /6)",tbProp = {4, 809, 1, 1, 0, 0},	nRate =	0.03},
	[167]	= {szName = "������NЬ��Ƭ (4/6) /6)",tbProp = {4, 810, 1, 1, 0, 0},	nRate =	0.03},
	[168]	= {szName = "������NЬ��Ƭ (5/6) /6)",tbProp = {4, 811, 1, 1, 0, 0},	nRate =	0.03},
	[169]	= {szName = "������NЬ��Ƭ (6/6) /6)",tbProp = {4, 812, 1, 1, 0, 0},	nRate =	0.03},
	[170]	= {szName = "�޼�֮���콣��Ƭ (1/9) /9)",	tbProp = {4, 621, 1, 1, 0, 0}, 	nRate =	0.02},
	[171]	= {szName = "�޼�֮���콣��Ƭ (2/9) /9)",	tbProp = {4, 622, 1, 1, 0, 0}, 	nRate =	0.02},
	[172]	= {szName = "�޼�֮���콣��Ƭ (3/9) /9)",	tbProp = {4, 623, 1, 1, 0, 0}, 	nRate =	0.02},
	[173]	= {szName = "�޼�֮���콣��Ƭ (4/9) /9)",	tbProp = {4, 624, 1, 1, 0, 0}, 	nRate =	0.02},
	[174]	= {szName = "�޼�֮���콣��Ƭ (5/9) /9)",	tbProp = {4, 625, 1, 1, 0, 0}, 	nRate =	0.02},
	[175]	= {szName = "�޼�֮���콣��Ƭ (6/9) /9)",	tbProp = {4, 626, 1, 1, 0, 0}, 	nRate =	0.02},
	[176]	= {szName = "�޼�֮���콣��Ƭ (7/9) /9)",	tbProp = {4, 627, 1, 1, 0, 0}, 	nRate =	0.02},
	[177]	= {szName = "�޼�֮���콣��Ƭ (8/9) /9)",	tbProp = {4, 628, 1, 1, 0, 0}, 	nRate =	0.02},
	[178]	= {szName = "�޼�֮���콣��Ƭ (9/9) /9)",	tbProp = {4, 629, 1, 1, 0, 0}, 	nRate =	0.02},
	[179]	= {szName = "�ܻ�֮���ǵ���Ƭ (1/9) /9)", 	tbProp = {4, 630, 1, 1, 0, 0}, 	nRate =	0.02},
	[180]	= {szName = "�ܻ�֮���ǵ���Ƭ (2/9) /9)", 	tbProp = {4, 631, 1, 1, 0, 0}, 	nRate =	0.02},
	[181]	= {szName = "�ܻ�֮���ǵ���Ƭ (3/9) /9)", 	tbProp = {4, 632, 1, 1, 0, 0}, 	nRate =	0.02},
	[182]	= {szName = "�ܻ�֮���ǵ���Ƭ (4/9) /9)", 	tbProp = {4, 633, 1, 1, 0, 0}, 	nRate =	0.02},
	[183]	= {szName = "�ܻ�֮���ǵ���Ƭ (5/9) /9)", 	tbProp = {4, 634, 1, 1, 0, 0}, 	nRate =	0.02},
	[184]	= {szName = "�ܻ�֮���ǵ���Ƭ(6/9) /9)", 	tbProp = {4, 635, 1, 1, 0, 0}, 	nRate =	0.02},
	[185]	= {szName = "�ܻ�֮���ǵ���Ƭ (7/9) /9)", 	tbProp = {4, 636, 1, 1, 0, 0}, 	nRate =	0.02},
	[186]	= {szName = "�ܻ�֮���ǵ���Ƭ (8/9) /9)", 	tbProp = {4, 637, 1, 1, 0, 0}, 	nRate =	0.02},
	[187]	= {szName = "�ܻ�֮���ǵ���Ƭ (9/9) /9)", 	tbProp = {4, 638, 1, 1, 0, 0}, 	nRate =	0.02},
	[188]	= {szName = "�ܻ�֮���ٽ�����Ƭ (1/6)", 	tbProp = {4, 1055, 1, 1, 0, 0}, nRate =	0.03},
	[189]	= {szName = "�ܻ�֮���ٽ�����Ƭ (2/6)", 	tbProp = {4, 1056, 1, 1, 0, 0}, nRate =	0.03},
	[190]	= {szName = "�ܻ�֮���ٽ�����Ƭ (3/6)", 	tbProp = {4, 1057, 1, 1, 0, 0}, nRate =	0.03},
	[191]	= {szName = "�ܻ�֮���ٽ�����Ƭ (4/6)", 	tbProp = {4, 1058, 1, 1, 0, 0}, nRate =	0.03},
	[192]	= {szName = "�ܻ�֮���ٽ�����Ƭ (5/6)", 	tbProp = {4, 1059, 1, 1, 0, 0}, nRate =	0.03},
	[193]	= {szName = "�ܻ�֮���ٽ�����Ƭ (6/6)", 	tbProp = {4, 1060, 1, 1, 0, 0}, nRate =	0.03},
	[194]	= {szName="��ڤǹ��Ƭ (1/9) /9)", 	tbProp = {4, 684, 1, 1, 0, 0}, 	nRate = 0.02},
	[195]	= {szName="��ڤǹ��Ƭ (2/9) /9)", 	tbProp = {4, 685, 1, 1, 0, 0}, 	nRate = 0.02},
	[196]	= {szName="��ڤǹ��Ƭ  (3/9) /9)", 	tbProp = {4, 686, 1, 1, 0, 0}, 	nRate = 0.02},
	[197]	= {szName="��ڤǹ��Ƭ  (4/9) /9)", 	tbProp = {4, 687, 1, 1, 0, 0}, 	nRate = 0.02},
	[198]	= {szName="��ڤǹ��Ƭ  (5/9) /9)", 	tbProp = {4, 688, 1, 1, 0, 0}, 	nRate = 0.02},
	[199]	= {szName="��ڤǹ��Ƭ  (6/9) /9)", 	tbProp = {4, 689, 1, 1, 0, 0}, 	nRate = 0.02},
	[200]	= {szName="��ڤǹ��Ƭ  (7/9) /9)", 	tbProp = {4, 690, 1, 1, 0, 0}, 	nRate = 0.02},
	[201]	= {szName="��ڤǹ��Ƭ  (8/9) /9)", 	tbProp = {4, 691, 1, 1, 0, 0}, 	nRate = 0.02},
	[202]	= {szName="��ڤǹ��Ƭ  (9/9) /9)", 	tbProp = {4, 692, 1, 1, 0, 0}, 	nRate = 0.02},
	[203]	= {szName = "ħ��֮ɽ���ɺ�����Ƭ(1/6) /6)",	tbProp = {4, 873, 1, 1, 0, 0},	nRate =	0.04},
	[204]	= {szName = "ħ��֮ɽ���ɺ�����Ƭ(1/6) /6)",	tbProp = {4, 874, 1, 1, 0, 0},	nRate =	0.04},
	[205]	= {szName = "ħ��֮ɽ���ɺ�����Ƭ(1/6) /6)",	tbProp = {4, 875, 1, 1, 0, 0},	nRate =	0.04},
	[206]	= {szName = "ħ��֮ɽ���ɺ�����Ƭ(1/6)/6)",	tbProp = {4, 876, 1, 1, 0, 0},	nRate =	0.04},
	[207]	= {szName = "ħ��֮ɽ���ɺ�����Ƭ(1/6) /6)",	tbProp = {4, 877, 1, 1, 0, 0},	nRate =	0.04},
	[208]	= {szName = "ħ��֮ɽ���ɺ�����Ƭ(1/6)/6)", 	tbProp = {4, 878, 1, 1, 0, 0},	nRate =	0.04},
	[209]	= {szName = "ͬ��֮����ؤ����Ƭ (1/6) /6)", 	tbProp = {4, 849, 1, 1, 0, 0},	nRate =	0.08},
	[210]	= {szName = "ͬ��֮����ؤ����Ƭ (2/6) /6)", 	tbProp = {4, 850, 1, 1, 0, 0},	nRate =	0.08},
	[211]	= {szName = "ͬ��֮����ؤ����Ƭ (3/6) /6)", 	tbProp = {4, 851, 1, 1, 0, 0},	nRate =	0.08},
	[212]	= {szName = "ͬ��֮����ؤ����Ƭ (4/6) /6)", 	tbProp = {4, 852, 1, 1, 0, 0},	nRate =	0.08},
	[213]	= {szName = "ͬ��֮����ؤ����Ƭ (5/6) /6)", 	tbProp = {4, 853, 1, 1, 0, 0},	nRate =	0.08},
	[214]	= {szName = "ͬ��֮����ؤ����Ƭ(6/6) /6)", 	tbProp = {4, 854, 1, 1, 0, 0},	nRate =	0.08},
	[215]	= {szName = "ͬ��֮����������Ƭ (1/6) /6)", 	tbProp = {4, 855, 1, 1, 0, 0}, 	nRate = 0.02},
	[216]	= {szName = "ͬ��֮����������Ƭ(2/6) /6)", 	tbProp = {4, 856, 1, 1, 0, 0}, 	nRate = 0.02},
	[217]	= {szName = "ͬ��֮����������Ƭ (3/6) /6)", 	tbProp = {4, 857, 1, 1, 0, 0}, 	nRate = 0.02},
	[218]	= {szName = "ͬ��֮����������Ƭ (4/6) /6)", 	tbProp = {4, 858, 1, 1, 0, 0}, 	nRate = 0.02},
	[219]	= {szName = "ͬ��֮����������Ƭ(5/6) /6)", 	tbProp = {4, 859, 1, 1, 0, 0}, 	nRate = 0.02},
	[220]	= {szName = "ͬ��֮����������Ƭ(6/6) /6)", 	tbProp = {4, 860, 1, 1, 0, 0}, 	nRate = 0.02},
	[221]	= {szName = "��������Ƭ (1/9) /9)", tbProp = {4, 675, 1, 1, 0, 0},		nRate = 0.02},
	[222]	= {szName = "��������Ƭ  (2/9) /9)", tbProp = {4, 676, 1, 1, 0, 0},		nRate = 0.02},
	[223]	= {szName = "��������Ƭ (3/9) /9)", tbProp = {4, 677, 1, 1, 0, 0},		nRate = 0.02},
	[224]	= {szName = "��������Ƭ  (4/9) /9)", tbProp = {4, 678, 1, 1, 0, 0},		nRate = 0.02},
	[225]	= {szName = "��������Ƭ  (5/9) /9)", tbProp = {4, 679, 1, 1, 0, 0},		nRate = 0.02},
	[226]	= {szName = "��������Ƭ  (6/9) /9)", tbProp = {4, 680, 1, 1, 0, 0},		nRate = 0.02},
	[227]	= {szName = "��������Ƭ (7/9) /9)", tbProp = {4, 681, 1, 1, 0, 0},		nRate = 0.02},
	[228]	= {szName = "��������Ƭ (8/9) /9)", tbProp = {4, 682, 1, 1, 0, 0},		nRate = 0.02},
	[229]	= {szName = "��������Ƭ (9/9) /9)", tbProp = {4, 683, 1, 1, 0, 0},		nRate = 0.02},
	[230]	= {szName = "�ƽ�-���֮���ɱ��ع���Ƭ(1/6)",	tbProp = {4, 1004, 1, 1, 0, 0},	nRate = 0.005},
	[231]	= {szName = "�ƽ�-���֮���ɱ��ع���Ƭ(2/6)",	tbProp = {4, 1005, 1, 1, 0, 0},	nRate = 0.005},
	[232]	= {szName = "�ƽ�-���֮���ɱ��ع���Ƭ(3/6)",	tbProp = {4, 1006, 1, 1, 0, 0},	nRate = 0.005},
	[233]	= {szName = "�ƽ�-���֮���ɱ��ع���Ƭ(4/6)",	tbProp = {4, 1007, 1, 1, 0, 0},	nRate = 0.005},
	[234]	= {szName = "�ƽ�-���֮���ɱ��ع���Ƭ(5/6)",	tbProp = {4, 1008, 1, 1, 0, 0},	nRate = 0.005},
	[235]	= {szName = "�ƽ�-���֮���ɱ��ع���Ƭ(6/6)",	tbProp = {4, 1009, 1, 1, 0, 0},	nRate = 0.005},
	[236]	= {szName = "ǧ�꺮����Ƭ  (1/9) /9)",	tbProp = {4, 702, 1, 1, 0, 0}, nRate = 0.02},
	[237]	= {szName = "ǧ�꺮����Ƭ  (2/9) /9)", 	tbProp = {4, 703, 1, 1, 0, 0}, nRate = 0.02},
	[238]	= {szName = "ǧ�꺮����Ƭ  (3/9) /9)", 	tbProp = {4, 704, 1, 1, 0, 0}, nRate = 0.02},
	[239]	= {szName = "ǧ�꺮����Ƭ  (4/9) /9)", 	tbProp = {4, 705, 1, 1, 0, 0}, nRate = 0.02},
	[240]	= {szName = "ǧ�꺮����Ƭ (5/9) /9)", 	tbProp = {4, 706, 1, 1, 0, 0}, nRate = 0.02},
	[241]	= {szName = "ǧ�꺮����Ƭ  (6/9) /9)", 	tbProp = {4, 707, 1, 1, 0, 0}, nRate = 0.02},
	[242]	= {szName = "ǧ�꺮����Ƭ (7/9) /9)", 	tbProp = {4, 708, 1, 1, 0, 0}, nRate = 0.02},
	[243]	= {szName = "ǧ�꺮����Ƭ  (8/9) /9)", 	tbProp = {4, 709, 1, 1, 0, 0}, nRate = 0.02},
	[244]	= {szName = "ǧ�꺮����Ƭ  (9/9) /9)", 	tbProp = {4, 710, 1, 1, 0, 0}, nRate = 0.02},
	[245]	= {szName = "���佣��Ƭ  (1/9) /9)",	tbProp = {4, 693, 1, 1, 0, 0}, nRate = 0.008},
	[246]	= {szName = "���佣��Ƭ  (2/9) /9)", 	tbProp = {4, 694, 1, 1, 0, 0}, nRate = 0.008},
	[247]	= {szName = "���佣��Ƭ  (3/9) /9)", 	tbProp = {4, 695, 1, 1, 0, 0}, nRate = 0.008},
	[248]	= {szName = "���佣��Ƭ  (4/9) /9)", 	tbProp = {4, 696, 1, 1, 0, 0}, nRate = 0.008},
	[249]	= {szName = "���佣��Ƭ  (5/9) /9)", 	tbProp = {4, 697, 1, 1, 0, 0}, nRate = 0.008},
	[250]	= {szName = "���佣��Ƭ  (6/9) /9)", 	tbProp = {4, 698, 1, 1, 0, 0}, nRate = 0.008},
	[251]	= {szName = "���佣��Ƭ  (7/9) /9)", 	tbProp = {4, 699, 1, 1, 0, 0}, nRate = 0.008},
	[252]	= {szName = "���佣��Ƭ  (8/9) /9)", 	tbProp = {4, 700, 1, 1, 0, 0}, nRate = 0.008},
	[253]	= {szName = "���佣��Ƭ  (9/9) /9)", 	tbProp = {4, 701, 1, 1, 0, 0}, nRate = 0.008},
	[254]	= {szName = "����֮�޼���������Ƭ  (1/6) /6)",	tbProp = {4, 879, 1, 1, 0, 0}, nRate = 0.02},
	[255]	= {szName = "����֮�޼���������Ƭ  (2/6) /6)", 	tbProp = {4, 880, 1, 1, 0, 0}, nRate = 0.02},
	[256]	= {szName = "����֮�޼���������Ƭ  (3/6) /6)", 	tbProp = {4, 881, 1, 1, 0, 0}, nRate = 0.02},
	[257]	= {szName = "����֮�޼���������Ƭ  (4/6) /6)", 	tbProp = {4, 882, 1, 1, 0, 0}, nRate = 0.02},
	[258]	= {szName = "����֮�޼���������Ƭ  (5/6) /6)", 	tbProp = {4, 883, 1, 1, 0, 0}, nRate = 0.02},
	[259]	= {szName = "����֮�޼���������Ƭ  (6/6) /6)", 	tbProp = {4, 884, 1, 1, 0, 0}, nRate = 0.02},
};

local tb_putaojiu_exp	=
{
	{nExp = 20, 	nRate = 0.2},
	{nExp = 30, 	nRate = 0.65},
	{nExp = 40, 	nRate = 0.05},
	{nExp = 50, 	nRate = 0.04},
	{nExp = 60, 	nRate = 0.03},
	{nExp = 80, 	nRate = 0.02},
	{nExp = 100,	nRate = 0.01},
};

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_jiu_expiredtime) then
		Msg2Player("��Ʒ��ʹ����.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("������δ��50������δ��ֵ�����Բ��ܲμӸû", 0);
		return 1;
	end
	
	if CalcFreeItemCellCount() < 10 then
		Say(format("Ϊȷ���Ʋ���ȫ��������%d ��λ", 10), 0);
		return 1;
	end
	
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jiuexp) >= GetTask(jf0904_TSK_jiuexplt)) then
		Say("�Ѵ���߾��飬������ʹ�����Ѿ���.", 0);
		return 1
	end
	
	local nAddedExp = putaojiu_getexp();
	if (GetTask(jf0904_TSK_jiuexp) + nAddedExp > GetTask(jf0904_TSK_jiuexplt)) then
		nAddedExp = GetTask(jf0904_TSK_jiuexplt) - GetTask(jf0904_TSK_jiuexp);
	end	

	SetTask(jf0904_TSK_jiuexp, GetTask(jf0904_TSK_jiuexp) + nAddedExp);
	AddOwnExp(nAddedExp * 100000);
	tbAwardTemplet:GiveAwardByList(%tb_putaojiu_award, "�ƺ�");

end

function putaojiu_getexp()
	local nstep = random(1, 100000);
	local ncurstep = 0;
	for i = 1, getn(%tb_putaojiu_exp) do
		if (ncurstep + %tb_putaojiu_exp[i].nRate * 100000 >= nstep) then
			return %tb_putaojiu_exp[i].nExp;
		end
		ncurstep = ncurstep + %tb_putaojiu_exp[i].nRate * 100000;
	end
end
