

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"�Ʋ�а��ˮ�������������嶾������֮��������֮����������ָ!",
	"���:(������֣�����װ��Ū����)����������ʲô����",
	"�Ʋ�а�����������ǿھ����嶾���������̵Ŀھ��������ڻ������涾�����ɺ�ֻ������һ��.",
	"�Ʋ�а�����ؾͻ���������������������������ʱ�����ھͻ������������棬��������������������.",
	"���:�����������������ָ���?",
	"�Ʋ�а���������ܺã��ܺá�Ӧ��ܿ죬���Ѹо�������֣������ʺ���ϰ�嶾��ͷ������󣬿������������������͵��������޵а�~",
	"���:���������к��´�������ˣ����ǣ���Ҫ����ʲô��?",
	"�Ʋ�а���������ʹ�����˵�����ǲ���ʱ�䣬��û�����ˣ���������ʣ���ϣ����ֻҪ����һֻ�־���.",
	"�Ʋ�а�� ��󶾳���׼���ø����ˣ�ֻҪ��Ը�⻻һֻ�֣��Ϳ������嶾�ƽ�ͷ�����澭������~",
	"���:һֻ�ֻ�ȡ��ͷ�嶾�ƽ�ͷ������������һ���õ�����~",
	"�Ʋ�а��ֻ��һֻ�ֶ��ѣ�ʧȥ�ֲ��ܽ������������ڣ�����������İ�~~",
	"�Ʋ�а�������嶾�ƽ�ͷ����������޵У��������Σ��Ҷ�����Ŷ?",
	"���:���������һ�£�����˵��ӯӯ���ó�����Ƥ�������Լ����Ĳ��ã���ȥ������æ!",
	"�Ʋ�а��������Ҳ�ԣ�����ú���ȫ����ӯӯ���ֶ����������ܱȣ���ȥ��!",
}

tbMissionDialog[1] = {
	"��ӯӯ:�㿴��������֣�Ƥ����������ֻƯ�����֣���ô��Ҫ�ˣ��ҿ��԰��㣬ֻ��Ҫ�����ҳ���Ľ�.",
	"���:�����Ҵ����ˣ��Ҳ���Ҫ�������.",
	"��ӯӯ: Ŷ��Ϊʲô���㲻�Ƕ��Һ�����Ȥ���������Ҹ���?",
	"���:�ǽ�����ˮ˵�����Ҵ������㣬˵�������ʳ��ڣ�����ϰ�嶾�ƽ�ͷ�������ѡ",
	"��ӯӯ�����������������ҵ����ң����ҿ��ֻ��ǿ���?",
	"���:(����ӯӯ�������������²�����ǣ���Ҳ��Ҫ�������)",
	"��ӯӯ:���������ԣ���Ȼ��ˣ�����Ҵ����Ÿ�ľ���˵�����и�����������.",
}

tbMissionDialog[2] = {
	"���:(��ϲ����ӯӯ������ֻ˵��ӯӯ������ɱ���ˣ��������ҽ��պ����㡣������Ҫ����ȡ����ֱ���ô�����Ʋ�а���Ҳ�������óѵ�)",
}

tbMissionDialog[3] = {
	"�Ʋ�а�����������������û��������Ҫ����������ָ��ң��Ұ�������.",
	"���:(�㿴�ң��ҽ�����һ����ϲ!",
	"�Ʋ�а�����ԣ���ƭ��!",
	"���:(�����Ů��ô���ֵģ�)���������ƭ����?",
	"�Ʋ�а�����£��������㻹��Ϊ������������Ҫ��������֣�����ҵ���ʲô.",
	"�Ʋ�а��������������˫��������ֱ��䣬����Ҳ������������û��!",
	"���:�԰���һ���ǰ�ӯӯ��һ���������ˣ���ȥ����!",
}

tbMissionDialog[4] = {
	"��ӯӯ:����ҵ���ʲô�����¶���?",
	"���:��ƭ�ң����������ɫ���������ܽ��������������ֶϳ��ݣ���ⶾ��?",
	"��ӯӯ:�ѽ�ҩ���ң�����ѧ������˫���ؼ����Ҹ������ƣ����ҽ�ҩ!",
	"���:���ƣ��书������������~",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1836, nMapId = 183, nPosX = 1690*32, nPosY = 3360*32, nLevel = 95, szName = "ľ����", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"�Ʋ�а��"}},
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
		{"PlotDialogue", {1, 2885, 0, "�嶾", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"DialogWithNpc", {"��ӯӯ"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {3, "150������"}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "�嶾", -1}},
	},
 }

tbConfig[4] = {
	m_nCurStepId = 2, 
	tbMessage = {
		{"KillNpc", {"ľ����"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2912,1,0,0,}, nBindState = -2,},}}},
		{"PlotDialogue", {1, 2885, 2, "�嶾", -1}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"�Ʋ�а�� "}},
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
		{"CheckItem", {{{tbProp = {6,1,2912,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3, "�嶾", 7}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2912,1,0,0,},},}}},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2912,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"��ӯӯ"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {9, "150������"}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "������Ҫһ����λ"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "�嶾", 10}},
	},
}

tbConfig[10] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "������Ҫһ����λ"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}





