

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"端木睿： 天下人士都进我大金国了，叶行俭最终还是中计了!",
	"玩家:恭喜左护法",
	"端木睿：你不问我为什么吗?",
	"玩家:我不需要知道",
	"端木睿：我只是没有看错人，此次你来这里，我有任务交给你.",
	"好的",
	"端木睿：不问是什么任务吗?",
	"玩家:我不需要知道",
	"端木睿：哈哈，你肯定知道大宋的叶行俭，他是个傻子，打听所有信息，但是，他的话不可信，你快去临安一趟，把你听到的回来告诉我，还有...",
	"玩家:我知道了",
}

tbMissionDialog[1] = {
	"武夷山的岳华老人是谁？去那里打听一下."
}

tbMissionDialog[2] = {
	"小颜:我想吃临安大门安东的葫芦糖，我想吃城门那里的板栗糖，我还想吃金水门的四川奶糖。你一个，我一个，一起吃好吗?",
	"玩家:你从没吃过糖吗?",
	"小颜:人家喜欢吃糖，快去买给我吧，我不敢一个人下山~~",
	"玩家:你的爷爷岳华老人呢?",
	"小颜:我不知道，他留下我一个人~~",
	"玩家:算了，不用骗我，你信我杀你吗?",
	"小颜: 他真的没说去哪里了，你给我买糖，我带你去找，只有我一人知道路",
}

tbMissionDialog[3] = {
	"小颜:味道真是甜!",
	"玩家:走吧，我带你去找他",
	"小颜:糖好吃吗?",
	"玩家:...好吃. (我怎么回答那么愚蠢的问题?..)",
	"小颜:可以了，他正在北极的覆雪高原处~~",
	"玩家:你不带我去啊?",
	"小颜:我不能离开这里，如果我骗你，你可以回来找我，对了你是不是天忍教的人?",
	"是的",
	"小颜:那你是汉人啊?",
	"是的",
	"小颜:真是汉人，但是为什么加入天忍教，与大宋战斗?",
	"玩家:我父亲之前是大宋的将领，后来被奸臣杀害，算了，像你这样的小姑娘怎么会知道.",
	"小颜:我知道，因为我和我爷爷都是....",
}

tbMissionDialog[4] = {
	"小颜:你来了.",
	"玩家:也许你要和我走一趟",
	"小颜:小颜还想临安大门安东的葫芦糖，我想吃城门那里的板栗糖，我还想吃金水门的四川奶糖。你一个，我一个，一起吃好吗?",
	"玩家:现在你还说这个，快和我去天忍教.",
	"小颜:我真的不能离开武夷山，我也活不久了。你带我去也不能威胁我的.",
	"玩家:你",
	"小颜:哈哈，你真不是那么冷漠，小颜死了，你会记得去临安买糖吗?",
	"玩家:我... 记得",
}

tbMissionDialog[5] = {
	"端木睿：哈哈，做得好。我大金军队天下威武，天忍教统一天下就要到了",
	"玩家: (一封书信不懂是什么，就这么高兴，看来我要重新认识你)",
	"端木睿：很好，这个令牌我给你，我特别相信你.",
	"玩家:我一定不辜负你的信任",
}

tbMissionDialog[6] = {
	"收到四川奶糖",
}

tbMissionDialog[7] = {
	"收到葫芦糖",
}

tbMissionDialog[8] = {
	"收到板栗糖",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1839, nMapId = 193, nPosX = 151*8*32, nPosY = 160*16*32, nLevel = 95, szName = "小颜",
		szScriptPath = "\\script\\task\\150skilltask\\tianren\\xiaoyan.lua"},
	{nNpcId = 1838, nMapId = 176, nPosX = 152*8*32, nPosY = 182*16*32, nLevel = 95, szName = "叶行俭", bNoRevive = 0, nIsboss = 1,},
	{nNpcId = 1840, nMapId = 320, nPosX = 193*8*32, nPosY = 195*16*32, nLevel = 95, szName = "岳华老人", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"左护法端木睿"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {1, "150级任务"}},
	},
}

tbConfig[1] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 0, "天忍", -1}},
	},
}

tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"KillNpc", {"叶行俭"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2913,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"UseItem", {{tbProp = {6,1,2913,1,0,0,},}}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 1, "天忍", 4}},
	},
}
 
tbConfig[4] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2913,1,0,0,},},}},},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2913,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"小颜"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {6, "150级任务"}},
	},
}

tbConfig[6] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "天忍", -1}},
	},
}

tbConfig[7] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"卖油人"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6, 1, 2914}},
	},
	tbAction = {
		{"AddDialog", {8, "150级任务"}},
	},
}

tbConfig[8] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 6,  "天忍", 9}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2914,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:GotoDetailEX", {"天忍", 16, -1, 6}},
	},
}


tbConfig[10] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"叶小玉"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6, 1, 2915}},
	},
	tbAction = {
		{"AddDialog", {11, "150级任务"}},
	},
}

tbConfig[11] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 7,  "天忍", 12}},
	},
}

tbConfig[12] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2915,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:GotoDetailEX", {"天忍", 16, -1, 6}},
	},
}

tbConfig[13] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"苏三娘"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6, 1, 2916}},
	},
	tbAction = {
		{"AddDialog", {14, "150级任务"}},
	},
}

tbConfig[14] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 8,  "天忍", 15}},
	},
}

tbConfig[15] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2916,1,0,0,}, nBindState = -2,},}}},
		{"ThisTask:GotoDetailEX", {"天忍", 16, -1, 6}},
	},
}

tbConfig[16] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckItemNoMsg", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
	},
	tbAction = {
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[17] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"小颜"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {18, "150级任务"}},
	},
}

tbConfig[18] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3,  "天忍", 19}},
	},
}

tbConfig[19] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2914,1,0,0,},},{tbProp = {6,1,2915,1,0,0,},},{tbProp = {6,1,2916,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[20] = {
	m_nCurStepId = 6,
	tbMessage = {
		{"KillNpc", {"岳华老人"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2917,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[21] = {
	m_nCurStepId = 7,
	tbMessage = {
		{"DialogWithNpc", {"小颜"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {22, "150级任务"}},
	},
}

tbConfig[22] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 4,  "天忍", -1}},
	},
}

tbConfig[23] = {
	m_nCurStepId = 8,
	tbMessage = {
		{"DialogWithNpc", {"左护法端木睿 "}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {24, "150级任务"}},
	},
}

tbConfig[24] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2917,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 5, "天忍", 25}},
	},
}

tbConfig[25] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckItem", {{{tbProp = {6,1,2917,1,0,0,},},}}},
		{"CheckBagFreeCell", {1, "最少需要1个装备空位"}}
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2917,1,0,0,},},}}},
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}
