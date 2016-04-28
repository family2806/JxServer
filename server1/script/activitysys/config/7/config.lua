Include("\\script\\activitysys\\g_activity.lua")
local tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "DailogOption",
	szName = "Ta muèn dïng nh¸nh c©y ®æi lÊy kinh nghiÖm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TuyÕt mai","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer1","C¸c h¹ muèn dïng c¸ch nµo ®Ó ®æi?"} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ComposeDailogOption",
	szName = format("Sö dông %s ®æi thµnh %u kinh nghiÖm", "Nh¸nh c©y tiÓu", 4000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","§æi kinh nghiÖm",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Nh¸nh c©y tiÓu","return {tbProp={6,1,2141,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"Sö dông nh¸nh c©y tiÓu, nh¸nh c©y trung, nh¸nh c©y ®¹i nhiÒu nhÊt chØ ®­îc 300.000.000 kinh nghiÖm","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{18} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "ComposeDailogOption",
	szName = format("Sö dông %s ®æi thµnh %u kinh nghiÖm", "Nh¸nh c©y trung", 6000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","§æi kinh nghiÖm",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Nh¸nh c©y trung","return {tbProp={6,1,2142,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"Sö dông nh¸nh c©y tiÓu, nh¸nh c©y trung, nh¸nh c©y ®¹i nhiÒu nhÊt chØ ®­îc 300.000.000 kinh nghiÖm","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{19} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "ComposeDailogOption",
	szName = format("Sö dông %s ®æi thµnh %u kinh nghiÖm", "Nh¸nh c©y ®¹i", 10000000),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer1","§æi kinh nghiÖm",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Nh¸nh c©y ®¹i","return {tbProp={6,1,2143,1,0,0},}",1} },
		{"PlayerFunLib:CheckTask",	{2647,300,"Sö dông nh¸nh c©y tiÓu, nh¸nh c©y trung, nh¸nh c©y ®¹i nhiÒu nhÊt chØ ®­îc 300.000.000 kinh nghiÖm","<"} },
	},
	tbActition = 
	{
		{"G_ACTIVITY:ExecActivityDetail",	{20} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "DailogOption",
	szName = format("NhËn ®­îc %s", "®iÓm trang trİ"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TuyÕt mai","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer2","C¸c h¹ muèn dïng c¸ch nµo ®Ó ®æi?"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "ComposeDailogOption",
	szName = format("Sö dông %s ®æi %d %s", "Nh¸nh c©y tiÓu", 1, "®iÓm trang trİ"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","§æi ®iÓm trang trİ",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Nh¸nh c©y tiÓu","return {tbProp={6,1,2141,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"C¸c h¹ vÉn ch­a cã bang héi"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{1} },
		{"G_ACTIVITY:ExecActivityDetail",	{18} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "ComposeDailogOption",
	szName = format("Sö dông %s ®æi %d %s", "Nh¸nh c©y trung", 2, "®iÓm trang trİ"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","§æi ®iÓm trang trİ",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Nh¸nh c©y trung","return {tbProp={6,1,2142,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"C¸c h¹ vÉn ch­a cã bang héi"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{2} },
		{"G_ACTIVITY:ExecActivityDetail",	{19} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "ComposeDailogOption",
	szName = format("Sö dông %s ®æi %d %s", "Nh¸nh c©y ®¹i", 3, "®iÓm trang trİ"),
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer2","§æi ®iÓm trang trİ",0,0,0,"",0},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Nh¸nh c©y ®¹i","return {tbProp={6,1,2143,1,0,0},}",1} },
		{"PlayerFunLib:IsHaveTong",	{"C¸c h¹ vÉn ch­a cã bang héi"} },
		{"tbZhongQiu200909:IsTimeAct",	{nil} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:AddExploit",	{3} },
		{"G_ACTIVITY:ExecActivityDetail",	{20} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "DailogOption",
	szName = "Xem ®iÓm trang trİ bang héi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TuyÕt mai","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3","§¹i hiÖp muèn xem c¸i g×?"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "DailogOption",
	szName = "Xem t×nh h×nh ®iÓm trang trİ cña bæn bang",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3","",""},
	tbCondition = 
	{
		{"PlayerFunLib:IsHaveTong",	{"C¸c h¹ vÉn ch­a cã bang héi"} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:TongInfo",	{nil} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "DailogOption",
	szName = "Xem ®iÓm trang trİ bang héiÅÅĞĞ°ñÇé¿ö",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1","Chän xem 1 bang xÕp h¹ng"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "DailogOption",
	szName = "B¶ng xÕp h¹ng mçi ®ît",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.1", format("<lua LadderFunLib:GetInfo(10263,\"%s\",\"%s\",\"%s\")/>", "ĞòºÅ", "°ï»áÃû³Æ", "ÊıÁ¿" ) } },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "DailogOption",
	szName = "B¶ng xÕp h¹ng tuÇn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.2",format("<lua LadderFunLib:GetInfo(10264,\"%s\",\"%s\",\"%s\")/>", "ĞòºÅ", "°ï»áÃû³Æ", "ÊıÁ¿")} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "DailogOption",
	szName = "B¶ng xÕp h¹ng suèt ho¹t ®éng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"shitouer3.1","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:ShowSubDailog",	{"shitouer3.1.3",format("<lua LadderFunLib:GetInfo(10265,\"%s\",\"%s\",\"%s\")/>",  "ĞòºÅ", "°ï»áÃû³Æ", "ÊıÁ¿" )} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "DailogOption",
	szName = "NhËn th­ëng xÕp h¹ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TuyÕt mai","",""},
	tbCondition = 
	{
		{"PlayerFunLib:IsHaveTong",	{"C¸c h¹ vÉn ch­a cã bang héi"} },
	},
	tbActition = 
	{
		{"tbZhongQiu200909:GetAwardDailog",	{nil} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "DailogOption",
	szName = "§i ®Õn ®Şa ®iÓm th­êng xuÊt hiÖn c©y gi¸ng sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xa phu","",""},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"tbZhongQiu200909:FlyToTree",	{nil} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "SetDailogTitle",
	szName = "ÉèÖÃÑ©Ã·±êÌâ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"TuyÕt mai","<npc>".."Ta ®ang cÇn t×m nh÷ng nh¸nh th«ng thËt ®Ñp ®Ó trang trİ cho nh÷ng C©y Gi¸ng Sinh quanh ®©y cµng thªm léng lÉy. §¹i hiÖp cã thÓ gióp ta t×m nh÷ng nh¸nh th«ng thËt tuyÖt vêi kh«ng?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "nil",
	szName = "T¨ng thªm ®iÓm c«ng ®øc ®ång thêi t¨ng ®iÓm kinh nghiÖm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"Sö dông nh¸nh c©y tiÓu, nh¸nh c©y trung, nh¸nh c©y ®¹i nhiÒu nhÊt chØ ®­îc 300.000.000 kinh nghiÖm","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{4000000,0,"shuzhi huan jingyan"} },
		{"PlayerFunLib:AddTask",	{2647,4} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "nil",
	szName = "T¨ng thªm ®iÓm c«ng ®øc ®ång thêi t¨ng ®iÓm kinh nghiÖm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"Sö dông nh¸nh c©y tiÓu, nh¸nh c©y trung, nh¸nh c©y ®¹i nhiÒu nhÊt chØ ®­îc 300.000.000 kinh nghiÖm","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{6000000,0,"shuzhi huan jingyan"} },
		{"PlayerFunLib:AddTask",	{2647,6} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "nil",
	szName = "T¨ng thªm ®iÓm c«ng ®øc ®ång thêi t¨ng ®iÓm kinh nghiÖm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{2647,300,"Sö dông nh¸nh c©y tiÓu, nh¸nh c©y trung, nh¸nh c©y ®¹i nhiÒu nhÊt chØ ®­îc 300.000.000 kinh nghiÖm","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"shuzhi huan jingyan"} },
		{"PlayerFunLib:AddTask",	{2647,10} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(7, tbConfig)
