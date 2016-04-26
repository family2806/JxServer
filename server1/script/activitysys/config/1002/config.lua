Include("\\script\\activitysys\\config\\1002\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Init Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:InitNpc",	{nil} },
	},
}
tbConfig[2] = --宋金2000点
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "高级宋金2000点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{2000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_雪星星\t宋金2000"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "闯过17关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_雪星星\t闯过17关"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "闯关28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},10,"Event_雪星星\t闯关28"} },
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "完成风陵渡",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},20,"Event_雪星星\t完成风陵渡"} },
	},
}
tbConfig[6] = --杀手boss
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "90级杀手任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},3,"Event_雪星星\t消灭杀手BOSS"} },
	},
}
tbConfig[7] = --宋金1000点
{
	nId = 7,
	szMessageType = "FinishSongJin",
	szName = "高级宋金1000点",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
		--{"PlayerFunLib:CheckTaskDaily",	{nTSK_DAILY_TK_领_冰_石,4,"","<"} },
	},
	tbActition = 
	{
		--{"PlayerFunLib:AddTaskDaily",	{nTSK_DAILY_TK_领_冰_石,4} },
		--{"PlayerFunLib:GetItem",	{{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime, nBindState = -2},4,"Event_雪星星\t宋金领取冰石"} },
	},
}
tbConfig[8] = --使用雪冰石礼盒
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "使用雪冰石礼盒",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30120,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{nTSK_DAILY_SU_DUNG_BANG_THACH_LE_HOP,15,"今天已使用15个雪冰石礼盒，明天继续使用哦.","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{nTSK_DAILY_SU_DUNG_BANG_THACH_LE_HOP,1} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime},10,"Event_NgoiSaoTuyet\tSuDungTuyetBangThachLeHop"} },
		{"ThisActivity:UseFreezingStoneBoxLog", {nil}},
	},
}
----add对话npc
tbConfig[9] = --大老师对话
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "点击天精老人",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"天精老人"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"您好，您想要我升级雪冰晶吗?"} },
		{"AddDialogOpt",	{"升级雪冰晶1级", 11} },
		{"AddDialogOpt",	{"升级雪冰晶2级", 12} },
		{"AddDialogOpt",	{"升级雪冰晶3级", 13} },
		{"AddDialogOpt",	{"升级雪冰晶4级", 14} },
		{"AddDialogOpt",	{"升级雪冰晶5级", 15} },
		{"AddDialogOpt",	{"升级雪冰晶6级", 16} },
		{"AddDialogOpt",	{"升级雪冰晶7级", 17} },
		{"AddDialogOpt",	{"升级雪冰晶8级", 18} },
		{"AddDialogOpt",	{"升级雪冰晶9级", 19} },
		{"AddDialogOpt",	{"升级雪冰晶10级", 20} },
		{"AddDialogOpt",	{"升级雪冰晶11级", 21} },
		{"AddDialogOpt",	{"升级雪冰晶12级", 22} },	
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "升级雪冰晶",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>请选择等级"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
--		{"AddDialogOpt",	{"雪冰晶1级", 11} },
--		{"AddDialogOpt",	{"雪冰晶2级", 12} },
--		{"AddDialogOpt",	{"雪冰晶3级", 13} },
--		{"AddDialogOpt",	{"雪冰晶4级", 14} },
--		{"AddDialogOpt",	{"雪冰晶5级", 15} },
--		{"AddDialogOpt",	{"雪冰晶6级", 16} },
--		{"AddDialogOpt",	{"雪冰晶7级", 17} },
--		{"AddDialogOpt",	{"雪冰晶8级", 18} },
--		{"AddDialogOpt",	{"雪冰晶9级", 19} },
--		{"AddDialogOpt",	{"雪冰晶10级", 20} },
--		{"AddDialogOpt",	{"雪冰晶11级", 21} },
--		{"AddDialogOpt",	{"雪冰晶12级", 22} },
	},
}
----合成原料
tbConfig[11] = --合成1级星星
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "合成1级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[1级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[0]级",{tbProp={6,1,30118,0,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{1} },
	},
}
tbConfig[12] = --合成2级星星
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "合成2级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[2级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[1]级",{tbProp={6,1,30118,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{2} },
	},
}
tbConfig[13] = --合成3级星星
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "合成3级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[3]级",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[2]级",{tbProp={6,1,30118,2,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{3} },
	},
}
tbConfig[14] = --合成4级星星
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "合成4级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[4级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[3]级",{tbProp={6,1,30118,3,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{4} },
	},
}
tbConfig[15] = --合成5级星星
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "合成5级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[5级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[4]级",{tbProp={6,1,30118,4,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{5} },
	},
}
tbConfig[16] = --合成6级星星
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "合成6级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[6级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[5]级",{tbProp={6,1,30118,5,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{6} },
	},
}
tbConfig[17] = --合成7级星星
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "合成7级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[7级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[6]级",{tbProp={6,1,30118,6,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{7} },
	},
}
tbConfig[18] = --合成8级星星
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "合成8级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[8级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[7]级",{tbProp={6,1,30118,7,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{8} },
	},
}
tbConfig[19] = --合成9级星星
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "合成9级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[9级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[8]级",{tbProp={6,1,30118,8,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{9} },
	},
}
tbConfig[20] = --合成10级星星
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "合成10级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[10级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[9]级",{tbProp={6,1,30118,9,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{10} },
	},
}
tbConfig[21] = --合成11级星星
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "合成11级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[11级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[10]级",{tbProp={6,1,30118,10,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{11} },
	},
}
tbConfig[22] = --合成12级星星
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "合成12级星星",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[12级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[11]级",{tbProp={6,1,30118,11,0,0},nExpiredTime=nItemExpiredTime,},1} },
		{"AddOneMaterial",	{"雪冰石",{tbProp={6,1,30119,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:UpgradeStar",	{12} },
	},
}

tbConfig[23] = --小童子对话
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "点击小童子",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"小童子"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"您好，大侠需要什么?"} },
		{"AddDialogOpt",	{"送雪冰晶[1级]",24} },	
		{"AddDialogOpt",	{"送雪冰晶[2级]",25} },	
		{"AddDialogOpt",	{"送雪冰晶[3级]",26} },	
		{"AddDialogOpt",	{"送雪冰晶[4级]",27} },	
		{"AddDialogOpt",	{"送雪冰晶[5级]",28} },	
		{"AddDialogOpt",	{"送雪冰晶[6级]",29} },	
		{"AddDialogOpt",	{"送雪冰晶[7级]",30} },	
		{"AddDialogOpt",	{"送雪冰晶[8级]",31} },	
		{"AddDialogOpt",	{"送雪冰晶[9级]",32} },	
		{"AddDialogOpt",	{"送雪冰晶[10级]",33} },	
		{"AddDialogOpt",	{"送雪冰晶[11级]",34} },	
		{"AddDialogOpt",	{"送雪冰晶[12级]",35} },	
	},
}
tbConfig[24] = --送雪冰晶1级
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "送星星 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[1级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[1]级",{tbProp={6,1,30118,1,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{1} },
	},
}
tbConfig[25] = --送雪冰晶2级
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "送星星 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[2级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[2]级",{tbProp={6,1,30118,2,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{2} },
	},
}
tbConfig[26] = --送雪冰晶3级
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "送星星3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[3级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[3]级",{tbProp={6,1,30118,3,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{3} },
	},
}
tbConfig[27] = --送雪冰晶4级
{
	nId = 27,
	szMessageType = "CreateCompose",
	szName = "送星星4",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[4级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[4]级",{tbProp={6,1,30118,4,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{4} },
	},
}
tbConfig[28] = --送雪冰晶5级
{
	nId = 28,
	szMessageType = "CreateCompose",
	szName = "送星星5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[5级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[5]级",{tbProp={6,1,30118,5,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{5} },
	},
}
tbConfig[29] = --送雪冰晶6级
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "送星星6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[6级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[6]级",{tbProp={6,1,30118,6,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{6} },
	},
}
tbConfig[30] = --送雪冰晶7级
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "送星星7",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[7级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[7]级",{tbProp={6,1,30118,7,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{7} },
	},
}
tbConfig[31] = --送雪冰晶8级
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "送星星8",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[8级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[8]级",{tbProp={6,1,30118,8,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{8} },
	},
}
tbConfig[32] = --送雪冰晶9级
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "送星星9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[ 9级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[9]级",{tbProp={6,1,30118,9,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{9} },
	},
}
tbConfig[33] = --送雪冰晶10级
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "送星星10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[10级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[10]级",{tbProp={6,1,30118,10,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{10} },
	},
}
tbConfig[34] = --送雪冰晶11级
{
	nId = 34,
	szMessageType = "CreateCompose",
	szName = "送星星 11",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[ 11级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[11]级",{tbProp={6,1,30118,11,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{11} },
	},
}
tbConfig[35] = --送雪冰晶12级
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "送星星12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>雪冰晶[12级]",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"雪冰晶[12]级",{tbProp={6,1,30118,12,0,0},nExpiredTime=nItemExpiredTime,},1} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveStar",	{12} },
	},
}
tbConfig[36] = --使用木箱
{
	nId = 36,
	szMessageType = "ItemScript",
	szName = "使用木箱",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30121,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{2,"default"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseWoodenChest", {nil}},
	},
}