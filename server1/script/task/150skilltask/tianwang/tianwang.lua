

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"��Ӣ:��˵���ڽ��������Ժգ���֪�������е�����������",
	"���:��ʲô���񣬰������ܷԸ��������ϵ�ɽ�»𺣣���������������Ͳ������������.",
	"��Ӣ:�У�����������˹�Ȼ�����ǣ������������ϵ�ɽ�»𺣣�ֻ��Ҫ�����Ǹ���ͽ���С������ţ���������Ǹ���ͽ���׼���������!",
	"���:�Ұ�Ҳ����ͽ�������ǳ��裬����˭�������ھ�ȥ",
	"��Ӣ:�ܾ�ǰ�����ǵ������Ϊ��������ռ����飬������������棬������������ְ������",
	"��Ӣ: �Ͳ����������ˡ����ɶ���ǣ���һ�ĸ�����������������Ҷ�м�.",
}

tbMissionDialog[1] = {
	"Ҷ�м�:���죬���յ���.",
	"���:�����������ͽ��ȥ����!",
	"Ҷ�м�:������Ҳ�У��ұ����������������˵����",
	"���:���ӣ�����ˣʲô?",
	"Ҷ�м�:��ֻ�����˵������������տ�ϲһ���˽����Σ�ʱ�����٣�ɱ����Ҫ�����ǣ�ɱ������Ҫ!",
	"���:���Ƕ�����!",
	"Ҷ�м�:����������������㲻����ɱ�����տ�ϲ",
	"���:����ʲô��˼?",
	"Ҷ�м�:����Ϊ�ն����ö�ľ��Ϲ������ý���е��ι��ǿ���⣬���ɻ��Ӷ���ǰ��������Ҳ�����׷������ȥ������������������?",
	"���:����Ϊ˵��Щ��������?",
	"Ҷ�м�: ʲô���ˣ���������������·���ߣ�ֻ��������ɽ�ӣ����´��ң������˶�����������������ô�ܻ��⣿��������������ܸı���ƣ�������̫ƽ��?",
	"���:��",
	"Ҷ�м�: �ν��ս��ͣ�����Ѿ��ð��������ˣ�������˴˴�������ֻ�������¸���.",
	"Ҷ�м�: ���ң���ֻ���ҳ����ҵ����ģ��ҳ������£��Ҳ�����ͽ!",
	"���:���ǣ�������ô˵����Ҳ����Ͷ�����",
	"Ҷ�м�:  ���������Ѿ�˵�ˣ���ֻ���������ն�������ҵ����ܻ�ȡ������ӵ�������Ҳֵ�ˡ����������绹�����Ϳ�ʱ����.",
	"Ҷ�м�: ��������ң�3�����ɽ����ɽһ�ˣ������տ�ϲ����ʱ���㽫֪���������ࡣ�����ƭ�㣬��ʱ����ȡ������Ҳ����.",
}

tbMissionDialog[2] = {
	"��Ӣ: �治������������ˣ���Ȼ��������������!",
	"��Ӣ: �Ҵ��ε��˲ţ����ǲ��ǽ���Ķ��֣����Ǽ鳼���������ǿ��£����²���Ҷ�м�,�������տ�ϲ",
	"���:Ҷ����Ҳ���ˣ����ڶ�ľ����У��ź�����",
	"��Ӣ: ԭ����ˣ�ԭ��Ҷ�м�Ҳ����־֮ʿ���ѵ��������������? Haizz..!!!",
	"��Ӣ: �����ѵ������ˣ�ҲҪ������֣������и����ƣ�����ȥ������������Դ���ô���.",
	"���: ���ƣ�������Ҫȥ����һ��.",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1837, nMapId = 176, nPosX = 163*8*32, nPosY = 194*16*32, nLevel = 95, szName = "Ҷ�м�",
		szScriptPath = "\\script\\task\\150skilltask\\tianwang\\yexingjian.lua"},
	{nNpcId = 1844, nMapId = 193, nPosX = 1736*32, nPosY = 2624*32, nLevel = 95, szName = "���տ�ϲ", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"����������Ӣ"}},
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
		{"DialogWithNpc", {"Ҷ�м� Ҷ�м�"}},
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
		{"KillNpc", {"���տ�ϲ"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2918,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:Talk", {"������տ�ϲ"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"����������Ӣ"}},
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
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2918,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "������Ҫһ��װ����λ"}},
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
		{"CheckItem", {{{tbProp = {6,1,2918,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "������Ҫһ��װ����λ"}}
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2918,1,0,0,},},}}},
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




