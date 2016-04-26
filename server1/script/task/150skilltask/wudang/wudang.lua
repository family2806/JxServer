

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"Ҷ����� ��˵����ǰ��ɽ���и�ǿ��ռɽ�������۸����䵱���徻�����ǣ��书��ǿ�����ȥ��������",
	"���:ʮ��ѧ����Ҳ���������ô��ˣ���������.",
}

tbMissionDialog[1] = {
	"���:�����Ѹ���ǿ���ˣ����ǣ�����²��ǳ���֮��",
	"Ҷ������������˵�ܶ�ط����˽������Ǵ���ʿ�����μӹ�̫ʯս�ۣ��ｫ��һ������о�̽����.",
	"Ҷ����� ����ս��ȡʤ������ȴս��ɳ�����ξ�������ϵ�����....",
	"���:�������Ǵ��ε��¸��ж���ȴ��������....",
	"Ҷ��������Ҿ���Ư��ƿ�����������������Լ�������",
	"���:��Ȼ��ˣ��ҽ�Ϊ����ȥһ�ˣ��������������ҵ������ѣ���Ҳ����Ӣ������ݿ�֮��.",
}

tbMissionDialog[2] = {
	"������:��������·������ʲô����?",
	"���:����Ū�£�Ʒ���۽���û�¾Ͳ����������ݹ���",
	"������:�����ֿ���Ц�ˣ����¶���֮�һ��������",
	"���:(�����ų���) �ź����ǣ��¶�����һ�£�Ҫ��Ӣ������ݿ�֮�֣�����ݹ�Ҳ�����.",
	"������:��ѽ���������ǲ����ˣ���Щ�º��ټ�.",
	"���:�������������Ͷ�����",
	"������:ÿ��ս����ȥ�����ǽ�ɽ��������ʿ����ɲݿܣ���Щ�£������ҿ��ھ�������.",
	"������: ֻ�����ٳ��٣����Ʒ��Ʋ���������ֻ�ǣ�����Ҫ�ȵ���ʱ��������....",
	"��� ��̫��ͻ��",
	"������:������Զ�ͣ������쳾֮��.",
}

tbMissionDialog[3] = {
	"Ҷ�����������Ҫ�����Ƿ����γ�����ʱ���С���Ȼ��ˣ����ǿ���������·.",
	"Ҷ�����ǰ����Զ���ν�߽磬���ǲ����ٵ���ʲô������Ŭ���������ð����ܿ���.",
	"���:����",
	"Ҷ����������䵱Ҳû��ƽ���������������Ƹ��㣬�������ɽһ��",
	"���:�����ھ�ȥ?",
	"Ҷ������书��ǿ���µ�һ���������Ҳ�������ô�õ���.",
	"���:������������ԭ�ɣ���������",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1843, nMapId = 78, nPosX = 202*8*32, nPosY = 200*16*32, nLevel = 95, szName = "������",
		szScriptPath = "\\script\\task\\150skilltask\\wudang\\yuyunwen.lua"},
	{nNpcId = 1856, nMapId = 81, nPosX = 234*8*32, nPosY = 178*16*32, nLevel = 95, szName = "ǿ��ͷ��", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"Ҷ��� "}},
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
		{"PlotDialogue", {1, 2885, 0, "�䵱", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1, 
	tbMessage = {
		{"KillNpc", {"ǿ��ͷ��"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"���ǿ��"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[3] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"Ҷ���"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {4, "150����������"}},
	},
}
 
tbConfig[4] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "�䵱", -1}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"������"}},
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
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "�䵱", -1}},
	},
}


tbConfig[7] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"Ҷ���"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {8, "150����������"}},
	},
}

tbConfig[8] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "��������һ����λ"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3, "�䵱", 9}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "��������һ����λ"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




