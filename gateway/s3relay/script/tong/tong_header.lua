COEF_CONTRIB_TO_VALUE	=	1000		--贡献度价值量转化系数
MAX_SHITU_VALUE_STORE	=	10000000	--最大师徙关系价值量
MAX_WEEK_CONTRIBUTION	=	22400		--周累积贡献度上限(10w/h*4h/1000*80%*7d)
MAX_KICK_COUNT			=	20			--每天最大的剔除帮会成员的个数

--贡献度入口活动类型
EVE_NOEVENT		=	0
EVE_SOJIN		=	1	--宋金
EVE_XINSHI		=	2	--信使
EVE_CHUNGGUAN	=	3	--闯关
EVE_YESHOU		=	4	--野叟
EVE_WULIN		=	5	--武林联赛
EVE_FENGHUO		=	6	--烽火
EVE_HUADENG		=	7	--花灯
EVE_ZHONGZI		=	8	--种子
EVE_SHUIJI		=	9	--随机任务
EVE_XIULIAN		=	10	--同伴修炼
EVE_JUQING		=	11	--同伴剧情
EVE_JUANKUAN	=	12	--捐款
EVE_KILLER		=	13	--杀手boss
EVE_FENGLINGDU	=	14	--风陵渡渡船
EVE_LONGMAI		=	15	--龙脉

--周目标相关
MIN_WEEKGOAL_MEMBER			=	100																--帮会周目标最少人数
DAILY_PRICE			=	50	--每天帮众可到祭坛领取的奖励
TB_WEEKGOAL_PRICE_BASE	=	{ 2.5,	4.5,	6.75 }	--三个难度级别的奖励基数
TB_WEEKGOAL_CHANGE		=	{ 4,	8,		16 }	-- 三个难度级别的周手动小时数
WEEKGOAL_VALUE_PERSON		=	150 * 8															--周目标个人贡献度需完成量
WEEKGOAL_VALUE_TONG_SYNC	=	WEEKGOAL_VALUE_PERSON / 10										--周目标帮会贡献度累积值同步阈值
WEEKGOAL_PRICE_PERSON		=	1000															--周目标个人奖励经验值（单位：万）
WEEKGOAL_PRICE_TONG			=	10																--周目标帮会奖励召唤令牌数
TB_WEEKGOAL_TYPE_ID		= 	{ EVE_SOJIN,	EVE_XINSHI,	EVE_CHUNGGUAN,	EVE_YESHOU }	--周目标类型
TB_WEEKGOAL_TYPE_NAME		=	{ "宋金大战",	"闯关任务",		"野叟任务",		"龙脉任务" }	--周目标类型名称

--玩家任务变量定义
TASKID_CONTRIVALUE			=	2361			--贡献价值量
TASKID_STORED_OFFER			=	2389			--玩家后备贡献度
TASKID_STUNT_LASTWEEK		=	2443			--特技领取的帮会周期
TASKID_STUNT_LASTDAY		=	1580			--最后一次领取帮会特技的帮会天数
TASKID_CITY_LASTDAY			=	1581			--最后一次领取城市特技的帮会天数
TASKID_STUNT_TAKED			=	2444			--特技周期内是否领取过
TASKID_MONEYBOX_LASTTIME	=	2446			--陶朱钱袋效力截止时间
TASKID_PANAXBOX_OPEND		=	1577			--参罐开启关闭
TASKID_PANAXBOX_LASTTIME	=	1578			--参罐剩余使用时间
TASKID_CITYST_TAKED			=	1579			--是否领取了城市特技
TASKID_LASTHERO_DATE		=	2497			--最后一次领取烽火英雄令的日期（领取时判断，更新）	
TASKID_LASTHERO_TAKED		=	2498			--每日领取烽火英雄令的个数（递增，领取时判断更新）
TASKID_HEROLING_COUNT		=	2499			--累积的英雄令个数（可+可-）
TASKID_CONTRIBUTE_USED		=	2517			--累积消耗的周贡献度（递增，领取时判断更新）

--帮会成员任务变量定义
TONGMTSK_WEEK_GOAL_PRICE	=	1001			--周目标领奖记录
TONGMTSK_DAILY_PRICE		=	1002			--祭坛领奖记录
TONGMTSK_TOMASTER			=	1003			--师徙关系价值量
TONGMTSK_SELFCOMMEND_TIME	=	1037			--[帮主自荐]参与帮主自荐的时间，当最终有多个竞投第一名，则以时间先后排序
TONGMTSK_MASTERCANDIDATE	=	1038			--[帮主自荐]是(1)否(0)是帮主候选人
TONGMTSK_INICONTRIBUTIVENESS=	1039			--[帮主自荐]申请帮主时的贡献度
TONGMTSK_CONTRIBUTIVENESS	=	1040			--[帮主自荐]竞选的个人贡献度

--帮会任务变量定义
TONGTSK_WEEKGOAL_COMPLETE	=	1006			--帮会上周目标是否完成
TONGTSK_LAST_LEVELUP_DAY	=	1007			--帮会建设等级上次提升时间
TONGTSK_WEEKGOAL_PRICE_WEEK	=	1009			--记录周目标已领过奖的上一个周数
TONGTSK_LAST_DEGRADE_DAY	=	1010			--帮会上次降级时间
TONGTSK_STUNT_ID			=	1011			--帮会特技编号
TONGTSK_STUNT_MEMLIMIT		=	1012			--帮会特技每个时段能够领取人数
TONGTSK_STUNT_MAINPERIOD	=	1013			--帮会特技维护周期，以天计算，以截止日期
TONGTSK_STUNT_ENABLED		=	1014			--帮会特技是否激活，1-激活，0-暂停
TONGTSK_STUNT_SWICTH		=	1021			--下一周期将要更改的帮会特技
TONGTSK_TOTEMINDEX			=	{ 1022, 1023 }	--记录图腾之柱NPC的index，1027为左边的，1028为右边的。右边的在帮会为5级的占城帮时被更换为城市图腾之柱
TONGTSK_CITYST_MEMLIMIT		=	1034			--城市特技能够领取人数
TONGTSK_MONEYBOX_DROPMAX	=	1035			--陶朱钱袋翻倍掉落boss宝印的限制
TONGTSK_STUNT_PAUSE			=	1036			--帮会暂停维护特技
TONGTSK_OPEN_DATE			=	1041			--[帮主自荐]帮主自荐开启的时间，如果为0表示没有开启
TONGTSK_LAST_WM_DAY			=	1050			--帮会上次周维护日子
TONGTSK_LUP_ORDER			=	1051			--帮会升级名次
TONGTSK_LUP_PRICE			=	1052			--帮会升级奖励
TONGTSK_HEROLING			=	1043			--帮会每周累积的英雄令（每周清空，递增）
TONGTSK_USEHEROLING			=	1044			--帮会消耗的英雄令（每周清空，递增）
TONGTSK_MAP_EXPIRE_DATE		=	1045			--帮会地图的有效日期
TONGTSK_MEMBER_KICK_COUNT	=	1046			--剔除帮会成员的计数
TONGTSK_MEMBER_KICK_DATE	=	1047			--剔除帮会成员的计数日期

TONGTSK_CLAIMWAR_DATE   = 1053         --某帮会宣战日期, add by wdb
TONGTSK_CLAIMWAR_TIMES  = 1054		   --某帮会在某天宣战的次数





--用于Log
TONGTSK_WEEK_BFADD			=	1100
TONGTSK_WEEK_BFCONSUME		=	1101
TONGTSK_WEEK_WFADD			=	1102
TONGTSK_WEEK_WFCONSUME		=	1103
TONGTSK_WEEK_WSCONSUME		=	1104
TONGTSK_MONEYFUND2BF		=	1105
TONGTSK_MONEY2BF			=	1106
TONGTSK_BF2WF				=	1107

--用于活动的临时帮会任务变量
TONGTSK_Gongde_meici = 1205
TONGTSK_Gongde_meici_flag = 1206 -- 记录年月日时
TONGTSK_Gongde_meizhou = 1208 --
TONGTSK_Gongde_meizhou_flag = 1209 -- 记录%j
TONGTSK_Gongde_Total = 1210

TONGTSK_TriumphDrum_LastUseDay = 1211	-- 上次使用日期
TONGTSK_TriumphDrum_BeUsed = 1212		-- 是否使用过


--帮会临时任务变量定义
--贡献度入口数据缓存
TONG_TEMPSTART				=	100				--临时变量ID必须大于此值
TONG_WEEKTEMP				=	101				--周目标累积贡献度缓存
TONG_STORETEMP				=	102				--储备贡献度缓存
TONG_FUNDTEMP				=	103				--基金缓存
TONG_TMPWEEKGOALPRICE		=	104				--周目标领奖临时

--退隐相关
TONGMEMBER_RETIRE_MAX_RATE		=	0.5			-- 退隐人数最大比例
TONGMEMBER_RETIRE_REQUIRE_DAY	=	7			-- 命令退隐需要帮众7天不在线才可进行
TONGMEMBER_UNRETIRE_REQUIRE_DAY	=	7			-- 恢复退隐需要在退隐7天后才可进行

-- 帮会职务ID
TONG_MASTER		= 0		--帮主
TONG_ELDER		= 1		--长老
TONG_MANAGER	= 2		--队长
TONG_MASS		= 3		--帮众
TONG_RETIRE		= 4		--隐士

-- 帮会职务名称
TB_TONG_FIGURE_NAME =
{
	[TONG_MASTER]	=	"帮主",
	[TONG_ELDER]	=	"长老",
	[TONG_MANAGER]	=	"队长",
	[TONG_MASS]		=	"帮众",
	[TONG_RETIRE]	=	"隐士",
};

MAX_ELDER_COUNT		=	7		-- 最大长老数量
MAX_MANAGER_COUNT	=	56		-- 最大队长数量


-- 帮会权限ID
RIGHTID_WORKSHOP	=	9001	-- 作坊管理
RIGHTID_WEEKGOAL	=	2005;	-- 周目标管理
RIGHTID_CITY		=	2003	-- 城市管理
RIGHTID_STUNT		=	2006	-- 特技管理

DYNMAP_ID_BASE		=	70000	-- 动态地图起始值

-- 特技相关
TB_STUNT_RIGHT_DS	=	{ "帮会领导层", "所有帮会成员" }
TB_TOTEMPOLE_POS	=	{ {1665, 3253}, {1657, 3262} }
TB_CITYID_STUNTID	=
{
	[1] = {"凤翔", 5},
	[2] = {"成都", 1},
	[3] = {"大理", 6},
	[4] = {"汴京", 7},
	[5] = {"襄阳", 3},
	[6] = {"扬州", 2},
	[7] = {"临安", 4},
}
TB_STUNT_PAUSESTATE	=
{
--[stateid] 当前状态 下周状态 准许改变的状态 维护后的状态
	[0] = {"关闭", "关闭", 1, 0},
	[1] = {"关闭", "开启", 0, 3},
	[2] = {"开启", "关闭", 3, 0},
	[3] = {"开启", "开启", 2, 3},
}

-- 帮助自荐相关
CAST_DURATION		=	14;				--竞投日期
MASTER_ASIDE_TIME	=	30;				--帮主离开的时间
FORETASKVALUE		=	2240;			--前提任务目标值