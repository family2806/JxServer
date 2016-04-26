tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "Chuanguan",
	szName = "闯关28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"shijiandetiaozhan"} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "宋金积分超过1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"songjin"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "捡辉煌果",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"huihuangzhiguo"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "YDBZguoguan",
	szName = "炎帝宝藏闯过10关",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"yandibaozang"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishMail",
	szName = "信使任务",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,3},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"xinshirenwu"} },
	},
}
