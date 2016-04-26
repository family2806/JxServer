

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"杨英:听说你在江湖名声显赫，不知今天你有胆量接任务吗？",
	"玩家:有什么任务，帮主尽管吩咐，不论上刀山下火海，如果我做不到，就不是天王帮的人.",
	"杨英:行，我天王帮的人果然有气魄，哈哈，不用上刀山下火海，只需要不像那个叛徒就行。你听着，我想你带那个叛徒的首级回来给我!",
	"玩家:我帮也有叛徒啊？真是耻辱，他是谁，我现在就去",
	"杨英:很久前，我们的义军因为想给大宋收集军情，将他埋伏到里面，不想他慢慢升职，不久",
	"杨英: 就不回天王帮了。更可恶的是，他一心跟随金国，他的名字是叶行俭.",
}

tbMissionDialog[1] = {
	"叶行俭:今天，最终到了.",
	"玩家:你真是有罪，叛徒，去死吧!",
	"叶行俭:想我死也行，我本该死，你可以听我说几句",
	"玩家:贼子，你想耍什么?",
	"叶行俭:我只想和你说，金国皇子完颜可喜一个人进大宋，时机难觅，杀我重要，但是，杀他更重要!",
	"玩家:你们都该死!",
	"叶行俭:哈哈，如果这样，你不可能杀死完颜可喜",
	"玩家:这是什么意思?",
	"叶行俭:我作为诱饵，让端木睿上钩，才让金国感到宋国是快肥肉，才派皇子独身前来，如果我不是在追兵中死去，你想他还相信我吗?",
	"玩家:你以为说这些就算了吗?",
	"叶行俭: 什么算了？哈哈，我现在无路可走，只是这万里山河，天下大乱，劫走了多少人性命，这样怎么能化解？我们天王帮真的能改变局势，让天下太平吗?",
	"玩家:哼",
	"叶行俭: 宋金对战不停，就已经让百姓遭殃了，天王帮乘此大乱兴起，只会让天下更乱.",
	"叶行俭: 而我，我只是忠诚于我的内心，忠诚于天下，我不是叛徒!",
	"玩家:但是，不管怎么说，你也不能投靠金国",
	"叶行俭:  哈哈，我已经说了，我只是以身做诱饵，如果我的命能换取金国皇子的命，我也值了。让它发生早还是晚，就看时运了.",
	"叶行俭: 如果你信我，3天后，你山武夷山一趟，见完颜可喜，到时，你将知道事情真相。如果我骗你，到时你再取我性命也不迟.",
}

tbMissionDialog[2] = {
	"杨英: 真不愧是天王帮的人，果然铁骨铮铮，人中龙凤!",
	"杨英: 我大宋的人才，在那不是金国的对手，都是奸臣当朝，真是可怕，这事不是叶行俭,而是完颜可喜",
	"玩家:叶大人也死了，死在端木睿手中，遗憾的是",
	"杨英: 原来如此，原来叶行俭也是有志之士，难道我天王帮错了吗? Haizz..!!!",
	"杨英: 事情已到这里了，也要继续坚持，这里有个令牌，你拿去，我相信你可以处理好此事.",
	"玩家: 令牌？看起来要去调查一趟.",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1837, nMapId = 176, nPosX = 163*8*32, nPosY = 194*16*32, nLevel = 95, szName = "叶行俭",
		szScriptPath = "\\script\\task\\150skilltask\\tianwang\\yexingjian.lua"},
	{nNpcId = 1844, nMapId = 193, nPosX = 1736*32, nPosY = 2624*32, nLevel = 95, szName = "完颜可喜", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"天王帮主杨英"}},
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
		{"PlotDialogue", {1, 2885, 0, "天王", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"DialogWithNpc", {"叶行俭 叶行俭"}},
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
		{"PlotDialogue", {1, 2885, 1, "天王", -1}},
	},
}

tbConfig[4] = {
	m_nCurStepId = 2, 
	tbMessage = {
		{"KillNpc", {"完颜可喜"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2918,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:Talk", {"打败完颜可喜"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"天王帮主杨英"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {6, "150级技能"}},
	},
}

tbConfig[6] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2918,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "最少需要一个装备空位"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 2, "天王", 7}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2918,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "最少需要一个装备空位"}}
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2918,1,0,0,},},}}},
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




