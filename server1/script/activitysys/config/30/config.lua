Include("\\script\\activitysys\\config\\30\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "高级宋金积分大于1000且小于3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveSongjinAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"越南教师节活动", "宋金1000领笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "宋金1000", "笔", 1}},
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "高级宋金积分大于3000",
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
		--{"ThisActivity:GiveSongjinAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "TongKim3000NhanCayBut"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TongKim3000", "笔", 1}},
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "高级闯关过17关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{17} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"越南教师节活动", "闯关17获得笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "VuotAi17", "笔", 1}},
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "高级闯关过28关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveChuangguanAward",	{28} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "闯关28获得笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "闯关28", "笔", 1}},
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishKillerBoss",
	szName = "高级杀手boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {90},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveShashouAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},2,"越南教师节活动", "消灭杀手BossSat获得笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossSatThu", "笔", 1}},
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯过10关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveYDBZAward",	{10} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},15,"越南教师节活动", "炎帝闯过10关获得笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "炎帝闯过10关", "笔", 1}},
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "野外打怪掉落白纸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,3039,1,0,0},nExpiredTime=20111201,},1,"5"} },		
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "ServerStart",
	szName = "服务器启动时加载npc",
	nStartDate = 201111010000,
	nEndDate  = 201112010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡水贼头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveFenglinduAward",	{1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},5,"越南教师节", "消灭水军头领获得笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "消灭水军头领", "笔", 1}},
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡水贼大头领",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveFenglinduAward",	{2} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},10,"Event_NhaGiaoVN", "消灭水军大头领获得笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "消灭水军大头领", "笔", 1}},
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "黄金boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		--{"ThisActivity:GiveGoldBossAward",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3040,1,0,0},nExpiredTime=20111201,},20,"Event_NhaGiaoVN", "消灭世界Boss获得笔"} },
		{"tbVngTransLog:Write", {"201111_20Thang11/", 16, "TieuDietBossTheGioi", "笔", 1}},
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "点击大老师",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"大老师"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"AddDialogOpt",	{"上交书",13} },
		{"AddDialogOpt",	{"领取教师节奖励",14} },
		--{"AddDialogOpt",	{"领取金乌图谱",15} },
		{"SetDialogTitle",	{"每年教师节又到了，各位大侠可以通过上交<color=yellow> 书籍 <color> 给我将获得奖励，如果上交次数达到700次，依然可以收到一些金乌图谱。同时，在2011年11月20日，可以到我这里领取越南教师节礼品，每人只能领取一次，不要忘记那天哦。"} },
	},
}
--tbConfig[13] = --一个细节
--{
--	nId = 13,
--	szMessageType = "nil",
--	szName = "上交书籍",
--	nStartDate = nil,
--	nEndDate  = nil,
--	tbMessageParam = {nil},
--	tbCondition = 
--	{
--		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
--	},
--	tbActition = 
--	{
--		{"ThisActivity:HandInBook",	{nil} },
--	},
--}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "使用书籍",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3042,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"ThisActivity:CheckBookLimit",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:UseBook",	{nil} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "nil",
	szName = "领取教师节奖励",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_TeacherAward,0,"你已经领取该奖励了，不能再领了","=="} },
	},
	tbActition = 
	{
		{"ThisActivity:TeacherAward",	{nil} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "nil",
	szName = "领取金乌图谱",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_JinwuAward,0,"您已领取该奖励，不能再领了","=="} },
		{"ThisActivity:CheckTask",	{TSK_HandInBook,700,"大侠所上交的书籍次数不足700次，不能领奖励.",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:JinwuAward",	{nil} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "点击书童",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"书童"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"上交白纸",17} },
		{"AddDialogOpt",	{"合成书籍",18} },
		{"SetDialogTitle",	{"大侠! 有<color=yellow> 白纸<color> 吗, 给我吧，我将给你相应的奖励。跟你说一个秘密，使用<color=yellow> 5 张白纸，一支笔，一瓶墨水 <color> juice可以合成一本 <color=yellow> 书 <color>, 拿书籍上交给<color=yellow> 我旁边的大老师<color> 将收到宝贵奖励。和你小声说吧，白纸可以到 <color=yellow> 长白山南，长白山北，裸狼洞，沙漠山洞3，莫高窟，进菊洞 <color> 打怪掉落，而笔则可以通过参加各种性能活动获得，墨水可以在 <color=yellow> 奇珍阁找到<color>, 不要弄错了哦"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "nil",
	szName = "交白纸",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandInPaper",	{nil} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "合成书籍",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"书籍",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{"白纸",{tbProp={6,1,3039,1,0,0},},5} },
		{"AddOneMaterial",	{"笔",{tbProp={6,1,3040,1,0,0},},1} },
		{"AddOneMaterial",	{"墨水",{tbProp={6,1,3041,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3042,1,0,0},nExpiredTime=20111201,},1,"Event_NhaGiaoVN","GhepCuonSach"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "使用花之恩",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3043,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedZhienhua,nMaxZhienhua,"真是遗憾，目前使用数量不够，不能再使用了","<"} },
		{"ThisActivity:CheckTask",	{TSK_HandInPaper,nMaxPaperCount,format("目前上交白纸数量未达到%s, 不能使用",nMaxPaperCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseZhienhua",	{nil} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "使用天宇魂",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,3044,-1,-1,0},} "},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTask",	{TSK_UsedTianyuhun,nMaxTianyuhun,"真是遗憾，目前使用数量不够，不能再使用了","<"} },
		--{"ThisActivity:CheckTask",	{TSK_HandInBook,nMaxBookCount,format("目前上交书籍数量未达到%s, 不能使用",nMaxBookCount),">="} },
	},
	tbActition = 
	{
		{"ThisActivity:UseTianyuhun",	{nil} },
	},
}
