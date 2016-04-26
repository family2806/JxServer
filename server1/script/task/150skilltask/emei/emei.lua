

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"妙如： 这个天忍护法耶律辟离说什么要挑战天下高手，近日来他一直站在峨眉前叫嚣.",
	"玩家: 这个就交给我吧。要让他丢掉看轻天下英雄的蛮横习惯！",
	"妙如：我看耶律辟离神态猖狂，举止无常，你要多加小心.",
}

tbMissionDialog[1] = {
	"妙如： 你被重伤了，去找云慈治伤去."
}

tbMissionDialog[2] = {
	"穆云慈: 额，你的伤势不轻呢。",
	"玩家: 多谢仙子，我的伤已经好多了，仙子真是妙手回春.",
	"穆云慈: 没什么，只是我想请你帮个忙。",
	"玩家: 仙子只管说.",
	"穆云慈: 我正在炮制一种药丸，只缺少一种沾雪冰莲（响水洞）。这种沾雪并联十分难找，我要留下来给别人治病，你能去帮我找回来吗？",
	"玩家: 行医救人是我心里的愿望，拿药的事情就交给我吧.",
}

tbMissionDialog[3] = {
	"穆云慈:这样就好，沾雪冰莲一旦使用会使骨头肌肉像重生一样，这样，不但可以救他，还可以就更多的人.",
	"玩家: 他? 他是谁? 是一个被伤的同门吗?",
	"穆云慈: 啊，不是的，是一个我去拿药时候在街上遇到的伤者，因此才出手相救.",
	"玩家: 仙子，他是不是穿着火红衣服的人?",
	"穆云慈:  恩，你怎么知道？而且他是被峨眉弟子打伤的，你不会就是那个把他打重伤的人吧.",
	"玩家: 仙子，你知道他是谁吗?",
	"穆云慈: 我看他穿红衣还有运功的方式，一定是天忍教的人，他就是之前在峨眉门前叫嚣的耶律辟离吧。",
	"玩家: 这样仙子还要救他吗？",
	"穆云慈: 大夫悬壶济世，从不问病人的来历。就算他是耶律辟离又怎么样。在我眼中，他只是一个身染重病的人。.",
	"玩家: 尽管你为他治病，他一直滥杀无辜，他一旦发疯，也不能遮盖住他沾满血腥的双手.",
	"周云泉: 就算他双手沾满鲜血，这样难道我们就允许峨眉正牌沾满他的血吗？江湖纷争不停，谁是谁非，有时只知心念。",
	"周云泉: 我不想分辨这件事，我只知道，我是一个大夫，只知道尽心尽力救人.",
	"玩家: 如果仙子这样固执的话我只能去禀报掌门了.",
}

tbMissionDialog[4] = {
	"清晓师太: 诶! 师儿啊，云慈的事，就由她去吧!",
	"玩家: 我们峨眉自称名门正派，如不为天下除害，我们的的颜面何存，如何见人.",
	"清晓师太: 正邪之分真有那么重要吗?",
	".....额",
	"清晓师太: 耶律辟离随时天忍教魔人，但他现在只是一个发疯的病人，更何况，云慈毕生的意愿就是救助病人.",
	"玩家: 但这个心愿, 真的是……",
	"清晓师太: 你要知道云慈没有多少时日的人了，就随她去完成她的心愿吧.",
	"玩家: 怎么会这样?仙子看上去很正常啊",
	"周云泉: 神医医人，但是不能自医，这恐怕是世间最可笑的事情了.",
	"周云泉: 云慈才出生就得了怪病，多少年都命悬一线，于是她潜心研究医术。不为个自己治病而是为世间人治病，这世间没有谁比她更绝望了.",
	"玩家: 仙子真是叫世人敬佩",
	"清晓师太: 对啊，最近峨眉得到了一块令牌，这块令牌十分重要，可能需要你去探查一事.",
	"玩家: 弟子遵命.",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1862, nMapId = 24, nPosX = 1697*32, nPosY = 3090*32, nLevel = 95, szName = "沾雪冰莲", bNoRevive = 0,
		szScriptPath = "\\script\\task\\150skilltask\\emei\\binglian.lua",},
	{nNpcId = 1833, nMapId = 13, nPosX = 1745*32, nPosY = 4990*32, nLevel = 95, szName = "耶律辟离", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"妙如："}},
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
		{"PlotDialogue", {1, 2885, 0, "峨眉", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"KillNpc", {"耶律辟离"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:Talk", {"击杀耶律辟离"}},
		{"GotoNextMessageStep", {1, 2885}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"妙如："}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {4, "150级技能任务"}},
	},
 }

tbConfig[4] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "峨眉", -1}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"映雪仙子穆云慈"}},
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
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 2, "峨眉", -1}},
	},
}

tbConfig[7] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"沾雪冰莲"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"ThisTask:GetBingLian", {1, 2885, "峨眉", -1}},
	},
}

tbConfig[8] = {
	m_nCurStepId = 5,
	tbMessage = {
		{"DialogWithNpc", {"映雪仙子穆云慈"}},
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
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckItem", {{{tbProp = {6,1,2911,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3, "峨眉", 10}},
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
		{"DialogWithNpc", {"峨眉掌门清晓师太"}},
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
		{"CheckBagFreeCell", {1, "背包中最少要有1个空格"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "峨眉", 13}},
	},
}

tbConfig[13] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "背包中最少要有1个空格"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}


