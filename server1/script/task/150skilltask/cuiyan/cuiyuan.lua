

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"看到若兰望月叹息，神色忧伤。你到那听见她说.",
	"若兰: 10年之约已近, 不知我为何不开心?",
	"玩家: 师姊有心事吗?",
	"若兰: 我与武当的周云泉原是青梅竹马，很久之前就是一对琴棋书画的鸳鸯伴侣. ",
	"若兰: 只因那年国有变数，他说‘匈奴未灭，河移家危'，便与我许下10年之约，说十年之后不管成败都要回来见我.",
	"玩家: 这样的话师姊还担心什么呢?",
	"若兰: 我也不知为何心神难定，但是我也不敢只身去找他.",
	"玩家: 这样的话就由我去帮师姊问一声，师姊不要担心就包在我身上.",
}

tbMissionDialog[1] = {
	"周云泉: 十年恋恋, 前途难卜,百年恋恋, 一抔黄土。儿女情长, 若与国家大事相比, 我真心不能选出一边.",
	"事已至此, 过去的事情就让它过去吧. 我原本只是想让她用这十年的时间忘记我.",
	"玩家: 难道10年不行你又忍心让师姊等一辈子吗?",
	"周云泉: 神州大地到处残破，生离死别已不少见，我怎么能忍心看着不管呢。",
	"玩家: 这些和你与师姊相见有什么关系吗？",
	"周云泉: 一入江湖无归期，我不敢期望有日能够回乡，我怎么能再侮辱她的缘分呢.没有我，她才可以找到幸福。",
	"玩家: 你真狠得下心，我要替师姊教训你!",
	"周云泉: 如果杀了我可以让她忘记我，那么就动手吧!",
	"玩家: 你拔剑吧!",
	"周云泉: 你执意如此，我就与你较量一番，这里人太多不方便，我下山恭候姑娘大驾。",
}

tbMissionDialog[2] = {
	"周云泉: 姑娘的武功实在是高强，为民除害，在下深感惭愧.",
	"玩家: 你真是胆小鬼, 说好在这等我, 最后是骗我来灭强盗.",
	"周云泉: 真是那个地方的百姓在恭候姑娘大驾，姑娘除邪灭恶，真是百姓之福啊！",
	"玩家: 算了算了，你还是不肯乖乖回去见若兰师姊吗？",
	"周云泉: 你能帮我做件事吗?",
	"玩家: 什么？一定又是不去见师姊的借口是吧？",
	"周云泉：你能帮我到襄阳赵刘恒把这个袋子交给他吗？",
	"玩家: 可以，我倒要看看你还能耍什么花样.",
}

tbMissionDialog[3] = {
	"刘恒: 是周大侠的东西啊，我看看，啊？是银票，哈哈，这次城中的百姓又可以过上一阵饱足的日子了.",
	"玩家: 周云泉为什么要让我带银票给你，这么简单的事情为什么要我做？",
	"刘恒: 可能是周大侠太忙了来不了吧? 他最喜欢的就是到处行侠江湖, 扶宋抗金, 要是人人都像他一样不知会有多好呢.",
	"玩家: 真是这样吗? 原来是我错了吗? 难道我逼他去翠烟和师姊一起生活是错的吗?",
	"刘恒: 姑娘，你刚刚说什么?",
	"玩家: 没，没什么。",
}

tbMissionDialog[4] = {
	"若兰: 其实，其实我早就知道事情会是这样，其实……其实我应该就这样一直等下去，就一直把明天当做十年之约的最后一天，这样也没什么不好吧?",
	"玩家: 师姊啊，你不必这么做，天下好男人多的是，像周云泉这种人有什么的.",
	"若兰: 不是呢.",
	"玩家: 他只想自己，只想着抗金，要是人人都像他的话就都要成仙了.",
	"若兰: 妹妹你不知道，他有多爱我，但是不敢和我成亲，他越是不敢我越是要等他。有时候等待已不是等待了，而是一种习惯了.",
	"玩家: 师姊..你...",
	"若兰: 你走吧，值得了，也值得了，你不去这趟，明天就是10年的最后一天.",
	"玩家: 但是... 明天",
	"若兰: 不说了，如果像你担心的那样, 就看令牌不请自来,我要在这等, 我不去了, 妹妹你代我去吧.",
	"玩家: 令牌? 妹妹知道了",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1829, nMapId = 81, nPosX = 1728*32, nPosY = 3328*32, nLevel = 95, szName = "强人", bNoRevive = 0, nIsboss = 1,}, -- 强人
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"若兰"}},
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
		{"PlotDialogue", {1, 2885, 0, "翠烟", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"DialogWithNpc", {"周云泉"}},
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
		{"PlotDialogue", {1, 2885, 1, "翠烟", -1}},
	},
 }

tbConfig[4] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"KillNpc", {"强人"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"周云泉果真是害怕我到这杀他，等我回去找他说清楚."}},
		{"GotoNextMessageStep", {1, 2885}}
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"周云泉"}},
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
		{"CheckBagFreeCell", {1, "背包至少要有1个空格"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 2,  "翠烟", 7}},
	},
}

tbConfig[7] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "背包至少要有1个空格"}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2923,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"刘恒"}},
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
		{"CheckItem", {{{tbProp = {6,1,2923,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3,  "翠烟", 10}},
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
		{"DialogWithNpc", {"若兰"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {12, "150级技能任务"}},
	},
}

tbConfig[12] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "背包空间至少要有1个空格"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4,  "翠烟", 13}},
	},
}

tbConfig[13] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "背包空间至少要有1个空格"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}


