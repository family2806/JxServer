

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"�Ʋ�Ⱦ:��Ҳ��һ�����ѵõ��˲ţ������������һ�ְ�������ȥ����Ū����һ������.",
	"���:������ˣ�ԭ��Ҳûʲô�Ÿɣ�ֻ�����",
	"�Ʋ�Ⱦ: ���ģ��ɹ����ٲ������.",
	"���: �������?",
	"�Ʋ�Ⱦ: �����ͩľ����������˿�;�������������Щ���������汦���������찵�����ѵ��㲻���һ����?",
	"���: �㿴���ң���ʹ���͹��Ҷ�����!",
	"�Ʋ�Ⱦ: ֻ�������컹��һ����ͼ�ף���ǰ��ǰ������Ϊ��ԭ�ϣ����������жϡ�",
	"�Ʋ�Ⱦ: ���µ�һ��տ��Ѿ������ҵ�ͼ���ˣ�����͵��һ�飬ֱ�����죬ԭ���ѹ�����ֻ��Ҫȥ���ǿ�ͼ�׾���.",
	"���: �õģ���ȥ.",
}

tbMissionDialog[1] = {
	"��տ�:��������ѽ��˯�����㣬��Ȼ��������Ǯ�����������µ�Ȩ��������������ˬ.",
	"��տ�: ���Ǹ��λ��ڣ�����һ���������ȶ����˻��ࡣ��������ˬ��.",
	"���: �����ź���������ֿ쵽��ͷ��.",
	"��տ�: ����˭���е��䵱һ����˼������������˰�?",
	"���: ������������ǵ�˼�ϣ��Ҿ��Ƕ���������˵�����ŵ�ͼ������?",
	"��տ�:ԭ����������ү�������Ĳ���ʱ��ͼ���ѱ��Ҳ���������ˣ�����л�ɽ��������.",
	"��տ�: ����ͷĿ�и���֬����ֻ��Ҫ������֬������ң��Ҿ͸�����ͼ�׵�λ��",
}

tbMissionDialog[2] = {
	"��տ�: ��������������֬�������ͼ�����⣬�Ǻ��ˡ�����ʹ�찡������������ô����ͼ�ױ��֮ǰ���������е�Ǯ�أ���������ɵС���������ұ���.",
	"��տ�:�������û�˳��ģ���ֻ�������������.",
	"���: �����Ҫ������������ҪǮ��Ҫ���ˡ�",
	"��տ�:�����Ļ�Ǯ��û���˻�Ҫ������?",
	".....��?",
	"��տ�: �㻹�����ߣ�վ���������ι�������ŵ����Ҳ�����Ҫ��ʲô��С��С�ġ�",
	"���: �����ֻҪǮ��Ҫ�����ˣ����Ҿͳ�ȫ�㣬�Һ����ּۻ��ۣ���֪��������ôд��?",
	"��տ�:�������������������!",
	"���: �ߣ��������ʧ��Ҫ�����Ҽ�������Ȼ�Ҽ���һ�δ���һ��.",
}

tbMissionDialog[3] = {
	"�Ʋ�Ⱦ: �������ã�̫���ˡ��������ͼ�ף������˶࣬�㵽������ң��������ٺ�����ϸ����.",
}

tbMissionDialog[4] = {
	"�Ʋ�Ⱦ: ��",
	"���: ������ô��������ʲô��˼���ѵ���û�д�������������?",
	"�Ʋ�Ⱦ: �α��õ��ý��ģ��㲻��Ҫ�������Ҹ���һ�����ᣬ�������꣬�Ҳ���������ķݵ�!",
	"���:  ����ͷ�������Ҫ�Ź�����?",
	"�Ʋ�Ⱦ: ���о�����˫�������书�ؼ������ر���.",
	"���: ��˵�Ļ���Ҳ������������",
	"�Ʋ�Ⱦ: ���������ƣ����������ȥ��!",
	"���: ������ô��? ����ȥ��!",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1830, nMapId = 80, nPosX = 1618*32, nPosY = 3047*32, nLevel = 95, szName = "��տ�",
		szScriptPath = "\\script\\task\\150skilltask\\tangmen\\yukongkong.lua"},
	{nNpcId = 1856, nMapId = 196, nPosX = 202*8*32, nPosY = 195*16*32, nLevel = 95, szName = "ɽ��ͷĿ", bNoRevive = 0, nIsboss = 1,},
	{nNpcId = 1832, nMapId = 25, nPosX = 4248*32, nPosY = 5120*32, nLevel = 95, szName = "�Ʋ�Ⱦ", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"�Ʋ�Ⱦ"}},
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
		{"DialogWithNpc", {"��տ�"}},
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
		{"KillNpc", {"ɽ��ͷĿ"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2909,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"��տ�"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {6, "150����������"}},
	},
}

tbConfig[6] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2909,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "������Ҫ����һ��װ��"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 2, "����", 7}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2909,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "������Ҫ����һ��װ��"}},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2909,1,0,0,},},}}},
		{"GetMissionItem", {{{tbProp = {6,1,2910,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}



tbConfig[8] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"�Ʋ�Ⱦ"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {9, "150����������"}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2910,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3,  "����", 10}},
	}
 }

tbConfig[10] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2910,1,0,0,},},}}},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2910,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[11] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"KillNpc", {"�Ʋ�Ⱦ"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[12] = {
	m_nCurStepId = 6,
	tbMessage = {
		{"DialogWithNpc", {"�Ʋ�Ⱦ"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {13, "150����������"}},
	},
}

tbConfig[13] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "������Ҫ����һ��װ��"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4,  "����", 14}},
	},
}

tbConfig[14] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫ����һ��װ��"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}


