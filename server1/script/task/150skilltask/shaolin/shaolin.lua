

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"������: �����ӷ𣬷����ģ����ʵ��̨������и������������ɽ����֪�����������ô����?",
	"���: �����ӷ𣬻���ʦ���������дȱ��ĳ������ն�����.",
	"������: �����û�м���������������?",
	"���: ɽ�·�������ƶɮ���Ҷ����������е��ص��Ƕ���֮��.",
	"������: ������Ϊ���ж���֮�Ĳ����������Ǳ�ġ��㵽ɽ��ȥ��������һ��Ů�ӣ�����Զ�����?",
}

tbMissionDialog[1] = {
	"Ů�ӣ� ��ʦ���ҵ����Ѿ��ܾ���.",
	"���: ��λʩ������ʲô��ֻ�ܺ�ƶɮ˵.",
	"Ů�ӣ���ʦ������ô��?",
	"���: ��ľ�к��ң�������ů��.",
	"Ů�ӣ���ʦ�޷���.",
	"���: �����г���֮��, Ҳ���ܿ�Խ�˵ı���, �ǳ��������ĵ���������������ʧ��.",
	"Ů�ӣ� ��ʦ���ˣ��ⲻ�Ƿ��ߡ�",
	"���: �����룬����������Ĳ��Ƿ��ģ����ļ���.",
}

tbMissionDialog[2] = {
	"������: �����ӷ��������㣬���������?",
	"���: �����ˣ�����ʲô��̬�����������ġ���Ҫ��һ���ˣ�̫���ˡ��Ǹ�Ů������̫���ˡ�",
	"������: �����������������Ż��γ����磬�ھ���֮����·�ϣ���������������飬�������������Եľ���㣬��ˮ����.",
	"���: ���������������������ǲ�����֮�࣬�����ܻ��޳��ǻۺ�Բ������.",
	"������: Υ����Ȼ���ܴﵽ�޳��ǻ��𣿾���������ɫ����ӣ�����֪���ߣ���΢���ȣ�����ͺܹ���.",
	"���: ����������",
	"������: �����Ļ�����ȥ������.",
}

tbMissionDialog[3] = {
	"Ů�ӣ���ʦ���������Ⱑ?",
	"���: ʩ���ղŽ���ƶɮ�������Ҹо���ô��?",
	"Ů�ӣ� ����",
	"���: ��֪��֪��֪��֪",
	"Ů�ӣ� ��ʦ���ұ���ɽ��һ���Ҹ��˼ҵĺ��ӣ����ǽ��·���⣬���Ҽ�ֻ����һ��.",
	"Ů�ӣ� ƽ���Ҷ�һ������κ��Կˣ������������٣���ŭ��ƽ.",
	"���: ʩ�������˵����ᣬ�������˵����飬����ʩ�����ģ���ʹ��һ������������˶�������'.",
	"Ů�ӣ� ��ʦ�������з��ģ��Ҹ�����������?",
	"���: ����ֻ��һƬƽ���İ��ˣ�����ͨ������������������ǰ����������Ҳ�л���.",
	"Ů�ӣ� �ݼ���ʦ������С���������������ԣ�����������������ľ�������������񲻶ϼ�ǿ�����������֮��.",
	"Ů�ӣ� �����޷��ƽ����е�ʹ�ࡣ��ֻ�ܹ���һ�ˣ���ӽ������Ｋ��ʹ�࣬��ɽ�����ķ����෴������û��һ�찲������ʦԸΪ���ƽ�ɱ����?",
	"���: �����ӷ�ɱ����������ն����ն��!",
	"Ů�ӣ� ������һ�������书������������ʦ�ȱ�Ϊ���������Ļ�Ҫ����Ϊ������Ŷ�.",
}

tbMissionDialog[4] = {
	"������: �����ӷ��ó���֮��������֮�£������������ӣ���ν�ȱ�������ΰ�������ܰο࣬������һƬ��ȫ�����İ���֮�ģ�Ҳ��һ��ƽ����.",
	"���: ���Ӽ�ס��",
	"������: ���ս���ַ��ҹ���������ս��ͣ���������˶�������ʹ�࣬�����������з��飬���ǳ�����ҲҪ���ж�֮��.",
	"������: ����Ҳ�����������������ĳ����������գ��ݲ��ɷ����˶ɾ����������ᣡ��ȥ�ɡ�����Ҫ�ú���.",
	"���: ��ʵ�ǻ������������ĵĳ�����.",
	"������: �������ʮ����Ҫ����Ҫ���������.",
	"���: ����ʦ�������������ˡ�",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1842, nMapId = 103, nPosX = 1440*32, nPosY = 3520*32, nLevel = 95, szName = "ɽ��Ů�ӣ�",
		szScriptPath = "\\script\\task\\150skilltask\\shaolin\\nvzi.lua"},
	{nNpcId = 1841, nMapId = 103, nPosX = 1488*32, nPosY = 3536*32, nLevel = 95, szName = "Ph?Nh�n", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"������"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {1, "150����������"}},
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
		{"DialogWithNpc", {"ɽ��Ů�ӣ�"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {3, "150����������"}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "����", -1}},
	},
}

tbConfig[4] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"������"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {5, "150����������"}},
	},
}

tbConfig[5] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "����", -1}},
	},
}

tbConfig[6] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"ɽ��Ů�ӣ�"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {7, "150����������"}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 3, "����", -1}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 4, 
	tbMessage = {
		{"KillNpc", {"����"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"��ܷ���"}},
		{"GotoNextMessageStep", {1, 2885}},
	},}

tbConfig[9] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"������"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {10, "150����������"}},
	},
}

tbConfig[10] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "����������Ҫ1���ո�"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "����", 11}},
	},
}

tbConfig[11] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "����������Ҫ1���ո�"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




