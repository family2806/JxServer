

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"玄因方丈: 阿弥陀佛，佛法修心，如佛实名台，不可懈怠，近日你下山，不知道你的修行怎么样了?",
	"玩家: 阿弥陀佛，回禀师父，菩萨有慈悲心肠，有普度众生.",
	"玄因方丈: 如果你没有激发渡世的心意呢?",
	"玩家: 山下烽烟四起，贫僧不敢独善其身。修行的重点是渡世之心.",
	"玄因方丈: 正是因为你有渡世之心才增加了你的潜心。你到山脚去，那里有一名女子，你可以渡她吗?",
}

tbMissionDialog[1] = {
	"女子： 大师，我等你已经很久了.",
	"玩家: 这位施主，有什么就只管和贫僧说.",
	"女子：大师觉得怎么样?",
	"玩家: 枯木倚寒岩，三冬无暖气.",
	"女子：大师无佛心.",
	"玩家: 佛者有超人之道, 也不能跨越人的本性, 是超脱人世的道，可以助人脱离失望.",
	"女子： 大师错了，这不是佛者。",
	"玩家: 决则离，防则沉，无心才是佛心，明心见清.",
}

tbMissionDialog[2] = {
	"玄因方丈: 阿弥陀佛，老衲问你，你渡她了吗?",
	"玩家: 凡是人，不论什么形态都有愚昧的心。想要渡一个人，太难了。那个女孩凡心太重了。",
	"玄因方丈: 错，人有七情六欲，才会形成三界，在救人之道的路上，合情合理。超脱忘情，超脱人世，这就缘木求鱼，对水捞月.",
	"玩家: 正人身立人世，参众生智参情欲之苦，更资能或无常智慧和圆满觉悟.",
	"玄因方丈: 违反自然，能达到无常智慧吗？就像是淫界色界弟子，竟不知淫者，本微过度，淫界就很过度.",
	"玩家: 弟子明白了",
	"玄因方丈: 这样的话你再去渡她吧.",
}

tbMissionDialog[3] = {
	"女子：大师，你又来这啊?",
	"玩家: 施主刚才紧抱贫僧，还问我感觉怎么样?",
	"女子： 这是",
	"玩家: 天知地知你知我知",
	"女子： 大师，我本是山下一个幸福人家的孩子，但是金兵路过这，在我家只有我一人.",
	"女子： 平日我都一心向佛，奈何试克，我依旧心如火焚，愤怒难平.",
	"玩家: 施主的忧伤的眼泪，真是忧伤的珍珠，充满施主的心，才使你一心向佛，所有众人都是友情'.",
	"女子： 大师，我想有佛心，我该怎样修行呢?",
	"玩家: 佛心只是一片平常心罢了，佛心通过辱身体现在我们面前，既有忧伤也有欢乐.",
	"女子： 拜见大师，我自小就生活在少林寺旁，晨听敲钟声，午闻木鱼声，佛晓精神不断加强，渐渐成向佛之心.",
	"女子： 但是无法破解心中的痛苦。我只能孤身一人，民居建在这里极其痛苦，下山流民四方，相反我这里没有一天安生。大师愿为我破戒杀生吗?",
	"玩家: 阿弥陀佛，杀生来救生，斩孽非斩人!",
	"女子： 近日有一个匪人武功极其厉害，大师慈悲为怀，这样的话要尽快为民除害才对.",
}

tbMissionDialog[4] = {
	"玄因方丈: 阿弥陀佛，拿出世之心行人世之事，先生活再生子，何谓慈悲？慈能伟岳，悲能拔苦，佛心是一片完全敞开的包容之心，也是一颗平常心.",
	"玩家: 弟子记住了",
	"玄因方丈: 近日金军侵犯我国的领土，战火不停，百姓众人都忍受着痛苦，六道众生皆有佛情，凡是出家人也要有有度之心.",
	"玄因方丈: 佛祖也大发雷霆，方显菩萨心肠，地狱不空，暂不成佛。众人渡尽，方正菩提！你去吧。令牌要拿好了.",
	"玩家: 其实是还是有着入世心的出家人.",
	"玄因方丈: 这个令牌十分重要，你要调查清楚了.",
	"玩家: 启禀师傅，弟子明白了。",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1842, nMapId = 103, nPosX = 1440*32, nPosY = 3520*32, nLevel = 95, szName = "山下女子：",
		szScriptPath = "\\script\\task\\150skilltask\\shaolin\\nvzi.lua"},
	{nNpcId = 1841, nMapId = 103, nPosX = 1488*32, nPosY = 3536*32, nLevel = 95, szName = "Ph?Nh﹏", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"辞因方丈"}},
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
		{"PlotDialogue", {1, 2885, 0, "少林", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"DialogWithNpc", {"山下女子："}},
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
		{"PlotDialogue", {1, 2885, 1, "少林", -1}},
	},
}

tbConfig[4] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"辞因方丈"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {5, "150级技能任务"}},
	},
}

tbConfig[5] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "少林", -1}},
	},
}

tbConfig[6] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"山下女子："}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {7, "150级技能任务"}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 3, "少林", -1}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 4, 
	tbMessage = {
		{"KillNpc", {"匪人"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"打败匪人"}},
		{"GotoNextMessageStep", {1, 2885}},
	},}

tbConfig[9] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"辞因方丈"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {10, "150级技能任务"}},
	},
}

tbConfig[10] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "背包至少需要1个空格"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "少林", 11}},
	},
}

tbConfig[11] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "背包至少需要1个空格"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




