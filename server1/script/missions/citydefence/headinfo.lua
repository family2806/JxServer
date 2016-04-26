----------------------------------------------------------------
--FileName:	headinfo.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	周末活动：卫国战争之烽火连城
--			功能1：活动头文件自定义常量
-----------------------------------------------------------------
IncludeLib("FILESYS");


--print(date("%w"))				--获得当前服务器星期 1--Monday；2--Tuesday；3--Wednesday；4--Thursday；5--Frieday；6--Saturday；0--Sunday
GV_TSK_CD_OPEN = 35
FIRE_OPENDAY_SATURDAY = 6;		--
FIRE_OPENDAY_SUNDAY = 0;		--
CD_LEVEL_LIMIT = 80		--最低参加守城等级
TASKID_FIRE_KEY = 1185;--random(1000000);					--每场次的关键字，由此判断是否为本轮次参加的玩家
TASKID_FIRE_DAY = 1186;--tonumber(date("%m%d"));			--玩家一天只能参加一场卫国战争，记录日期
TASKID_FIRE_ADDR = 1187;--传入的的城市ID
--1189
FIRE_1RSTNPC_COUNT = 15000;
FIRE_2CNDNPC_COUNT = 2000;
FIRE_3RDNPC_COUNT = 1000;
FIRE_4THNPC_COUNT = 100;
FIRE_5THNPC_COUNT = 10;
tbNPC_COUNT = { 15000, 2000, 1000, 100, 10 }

TNPC_DOCTOR1 = 55;			--宋军医的Npc模板ID号
TNPC_DOCTOR2 = 49;			--金军医的Npc模板ID号
TNPC_DEPOSIT = 625;			--储物箱NPC模板ID
TNPC_CHEFU = 393;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;

					--列兵	小队长	副将	大将	元帅
tbTNPC_SOLDIER = {	{1067,	1068,	1069,	1070,	1080},	--宋
					{1072,	1073,	1074,	1075,	1090}}	--金
tbSOLDIER_NAME = {	"列兵", "队长", "前锋", "主将", "主帅"	}
tbSOLDIER_LEVEL = {	95, 95, 95, 100, 120 }
tbFILE_NPCDEATH = 
	{
	"\\script\\missions\\citydefence\\npcdeath_1.lua",
	"\\script\\missions\\citydefence\\npcdeath_2.lua",
	"\\script\\missions\\citydefence\\npcdeath_3.lua",
	"\\script\\missions\\citydefence\\npcdeath_4.lua",
	"\\script\\missions\\citydefence\\npcdeath_5.lua",
	"\\script\\missions\\citydefence\\npcdeath_6.lua"
	};
tbDEFENCE_MAPID = { 516, 517 }
tbDEFENCE_SIGNMAP = { 518, 519 }
tbREVIVAL_POS = {
					{1621,3792},
					{1660,3853},
					{1646,3910},
					{1698,3898},
					{1659,3957}
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
						[162] = { 1470,3269, "大理", 1 },	--大理
						[176] = { 1392,3313, "临安府", 1 },	--临安
					}
					
tbDEFENCE_ANNOUNCE = {
			"玩家可以到成都府、襄阳府、临安府、大理、扬州府和城门卫兵对话参加宋方守城.",
			"玩家可以到凤翔府、汴京府和城门卫兵对话参加金方守城."
}

FILE_PLAYERDEATH = 		"\\script\\missions\\citydefence\\playerdeath.lua";
FILE_DOCTOR = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_BOX = 				"\\script\\missions\\citydefence\\npc\\cd_box.lua";
FILE_DOCTOR1 = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_DOCTOR2 = 			"\\script\\missions\\citydefence\\npc\\cd_doctor.lua";
FILE_CENTERTRAP1 = 		"\\script\\missions\\citydefence\\trap\\hometrap1.lua";
FILE_CENTERTRAP2 = 		"\\script\\missions\\citydefence\\trap\\hometrap2.lua";
FILE_CENTERTRAP3 = 		"\\script\\missions\\citydefence\\trap\\hometrap3.lua";
FILE_CD_TRANSER = 		"\\script\\missions\\citydefence\\npc\\cd_transer.lua"
FILE_SYMBOLNPC =		"";

FRAME2TIME = 18;				--18帧游戏时间相当于1秒钟
MISSIONID = 23;					--mission编号
MAX_MEMBERCOUNT = 600;			--攻城地图最大人数限制

SMALLTIMERID = 45;				--计时器编号
TOTALTIMERID = 46;				--计时器编号

SMALL_TIME = 20 * FRAME2TIME;				--每20秒计时一次
TOTAL_TIME = 150 * 60 * FRAME2TIME;			--150分钟计时一次，活动结束
RUNGAME_TIME = 30 * 60 * FRAME2TIME / SMALL_TIME; --报名30分钟之后，启动
LASTREPORT_TIME = 145 * 60 * FRAME2TIME / SMALL_TIME;	--守城最后5分钟没分钟，提示一次时间

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

MS_1RSTNPC_CCNT = 11;		--记录当前10分钟内，杀死的白怪数量
MS_2CNDNPC_CCNT = 12;		--记录当前10分钟内，杀死的兰怪数量
MS_3RDNPC_CCNT = 13;			--记录当前10分钟内，杀死的杀手级怪数量
MS_4THNPC_CCNT = 14;			--记录当前10分钟内，杀死的小BOSS数量
MS_5THNPC_CCNT = 15;			--记录当前10分钟内，杀死的大BOSS数量

MS_1RSTNPC_TCNT = 16;		--记录一共杀死的白怪数量
MS_2CNDNPC_TCNT = 17;		--记录一共杀死的兰怪数量
MS_3RDNPC_TCNT = 18;		--记录一共杀死的杀手级怪数量
MS_4THNPC_TCNT = 19;		--记录一共杀死的小BOSS数量
MS_5THNPC_TCNT = 20;		--记录一共杀死的大BOSS数量

MS_HOMEOUT_X1 = 21;			--野外往大营的传送坐标X，第一类Trap
MS_HOMEOUT_Y1 = 22;
MS_HOMEOUT_X2 = 23;			--野外往大营的传送坐标X，第二类Trap
MS_HOMEOUT_Y2 = 24;
MS_HOMEOUT_X3 = 25;			--野外往大营的传送坐标X，第三类Trap
MS_HOMEOUT_Y3 = 26;

MS_CENTER_X1 = 27;			--大营往野外的传送坐标X，第一类Trap
MS_CENTER_Y1 = 28;
MS_CENTER_X2 = 29;			--大营往野外的传送坐标X，第一类Trap
MS_CENTER_Y2 = 30;
MS_CENTER_X3 = 31;			--大营往野外的传送坐标X，第一类Trap
MS_CENTER_Y3 = 32;

MS_S_CMNPCFILE = 1;			--记录普通怪点的文件
MS_S_JRNPCFILE = 2;			--记录小BOSS坐标的文件
MS_S_SRNPCFILE = 3;			--记录大BOSS坐标的文件
MS_S_CD_NAME = 4;			--当前守城战役的名字
