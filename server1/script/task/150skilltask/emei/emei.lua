

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"���磺 ������̻���Ү�ɱ���˵ʲôҪ��ս���¸��֣���������һֱվ�ڶ�üǰ����.",
	"���: ����ͽ����Ұɡ�Ҫ����������������Ӣ�۵�����ϰ�ߣ�",
	"���磺�ҿ�Ү�ɱ�����̬���񣬾�ֹ�޳�����Ҫ���С��.",
}

tbMissionDialog[1] = {
	"���磺 �㱻�����ˣ�ȥ���ƴ�����ȥ."
}

tbMissionDialog[2] = {
	"���ƴ�: �������Ʋ����ء�",
	"���: ��л���ӣ��ҵ����Ѿ��ö��ˣ������������ֻش�.",
	"���ƴ�: ûʲô��ֻ������������æ��",
	"���: ����ֻ��˵.",
	"���ƴ�: ����������һ��ҩ�裬ֻȱ��һ��մѩ��������ˮ����������մѩ����ʮ�����ң���Ҫ�������������β�������ȥ�����һ�����",
	"���: ��ҽ�������������Ը������ҩ������ͽ����Ұ�.",
}

tbMissionDialog[3] = {
	"���ƴ�:�����ͺã�մѩ����һ��ʹ�û�ʹ��ͷ����������һ�����������������Ծ����������Ծ͸������.",
	"���: ��? ����˭? ��һ�����˵�ͬ����?",
	"���ƴ�: �������ǵģ���һ����ȥ��ҩʱ���ڽ������������ߣ���˲ų������.",
	"���: ���ӣ����ǲ��Ǵ��Ż���·�����?",
	"���ƴ�:  ��������ô֪�����������Ǳ���ü���Ӵ��˵ģ��㲻������Ǹ����������˵��˰�.",
	"���: ���ӣ���֪������˭��?",
	"���ƴ�: �ҿ��������»����˹��ķ�ʽ��һ�������̵̽��ˣ�������֮ǰ�ڶ�ü��ǰ������Ү�ɱ���ɡ�",
	"���: �������ӻ�Ҫ������",
	"���ƴ�: ��������������Ӳ��ʲ��˵���������������Ү�ɱ�������ô�����������У���ֻ��һ����Ⱦ�ز����ˡ�.",
	"���: ������Ϊ���β�����һֱ��ɱ�޹�����һ�����裬Ҳ�����ڸ�ס��մ��Ѫ�ȵ�˫��.",
	"����Ȫ: ������˫��մ����Ѫ�������ѵ����Ǿ������ü����մ������Ѫ�𣿽���������ͣ��˭��˭�ǣ���ʱֻ֪���",
	"����Ȫ: �Ҳ���ֱ�����£���ֻ֪��������һ�����ֻ֪�����ľ�������.",
	"���: �������������ִ�Ļ���ֻ��ȥ����������.",
}

tbMissionDialog[4] = {
	"����ʦ̫: ��! ʦ�������ƴȵ��£�������ȥ��!",
	"���: ���Ƕ�ü�Գ��������ɣ��粻Ϊ���³��������ǵĵ�����δ棬��μ���.",
	"����ʦ̫: ��а֮��������ô��Ҫ��?",
	".....��",
	"����ʦ̫: Ү�ɱ�����ʱ���̽�ħ�ˣ���������ֻ��һ������Ĳ��ˣ����ο����ƴȱ�������Ը���Ǿ�������.",
	"���: �������Ը, ����ǡ���",
	"����ʦ̫: ��Ҫ֪���ƴ�û�ж���ʱ�յ����ˣ�������ȥ���������Ը��.",
	"���: ��ô������?���ӿ���ȥ��������",
	"����Ȫ: ��ҽҽ�ˣ����ǲ�����ҽ����������������Ц��������.",
	"����Ȫ: �ƴȲų����͵��˹ֲ��������궼����һ�ߣ�������Ǳ���о�ҽ������Ϊ���Լ��β�����Ϊ�������β���������û��˭������������.",
	"���: �������ǽ����˾���",
	"����ʦ̫: �԰��������ü�õ���һ�����ƣ��������ʮ����Ҫ��������Ҫ��ȥ̽��һ��.",
	"���: ��������.",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1862, nMapId = 24, nPosX = 1697*32, nPosY = 3090*32, nLevel = 95, szName = "մѩ����", bNoRevive = 0,
		szScriptPath = "\\script\\task\\150skilltask\\emei\\binglian.lua",},
	{nNpcId = 1833, nMapId = 13, nPosX = 1745*32, nPosY = 4990*32, nLevel = 95, szName = "Ү�ɱ���", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"���磺"}},
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
		{"PlotDialogue", {1, 2885, 0, "��ü", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"KillNpc", {"Ү�ɱ���"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"��ɱҮ�ɱ���"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"���磺"}},
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
		{"PlotDialogue", {1, 2885, 1, "��ü", -1}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"ӳѩ�������ƴ�"}},
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
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "��ü", -1}},
	},
}

tbConfig[7] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"մѩ����"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:GetBingLian", {1, 2885, "��ü", -1}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"ӳѩ�������ƴ�"}},
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
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2911,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3, "��ü", 10}},
	},
}

tbConfig[10] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2911,1,0,0,},},}}},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2911,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[11] = {
	m_nCurStepId = 6,
	tbMessage = {
		{"DialogWithNpc", {"��ü��������ʦ̫"}},
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
		{"CheckBagFreeCell", {1, "����������Ҫ��1���ո�"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "��ü", 13}},
	},
}

tbConfig[13] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "����������Ҫ��1���ո�"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}


