Include("\\script\\event\\tongwar\\headinfo.lua")
MISSIONID = 33
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟			
TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TIMER_2 = 15* 6 * 60  * FRAME2TIME; -- 交战时间为2小时
RUNGAME_TIME = 30 * 60 * FRAME2TIME / TIMER_1; --报名30分钟之后，自动进入战斗阶段

MAX_MEMBERCOUNT = 150
MIN_MEMBERCOUNT = 5
TIME_PLAYER_STAY = 120
TONGWAR_MAXDEATH = 10

BONUS_KILLPLAYER = 75
BONUS_MAXSERIESKILL = 150

tbNPCPOS = {"npcpos1", "npcpos2"}
TNPC_DOCTOR1 = 55;--军医的Npc模板ID号
TNPC_DOCTOR2 = 49;
TNPC_SYMBOL1 = 629;
TNPC_SYMBOL2 = 630;
TNPC_DEPOSIT = 625;
	
TNPC_FLAG0 = 626;
TNPC_FLAG1 = 628;
TNPC_FLAG2 = 627;
	
	
tbTONGWAR_SIGNMAP_POS = {
					{ 1582,3174 },
					{ 1588,3160 },
					{ 1604,3147 },
				}
	
tbTONGWARMAP = {
						{605, 608, 609},
						{606, 610, 611},
						{607, 612, 613},
							}	

----------------Title Value-------------------------------------
	RA_KILL_PL_RANK = {10, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	--7 玩家士兵	--7/3 玩家校尉	--14/15 玩家统领	--21/25 玩家副将	--14/25 玩家大将	--7/20 玩家元帅
 	
 	RANK_PKBONUS = {
 	{1,	6/5,7/5	,8/5,2	},
	{4/5,1,	6/5,7/5,8/5	},
	{3/5,4/5,1,	6/5,7/5	},
	{2/5,3/5,4/5,1,	6/5	},
	{1/5,2/5,3/5,4/5,1},
	};
	
	TAB_SERIESKILL =    --记录不同rank的玩家，在PK时，是否记录实际连斩的表，1表示记录，0表示不记录
	{
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,1},
		{0,0,1,1,1},
	};
	
	BALANCE_MAMCOUNT = 15
	TAB_RANKBONUS = {0, 1000, 3000, 6000,10000};
	RANK_SKILL = 661;
	TAB_RANKMSG = {
	"你被封为 <color=white>士兵<color>!",
	"你被封为<color=0xff>校尉<color>! 血量增加 20%",
	"你被封为<color=0xff>统领<color>! 血量增加 30%, 防守增加 5%",
	"你被封为<color=yellow>副将<color>! 血量增加 40%, 防守增加 10% ",
	"你被封为<color=yellow><bclr=red>大将<bclr><color>! 血量增加 50%, 防守增加 15%.",
	"你被封为<color=yellow>元帅<color=>!"}
	
	tbRANKNAME={"<color=white>士兵<color>", "<color=0xa0ff>校尉<color>", "<color=0xff>统领<color>", "<color=yellow>副将<color>", "<color=yellow><bclr=red>大将<bclr><color>" , "<color=black>元帅<color>"}
	
	TITLE_BONUSRANK1 = 0		--成为相应头衔所需积分值
	TITLE_BONUSRANK2 = 10000
	TITLE_BONUSRANK3 = 20000
	TITLE_BONUSRANK4 = 40000
	TITLE_BONUSRANK5 = 60000
	TITLE_BONUSRANK6 = 80000
	
	TITLE_PL2RANK1_N = 400		--相应头衔的玩家最大人数
	TITLE_PL2RANK2_N = 60
	TITLE_PL2RANK3_N = 25
	TITLE_PL2RANK4_N = 10
	TITLE_PL2RANK5_N = 5
	TITLE_PL2RANK6_N = 1
	
---------------------------------------------------------------

FILE_HOMETRAP1 = "\\script\\missions\\tongwar\\match\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\missions\\tongwar\\match\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\missions\\tongwar\\match\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\missions\\tongwar\\match\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\missions\\tongwar\\match\\homeouttrap2.lua"

FILE_DOCTOR1 = 	"\\script\\missions\\tongwar\\npc\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\missions\\tongwar\\npc\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\missions\\tongwar\\npc\\openbox.lua"
FILE_DEATH = "\\script\\missions\\tongwar\\match\\npcdeath.lua"






