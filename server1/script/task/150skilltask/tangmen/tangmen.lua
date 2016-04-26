

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"唐不染:你也是一个很难得的人才，最近我在制造一种暗器，你去帮我弄这样一样东西.",
	"玩家:你过奖了，原本也没什么才干，只是最近",
	"唐不染: 放心，成功后，少不了你的.",
	"玩家: 真是最近?",
	"唐不染: 凤凰梧桐木，瑶池玉沼丝和九天玄铁晶，这些都是天下奇宝，用来制造暗器，难道你不想分一点吗?",
	"玩家: 你看重我，即使下油锅我都不怕!",
	"唐不染: 只是我制造还少一部分图谱，以前，前辈们因为少原料，所以制造中断。",
	"唐不染: 天下第一余空空已经看上我的图谱了，被他偷了一块，直到今天，原料已够，你只需要去找那块图谱就行.",
	"玩家: 好的，我去.",
}

tbMissionDialog[1] = {
	"余空空:哈哈，哎呀，睡得真香，自然醒来，数钱数到手软，天下的权利握在手中真是爽.",
	"余空空: 看那个宋徽宗，堂堂一个帝王，比多少人还苦。还是我最爽啊.",
	"玩家: 真是遗憾，你的享乐快到尽头了.",
	"余空空: 你是谁？感到武当一剑丹思南我这里，活腻了吧?",
	"玩家: 哈哈，如果你是丹思南，我就是毒胡剑，快说，唐门的图谱在哪?",
	"余空空:原来是唐门少爷，你来的不是时候，图谱已被我藏在杨觉洞了，最近有火山贼经常来.",
	"余空空: 贼子头目有个羊脂白玉，只需要你拿羊脂白玉给我，我就告诉你图谱的位置",
}

tbMissionDialog[2] = {
	"余空空: 哈哈，果真是羊脂白玉，你的图谱在这，那好了。真是痛快啊，我正发愁怎么把这图谱变成之前还在我手中的钱呢，就有两个傻小子来帮我找宝物.",
	"余空空:这个东西没人尝的，我只是拿来玩玩罢了.",
	"玩家: 你真敢要求我吗？你真是要钱不要命了。",
	"余空空:这样的话钱都没有了还要命干吗?",
	".....啊?",
	"余空空: 你还不快走，站在那里干吗？喂，你拿着刀在我脖子上要做什么，小心小心。",
	"玩家: 如果你只要钱不要活命了，那我就成全你，敢和我讨价还价，你知道死字怎么写吗?",
	"余空空:请大侠饶命，大侠饶命!",
	"玩家: 哼，你最好消失不要再让我见到，不然我见你一次打你一次.",
}

tbMissionDialog[3] = {
	"唐不染: 哈哈，好，太好了。就是这个图谱，这里人多，你到外面等我，待会我再和你详细商议.",
}

tbMissionDialog[4] = {
	"唐不染: 啊",
	"玩家: 这是怎么样，你是什么意思？难道你没有带暗器来给我吗?",
	"唐不染: 何必用刀用剑的，你不是要暗器吗，我给你一个机会，等我做完，我不会忘了你的份的!",
	"玩家:  你老头想的是我要放过你吗?",
	"唐不染: 还有绝世无双的天下武功秘籍，神秘宝藏.",
	"玩家: 你说的话再也吸引不了我了",
	"唐不染: 这里有令牌，如果不信你去看!",
	"玩家: 令牌怎么了? 带我去看!",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1830, nMapId = 80, nPosX = 1618*32, nPosY = 3047*32, nLevel = 95, szName = "余空空",
		szScriptPath = "\\script\\task\\150skilltask\\tangmen\\yukongkong.lua"},
	{nNpcId = 1856, nMapId = 196, nPosX = 202*8*32, nPosY = 195*16*32, nLevel = 95, szName = "山贼头目", bNoRevive = 0, nIsboss = 1,},
	{nNpcId = 1832, nMapId = 25, nPosX = 4248*32, nPosY = 5120*32, nLevel = 95, szName = "唐不染", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"唐不染"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {1, "150级技能任务"}},
	},
}

tbConfig[1] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 0, "唐门", -1}},
	},
}

tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"DialogWithNpc", {"余空空"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {3, "150级技能任务"}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "唐门", -1}},
	},
 }

tbConfig[4] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"KillNpc", {"山贼头目"}},
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
		{"DialogWithNpc", {"余空空"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {6, "150级技能任务"}},
	},
}

tbConfig[6] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2909,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "最少需要留下一个装备"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 2, "唐门", 7}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2909,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "最少需要留下一个装备"}},
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
		{"DialogWithNpc", {"唐不染"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {9, "150级技能任务"}},
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
		{"PlotDialogue", {-1, -1, 3,  "唐门", 10}},
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
		{"KillNpc", {"唐不染"}},
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
		{"DialogWithNpc", {"唐不染"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {13, "150级技能任务"}},
	},
}

tbConfig[13] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "最少需要留下一个装备"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4,  "唐门", 14}},
	},
}

tbConfig[14] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要留下一个装备"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}


