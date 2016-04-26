Include("\\script\\activitysys\\config\\31\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "服务器启动加载npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "打怪给奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	--Fix map ID Kh醓 Lang ng - Modified by DinhHQ - 20110606
		{"NpcFunLib:CheckInMap",	{"321,322,340,75,93,144,225,226,227"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2862,1,0,0},nExpiredTime=20110630,},1,"8"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "高级宋金得分大于1000小于3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_songjinggethongselihe", "宋金1000点"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "高级宋金得分大于3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {15, "jxshengri_songjinghuodehongselihe", "宋金3000点"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "高级闯关过第17关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_chuangguanggetlihe", "高级闯关(17关)"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "高级闯关过第28关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox",	{10, "jxshengri_chuangguanghuodelihe", "高级闯关(28关)"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "在1、2、3码头打怪",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeitoulingdiaoluohongselihe", "消灭水贼头领"} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {1, "jxshengri_shashouchanchuhongselihe", "消灭90级杀手Boss"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "世界BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {20, "jxshengri_bosschanchuhongselihe", "消灭世界BOSS"} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {1, "jxshengri_yandichanchuhongselihe"} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "YDBZ_KillMaxBoss",
	szName = "炎帝杀死BOSS",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:YDBZ_GiveRedBox",	{nil} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "FinishMail",
	szName = "完成信使任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveRedBox", {5, "jxshengri_xinshichanchuhongselihe"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "使用蓝色礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2862,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBlueBox",	{nil} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "使用红色礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2863,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseRedBox",	{nil} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "ClickNpc",
	szName = "与蛋糕对话",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"生日蛋糕"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"合成冰淇淋饼",16} },
		{"AddDialogOpt",	{"合成生日蛋糕",17} },
		{"AddDialogOpt",	{"合同特别的生日蛋糕",18} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "合成冰淇淋饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B竛h Kem",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"鲜奶",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"精糖",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"面粉",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"冰淇淋",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"奶油",{tbProp={6,1,2855,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2859,1,0,0},nExpiredTime=20110630,},1,"SinhNhatVoLamTruyenKy\tHopThanhBanhKem"} },
		{"AddStatData",	{"jxshengri_naiyoubing", 1} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "合成生日蛋糕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"合成生日蛋糕",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"鲜奶",{tbProp={6,1,2851,1,0,0},},2} },
		{"AddOneMaterial",	{"精糖",{tbProp={6,1,2852,1,0,0},},2} },
		{"AddOneMaterial",	{"面粉",{tbProp={6,1,2853,1,0,0},},2} },
		{"AddOneMaterial",	{"冰淇淋",{tbProp={6,1,2856,1,0,0},},1} },
		{"AddOneMaterial",	{"奶油",{tbProp={6,1,2855,1,0,0},},2} },
		{"AddOneMaterial",	{"巧克力",{tbProp={6,1,2854,1,0,0},},1} },
		{"AddOneMaterial",	{"生日蜡烛",{tbProp={6,1,2857,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GetCake",	{nil} },
		{"AddStatData",	{"jxshengri_dangao", 1} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "合成特别生日蛋糕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"特别生日蛋糕",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"大生日蛋糕",{tbProp={6,1,2861,1,0,0},},1} },
		{"AddOneMaterial",	{"水果篮",{tbProp={6,1,2858,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2864,1,0,0},nExpiredTime=20110630,},1,"武林传奇生日\t合成特别生日蛋糕"} },
		{"AddStatData",	{"jxshengri_tebiedangao", 1} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "使用奶油饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2859,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"150级以上或者已重生才能使用",">="} },
		{"ThisActivity:CheckTask",	{TSKG_NaiYouBing,1000,"在整个活动时间内，每个人物最多只能使用1000冰淇淋饼","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_NaiYouBing,1} },
		{"ThisActivity:UseNaiYouBing",	{nil} },		
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "使用小蛋糕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2860,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"150级以上或者已重生才能使用",">="} },
		{"ThisActivity:CheckTask",	{TKSG_XiaoDanGao,500,"在整个活动时间内，每个人物最多只能使用500个小蛋糕","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"装备不够"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_XiaoDanGao,1} },
		{"ThisActivity:UseXiaoDanGao",	{nil} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "使用大蛋糕",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2861,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"150级以上或者已重生才能使用",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_DaDanGao,10,"每天最多只能使用10个大生日蛋糕","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"装备不够"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_DaDanGao,1} },
		{"ThisActivity:UseDaDanGao",	{nil} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "使用特别生日饼",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2864,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"150级以上或者已重生才能使用",">="} },
		{"ThisActivity:CheckTask",	{TKSG_TeBieShengRiBing,400,"在整个活动时间内，每个人物最多只能使用400个特别生日蛋糕","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{10,"装备不够"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_TeBieShengRiBing,1} },
		{"ThisActivity:UseTeBieDanGao",	{nil} },
		{"ThisActivity:GetRabbit",	{nil} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "兔毛换翻羽",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam ={" 大人团"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"换翻羽",24} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "合成翻羽",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"翻羽",0,2,3,1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"兔毛",{tbProp={6,1,2865,1,0,0},},200} },
	},
	tbActition = 
	{
		{"ThisActivity:GetFanYu",	{nil}},
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "NpcOnDeath",
	szName = "杀死水贼大头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveRedBox", {5, "jxshengri_shuizeidatoulingdiaoluohongselihe", "消灭水贼大头领"} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "FinishSongJin",
	szName = "HoanThanhTranTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{		
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2725,1} },
		{"ThisActivity:Vn_AwardOnSJMatchCount",	{nil} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "Chuanguan",
	szName = "HoanThanhAi28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },		
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{2726,1} },
		{"ThisActivity:Vn_AwardOnCOTMatchCount",	{nil} },
	},
}
tbConfig[28] = 
{
	nId = 28,
	szMessageType = "FinishFengLingDu",
	szName = "完成风陵渡损失费用",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:Vn_CheckPLDTime", {nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},10,"SinhNhatVoLamTruyenKy\tHoanThanhPLDTonPhi"} },
	},
}