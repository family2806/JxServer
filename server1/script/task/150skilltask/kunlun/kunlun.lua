

tbConfig = {}
tbMissionDialog = {}
tbMissionDialog[0] = {
	"璇玑子： 今日我见你拜见才来，对于剑法，你悟出了什么没有?",
	"玩家: 弟子得到一把好剑.",
	"璇玑子：你是昆仑弟子，但是只喜欢剑吗?",
	"玩家: 弟子来拜师",
	"璇玑子： 哦，如果是这样的话，我们为什么不讨论刀剑呢。我在见性峰山洞等你.",
}

tbMissionDialog[1] = {
	"武器被打断，把地上折断的兵器再合成起来，到正殿汇报给掌门",
}

tbMissionDialog[2] = {
	"璇玑子： 虽然你打败了我的分身，但是你的剑折断了，知道是为什么吗？",
	"玩家: 所以弟子才常常去找一把不曾被折断成这样的好剑.",
	"璇玑子：如果那把剑也折断了怎么办?",
	"玩家: 那么那把剑就不是弟子要寻找的剑",
	"璇玑子： 可能有一把剑不会断.",
	"玩家: 那把剑现在在哪",
	"璇玑子： 叹息老人",
}

tbMissionDialog[3] = {
	"叹息老人: 你觉得最高明的剑法是什么?",
	"玩家: 无剑胜有剑.",
	"叹息老人: 这样你为什么还要拿剑?",
	"玩家: 无心无剑, 是剑法的最高境界, 只是我还没有悟到那个境界.",
	"叹息老人: 错，普通人常认为无心无剑，一直认为是剑法的最高境界，而我却相反，我认为有剑在手，心剑合一.",
	"叹息老人: 剑招一出，如弛应机，霆不暇发，电不及飞.",
	"玩家: 人剑合一便无破绽？我认为剑术不是泛泛之辈，剑也是名家所铸，也应达到人剑合一，但是手中之剑也被折断了.",
	"叹息老人: 可借剑一阅否.",
	"上交断剑",
	"玩家: 您用手打剑，是不是有什么意思呢?",
	"叹息老人: 琴有琴音，剑有剑吟，铠不问弹龙吟剑，听音便可悟出剑法的素质,铸法算不上上流，再观剑身",
	"叹息老人: 此剑剑壁微弯，已成衰老之态，你追随剑的心不停，如此剑法在你手中也只是一堆铁！只有铁堆才不会断",
	"这是?",
	"叹息老人: 剑假剑冢, 你在选剑，同时间也在选你，如有机会领悟剑法，增进剑术，希望你早日找到自己的心剑.",
}

tbMissionDialog[4] = {
	"璇玑子：怎么样?",
	"玩家: 师傅要弟子找的剑，真和想的不一样。剑是好剑，人是高人.",
	"璇玑子：找到了绝世宝剑，这个令牌我交给你了.",
	"玩家: 恩？谁的令牌?",
	"璇玑子：山雨欲来风满楼，谁的令牌，其实哪里说得清楚啊.",
	"玩家: 弟子不但要找剑，还要调查这个事情的真相!",
}

tbConfig.tbNpcPos = {
	{nNpcId = 95, nMapId = 136, nPosX = 202*8*32, nPosY = 196*16*32, nLevel = 95, szName = "叹息老人",
		szScriptPath = "\\script\\task\\150skilltask\\kunlun\\tanxilaoren.lua"},
	{nNpcId = 1845, nMapId = 135, nPosX = 1520*32, nPosY = 2944*32, nLevel = 95, szName = "璇玑子：", bNoRevive = 0, nIsboss = 1,},
}

tbConfig[0] = {
	m_nCurStepId = 0,
	tbMessage = {
		{"DialogWithNpc", {"璇玑子："}},
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
		{"PlotDialogue", {1, 2885, 0, "昆仑", -1}},
	},
}

tbConfig[2] = {
	m_nCurStepId = 1, 
	tbMessage = {
		{"KillNpc", {"璇玑子："}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
		{"ThisTask:CheckNoItem", {6,1,2919}},
	},
	tbAction = {
		{"DropItem", {{{tbProp = {6,1,2919,1,0,0,}, nBindState = -2,},}}},
		{"PlotDialogue", {-1, -1, 1, "昆仑", 3}},
	},
}

tbConfig[3] = {
	m_nCurStepId = 1,
	tbMessage = {
		{"PickUp", {{tbProp = {6,1,2919,1,0,0,},}}},
	},
	tbCondition = {
		{"ThisTask:CheckMissionCondition", {}},
	},
	tbAction = {
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[4] = {
	m_nCurStepId = 2,
	tbMessage = {
		{"DialogWithNpc", {"璇玑子："}},
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
		{"PlotDialogue", {1, 2885, 2, "昆仑", -1}},
	},
}


tbConfig[6] = {
	m_nCurStepId = 3,
	tbMessage = {
		{"DialogWithNpc", {"叹息老人"}},
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
		{"PlotDialogue", {-1, -1, 3, "昆仑", 8}},
	},
}

tbConfig[8] = {
	m_nCurStepId = nil, 
	tbMessage = {
	},
	tbCondition = {
	},
	tbAction = {
		{"ConsumeItem", {{{tbProp = {6,1,2919,1,0,0,},},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}

tbConfig[9] = {
	m_nCurStepId = 4,
	tbMessage = {
		{"DialogWithNpc", {"璇玑子："}},
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
		{"CheckBagFreeCell", {1, "背包不够1个空格"}},
	},
	tbAction = {
		{"PlotDialogue", {-1, -1, 4, "昆仑", 11}},
	},
}

tbConfig[11] = {
	m_nCurStepId = nil,
	tbMessage = {
	},
	tbCondition = {
		{"CheckBagFreeCell", {1, "背包不够1个空格"}}
	},
	tbAction = {
		{"GetMissionItem", {{{tbProp = {6,1,2908,1,0,0,}, nBindState = -2,},}}},
		{"GotoNextMessageStep", {1, 2885}},
	},
}




