

-------局部变量定义 开始---------
local nTask_HuDie		= 1
local nTask_XinXin		= 2
local nTask_ZhuXin_YuanXin		= 3
local nTask_ChenDu		= 4
local nTask_DaLi		= 5
local nTask_FengXiang		= 6
local nTask_XiangYang		= 7
local nTask_BianJin		= 8
local nTask_LinAn		= 9
local nTask_YangZhou		= 10
local nTask_GiveCount		= 11
local nTask_Activi_Point		= 2794
-------局部变量定义 结束---------

tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "Цnh qu竔 r韙 b竛h h箃 sen",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"322,321,144,124,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2496,1,0,0},nExpiredTime=20101011,},1,"5"} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "Цnh qu竔 r韙 b竛h u xanh",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"225,226,227,224,340,75"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2497,1,0,0},nExpiredTime=20101011,},1,"5"} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "Цnh qu竔 r韙 b竛h khoai m玭",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2498,1,0,0},nExpiredTime=20101011,},1,"1"} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 k誸 th骳 t苙g b竛h d蝟 (th緉g)",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[Ho箃 ng trung thu] [T鑞g Kim s秐 sinh b竛h d蝟]"} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 k誸 th骳 t苙g b竛h d蝟 (h遖)",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {0,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[Ho箃 ng trung thu] [T鑞g Kim s秐 sinh b竛h d蝟]"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "FinishSongJin",
	szName = "T鑞g kim cao c蕄 k誸 th骳 t苙g b竛h d蝟 (thua)",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {-1,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2499,1,0,0},nExpiredTime=20101011,},40,"[Ho箃 ng trung thu] [T鑞g Kim s秐 sinh b竛h d蝟]"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "ClickNpc",
	szName = "H祅g rong b竛 b竛h nh﹏ th辴",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"H祅g rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua b竛h nh﹏ th辴",8} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Mua b竛h nh﹏ th辴",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"B竛h nh﹏ th辴",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"30000 lng",{nJxb=30000,},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2500,1,0,0},nExpiredTime=20101011,},1,"[中秋活动] [商贩Mua b竛h nh﹏ th辴]"} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "H籲g nga h頿 th祅h",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"H籲g Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"H籲g Nga灯笼",10} },
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "H籲g Nga划分等级",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"<npc>阁下想H籲g Nga哪种灯笼?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"L錸g n bm bm",11} },
		{"AddDialogOpt",	{"n ng玦 sao",12} },
		{"AddDialogOpt",	{"L錸g n 鑞g",13} },
		{"AddDialogOpt",	{"L錸g n tr遪",14} },
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "H籲g NgaL錸g n bm bm",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"L錸g n bm bm",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B竛h H箃 Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h u Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h Khoai M玭",{tbProp={6,1,2498,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2502,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [H籲g Nga灯笼]"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "H籲g Ngan ng玦 sao笼",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"n ng玦 sao笼",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B竛h H箃 Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h u Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h Khoai M玭",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h d蝟",{tbProp={6,1,2499,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2503,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [H籲g Nga灯笼]"} },
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "H籲g NgaL錸g n 鑞g",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"L錸g n 鑞g",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B竛h H箃 Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h u Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h Khoai M玭",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h nh﹏ th辴",{tbProp={6,1,2500,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2504,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [H籲g Nga灯笼]"} },
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "H籲g NgaL錸g n tr遪",
	nStartDate = 201009200000,
	nEndDate  = 201010110000,
	tbMessageParam = {"L錸g n tr遪",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"B竛h H箃 Sen",{tbProp={6,1,2496,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h u Xanh",{tbProp={6,1,2497,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h Khoai M玭",{tbProp={6,1,2498,1,0,0},},1} },
		{"AddOneMaterial",	{"B竛h th藀 c萴",{tbProp={6,1,2501,1,0,0},},1} },
		{"lib:CheckDay",	{20100920, 20101011, "Th阨 h筺 i  k誸 th骳"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2505,1,0,0},nExpiredTime=20101018,},1,"[中秋活动] [H籲g Nga灯笼]"} },
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","Gia t╪g 1 甶觤 t輈h l騳 s� ki謓"} },
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "使用L錸g n bm bm",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2502,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","Xin h穣 s� d鬾g t筰 th祅h th� ho芻 t﹏ th� th玭!"} },
		{"PlayerFunLib:IsFightState",	{1,"Xin h穣 s� d鬾g t筰 khu v鵦 chi課 u!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"ThisActivity:CheckTask",	{nTask_HuDie,1000,"Чt n kinh nghi謒 cao nh蕋, kh玭g th� nh薾 th猰 kinh nghi謒!","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AwardExp",	{1000000, nTask_HuDie, 1000000000, "使用L錸g n bm bm", "[中秋活动][使用L錸g n bm bm]"} },
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "使用n ng玦 sao笼",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2503,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","请Xin h穣 s� d鬾g t筰 th祅h th� ho芻 t﹏ th� th玭!"} },
		{"PlayerFunLib:IsFightState",	{1,"请Xin h穣 s� d鬾g t筰 khu v鵦 chi課 u!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"Чi L鵦 Th� V�"} },
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "使用L錸g n 鑞g",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2504,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","请Xin h穣 s� d鬾g t筰 th祅h th� ho芻 t﹏ th� th玭!"} },
		{"PlayerFunLib:IsFightState",	{1,"请Xin h穣 s� d鬾g t筰 khu v鵦 chi課 u!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"Thng Th緉g Th� V�"} },
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "使用L錸g n tr遪",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2505,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","请Xin h穣 s� d鬾g t筰 th祅h th� ho芻 t﹏ th� th玭!"} },
		{"PlayerFunLib:IsFightState",	{1,"请Xin h穣 s� d鬾g t筰 khu v鵦 chi課 u!"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddNpc",	{"Kim Cng Th� V�"} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu Th祅h Й",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2507,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_ChenDu,20,"Trong th阨 gian ho箃 ng, m鏸 lo筰 b竛h ch� 頲 s� d鬾g 20 c竔","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][S� d鬾g B竛h Trung Thu Th祅h Й]"} },
		{"ThisActivity:AddTask",	{nTask_ChenDu,1} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu Чi L�",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2508,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_DaLi,20,"Trong th阨 gian ho箃 ng, m鏸 lo筰 b竛h ch� 頲 s� d鬾g 20 c竔","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][S� d鬾g B竛h Trung Thu Чi L�"} },
		{"ThisActivity:AddTask",	{nTask_DaLi,1} },
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu Phng Tng",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2509,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_FengXiang,20,"Trong th阨 gian ho箃 ng, m鏸 lo筰 b竛h ch� 頲 s� d鬾g 20 c竔","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][S� d鬾g B竛h Trung Thu Phng Tng]"} },
		{"ThisActivity:AddTask",	{nTask_FengXiang,1} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu Tng Dng",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2510,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_XiangYang,20,"Trong th阨 gian ho箃 ng, m鏸 lo筰 b竛h ch� 頲 s� d鬾g 20 c竔","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][S� d鬾g B竛h Trung Thu Tng Dng]"} },
		{"ThisActivity:AddTask",	{nTask_XiangYang,1} },
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu Bi謓 Kinh",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2511,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_BianJin,20,"Trong th阨 gian ho箃 ng, m鏸 lo筰 b竛h ch� 頲 s� d鬾g 20 c竔","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][S� d鬾g B竛h Trung Thu Bi謓 Kinh]"} },
		{"ThisActivity:AddTask",	{nTask_BianJin,1} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu L﹎ An",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2512,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_LinAn,20,"Trong th阨 gian ho箃 ng, m鏸 lo筰 b竛h ch� 頲 s� d鬾g 20 c竔","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][S� d鬾g B竛h Trung Thu L﹎ An]"} },
		{"ThisActivity:AddTask",	{nTask_LinAn,1} },
	},
}
tbConfig[25] = --一个细节
{
	nId = 25,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu Dng Ch﹗",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {{tbProp={6,1,2513,1,0,0},}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{nTask_YangZhou,20,"Trong th阨 gian ho箃 ng, m鏸 lo筰 b竛h ch� 頲 s� d鬾g 20 c竔","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"C蕄 50 tr� l猲 m韎 c� th� tham gia ho箃 ng",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[中秋活动][S� d鬾g B竛h Trung Thu Dng Ch﹗]"} },
		{"ThisActivity:AddTask",	{nTask_YangZhou,1} },
	},
}
tbConfig[26] = --一个细节
{
	nId = 26,
	szMessageType = "ServerStart",
	szName = "Loading NPC",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:AddTaskNpc",	{nil} },
		{"tb2010ZhongQiu:AddDecorationNpc",	{nil} },
	},
}
tbConfig[27] = --一个细节
{
	nId = 27,
	szMessageType = "ClickNpc",
	szName = "цi tho筰 v韎 H籲g Nga",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"H籲g Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trong th阨 gian 0 gi?20/09/2010 n 0 gi?11/10/2010, 在2010年09月20日至2010年10月11日，同行可以通过打怪，宋金，H祅g rong，奇珍阁领取各种中秋饼，同时也可以H籲g Nga各种灯笼。在10月18日前使用灯笼，可以召回中秋BOSS，打败后将收到丰富的奖励，同时可以由计划收到L錸g n k衞 qu﹏。N閜 l錸g n k衞 qu﹏给H籲g Nga姐姐，将收到经验奖励，缴1000,2000,3000...将收到比平常更多的经验。H籲g Nga的大度将根据已缴的L錸g n k衞 qu﹏数量决定。每天20点如果H籲g Nga在最大的状态，将出现放烟火效应，各位站在周围的同行可以收到经验奖励。每天20点30分，H籲g Nga将回到最小状态，拉军灯数量也回到0.在活动时间内，每个人最多只能缴1999个。"} },
		{"AddDialogOpt",	{"N閜 l錸g n k衞 qu﹏",28} },
		{"AddDialogOpt",	{"Ki觤 tra s� lng  n閜",34} },
	},
}
tbConfig[28] = --一个细节
{
	nId = 28,
	szMessageType = "CreateCompose",
	szName = "N閜 l錸g n k衞 qu﹏",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {"N閜 l錸g n k衞 qu﹏",1,1,1,0.01},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "Ho箃 ng  k誸 th骳"} },
		{"lib:CheckTime",	{{{000000,200000},{203000,240000}}, "Kh玭g ph秈 l� th阨 gian ho箃 ng"} },
		{"AddOneMaterial",	{"L錸g n k衞 qu﹏",{tbProp={6,1,2506,1,0,0},},1} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
		{"ThisActivity:CheckTask",	{nTask_GiveCount,"1999 - <ComposeCount> ","Trong th阨 gian ho箃 ng m鏸 ngi ch� 頲 n閜 1999 c竔!","<="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_Activi_Point,1} },
		{"PlayerFunLib:AddExp",	{500000,0,"[中秋活动][N閜 l錸g n k衞 qu﹏]"} },
		{"tb2010ZhongQiu:GiveItem2HengE",	{nil} },
		{"ThisActivity:AddTask",	{nTask_GiveCount,1} },
		{"PlayerFunLib:SimpleMsg",	{"Msg2Player","Gia t╪g 1 甶觤 t輈h l騳 s� ki謓"} },
	},
}
tbConfig[29] = --一个细节
{
	nId = 29,
	szMessageType = "ClickNpc",
	szName = "B蕀 v祇 long nhi",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"B� Long"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"фi m苩 n� c鰑 m謓h",33} },
		{"AddDialogOpt",	{"фi m苩 n� trng c玭g",35} },
		{"AddDialogOpt",	{"фi M苩 n� ki猲 ng筺h",36} },
		{"AddDialogOpt",	{"фi m苩 n� qu� 秐h",30} },
		{"AddDialogOpt",	{"фi h錳 thi猲 t竔 t筼 c萴 nang",31} },
		{"AddDialogOpt",	{"фi nh蕋 k� c祅 kh玭 ph�",32} },
	},
}
tbConfig[30] = --一个细节
{
	nId = 30,
	szMessageType = "CreateCompose",
	szName = "фi m苩 n� qu� 秐h",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"M苩 n� qu� 秐h",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Th阨 h筺 i  k誸 th骳"} },
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,455,1,0,0},nExpiredTime=10080,},1,"[Ho箃 ng trung thu][фi qu� 秐h]"} },
	},
}
tbConfig[31] = --一个细节
{
	nId = 31,
	szMessageType = "CreateCompose",
	szName = "фi h錳 thi猲 t竔 t筼 c萴 nang",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"C萴 nang thay i tr阨 t",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Th阨 h筺 i  k誸 th骳"} }
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},3} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1781,1,0,0},nExpiredTime=20160, tbParam={60}},1,"[中秋活动][换取C萴 nang thay i tr阨 t]"} },
	},
}
tbConfig[32] = --一个细节
{
	nId = 32,
	szMessageType = "CreateCompose",
	szName = "фi nh蕋 k� c祅 kh玭 ph�",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"Nh蕋 K� C祅 Kh玭 Ph�",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Th阨 h筺 i  k誸 th骳"} }
		{"AddOneMaterial",	{"Nh蕋 K� C祅 Kh玭 Ph�",{tbProp={6,1,2125,1,0,0},},300} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2126,1,0,0},nExpiredTime=20160,},1,"[中秋活动][фi nh蕋 k� c祅 kh玭 ph�"} },
	},
}
tbConfig[33] = --一个细节
{
	nId = 33,
	szMessageType = "CreateCompose",
	szName = "фi m苩 n� c鰑 m謓h",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"M苩 n� c鰑 m謓h",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Th阨 h筺 i  k誸 th骳"} }
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,454,1,0,0},nExpiredTime=10080,},1,"[中秋活动][фi m苩 n� c鰑 m謓h]"} },
	},
}
tbConfig[34] = --一个细节
{
	nId = 34,
	szMessageType = "nil",
	szName = "检查已N閜 l錸g n k衞 qu﹏数量",
	nStartDate = 201009200000,
	nEndDate  = 201010180000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckDay",	{20100920, 20101018, "Ho箃 ng  k誸 th骳"} },
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201009\\support.lua"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"tb2010ZhongQiu:ShowGiveCount",	{nTask_GiveCount} },
	},
}
tbConfig[35] = --一个细节
{
	nId = 35,
	szMessageType = "CreateCompose",
	szName = "фi m苩 n� trng c玭g",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"M苩 n� trng c玭g",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "фi m苩 n� trng c玭g时限"} }
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},5} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,479,1,0,0},nExpiredTime=10080,},1,"[中秋活动][фi m苩 n� trng c玭g]"} },
	},
}
tbConfig[36] = --一个细节
{
	nId = 36,
	szMessageType = "CreateCompose",
	szName = "фi M苩 n� ki猲 ng筺h",
	nStartDate = 201011160000,
	nEndDate  = 201012060000,
	tbMessageParam = {"M苩 n� ki猲 ng筺h",0,1,1,1},
	tbCondition = 
	{
		--{"lib:CheckDay",	{20101116, 20101206, "Th阨 h筺 i  k誸 th骳"} }
		{"AddOneMaterial",	{"Ng� H祅h K� Th筩h",{tbProp={6,1,2125,1,0,0},},20} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,11,480,1,0,0},nExpiredTime=10080,},1,"[中秋活动][фi M苩 n� ki猲 ng筺h]"} },
	},
}
