----------------------------------------------------------------
--FileName:	headinfo.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	周末活动：卫国战争之烽火连城
--			功能1：活动头文件自定义常量
-----------------------------------------------------------------
IncludeLib("FILESYS");
--IncludeLib("BATTLE");
IncludeLib("TITLE");
IncludeLib("RELAYLADDER")
Include( "\\script\\task\\system\\task_string.lua" );

--print(date("%w"))				--获得当前服务器星期 1--Monday；2--Tuesday；3--Wednesday；4--Thursday；5--Frieday；6--Saturday；0--Sunday
GV_TSK_CD_OPEN = 35
FIRE_OPENDAY_SATURDAY = 6;		--
FIRE_OPENDAY_SUNDAY = 0;		--
CD_LEVEL_LIMIT = 80		--最低参加守城等级
TASKID_FIRE_KEY = 1185;--random(1000000);					--每场次的关键字，由此判断是否为本轮次参加的玩家
TASKID_FIRE_DAY = 1186;--tonumber(date("%m%d"));			--玩家一天只能参加一场卫国战争，记录日期
TASKID_FIRE_ADDR = 1187;--传入的的城市ID
--1189
TSKID_FIRE_SIGNLVL = 1867	--报名时等级
TSKID_FIRE_SIGNEXP = 1868	--报名时经验值
TSKID_FIRE_SUMEXP = 1869	--获得的经验值
TSKID_PLAYER_ZHANGONG = 1879 --获得的战功值
FIRE_JOINUP_FEE = 100000;			--报名费用10w两
PL_TOTALPOINT = 1
--LADDER_ID_TEMP = 10255	--暂存排行榜
--LADDER_ID_FANIEL = 10256--最终排行

MAX_NPC_COUNT = 500--1000--5000;	--限制地图中最多有5000个npc

FIRE_1RSTNPC_COUNT = 13500--15000;
FIRE_2CNDNPC_COUNT = 3000--2000;
FIRE_3RDNPC_COUNT = 1500--1000;
FIRE_4THNPC_COUNT = 120;
FIRE_5THNPC_COUNT = 10;

TNPC_DOCTOR1 = 55;			--宋军医的Npc模板ID号
TNPC_DOCTOR2 = 49;			--金军医的Npc模板ID号
TNPC_DEPOSIT = 625;			--储物箱NPC模板ID
TNPC_CHEFU = 393;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
RANK_SKILL = 661;		--称号光环
					--列兵	小队长	副将	大将	元帅 炸弹车
tbTNPC_SOLDIER = {	{1067,	1068,	1069,	1070,	1080, 1337},	--宋
										{1072,	1073,	1074,	1075,	1090, 1337}}	--金
tbSOLDIER_NAME = {	"小号", "队长", "先锋", "主将", "主帅", "攻城战场"	}
tbPlAYERER_NAME 		= {"士兵","校尉 ","统领","副将 ","大将"} --战功达到称谓光环
tbPlAYERER_ZHANGONG = {     0,   300,   500,  1000,  2000} --大于0为士兵，大于300为校尉....
tbPlAYERER_GUANGHUAN= { {89,   90,   91,   92,   93}, --宋称号ID
												{94,   95,   96,   97,   98}} --金
					--卫兵	将军 守城部分的固定npc
tbTNPC_SOLDIER1 = {	{1067,	1068},	--宋
					{1072,	1073}}	--金
tbSOLDIER_NAME1 = {	"卫兵", "将军"}

tbSOLDIER_LEVEL = {	95, 95, 95, 100, 100 ,95}
tbSOLDIER_LEVEL1 = {	95, 95}--守城官兵的级别
                  --小校	队长	先锋	主将	主帅 炸弹车 取宝
tbKILLNPC_AWARD = {2,8,10,40,60,30,10}	--杀死npc获得战功
tbKILLNPC_SHAREAWARD = {1,5,5,20,30,15,0}--队友获得战功
tbFILE_NPCDEATH = 
	{
	"\\script\\missions\\newcitydefence\\npcdeath_1.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_2.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_3.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_4.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_5.lua",
	"\\script\\missions\\newcitydefence\\npcdeath_6.lua",	
	};
FILE_SHOUCHENG_DEATH = {
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath1.lua",
		"\\script\\missions\\newcitydefence\\shouchengnpcdeath2.lua",
	}

tbDEFENCE_MAPID = { 580, 581 }	--新宋金地图，by廖志山
tbDEFENCE_SIGNMAP = { 518, 519 }
tbREVIVAL_POS = {
					{1528,3321},
					{1557,3330},
					{1567,3358},
					{1537,3369},
				}
tbSIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}


tbDEFENCE_RETURN = {
						[1] = { 1520,3228, "凤翔府", 2 },	--凤翔
						[11] = { 3018,5089, "成都府", 1 },	--成都
						[37] = { 1632,3185, "汴京府", 2 },	--汴京
						[78] = { 1439,3214, "襄阳府", 1 },	--襄阳
						[80] = { 1593,3197, "扬州府", 1 },	--扬州
						[162] = { 1470,3269, "大理府", 1 },	--大理
						[176] = { 1392,3313, "临安府", 1 },	--临安
					}
					
tbDEFENCE_ANNOUNCE = {
			"玩家可以到成都府 襄阳府 临安府 大理府 扬州府与城门卫兵对话参加宋方守城.",
			"玩家可以到凤翔府 汴京府与城门卫兵对话参加金方守城."
}

FILE_PLAYERDEATH = 		"\\script\\missions\\newcitydefence\\playerdeath.lua";
FILE_DOCTOR = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_BOX = 				"\\script\\missions\\newcitydefence\\npc\\cd_box.lua";
FILE_DOCTOR1 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_DOCTOR2 = 			"\\script\\missions\\newcitydefence\\npc\\cd_doctor.lua";
FILE_CENTERTRAP1 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap1.lua";
FILE_CENTERTRAP2 = 		"\\script\\missions\\newcitydefence\\trap\\hometrap2.lua";
FILE_CD_TRANSER = 		"\\script\\missions\\newcitydefence\\npc\\cd_transer.lua"
FILE_SYMBOLNPC =		"";

FRAME2TIME = 18;				--18帧游戏时间相当于1秒钟
MISSIONID = 27;					--mission编号
MAX_MEMBERCOUNT = 400;			--攻城地图最大人数限制

SMALLTIMERID = 52;				--计时器编号
TOTALTIMERID = 53;				--计时器编号

SMALL_TIME = 20 * FRAME2TIME;				--每20秒计时一次
TOTAL_TIME = 150 * 60 * FRAME2TIME;			--150分钟计时一次，活动结束
RUNGAME_TIME = 30 * 60 * FRAME2TIME / SMALL_TIME; --报名30分钟之后，启动
LASTREPORT_TIME = 145 * 60 * FRAME2TIME / SMALL_TIME;	--守城最后5分钟没分钟，提示一次时间
CALLBOSS_ZHUSHUAI = 120 * 60 * FRAME2TIME / SMALL_TIME;	--主帅出现时间

NHOMEDEFENCE = 24 --城防初始值
NHOMEDEFENCE_DAMAGE = 1  --城防伤害值，攻城车对城防

MS_STATE = 1;				--任务中记录任务状态的变量ID
MS_RANDKEY = 2;				--记录当前任务下的key，随机数
MS_OPENDAY = 3;				--记录当前任务开始的月，日
MS_CITYCAMP = 4;			--记录本张地图的阵营，宋-1；金-2
MS_SMALL_TIME = 5;			--记录smalltimer计时器的次数
MS_BOSS4_DOWN = 6;			--为1已产生小boss，0还未
MS_BOSS5_DOWN	=	7;		--为1已产生大boss，0还未
MS_TLCOUNT_COMMON = 8;		--杀死的普通怪的总数
MS_CITYDEFENCE = 9;			--为0表示到时间没有完成任务，为1表示任务完成
MS_MISSIONID = 10;			--存入当前mission的ID

MS_MAXCOUNTNPC_1 = 11;		--小校剩余数量
MS_MAXCOUNTNPC_2 = 12;		--队长剩余数量
MS_MAXCOUNTNPC_3 = 13;			--先锋剩余数量
MS_MAXCOUNTNPC_4 = 14;			--主将剩余数量
MS_MAXCOUNTNPC_5 = 15;			--主帅剩余数量

MS_RESTCOUNTNPC_1 = 16;		--记录一共杀死的白怪数量
MS_RESTCOUNTNPC_2 = 17;		--记录一共杀死的兰怪数量
MS_RESTCOUNTNPC_3 = 18;		--记录一共杀死的杀手级怪数量
MS_RESTCOUNTNPC_4 = 19;		--记录一共杀死的小BOSS数量
MS_RESTCOUNTNPC_5 = 20;		--记录一共杀死的大BOSS数量

MS_HOMEOUT_X1 = 21;			--野外往大营的传送坐标X，第一类Trap
MS_HOMEOUT_Y1 = 22;
MS_HOMEOUT_X2 = 23;			--野外往大营的传送坐标X，第二类Trap
MS_HOMEOUT_Y2 = 24;

MS_CENTER_X1 = 27;			--大营往野外的传送坐标X，第一类Trap
MS_CENTER_Y1 = 28;
MS_CENTER_X2 = 29;			--大营往野外的传送坐标X，第一类Trap
MS_CENTER_Y2 = 30;

MS_SHOUCHENGWEIBING = 33
MS_SHOUCHENGJIANGJUN = 34

MS_HOMEDEFENCE = 35	--城防

MS_S_GUAI1 = 1;			--记录第一个刷怪点
MS_S_GUAI2 = 2;			--记录第二个刷怪点
MS_S_GUAI3 = 3;			--记录第三个刷怪点
MS_S_CD_NAME = 4;			--当前守城战役的名字

CD_BASE_VALUE = 1000000

TB_CD_AWARDEXP = {600, 700, 800, 900, 1000}
TB_CD_AWARDITEM = {
			--{ itemname, itemvalue, itemlist},
				{"仙草露",0.719012,{ 6,1,71,0,1,1,1 }},
				{"百果露",0.02,{ 6,1,73,0,1,1,1 }},
				{"天山宝露",0.02,{ 6,1,72,0,1,1,1 }},
				{"玄晶4级",0.02,{ 6,1,147,0,4,1,1 }},
				{"玄晶5级",0.003,{ 6,1,147,0,5,1,1 }},
				{"玄晶6级",0.001,{ 6,1,147,0,6,1,1 }},
				{"玄晶7级",0.0003,{ 6,1,147,0,7,1,1 }},
				{"玄晶8级",0.0001,{ 6,1,147,0,8,1,1 }},
				{"大力丸",0.02,{ 6,0,3,0,1,1,1 }},
				{"飞速丸",0.02,{ 6,0,6,0,1,1,1 }},
				{"毒防丸",0.02,{ 6,0,10,0,1,1,1 }},
				{"冰防丸",0.02,{ 6,0,7,0,1,1,1 }},
				{"火防丸",0.02,{ 6,0,9,0,1,1,1 }},
				{"雷防丸",0.02,{ 6,0,8,0,1,1,1 }},
				{"高中丸",0.02,{ 6,0,5,0,1,1,1 }},
				{"加跑丸",0.02,{ 6,0,2,0,1,1,1 }},
				{"高闪丸",0.02,{ 6,0,4,0,1,1,1 }},
				{"长命丸",0.02,{ 6,0,1,0,1,1,1 }},
				{"盘若心经",0.0005,{ 6,1,12,0,1,1,1 }},
				{"蓝水晶",0.001,{ 238 }},
				{"绿水晶",0.001,{ 240 }},
				{"紫水晶",0.001,{ 239 }},
				{"武林秘籍",0.0001,{ 6,1,26,0,1,1,1 }},
				{"洗髓经",0.0001,{ 6,1,22,0,1,1,1 }},
				{"侠骨之铁血衫碎片 (1/4) /4)",0.0001,{ 903 }},
				{"侠骨之铁血衫碎片 (2/4) /4)",0.0001,{ 904 }},
				{"侠骨之铁血衫碎片 (3/4) /4)",0.0001,{ 905 }},
				{"侠骨之铁血衫碎片 (4/4) /4)",0.0001,{ 906 }},
				{"侠骨之多情环碎片 (1/4) /4)",0.0002,{ 907 }},
				{"侠骨之多情环碎片 (2/4) /4)",0.0002,{ 908 }},
				{"侠骨之多情环碎片 (3/4) /4)",0.0002,{ 909 }},
				{"侠骨之多情环碎片 (4/4) /4)",0.0002,{ 910 }},
				{"侠骨之丹心戒碎片(1/4) /4)",0.0002,{ 911 }},
				{"侠骨之丹心戒碎片(2/4) /4)",0.0002,{ 912 }},
				{"侠骨之丹心戒碎片(3/4) /4)",0.0002,{ 913 }},
				{"侠骨之丹心戒碎片(4/4) /4)",0.0002,{ 914 }},
				{"侠骨之情意结碎片(1/6) /6)",0.00002,{ 771 }},
				{"侠骨之情意结碎片(2/6) /6)",0.00002,{ 772 }},
				{"侠骨之情意结碎片(3/6) /6)",0.00002,{ 773 }},
				{"侠骨之情意结碎片(4/6) /6)",0.00002,{ 774 }},
				{"侠骨之情意结碎片(5/6) /6)",0.00002,{ 775 }},
				{"侠骨之情意结碎片(6/6) /6)",0.00002,{ 776 }},
				{"巾帼霓裳碎片 (1/6) /6)",0.00001,{ 777 }},
				{"巾帼霓裳碎片 (2/6) /6)",0.00001,{ 778 }},
				{"巾帼霓裳碎片 (3/6) /6)",0.00001,{ 779 }},
				{"巾帼霓裳碎片 (4/6) /6)",0.00001,{ 780 }},
				{"巾帼霓裳碎片 (5/6) /6)",0.00001,{ 781 }},
				{"巾帼霓裳碎片 (6/6) /6)",0.00001,{ 782 }},
				{"柔情之淑女项链碎片 (1/4) /4)",0.0002,{ 915 }},
				{"柔情之淑女项链碎片 (2/4) /4)",0.0002,{ 916 }},
				{"柔情之淑女项链碎片 (3/4) /4)",0.0002,{ 917 }},
				{"柔情之淑女项链碎片 (4/4) /4)",0.0002,{ 918 }},
				{"柔情之凤仪戒指碎片 (1/4) /4)",0.0002,{ 919 }},
				{"柔情之凤仪戒指碎片(2/4) /4)",0.0002,{ 920 }},
				{"柔情之凤仪戒指碎片(3/4) /4)",0.0002,{ 921 }},
				{"柔情之凤仪戒指碎片(4/4) /4)",0.0002,{ 922 }},
				{"柔情之慧心玉佩碎片 (1/4) /4)",0.00002,{ 923 }},
				{"柔情之慧心玉佩碎片 (2/4) /4)",0.00002,{ 924 }},
				{"柔情之慧心玉佩碎片 (3/4) /4)",0.00002,{ 925 }},
				{"柔情之慧心玉佩碎片 (4/4) /4)",0.00002,{ 926 }},
				{"定国之青纱长衫碎片 (1/4) /4)",0.0001,{ 927 }},
				{"定国之青纱长衫碎片 (2/4) /4)",0.0001,{ 928 }},
				{"定国之青纱长衫碎片 (3/4) /4)",0.0001,{ 929 }},
				{"定国之青纱长衫碎片 (4/4) /4)",0.0001,{ 930 }},
				{"定国之赤绢软靴碎片 (1/4) /4)",0.0002,{ 931 }},
				{"定国之赤绢软靴碎片 (2/4) /4)",0.0002,{ 932 }},
				{"定国之赤绢软靴碎片 (3/4) /4)",0.0002,{ 933 }},
				{"定国之赤绢软靴碎片 (4/4) /4)",0.0002,{ 934 }},
				{"定国之紫藤护腕碎片 (1/4) /4)",0.0002,{ 935 }},
				{"定国之紫藤护腕碎片 (2/4) /4)",0.0002,{ 936 }},
				{"定国之紫藤护腕碎片 (3/4) /4)",0.0002,{ 937 }},
				{"定国之紫藤护腕碎片 (4/4) /4)",0.0002,{ 938 }},
				{"定国之银蚕腰带碎片 (1/4) /4)",0.0002,{ 939 }},
				{"定国之银蚕腰带碎片 (2/4) /4)",0.0002,{ 940 }},
				{"定国之银蚕腰带碎片 (3/4) /4)",0.0002,{ 941 }},
				{"定国之银蚕腰带碎片 (4/4) /4)",0.0002,{ 942 }},
				{"摘星环碎片 (1/6) /6)",0.00005,{ 711 }},
				{"摘星环碎片 (2/6) /6)",0.00005,{ 712 }},
				{"摘星环碎片 (3/6) /6)",0.00005,{ 713 }},
				{"摘星环碎片 (4/6) /6)",0.00005,{ 714 }},
				{"摘星环碎片 (5/6) /6)",0.00005,{ 715 }},
				{"摘星环碎片 (6/6) /6)",0.00005,{ 716 }},
				{"唐猊甲碎片 (1/6) /6)",0.00005,{ 717 }},
				{"唐猊甲碎片 (2/6) /6)",0.00005,{ 718 }},
				{"唐猊甲碎片 (3/6) /6)",0.00005,{ 719 }},
				{"唐猊甲碎片 (4/6) /6)",0.00005,{ 720 }},
				{"唐猊甲碎片 (5/6) /6)",0.00005,{ 721 }},
				{"唐猊甲碎片 (6/6) /6)",0.00005,{ 722 }},
				{"绿翡翠护身符碎片(1/6) /6)",0.000005,{ 723 }},
				{"绿翡翠护身符碎片(2/6) /6)",0.000005,{ 724 }},
				{"绿翡翠护身符碎片(3/6) /6)",0.000005,{ 725 }},
				{"绿翡翠护身符碎片(4/6) /6)",0.000005,{ 726 }},
				{"绿翡翠护身符碎片(5/6) /6)",0.000005,{ 727 }},
				{"绿翡翠护身符碎片(6/6) /6)",0.000005,{ 728 }},
				{"白金腰带碎片 (1/6) /6)",0.00001,{ 729 }},
				{"白金腰带碎片 (2/6) /6)",0.00001,{ 730 }},
				{"白金腰带碎片 (3/6) /6)",0.00001,{ 731 }},
				{"白金腰带碎片 (4/6) /6)",0.00001,{ 732 }},
				{"白金腰带碎片 (5/6) /6)",0.00001,{ 733 }},
				{"白金腰带碎片 (6/6) /6)",0.00001,{ 734 }},
				{"天蚕护腕碎片(1/6) /6)",0.00001,{ 735 }},
				{"天蚕护腕碎片(1/6) /6)",0.00001,{ 736 }},
				{"天蚕护腕碎片(1/6) /6)",0.00001,{ 737 }},
				{"天蚕护腕碎片(1/6) /6)",0.00001,{ 738 }},
				{"天蚕护腕碎片(1/6) /6)",0.00001,{ 739 }},
				{"天蚕护腕碎片(1/6) /6)",0.00001,{ 740 }},
				{"天蚕靴碎片 (1/6) /6)",0.00001,{ 741 }},
				{"天蚕靴碎片 (2/6) /6)",0.00001,{ 742 }},
				{"天蚕靴碎片 (3/6) /6)",0.00001,{ 743 }},
				{"天蚕靴碎片 (4/6) /6)",0.00001,{ 744 }},
				{"天蚕靴碎片 (5/6) /6)",0.00001,{ 745 }},
				{"天蚕靴碎片 (6/6) /6)",0.00001,{ 746 }},
				{"冰晶石项链碎片 (1/6) /6)",0.0001,{ 747 }},
				{"冰晶石项链碎片 (2/6) /6)",0.0001,{ 748 }},
				{"冰晶石项链碎片 (3/6) /6)",0.0001,{ 749 }},
				{"冰晶石项链碎片 (4/6) /6)",0.0001,{ 750 }},
				{"冰晶石项链碎片 (5/6) /6)",0.0001,{ 751 }},
				{"冰晶石项链碎片 (6/6) /6)",0.0001,{ 752 }},
				{"菊花石指环碎片 (1/6) /6)",0.0001,{ 753 }},
				{"菊花石指环碎片 (2/6) /6)",0.0001,{ 754 }},
				{"菊花石指环碎片 (3/6) /6)",0.0001,{ 755 }},
				{"菊花石指环碎片 (4/6) /6)",0.0001,{ 756 }},
				{"菊花石指环碎片 (5/6) /6)",0.0001,{ 757 }},
				{"菊花石指环碎片 (6/6) /6)",0.0001,{ 758 }},
				{"田黄石玉佩碎片 (1/6) /6)",0.0001,{ 759 }},
				{"田黄石玉佩碎片 (2/6) /6)",0.0001,{ 760 }},
				{"田黄石玉佩碎片 (3/6) /6)",0.0001,{ 761 }},
				{"田黄石玉佩碎片 (4/6) /6)",0.0001,{ 762 }},
				{"田黄石玉佩碎片 (5/6) /6)",0.0001,{ 763 }},
				{"田黄石玉佩碎片 (6/6) /6)",0.0001,{ 764 }},
				{"鸡血石戒指碎片 (1/6) /6)",0.0001,{ 765 }},
				{"鸡血石戒指碎片(2/6) /6)",0.0001,{ 766 }},
				{"鸡血石戒指碎片(3/6) /6)",0.0001,{ 767 }},
				{"鸡血石戒指碎片(4/6) /6)",0.0001,{ 768 }},
				{"鸡血石戒指碎片(5/6) /6)",0.0001,{ 769 }},
				{"鸡血石戒指碎片(6/6) /6)",0.0001,{ 770 }},
				{"侠骨之情意结碎片(1/6) /6)",0.0001,{ 783 }},
				{"侠骨之情意结碎片(2/6) /6)",0.0001,{ 784 }},
				{"侠骨之情意结碎片(3/6) /6)",0.0001,{ 785 }},
				{"侠骨之情意结碎片(4/6) /6)",0.0001,{ 786 }},
				{"侠骨之情意结碎片(5/6) /6)",0.0001,{ 787 }},
				{"侠骨之情意结碎片(6/6) /6)",0.0001,{ 788 }},
				{"金丝正红袈裟碎片 (1/6) /6)",0.00001,{ 789 }},
				{"金丝正红袈裟碎片 (2/6) /6)",0.00001,{ 790 }},
				{"金丝正红袈裟碎片 (3/6) /6)",0.00001,{ 791 }},
				{"金丝正红袈裟碎片 (4/6) /6)",0.00001,{ 792 }},
				{"金丝正红袈裟碎片 (5/6) /6)",0.00001,{ 793 }},
				{"金丝正红袈裟碎片 (6/6) /6)",0.00001,{ 794 }},
				{"玄武黄金铠碎片 (1/6) /6)",0.00001,{ 795 }},
				{"玄武黄金铠碎片 (2/6) /6)",0.00001,{ 796 }},
				{"玄武黄金铠碎片 (3/6) /6)",0.00001,{ 797 }},
				{"玄武黄金铠碎片 (4/6) /6)",0.00001,{ 798 }},
				{"玄武黄金铠碎片 (5/6) /6)",0.00001,{ 799 }},
				{"玄武黄金铠碎片 (6/6) /6)",0.00001,{ 800 }},
				{"洗象玉扣碎片 (1/6) /6)",0.00001,{ 801 }},
				{"洗象玉扣碎片 (2/6) /6)",0.00001,{ 802 }},
				{"洗象玉扣碎片 (3/6) /6)",0.00001,{ 803 }},
				{"洗象玉扣碎片 (4/6) /6)",0.00001,{ 804 }},
				{"洗象玉扣碎片 (5/6) /6)",0.00001,{ 805 }},
				{"洗象玉扣碎片 (6/6) /6)",0.00001,{ 806 }},
				{"红缁软禢鞋碎片 (1/6) /6)",0.00001,{ 807 }},
				{"红缁软禢鞋碎片 (2/6) /6)",0.00001,{ 808 }},
				{"红缁软禢鞋碎片 (3/6) /6)",0.00001,{ 809 }},
				{"红缁软禢鞋碎片 (4/6) /6)",0.00001,{ 810 }},
				{"红缁软禢鞋碎片 (5/6) /6)",0.00001,{ 811 }},
				{"红缁软禢鞋碎片 (6/6) /6)",0.00001,{ 812 }},
				{"清心向善珠碎片(1/6) /6)",0.00001,{ 813 }},
				{"清心向善珠碎片(2/6) /6)",0.00001,{ 814 }},
				{"清心向善珠碎片(3/6) /6)",0.00001,{ 815 }},
				{"清心向善珠碎片(4/6) /6)",0.00001,{ 816 }},
				{"清心向善珠碎片(5/6) /6)",0.00001,{ 817 }},
				{"清心向善珠碎片(6/6) /6)",0.00001,{ 818 }},
				{"碧海之红铃波碎片(1/6) /6)",0.00001,{ 819 }},
				{"碧海之红铃波碎片(2/6) /6)",0.00001,{ 820 }},
				{"碧海之红铃波碎片(3/6) /6)",0.00001,{ 821 }},
				{"碧海之红铃波碎片(4/6) /6)",0.00001,{ 822 }},
				{"碧海之红铃波碎片(5/6) /6)",0.00001,{ 823 }},
				{"碧海之红铃波碎片(6/6) /6)",0.00001,{ 824 }},
				{"幽胧之金蛇发带碎片碎片(1/6) /6)",0.00001,{ 825 }},
				{"幽胧之金蛇发带碎片(2/6) /6)",0.00001,{ 826 }},
				{"幽胧之金蛇发带碎片(3/6) /6)",0.00001,{ 827 }},
				{"幽胧之金蛇发带碎片(4/6) /6)",0.00001,{ 828 }},
				{"幽胧之金蛇发带碎片(5/6) /6)",0.00001,{ 829 }},
				{"幽胧之金蛇发带碎片(6/6) /6)",0.00001,{ 830 }},
				{"幽胧之墨蛛软履碎片 (1/6) /6)",0.00001,{ 831 }},
				{"幽胧之墨蛛软履碎片(2/6) /6)",0.00001,{ 832 }},
				{"幽胧之墨蛛软履碎片(3/6) /6)",0.00001,{ 833 }},
				{"幽胧之墨蛛软履碎片(4/6) /6)",0.00001,{ 834 }},
				{"幽胧之墨蛛软履碎片(5/6) /6)",0.00001,{ 835 }},
				{"幽胧之墨蛛软履碎片(6/6) /6)",0.00001,{ 836 }},
				{"咒缚之灭雷颈符碎片(1/6) /6)",0.00001,{ 837 }},
				{"咒缚之灭雷颈符碎片(2/6) /6)",0.00001,{ 838 }},
				{"咒缚之灭雷颈符碎片(3/6) /6)",0.00001,{ 839 }},
				{"咒缚之灭雷颈符碎片(4/6) /6)",0.00001,{ 840 }},
				{"咒缚之灭雷颈符碎片(5/6) /6)",0.00001,{ 841 }},
				{"咒缚之灭雷颈符碎片(6/6) /6)",0.00001,{ 842 }},
				{"地魄之黑焰冲天链碎片 (1/6) /6)",0.00001,{ 843 }},
				{"地魄之黑焰冲天链碎片 (2/6) /6)",0.00001,{ 844 }},
				{"地魄之黑焰冲天链碎片 (3/6) /6)",0.00001,{ 845 }},
				{"地魄之黑焰冲天链碎片 (4/6) /6)",0.00001,{ 846 }},
				{"地魄之黑焰冲天链碎片 (5/6) /6)",0.00001,{ 847 }},
				{"地魄之黑焰冲天链碎片 (6/6) /6)",0.00001,{ 848 }},
				{"同仇之降龙丐衣碎片 (1/6) /6)",0.00001,{ 849 }},
				{"同仇之降龙丐衣碎片 (2/6) /6)",0.00001,{ 850 }},
				{"同仇之降龙丐衣碎片 (3/6) /6)",0.00001,{ 851 }},
				{"同仇之降龙丐衣碎片 (4/6) /6)",0.00001,{ 852 }},
				{"同仇之降龙丐衣碎片 (5/6) /6)",0.00001,{ 853 }},
				{"同仇之降龙丐衣碎片 (6/6) /6)",0.00001,{ 854 }},
				{"同仇之亢龙护手碎片 (1/6) /6)",0.00001,{ 855 }},
				{"同仇之亢龙护手碎片 (2/6) /6)",0.00001,{ 856 }},
				{"同仇之亢龙护手碎片 (3/6) /6)",0.00001,{ 857 }},
				{"同仇之亢龙护手碎片 (4/6) /6)",0.00001,{ 858 }},
				{"同仇之亢龙护手碎片 (5/6) /6)",0.00001,{ 859 }},
				{"同仇之亢龙护手碎片 (6/6) /6)",0.00001,{ 860 }},
				{"魔煌之金甲盔碎片(1/6) /6)",0.00001,{ 861 }},
				{"魔煌之金甲盔碎片(2/6) /6)",0.00001,{ 862 }},
				{"魔煌之金甲盔碎片(3/6) /6)",0.00001,{ 863 }},
				{"魔煌之金甲盔碎片(4/6) /6)",0.00001,{ 864 }},
				{"魔煌之金甲盔碎片(5/6) /6)",0.00001,{ 865 }},
				{"魔煌之金甲盔碎片(6/6) /6)",0.00001,{ 866 }},
				{"魔煌之按出虎项圈碎片(1/6) /6)",0.00001,{ 867 }},
				{"魔煌之按出虎项圈碎片(2/6) /6)",0.00001,{ 868 }},
				{"魔煌之按出虎项圈碎片(3/6) /6)",0.00001,{ 869 }},
				{"魔煌之按出虎项圈碎片(4/6) /6)",0.00001,{ 870 }},
				{"魔煌之按出虎项圈碎片(5/6) /6)",0.00001,{ 871 }},
				{"魔煌之按出虎项圈碎片(6/6) /6)",0.00001,{ 872 }},
				{"魔嗜之山海飞鸿履碎片 (1/6) /6)",0.00001,{ 873 }},
				{"魔嗜之山海飞鸿履碎片(1/6) /6)",0.00001,{ 874 }},
				{"魔嗜之山海飞鸿履碎片(1/6) /6)",0.00001,{ 875 }},
				{"魔嗜之山海飞鸿履碎片(1/6) /6)",0.00001,{ 876 }},
				{"魔嗜之山海飞鸿履碎片(1/6) /6)",0.00001,{ 877 }},
				{"魔嗜之山海飞鸿履碎片(1/6) /6)",0.00001,{ 878 }},
				{"凌岳之无极玄玉佩碎片 (1/6) /6)",0.00001,{ 879 }},
				{"凌岳之无极玄玉佩碎片 (2/6) /6)",0.00001,{ 880 }},
				{"凌岳之无极玄玉佩碎片 (3/6) /6)",0.00001,{ 881 }},
				{"凌岳之无极玄玉佩碎片 (4/6) /6)",0.00001,{ 882 }},
				{"凌岳之无极玄玉佩碎片 (5/6) /6)",0.00001,{ 883 }},
				{"凌岳之无极玄玉佩碎片 (6/6) /6)",0.00001,{ 884 }},
				{"及丰之三清符碎片(1/6) /6)",0.00001,{ 885 }},
				{"及丰之三清符碎片(2/6) /6)",0.00001,{ 886 }},
				{"及丰之三清符碎片(3/6) /6)",0.00001,{ 887 }},
				{"及丰之三清符碎片(4/6) /6)",0.00001,{ 888 }},
				{"及丰之三清符碎片(5/6) /6)",0.00001,{ 889 }},
				{"及丰之三清符碎片(6/6) /6)",0.00001,{ 890 }},
				{"雷穹之天地护符碎片(1/6) /6)",0.00001,{ 891 }},
				{"雷穹之天地护符碎片(2/6) /6)",0.00001,{ 892 }},
				{"雷穹之天地护符碎片(3/6) /6)",0.00001,{ 893 }},
				{"雷穹之天地护符碎片(4/6) /6)",0.00001,{ 894 }},
				{"雷穹之天地护符碎片(5/6) /6)",0.00001,{ 895 }},
				{"雷穹之天地护符碎片(6/6) /6)",0.00001,{ 896 }},
				{"雾幻之北冥道冠碎片 (1/6) /6)",0.00001,{ 897 }},
				{"雾幻之北冥道冠碎片 (2/6) /6)",0.00001,{ 898 }},
				{"雾幻之北冥道冠碎片 (3/6) /6)",0.00001,{ 899 }},
				{"雾幻之北冥道冠碎片 (4/6) /6)",0.00001,{ 900 }},
				{"雾幻之北冥道冠碎片 (5/6) /6)",0.00001,{ 901 }},
				{"雾幻之北冥道冠碎片 (6/6) /6)",0.00001,{ 902 }},
				{"北京之梦装备碎片 (1/9) /9)",0.000002,{ 540 }},
				{"北京之梦装备碎片 (2/9) /9)",0.000002,{ 541 }},
				{"北京之梦装备碎片 (3/9) /9)",0.000002,{ 542 }},
				{"北京之梦装备碎片 (4/9) /9)",0.000002,{ 543 }},
				{"北京之梦装备碎片 (5/9) /9)",0.000002,{ 544 }},
				{"北京之梦装备碎片 (6/9) /9)",0.000002,{ 545 }},
				{"北京之梦装备碎片 (7/9) /9)",0.000002,{ 546 }},
				{"北京之梦装备碎片 (8/9) /9)",0.000002,{ 547 }},
				{"北京之梦装备碎片 (9/9) /9)",0.000002,{ 548 }},
				{"五色玉佩碎片 (1/9) /9)",0.000002,{ 549 }},
				{"五色玉佩碎片 (2/9) /9)",0.000002,{ 550 }},
				{"五色玉佩碎片 (3/9) /9)",0.000002,{ 551 }},
				{"五色玉佩碎片 (4/9) /9)",0.000002,{ 552 }},
				{"五色玉佩碎片 (5/9) /9)",0.000002,{ 553 }},
				{"五色玉佩碎片 (6/9) /9)",0.000002,{ 554 }},
				{"五色玉佩碎片 (7/9) /9)",0.000002,{ 555 }},
				{"五色玉佩碎片 (8/9) /9)",0.000002,{ 556 }},
				{"五色玉佩碎片 (9/9) /9)",0.000002,{ 557 }},
				{"雅典之魂碎片 (1/9) /9)",0.000002,{ 558 }},
				{"雅典之魂碎片 (2/9) /9)",0.000002,{ 559 }},
				{"雅典之魂碎片 (3/9) /9)",0.000002,{ 560 }},
				{"雅典之魂碎片 (4/9) /9)",0.000002,{ 561 }},
				{"雅典之魂碎片 (5/9) /9)",0.000002,{ 562 }},
				{"雅典之魂碎片 (6/9) /9)",0.000002,{ 563 }},
				{"雅典之魂碎片 (7/9) /9)",0.000002,{ 564 }},
				{"雅典之魂碎片 (8/9) /9)",0.000002,{ 565 }},
				{"雅典之魂碎片 (9/9) /9)",0.000002,{ 566 }},
				{"奔雷钻龙枪碎片 (1/9) /9)",0.000004,{ 567 }},
				{"奔雷钻龙枪碎片 (2/9) /9)",0.000004,{ 568 }},
				{"奔雷钻龙枪碎片 (3/9) /9)",0.000004,{ 569 }},
				{"奔雷钻龙枪碎片 (4/9) /9)",0.000004,{ 570 }},
				{"奔雷钻龙枪碎片 (5/9) /9)",0.000004,{ 571 }},
				{"奔雷钻龙枪碎片 (6/9) /9)",0.000004,{ 572 }},
				{"奔雷钻龙枪碎片 (7/9) /9)",0.000004,{ 573 }},
				{"奔雷钻龙枪碎片 (8/9) /9)",0.000004,{ 574 }},
				{"奔雷钻龙枪碎片 (9/9) /9)",0.000004,{ 575 }},
				{"伏魔之紫金棍碎片 (1/9) /9)",0.00001,{ 576 }},
				{"伏魔之紫金棍碎片 (2/9) /9)",0.00001,{ 577 }},
				{"伏魔之紫金棍碎片 (3/9) /9)",0.00001,{ 578 }},
				{"伏魔之紫金棍碎片 (4/9) /9)",0.00001,{ 579 }},
				{"伏魔之紫金棍碎片 (5/9) /9)",0.00001,{ 580 }},
				{"伏魔之紫金棍碎片 (6/9) /9)",0.00001,{ 581 }},
				{"伏魔之紫金棍碎片 (7/9) /9)",0.00001,{ 582 }},
				{"伏魔之紫金棍碎片 (8/9) /9)",0.00001,{ 583 }},
				{"伏魔之紫金棍碎片 (9/9) /9)",0.00001,{ 584 }},
				{"四空之降魔戒刀碎片 (1/9) /9)",0.00001,{ 585 }},
				{"四空之降魔戒刀碎片 (2/9) /9)",0.00001,{ 586 }},
				{"四空之降魔戒刀碎片 (3/9) /9)",0.00001,{ 587 }},
				{"四空之降魔戒刀碎片 (4/9) /9)",0.00001,{ 588 }},
				{"四空之降魔戒刀碎片 (5/9) /9)",0.00001,{ 589 }},
				{"四空之降魔戒刀碎片 (6/9) /9)",0.00001,{ 590 }},
				{"四空之降魔戒刀碎片 (7/9) /9)",0.00001,{ 591 }},
				{"四空之降魔戒刀碎片 (8/9) /9)",0.00001,{ 592 }},
				{"四空之降魔戒刀碎片 (9/9) /9)",0.00001,{ 593 }},
				{"大眼神锤碎片(1/9) /9)",0.000004,{ 594 }},
				{"大眼神锤碎片(2/9) /9)",0.000004,{ 595 }},
				{"大眼神锤碎片(3/9) /9)",0.000004,{ 596 }},
				{"大眼神锤碎片(4/9) /9)",0.000004,{ 597 }},
				{"大眼神锤碎片(5/9) /9)",0.000004,{ 598 }},
				{"大眼神锤碎片(6/9) /9)",0.000004,{ 599 }},
				{"大眼神锤碎片(7/9) /9)",0.000004,{ 600 }},
				{"大眼神锤锤碎片(8/9) /9)",0.000004,{ 601 }},
				{"大眼神锤碎片(9/9) /9)",0.000004,{ 602 }},
				{"奔雷钻龙枪碎片 (1/9) /9)",0.000004,{ 603 }},
				{"奔雷钻龙枪碎片 (2/9) /9)",0.000004,{ 604 }},
				{"奔雷钻龙枪碎片 (3/9) /9)",0.000004,{ 605 }},
				{"奔雷钻龙枪碎片 (4/9) /9)",0.000004,{ 606 }},
				{"奔雷钻龙枪碎片 (5/9) /9)",0.000004,{ 607 }},
				{"奔雷钻龙枪碎片 (6/9) /9)",0.000004,{ 608 }},
				{"奔雷钻龙枪碎片 (7/9) /9)",0.000004,{ 609 }},
				{"奔雷钻龙枪碎片 (8/9) /9)",0.000004,{ 610 }},
				{"奔雷钻龙枪碎片 (9/9) /9)",0.000004,{ 611 }},
				{"亮银宝刀碎片 (1/9) /9)",0.00001,{ 612 }},
				{"亮银宝刀碎片 (2/9) /9)",0.00001,{ 613 }},
				{"亮银宝刀碎片 (3/9) /9)",0.00001,{ 614 }},
				{"亮银宝刀碎片 (4/9) /9)",0.00001,{ 615 }},
				{"亮银宝刀碎片 (5/9) /9)",0.00001,{ 616 }},
				{"亮银宝刀碎片 (6/9) /9)",0.00001,{ 617 }},
				{"亮银宝刀碎片 (7/9) /9)",0.00001,{ 618 }},
				{"亮银宝刀碎片 (8/9) /9)",0.00001,{ 619 }},
				{"亮银宝刀碎片 (9/9) /9)",0.00001,{ 620 }},
				{"无间之倚天剑碎片(1/9) /9)",0.00001,{ 621 }},
				{"无间之倚天剑碎片(2/9) /9)",0.00001,{ 622 }},
				{"无间之倚天剑碎片(3/9) /9)",0.00001,{ 623 }},
				{"无间之倚天剑碎片(4/9) /9)",0.00001,{ 624 }},
				{"无间之倚天剑碎片(5/9) /9)",0.00001,{ 625 }},
				{"无间之倚天剑碎片(6/9) /9)",0.00001,{ 626 }},
				{"无间之倚天剑碎片(7/9) /9)",0.00001,{ 627 }},
				{"无间之倚天剑碎片(8/9) /9)",0.00001,{ 628 }},
				{"无间之倚天剑碎片(9/9) /9)",0.00001,{ 629 }},
				{"栖凰之凤仪刀碎片 (1/9) /9)",0.00001,{ 630 }},
				{"栖凰之凤仪刀碎片 (2/9) /9)",0.00001,{ 631 }},
				{"栖凰之凤仪刀碎片 (3/9) /9)",0.00001,{ 632 }},
				{"栖凰之凤仪刀碎片 (4/9) /9)",0.00001,{ 633 }},
				{"栖凰之凤仪刀碎片 (5/9) /9)",0.00001,{ 634 }},
				{"栖凰之凤仪刀碎片 (6/9) /9)",0.00001,{ 635 }},
				{"栖凰之凤仪刀碎片 (7/9) /9)",0.00001,{ 636 }},
				{"栖凰之凤仪刀碎片 (8/9) /9)",0.00001,{ 637 }},
				{"栖凰之凤仪刀碎片 (9/9) /9)",0.00001,{ 638 }},
				{"碧海之鸳鸯连环刀碎片 (1/9) /9)",0.00001,{ 639 }},
				{"碧海之鸳鸯连环刀碎片 (2/9) /9)",0.00001,{ 640 }},
				{"碧海之鸳鸯连环刀碎片 (3/9) /9)",0.00001,{ 641 }},
				{"碧海之鸳鸯连环刀碎片 (4/9) /9)",0.00001,{ 642 }},
				{"碧海之鸳鸯连环刀碎片 (5/9) /9)",0.00001,{ 643 }},
				{"碧海之鸳鸯连环刀碎片 (6/9) /9)",0.00001,{ 644 }},
				{"碧海之鸳鸯连环刀碎片 (7/9) /9)",0.00001,{ 645 }},
				{"碧海之鸳鸯连环刀碎片 (8/9) /9)",0.00001,{ 646 }},
				{"碧海之鸳鸯连环刀碎片 (9/9) /9)",0.00001,{ 647 }},
				{"冥幻之邪刹毒刃碎片 (1/9) /9)",0.00001,{ 648 }},
				{"冥幻之邪刹毒刃碎片 (2/9) /9)",0.00001,{ 649 }},
				{"冥幻之邪刹毒刃碎片 (3/9) /9)",0.00001,{ 650 }},
				{"冥幻之邪刹毒刃碎片 (4/9) /9)",0.00001,{ 651 }},
				{"冥幻之邪刹毒刃碎片 (5/9) /9)",0.00001,{ 652 }},
				{"冥幻之邪刹毒刃碎片 (6/9) /9)",0.00001,{ 653 }},
				{"冥幻之邪刹毒刃碎片 (7/9) /9)",0.00001,{ 654 }},
				{"冥幻之邪刹毒刃碎片 (8/9) /9)",0.00001,{ 655 }},
				{"冥幻之邪刹毒刃碎片 (9/9) /9)",0.00001,{ 656 }},
				{"花雨漫天碎片 (1/9) /9)",0.00001,{ 657 }},
				{"花雨漫天碎片 (2/9) /9)",0.00001,{ 658 }},
				{"花雨漫天碎片 (3/9) /9)",0.00001,{ 659 }},
				{"花雨漫天碎片 (4/9) /9)",0.00001,{ 660 }},
				{"花雨漫天碎片 (5/9) /9)",0.00001,{ 661 }},
				{"花雨漫天碎片 (6/9) /9)",0.00001,{ 662 }},
				{"花雨漫天碎片 (7/9) /9)",0.00001,{ 663 }},
				{"花雨漫天碎片 (8/9) /9)",0.00001,{ 664 }},
				{"花雨漫天碎片 (9/9) /9)",0.00001,{ 665 }},
				{"飞星夺魂碎片 (1/9) /9)",0.00001,{ 666 }},
				{"飞星夺魂碎片 (2/9) /9)",0.00001,{ 667 }},
				{"飞星夺魂碎片 (3/9) /9)",0.00001,{ 668 }},
				{"飞星夺魂碎片 (4/9) /9)",0.00001,{ 669 }},
				{"飞星夺魂碎片 (5/9) /9)",0.00001,{ 670 }},
				{"飞星夺魂碎片 (6/9) /9)",0.00001,{ 671 }},
				{"飞星夺魂碎片 (7/9) /9)",0.00001,{ 672 }},
				{"飞星夺魂碎片 (8/9) /9)",0.00001,{ 673 }},
				{"飞星夺魂碎片 (9/9) /9)",0.00001,{ 674 }},
				{"绿玉杖碎片 (1/9) /9)",0.00001,{ 675 }},
				{"绿玉杖碎片 (2/9) /9)",0.00001,{ 676 }},
				{"绿玉杖碎片 (3/9) /9)",0.00001,{ 677 }},
				{"绿玉杖碎片 (4/9) /9)",0.00001,{ 678 }},
				{"绿玉杖碎片 (5/9) /9)",0.00001,{ 679 }},
				{"绿玉杖碎片 (6/9) /9)",0.00001,{ 680 }},
				{"绿玉杖碎片 (7/9) /9)",0.00001,{ 681 }},
				{"绿玉杖碎片 (8/9) /9)",0.00001,{ 682 }},
				{"绿玉杖碎片 (9/9) /9)",0.00001,{ 683 }},
				{"幽冥枪碎片(1/9) /9)",0.00001,{ 684 }},
				{"幽冥枪碎片(2/9) /9)",0.00001,{ 685 }},
				{"幽冥枪碎片(3/9) /9)",0.00001,{ 686 }},
				{"幽冥枪碎片(4/9) /9)",0.00001,{ 687 }},
				{"幽冥枪碎片(5/9) /9)",0.00001,{ 688 }},
				{"幽冥枪碎片(6/9) /9)",0.00001,{ 689 }},
				{"幽冥枪碎片(7/9) /9)",0.00001,{ 690 }},
				{"幽冥枪碎片(8/9) /9)",0.00001,{ 691 }},
				{"幽冥枪碎片(9/9) /9)",0.00001,{ 692 }},
				{"真武剑碎片 (1/9) /9)",0.000004,{ 693 }},
				{"真武剑碎片 (2/9) /9)",0.000004,{ 694 }},
				{"真武剑碎片 (3/9) /9)",0.000004,{ 695 }},
				{"真武剑碎片 (4/9) /9)",0.000004,{ 696 }},
				{"真武剑碎片 (5/9) /9)",0.000004,{ 697 }},
				{"真武剑碎片 (6/9) /9)",0.000004,{ 698 }},
				{"真武剑碎片 (7/9) /9)",0.000004,{ 699 }},
				{"真武剑碎片 (8/9) /9)",0.000004,{ 700 }},
				{"真武剑碎片 (9/9) /9)",0.000004,{ 701 }},
				{"千年寒铁碎片 (1/9) /9)",0.00001,{ 702 }},
				{"千年寒铁碎片 (2/9) /9)",0.00001,{ 703 }},
				{"千年寒铁碎片 (3/9) /9)",0.00001,{ 704 }},
				{"千年寒铁碎片 (4/9) /9)",0.00001,{ 705 }},
				{"千年寒铁碎片 (5/9) /9)",0.00001,{ 706 }},
				{"千年寒铁碎片 (6/9) /9)",0.00001,{ 707 }},
				{"千年寒铁碎片 (7/9) /9)",0.00001,{ 708 }},
				{"千年寒铁碎片 (8/9) /9)",0.00001,{ 709 }},
				{"千年寒铁碎片 (9/9) /9)",0.00001,{ 710 }},
	}