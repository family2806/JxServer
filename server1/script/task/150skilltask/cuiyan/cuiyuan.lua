

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"������������̾Ϣ����ɫ���ˡ��㵽��������˵.",
	"����: 10��֮Լ�ѽ�, ��֪��Ϊ�β�����?",
	"���: ʦ���������?",
	"����: �����䵱������Ȫԭ����÷�����ܾ�֮ǰ����һ�������黭��ԧ�����. ",
	"����: ֻ��������б�������˵����ūδ�𣬺��Ƽ�Σ'������������10��֮Լ��˵ʮ��֮�󲻹ܳɰܶ�Ҫ��������.",
	"���: �����Ļ�ʦ梻�����ʲô��?",
	"����: ��Ҳ��֪Ϊ�������Ѷ���������Ҳ����ֻ��ȥ����.",
	"���: �����Ļ�������ȥ��ʦ���һ����ʦ梲�Ҫ���ľͰ���������.",
}

tbMissionDialog[1] = {
	"����Ȫ: ʮ������, ǰ;�Ѳ�,��������, һ�g��������Ů�鳤, ������Ҵ������, �����Ĳ���ѡ��һ��.",
	"��������, ��ȥ�������������ȥ��. ��ԭ��ֻ������������ʮ���ʱ��������.",
	"���: �ѵ�10�겻������������ʦ梵�һ������?",
	"����Ȫ: ���ݴ�ص������ƣ����������Ѳ��ټ�������ô�����Ŀ��Ų����ء�",
	"���: ��Щ������ʦ������ʲô��ϵ��",
	"����Ȫ: һ�뽭���޹��ڣ��Ҳ������������ܹ����磬����ô������������Ե����.û���ң����ſ����ҵ��Ҹ���",
	"���: ����ݵ����ģ���Ҫ��ʦ梽�ѵ��!",
	"����Ȫ: ���ɱ���ҿ������������ң���ô�Ͷ��ְ�!",
	"���: ��ν���!",
	"����Ȫ: ��ִ����ˣ��Ҿ��������һ����������̫�಻���㣬����ɽ��������ݡ�",
}

tbMissionDialog[2] = {
	"����Ȫ: ������书ʵ���Ǹ�ǿ��Ϊ�������������в���.",
	"���: �����ǵ�С��, ˵���������, �����ƭ������ǿ��.",
	"����Ȫ: �����Ǹ��ط��İ����ڹ�������ݣ������а������ǰ���֮������",
	"���: �������ˣ��㻹�ǲ��ϹԹԻ�ȥ������ʦ���",
	"����Ȫ: ���ܰ�����������?",
	"���: ʲô��һ�����ǲ�ȥ��ʦ梵Ľ���ǰɣ�",
	"����Ȫ�����ܰ��ҵ������������������ӽ�������",
	"���: ���ԣ��ҵ�Ҫ�����㻹��ˣʲô����.",
}

tbMissionDialog[3] = {
	"����: ���ܴ����Ķ��������ҿ�������������Ʊ����������γ��еİ����ֿ��Թ���һ�����������.",
	"���: ����ȪΪʲôҪ���Ҵ���Ʊ���㣬��ô�򵥵�����ΪʲôҪ������",
	"����: �������ܴ���̫æ�������˰�? ����ϲ���ľ��ǵ�����������, ���ο���, Ҫ�����˶�����һ����֪���ж����.",
	"���: ����������? ԭ�����Ҵ�����? �ѵ��ұ���ȥ���̺�ʦ�һ�������Ǵ����?",
	"����: �����ո�˵ʲô?",
	"���: û��ûʲô��",
}

tbMissionDialog[4] = {
	"����: ��ʵ����ʵ�����֪�����������������ʵ������ʵ��Ӧ�þ�����һֱ����ȥ����һֱ�����쵱��ʮ��֮Լ�����һ�죬����Ҳûʲô���ð�?",
	"���: ʦ械����㲻����ô�������º����˶���ǣ�������Ȫ��������ʲô��.",
	"����: ������.",
	"���: ��ֻ���Լ���ֻ���ſ���Ҫ�����˶������Ļ��Ͷ�Ҫ������.",
	"����: �����㲻֪�������жమ�ң����ǲ��Һ��ҳ��ף���Խ�ǲ�����Խ��Ҫ��������ʱ��ȴ��Ѳ��ǵȴ��ˣ�����һ��ϰ����.",
	"���: ʦ�..��...",
	"����: ���߰ɣ�ֵ���ˣ�Ҳֵ���ˣ��㲻ȥ���ˣ��������10������һ��.",
	"���: ����... ����",
	"����: ��˵�ˣ�������㵣�ĵ�����, �Ϳ����Ʋ�������,��Ҫ�����, �Ҳ�ȥ��, ���������ȥ��.",
	"���: ����? ����֪����",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1829, nMapId = 81, nPosX = 1728*32, nPosY = 3328*32, nLevel = 95, szName = "ǿ��", bNoRevive = 0, nIsboss = 1,}, -- ǿ��
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"����"}},
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
		{"DialogWithNpc", {"����Ȫ"}},
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
		{"KillNpc", {"ǿ��"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"����Ȫ�����Ǻ����ҵ���ɱ�������һ�ȥ����˵���."}},
		{"GotoNextMessageStep", {1, 2885}}
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"����Ȫ"}},
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
		{"CheckBagFreeCell", {1, "��������Ҫ��1���ո�"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 2,  "����", 7}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "��������Ҫ��1���ո�"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2923,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"����"}},
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
		{"CheckItem", {{{tbProp = {6,1,2923,1,0,0,},},}}},
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
		{"CheckItem", {{{tbProp = {6,1,2923,1,0,0,},},}}},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2923,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[11] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"����"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {12, "150����������"}},
	},
}

tbConfig[12] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "�����ռ�����Ҫ��1���ո�"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4,  "����", 13}},
	},
}

tbConfig[13] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "�����ռ�����Ҫ��1���ո�"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}


