

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"����ӣ� �����Ҽ���ݼ����������ڽ������������ʲôû��?",
	"���: ���ӵõ�һ�Ѻý�.",
	"����ӣ��������ص��ӣ�����ֻϲ������?",
	"���: ��������ʦ",
	"����ӣ� Ŷ������������Ļ�������Ϊʲô�����۵����ء����ڼ��Է�ɽ������.",
}

tbMissionDialog[1] = {
	"��������ϣ��ѵ����۶ϵı����ٺϳ�������������㱨������",
}

tbMissionDialog[2] = {
	"����ӣ� ��Ȼ�������ҵķ���������Ľ��۶��ˣ�֪����Ϊʲô��",
	"���: ���Ե��Ӳų���ȥ��һ�Ѳ������۶ϳ������ĺý�.",
	"����ӣ�����ǰѽ�Ҳ�۶�����ô��?",
	"���: ��ô�ǰѽ��Ͳ��ǵ���ҪѰ�ҵĽ�",
	"����ӣ� ������һ�ѽ������.",
	"���: �ǰѽ���������",
	"����ӣ� ̾Ϣ����",
}

tbMissionDialog[3] = {
	"̾Ϣ����: �����������Ľ�����ʲô?",
	"���: �޽�ʤ�н�.",
	"̾Ϣ����: ������Ϊʲô��Ҫ�ý�?",
	"���: �����޽�, �ǽ�������߾���, ֻ���һ�û�����Ǹ�����.",
	"̾Ϣ����: ����ͨ�˳���Ϊ�����޽���һֱ��Ϊ�ǽ�������߾��磬����ȴ�෴������Ϊ�н����֣��Ľ���һ.",
	"̾Ϣ����: ����һ�������Ӧ��������Ͼ�����粻����.",
	"���: �˽���һ��������������Ϊ�������Ƿ���֮������Ҳ������������ҲӦ�ﵽ�˽���һ����������֮��Ҳ���۶���.",
	"̾Ϣ����: �ɽ轣һ�ķ�.",
	"�Ͻ��Ͻ�",
	"���: �����ִ򽣣��ǲ�����ʲô��˼��?",
	"̾Ϣ����: �������������н����������ʵ�����������������������������,�����㲻���������ٹ۽���",
	"̾Ϣ����: �˽�����΢�䣬�ѳ�˥��̬֮����׷�潣���Ĳ�ͣ����˽�����������Ҳֻ��һ������ֻ�����ѲŲ����",
	"����?",
	"̾Ϣ����: ���ٽ�ڣ, ����ѡ����ͬʱ��Ҳ��ѡ�㣬���л������򽣷�������������ϣ���������ҵ��Լ����Ľ�.",
}

tbMissionDialog[4] = {
	"����ӣ���ô��?",
	"���: ʦ��Ҫ�����ҵĽ��������Ĳ�һ�������Ǻý������Ǹ���.",
	"����ӣ��ҵ��˾�����������������ҽ�������.",
	"���: ����˭������?",
	"����ӣ�ɽ����������¥��˭�����ƣ���ʵ����˵�������.",
	"���: ���Ӳ���Ҫ�ҽ�����Ҫ����������������!",
}

tbConfig.tbNpcPos = {
	{nNpcId = 95, nMapId = 136, nPosX = 202*8*32, nPosY = 196*16*32, nLevel = 95, szName = "̾Ϣ����",
		szScriptPath = "\\script\\task\\150skilltask\\kunlun\\tanxilaoren.lua"},
	{nNpcId = 1845, nMapId = 135, nPosX = 1520*32, nPosY = 2944*32, nLevel = 95, szName = "����ӣ�", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"����ӣ�"}},
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
		{"KillNpc", {"����ӣ�"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6,1,2919}},
	},
	tbAction = {
		{"DropItem", {{{tbProp = {6,1,2919,1,0,0,}, nBindState = -2,},}}},
		{"PlotDialogue", {-1, -1, 1, "����", 3}},
	},
}

tbConfig[3] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"PickUp", {{tbProp = {6,1,2919,1,0,0,},}}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[4] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"����ӣ�"}},
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
		{"DialogWithNpc", {"̾Ϣ����"}},
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
		{"PlotDialogue", {-1, -1, 3, "����", 8}},
	},
}

tbConfig[8] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2919,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[9] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"����ӣ�"}},
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
		{"CheckBagFreeCell", {1, "��������1���ո�"}},
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
		{"CheckBagFreeCell", {1, "��������1���ո�"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




