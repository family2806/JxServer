

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"��ľ� ������ʿ�����Ҵ����ˣ�Ҷ�м����ջ����м���!",
	"���:��ϲ�󻤷�",
	"��ľ��㲻����Ϊʲô��?",
	"���:�Ҳ���Ҫ֪��",
	"��ľ���ֻ��û�п����ˣ��˴���������������񽻸���.",
	"�õ�",
	"��ľ�������ʲô������?",
	"���:�Ҳ���Ҫ֪��",
	"��ľ���������϶�֪�����ε�Ҷ�м����Ǹ�ɵ�ӣ�����������Ϣ�����ǣ����Ļ������ţ����ȥ�ٰ�һ�ˣ����������Ļ��������ң�����...",
	"���:��֪����",
}

tbMissionDialog[1] = {
	"����ɽ������������˭��ȥ�������һ��."
}

tbMissionDialog[2] = {
	"С��:������ٰ����Ű����ĺ�«�ǣ�����Գ�������İ����ǣ��һ���Խ�ˮ�ŵ��Ĵ����ǡ���һ������һ����һ��Ժ���?",
	"���:���û�Թ�����?",
	"С��:�˼�ϲ�����ǣ���ȥ����Ұɣ��Ҳ���һ������ɽ~~",
	"���:���үү����������?",
	"С��:�Ҳ�֪������������һ����~~",
	"���:���ˣ�����ƭ�ң�������ɱ����?",
	"С��: �����û˵ȥ�����ˣ���������ǣ��Ҵ���ȥ�ң�ֻ����һ��֪��·",
}

tbMissionDialog[3] = {
	"С��:ζ��������!",
	"���:�i�߰ɣ��Ҵ���ȥ����",
	"С��:�Ǻó���?",
	"���:...�ó�. (����ô�ش���ô�޴�������?..)",
	"С��:�����ˣ������ڱ����ĸ�ѩ��ԭ��~~",
	"���:�㲻����ȥ��?",
	"С��:�Ҳ����뿪��������ƭ�㣬����Ի������ң��������ǲ������̵̽���?",
	"�ǵ�",
	"С��:�����Ǻ��˰�?",
	"�ǵ�",
	"С��:���Ǻ��ˣ�����Ϊʲô�������̣̽������ս��?",
	"���:�Ҹ���֮ǰ�Ǵ��εĽ��죬�������鳼ɱ�������ˣ�����������С������ô��֪��.",
	"С��:��֪������Ϊ�Һ���үү����....",
}

tbMissionDialog[4] = {
	"С��:������.",
	"���:Ҳ����Ҫ������һ��",
	"С��:С�ջ����ٰ����Ű����ĺ�«�ǣ�����Գ�������İ����ǣ��һ���Խ�ˮ�ŵ��Ĵ����ǡ���һ������һ����һ��Ժ���?",
	"���:�����㻹˵����������ȥ���̽�.",
	"С��:����Ĳ����뿪����ɽ����Ҳ����ˡ������ȥҲ������в�ҵ�.",
	"���:��",
	"С��:���������治����ô��Į��С�����ˣ����ǵ�ȥ�ٰ�������?",
	"���:��... �ǵ�",
}

tbMissionDialog[5] = {
	"��ľ����������úá��Ҵ������������䣬���̽�ͳһ���¾�Ҫ����",
	"���: (һ�����Ų�����ʲô������ô���ˣ�������Ҫ������ʶ��)",
	"��ľ��ܺã���������Ҹ��㣬���ر�������.",
	"���:��һ���������������",
}

tbMissionDialog[6] = {
	"�յ��Ĵ�����",
}

tbMissionDialog[7] = {
	"�յ���«��",
}

tbMissionDialog[8] = {
	"�յ�������",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1839, nMapId = 193, nPosX = 151*8*32, nPosY = 160*16*32, nLevel = 95, szName = "С��",
		szScriptPath = "\\script\\task\\150skilltask\\tianren\\xiaoyan.lua"},
	{nNpcId = 1838, nMapId = 176, nPosX = 152*8*32, nPosY = 182*16*32, nLevel = 95, szName = "Ҷ�м�", bNoRevive = 0, nIsboss = 1,},
	{nNpcId = 1840, nMapId = 320, nPosX = 193*8*32, nPosY = 195*16*32, nLevel = 95, szName = "��������", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"�󻤷���ľ�"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {1, "150������"}},
	},
}

tbConfig[1] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 0, "����", -1}},
	},
}

tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"KillNpc", {"Ҷ�м�"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2913,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"UseItem", {{tbProp = {6,1,2913,1,0,0,},}}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 1, "����", 4}},
	},
}
 
tbConfig[4] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2913,1,0,0,},},}},},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2913,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"С��"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {6, "150������"}},
	},
}

tbConfig[6] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "����", -1}},
	},
}

tbConfig[7] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"������"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6, 1, 2914}},
	},
	tbAction = {
		{"AddDialog", {8, "150������"}},
	},
}

tbConfig[8] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 6,  "����", 9}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2914,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:GotoDetailEX", {"����", 16, -1, 6}},
	},
}


tbConfig[10] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"ҶС��"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6, 1, 2915}},
	},
	tbAction = {
		{"AddDialog", {11, "150������"}},
	},
}

tbConfig[11] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 7,  "����", 12}},
	},
}

tbConfig[12] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2915,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:GotoDetailEX", {"����", 16, -1, 6}},
	},
}

tbConfig[13] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"������"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6, 1, 2916}},
	},
	tbAction = {
		{"AddDialog", {14, "150������"}},
	},
}

tbConfig[14] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 8,  "����", 15}},
	},
}

tbConfig[15] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2916,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:GotoDetailEX", {"����", 16, -1, 6}},
	},
}

tbConfig[16] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckItemNoMsg", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
	},
	tbAction = {
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[17] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"С��"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {18, "150������"}},
	},
}

tbConfig[18] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3,  "����", 19}},
	},
}

tbConfig[19] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[20] = {
	m_nCurStepId = 6,
	tbMessage = {
		{"KillNpc", {"��������"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2917,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[21] = {
	m_nCurStepId = 7,
	tbMessage = {
		{"DialogWithNpc", {"С��"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {22, "150������"}},
	},
}

tbConfig[22] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 4,  "����", -1}},
	},
}

tbConfig[23] = {
	m_nCurStepId = 8,
	tbMessage = {
		{"DialogWithNpc", {"�󻤷���ľ� "}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {24, "150������"}},
	},
}

tbConfig[24] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2917,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 5, "����", 25}},
	},
}

tbConfig[25] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2917,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "������Ҫ1��װ����λ"}}
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2917,1,0,0,},},}}},
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}
