

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"云不邪：水火相生，趋我五毒，楚林之宫，阴阳之宝，生死弹指!",
	"玩家:(这个妖怪，又在装神弄鬼了)香主，这是什么啊？",
	"云不邪：哈哈，这是口诀。五毒派最毒、最残忍的口诀，可以融化天下奇毒，炼成后，只需心念一动.",
	"云不邪：毒素就会深入他人五脏六腑，当他动弹时，体内就会生出无数昆虫，从七窍中爬出来。哈哈.",
	"玩家:啊，香主，你摸我手干嘛?",
	"云不邪：哈哈，很好，很好。应变很快，很难感觉是你的手，真是适合练习五毒降头。练完后，可以掌握他人生死，就等着天下无敌吧~",
	"玩家:听起来，有好事从天而降了，但是，我要付出什么吗?",
	"云不邪：哈哈，和聪明人说话真是不费时间，我没看错人，以你的资质，我希望，只要付出一只手就行.",
	"云不邪： 五大毒虫已准备好给你了，只要你愿意换一只手，就可以用五毒蛊降头引入奇经八脉了~",
	"玩家:一只手换取降头五毒蛊降头，看起来不是一个好的买卖~",
	"云不邪：只是一只手而已，失去手才能将毒素引入体内，哈哈，你放心吧~~",
	"云不邪：有了五毒蛊降头，你就天下无敌，你觉得如何？我动手了哦?",
	"玩家:香主，请等一下，我听说白盈盈很擅长抽筋剥皮，我怕自己砍的不好，我去找她帮忙!",
	"云不邪：哈哈，也对，你想得很周全，白盈盈的手段真是无人能比，你去吧!",
}

tbMissionDialog[1] = {
	"白盈盈:你看看你的左手，皮肉清晰，是只漂亮的手，怎么不要了？我可以帮你，只需要你让我抽你的筋.",
	"玩家:仙子找错人了，我不需要你的美术.",
	"白盈盈: 哦，为什么？你不是对我很有兴趣吗？你来找我干嘛?",
	"玩家:是金蛇香水说想让我传话给你，说仙子天资出众，是练习五毒蛊降头的最好人选",
	"白盈盈：这样啊，那真是我的荣幸，想我砍手还是砍脚?",
	"玩家:(看白盈盈这样生气，恐怕不妙，但是，我也需要看看情况)",
	"白盈盈:哈哈，可以，既然如此，你帮我带口信给木无语，说，我有个买卖和他做.",
}

tbMissionDialog[2] = {
	"玩家:(他喜欢白盈盈，老子只说白盈盈，就想杀我了，该死，我将日后处理你。哈哈，要不我取你的手臂怎么样，云不邪，我不会让你得逞的)",
}

tbMissionDialog[3] = {
	"云不邪：哈哈，看你的左手没有力气，要不砍了你的手给我，我帮你练功.",
	"玩家:(你看我，我将给你一个惊喜!",
	"云不邪：不对，你骗我!",
	"玩家:(这个妖女怎么发现的？)属下哪里敢骗香主?",
	"云不邪：属下，哈哈，你还以为你是属下吗，我要的是你的手，你给我的是什么.",
	"云不邪：你是天性阴阳双脉，你的手冰冷，给我也是垃圾，真是没用!",
	"玩家:对啊，一定是白盈盈，一定是她换了，我去找她!",
}

tbMissionDialog[4] = {
	"白盈盈:你给我的是什么，想下毒吗?",
	"玩家:你骗我，不给你点颜色看看，不能解气。你已中七手断肠草，想解毒吗?",
	"白盈盈:把解药给我，你想学天下无双的秘籍吗，我给你令牌，给我解药!",
	"玩家:令牌，武功，听起来不错~",
}

tbConfig.tbNpcPos = {
	{nNpcId = 1836, nMapId = 183, nPosX = 1690*32, nPosY = 3360*32, nLevel = 95, szName = "木无语", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"云不邪："}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {1, "150级技能"}},
	},
}

tbConfig[1] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 0, "五毒", -1}},
	},
}


tbConfig[2] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"DialogWithNpc", {"白盈盈"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {3, "150级技能"}},
	},
 }
 
tbConfig[3] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"PlotDialogue", {1, 2885, 1, "五毒", -1}},
	},
 }

tbConfig[4] = {
	m_nCurStepId = 2, 
	tbMessage = {
		{"KillNpc", {"木无语"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2912,1,0,0,}, nBindState = -2,},}}},
		{"PlotDialogue", {1, 2885, 2, "五毒", -1}},
	},
}

tbConfig[5] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"云不邪： "}},
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
		{"CheckItem", {{{tbProp = {6,1,2912,1,0,0,},},}}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 3, "五毒", 7}},
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
		{"DialogWithNpc", {"白盈盈"}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"AddDialog", {9, "150级技能"}},
	},
}

tbConfig[9] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"CheckBagFreeCell", {1, "最少需要一个空位"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "五毒", 10}},
	},
}

tbConfig[10] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "最少需要一个空位"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}





