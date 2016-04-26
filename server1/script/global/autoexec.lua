-- 自动加载npc脚本
Include( "\\script\\global\\addxishancunnpc.lua" )
Include( "\\script\\task\\tollgate\\killbosshead.lua" )
Include( "\\script\\task\\tollgate\\addtollgatenpc.lua" ) --加载关卡任务涉及的NPC
Include( "\\script\\task\\partner\\partner_head.lua" )    --加载同伴任务涉及的NPC
Include ("\\script\\missions\\freshman_match\\add_championnpc.lua")
Include("\\script\\event\\mid_autumn\\add_zhongqiunpc.lua")
Include("\\script\\missions\\newcitydefence\\cd_addsignnpc.lua")
Include("\\script\\misc\\league_cityinfo.lua")
Include ("\\script\\missions\\leaguematch\\wlls_autoexec.lua")	--WLLS 武林联赛
Include ("\\script\\missions\\statinfo\\head.lua")	--数据统计
Include("\\script\\event\\wulin_2nd\\wulin_addmaster.lua")
Include("\\script\\global\\addspreadernpc.lua")			--游戏推广员
Include("\\script\\missions\\tongwar\\tongwar_autoexec.lua")
Include("\\script\\task\\lv120skill\\head.lua")	-- 120级技能任务
Include("\\script\\tong\\addtongnpc.lua")
Include("\\script\\中原北区\\汴京\\汴京\\trap\\bianjing_ximen_trap.lua")
Include("\\script\\江南区\\金山岛\\addnpcandtrap.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua");	-- 黄连老叟
Include("\\script\\event\\change_destiny\\npc.lua");	-- 逆天改命
Include("\\script\\missions\\newpracticemap\\addnpc.lua");	-- 新练级地图	
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua"); -- 寻花打虎
Include("\\script\\misc\\timeline\\timelinemanager.lua") --时间轴
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\西南南区\\大理府\\大理府\\trap\\dali_heidong_trap.lua")

if (GetProductRegion() =="cn" or GetProductRegion() == "cn_ib") then
	-- 读入招募使任务头文件
	Include("\\script\\task\\lord\\head.lua");
end

if (GetProductRegion() == "vn") then
	-- 2006 中秋节活动头文件
	Include("\\script\\event\\mid_autumn06\\autoexe.lua");
	Include("\\script\\global\\judgeoffline_special.lua")	--用于无名谷——托管服务器地图
	Include("\\script\\event\\collect_juanzhou\\autoaddnpc.lua")--收集神秘卷轴任务，明月镇npc
	Include("\\script\\event\\act2years_yn\\head.lua")       --越南两周年活动，明月镇npc
	--Include("\\script\\event\\vnchristmas2007\\addnpc.lua") --越南2007圣诞节,冰儿npc
	--Include("\\script\\event\\newyear_2008\\cailu\\addnpc.lua")	--越南2008春节采禄npc
	Include("\\script\\两湖区\\南岳镇\\heisha_autoexec.lua")	-- 越南增加南岳镇to黑沙洞trap点
	
	Include("\\script\\event\\great_night\\great_night_head.lua")	--双龙洞黄金之核
end
	

MSID_LOCALNEWS = 17 --系统自动发送LocalNews计时器事件编号

maptab={};
--maptab[1]=209;
--maptab[2]=210;
--maptab[3]=211;
--maptab[1]=212;
clearskillmap = {243, 245, 247, 249, 251, 253,255}

adddialognpc = {
	{822,387,1306,2564,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\messenger_flynpc.lua","白翼"},
	{822,388,1306,2564,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\messenger_flynpc.lua","白翼"},
	{822,389,1306,2564,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\messenger_flynpc.lua","白翼"},
	{832,390,1586,2600,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\messenger_temnpc.lua","纳兰青城"},
	{832,391,1586,2600,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\messenger_temnpc.lua","纳兰青城"},
	{832,392,1586,2600,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\messenger_temnpc.lua","纳兰青城"},
	{842,393,1386,2442,"\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_turenpc.lua","萧镇"},
	{842,394,1386,2442,"\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_turenpc.lua","萧镇"},
	{842,395,1386,2442,"\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_turenpc.lua","萧镇"},

	{377,387,1570,3132,"\\script\\task\\tollgate\\messenger\\messenger_flyrukou.lua","驿官"},
	{377,388,1570,3132,"\\script\\task\\tollgate\\messenger\\messenger_flyrukou.lua","驿官"},
	{377,389,1570,3132,"\\script\\task\\tollgate\\messenger\\messenger_flyrukou.lua","驿官"},

	{377,390,1320,3185,"\\script\\task\\tollgate\\messenger\\messenger_templerukou.lua","驿官"},
	{377,391,1320,3185,"\\script\\task\\tollgate\\messenger\\messenger_templerukou.lua","驿官"},
	{377,392,1320,3185,"\\script\\task\\tollgate\\messenger\\messenger_templerukou.lua","驿官"},

	{377,393,1412,3203,"\\script\\task\\tollgate\\messenger\\messenger_turerukou.lua","驿官"},
	{377,394,1412,3203,"\\script\\task\\tollgate\\messenger\\messenger_turerukou.lua","驿官"},
	{377,395,1412,3203,"\\script\\task\\tollgate\\messenger\\messenger_turerukou.lua","驿官"},

	{309,80,1806,3145,"\\script\\global\\faeshi.lua","罚恶使"},
	{310,80,1788,3172,"\\script\\global\\shangshanshi.lua","赏善使"},	-- 增加扬州赏善罚恶使
	{387,176,1314,3194,"\\script\\江南区\\临安\\临安\\npc\\职能_神秘铁匠.lua","神秘铁匠"},
	{769,11,3210,4974,"\\script\\task\\tollgate\\killer\\nieshichen.lua","聂弑尘"},
	{769,1,1506,3198,"\\script\\task\\tollgate\\killer\\nieshichen.lua","聂弑尘"},
	{769,37,1647,3050,"\\script\\task\\tollgate\\killer\\nieshichen.lua","聂弑尘"},
	{769,176,1372,3010,"\\script\\task\\tollgate\\killer\\nieshichen.lua","聂弑尘"},
	{769,162,1573,3227,"\\script\\task\\tollgate\\killer\\nieshichen.lua","聂弑尘"},
	{769,78,1512,3206,"\\script\\task\\tollgate\\killer\\nieshichen.lua","聂弑尘"},
	{769,80,1700,2963,"\\script\\task\\tollgate\\killer\\nieshichen.lua","聂弑尘"},
	{1783,  174, 1644,3308, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
	{1783,  121, 2036,4507, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
	{1783,  153, 1609,3257, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
	{1783,  101, 1694,3118, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
	{1783,  99,  1578,3209, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
	{1783,  100, 1614,3167, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
	{1783,  20,  3534, 6197, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
	{1783,  53,  1593, 3188, "\\script\\global\\帮会接引人.lua", "帮会接引人"},
}

nw_npclist = {
	{1434, 176, 1478, 3238, "\\script\\nationalwar\\npc.lua", "内阁尚书"},	-- 内阁尚书（宋）
	{1435, 37,  1785, 3041, "\\script\\nationalwar\\npc.lua", "内阁尚书"},	-- 内阁尚书（金）
}

-- 七城大战
npclist_sevencity = {
--	{950, 1, 	1642, 3270, "\\script\\missions\\sevencity\\dialog_npc.lua", "七城大战接头人"},
--	{950, 11, 	3186, 5182, "\\script\\missions\\sevencity\\dialog_npc.lua", "七城大战接头人"},
--	{950, 162, 	1680, 3276, "\\script\\missions\\sevencity\\dialog_npc.lua", "七城大战接头人"},
--	{950, 37, 	1692, 3212, "\\script\\missions\\sevencity\\dialog_npc.lua", "七城大战接头人"},
	{950, 78, 	1582, 3380, "\\script\\missions\\sevencity\\dialog_npc.lua", "七城大战接头人"},
--	{950, 80, 	1692, 3218, "\\script\\missions\\sevencity\\dialog_npc.lua", "七城大战接头人"},
--	{950, 176, 	1689, 3289, "\\script\\missions\\sevencity\\dialog_npc.lua", "七城大战接头人"},
}

addnewtasknpc={
{697,80,4,37,1679,3045,0,"拓跋怀川",0,"\\script\\中原北区\\汴京\\汴京\\npc\\passerby_tuoba.lua"},
{698,30,4,78,1615,3185,0,"刘蕴古",0,"\\script\\中原南区\\襄阳\\襄阳\\npc\\passerby_liuyungu.lua"},
{699,35,5,176,1695,3387,0,"施宜生",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_shiyisheng.lua"},
{700,25,5,80,1796,3393,0,"正派武士",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_shenfeng.lua"},
{701,45,5,78,1781,3213,0,"阮明远",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_ruanmingyuan.lua"},
{702,55,5,78,1359,3514,0,"盛尹",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_shengyin.lua"},
{671,25,5,1,1764,3052,0,"潘如龙",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_panrulong.lua"},
{672,45,5,11,3369,4865,0,"渝湘津",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_yuxiangjin.lua"},
{668,55,5,176,1666,2562,0,"齐即风",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_qijifeng.lua"},
{660,80,4,1,1587,3303,0,"傲云宗",0,"\\script\\西北南区\\凤翔\\路人npc\\passerby_aoyunzong.lua"},
{662,50,4,80,1849,3050,0,"混混",0,"\\script\\中原南区\\扬州\\npc\\passerby_hunhun.lua"},
{661,80,4,176,1368,3050,0,"柳南云",0,"\\script\\江南区\\临安\\临安\\npc\\passerby_liunanyun.lua"},
{675,35,5,131,1878,3400,0,"荷花盗碧玉",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_hehuadaobiyu.lua"},
{675,35,5,131,1898,3430,0,"荷花盗如烟",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_hehuadaoruyan.lua"},
{675,35,5,131,1889,3404,0,"荷花盗曾梦",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_hehuadaocengmeng.lua"},
{676,55,5,162,1728,2969,0,"紫面魔王龙追舞",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_longzhuiwu.lua"},
{670,30,5,80,1395,3443,0,"武林人物宋云飞",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwulouqianxue.lua"},
{670,30,5,80,1383,3447,0,"武林人物秦时风",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwuqinshifeng.lua"},
{670,30,5,80,1377,3435,0,"武林人物蓝战",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwulanzhan.lua"},
{670,30,5,80,1381,3418,0,"武林人物尹双瞳",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwuyinshuangtong.lua"},
{670,30,5,80,1390,3405,0,"武林人物费冷",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwufeileng.lua"},
{669,25,5,80,2004,2876,0,"朝天帮帮主路长天",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_luchangtian.lua"},
{663,80,4,20,3545,6223,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{663,80,4,53,1618,3169,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{663,80,4,121,2010,4484,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{663,80,4,99,1625,3194,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{663,80,4,100,1621,3170,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{663,80,4,101,1692,3140,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{663,80,4,174,1639,3291,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{663,80,4,153,1622,3242,0,"龙五",0,"\\script\\task\\newtask\\education\\路人_龙五.lua"},
{646,80,4,162,1469,3168,0,"莫愁",0,"\\script\\西南南区\\大理府\\大理府\\npc\\路人_莫愁.lua"},
{648,80,4,162,1468,3167,0,"莫巧儿",0,"\\script\\西南南区\\大理府\\大理府\\npc\\路人_莫巧儿.lua"},
{649,80,4,11,3226,5118,0,"公子笑",0,"\\script\\西南北区\\成都\\成都\\路人npc\\路人_公子笑.lua"},
{678,20,5,179,2033,2755,0,"宁将军",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_ningjiangjun.lua"},
{647,20,5,162,1635,2977,0,"莫愁",0,"\\script\\task\\newtask\\master\\zhengpai\\战斗_莫愁.lua"},
{653,30,5,141,1540,3324,0,"界流风",0,"\\script\\task\\newtask\\master\\zhengpai\\战斗_界流风.lua"},
{679,30,5,136,1613,3194,0,"卢善像",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_lushanxiang.lua"},
{654,40,5,173,1555,3054,0,"紫刀侠",0,"\\script\\task\\newtask\\master\\zhengpai\\战斗_紫刀侠.lua"},
{680,40,5,5,1455,3437,0,"徐自力",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_xuzili.lua"},
{655,50,5,24,2114,3323,0,"怨毒",0,"\\script\\task\\newtask\\master\\zhengpai\\战斗_怨毒.lua"},
{681,50,5,66,1596,3300,0,"寒江独钓叟",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_hanjiangdudiaosou.lua"},
{667,60,5,79,1683,3144,0,"神秘人",0,"\\script\\task\\newtask\\master\\zhengpai\\战斗_南宫飞云.lua"},
{666,60,5,103,1750,2668,0,"空寂大师",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_shaolinkongji.lua"},
{651,80,4,176,1630,2992,0,"孟凡",0,"\\script\\江南区\\临安\\临安\\npc\\路人_孟凡.lua"},
{650,80,4,80,1703,3119,0,"夏无且",0,"\\script\\中原南区\\扬州\\npc\\路人_夏无且.lua"},
{665,80,4,103,1774,2842,0,"空寂大师",0,"\\script\\中原北区\\少林派\\少林派\\npc\\passerby_shaolinkongji.lua"},
{677,80,4,59,1640,3186,0,"寒江独钓叟",0,"\\script\\两湖区\\天王帮\\天王帮\\npc\\passerby_hanjiangdudiaosou.lua"},
{723,25,5,332,1262,2821,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1220,2833,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1244,2881,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1252,2934,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1250,3002,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1307,3007,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1368,3060,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1428,3046,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1476,3049,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1470,3097,0,"藏宝客",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{738,35,5,90,1792,3137,0,"恶狼",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_elang.lua"},

-- 邪教主线任务所对应 NPC 

{720,45,2,195,593,3070,0,"陆非",0,"\\script\\task\\newtask\\master\\xiepai\\战斗_陆非.lua"},

{718,90,2,121,2016,4490,0,"端木清",0,"\\script\\task\\newtask\\master\\xiepai\\路人_端木清.lua"},

{714,90,2,176,1628,3209,0,"蔡公公",0,"\\script\\task\\newtask\\master\\xiepai\\路人_蔡公公.lua"},

{722,30,2,90,1814,3283,0,"小祺儿",0,"\\script\\task\\newtask\\master\\xiepai\\战斗_小祺儿.lua"},

{719,90,2,80,1592,3118,0,"镖师",0,"\\script\\task\\newtask\\master\\xiepai\\扬州_镖师.lua"},

{716,45,2,21,2710,3947,0,"夏侯复",0,"\\script\\task\\newtask\\master\\xiepai\\战斗_夏侯复.lua"},

{715,90,2,174,1593,3256,0,"傅雷书",0,"\\script\\task\\newtask\\master\\xiepai\\路人_傅雷书.lua"},

{717,55,2,92,1944,3214,0,"肖无常",0,"\\script\\task\\newtask\\master\\xiepai\\战斗_肖无常.lua"},

{721,65,2,40,1688,3032,0,"徒单大人",0,"\\script\\task\\newtask\\master\\xiepai\\战斗_徒单大人.lua"},

{694,80,2,94,1551,3149,0,"廖定",0,"\\script\\task\\newtask\\master\\xiepai\\战斗_廖定.lua"},

----炎帝宝藏npc
--{1321,80,4,176,1420,3309,0,"丁丁姑娘",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1321,80,4,176,1664,3244,0,"丁丁姑娘",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1321,80,4,176,1559,2917,0,"丁丁姑娘",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1321,80,4,176,1373,2970,0,"丁丁姑娘",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1320,80,4,37,1714,3173,0,"炎帝宝藏",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1320,80,4,37,1642,3145,0,"炎帝宝藏",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1320,80,4,37,1622,3019,0,"炎帝宝藏",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
{1320,80,4,37,1857,2968,0,"炎帝宝藏",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},

{389,80,4,851,1577,3184,0,"药商",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},
{389,80,4,851,1607,3178,0,"药商",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},
--{389,80,4,852,1577,3184,0,"药商",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},
--{389,80,4,852,1607,3178,0,"药商",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},

}


addmasknpc = {
	{375,1,1554,3137,"\\script\\global\\路人_易容术士.lua","易容术士"},
	{375,11,3164,4957,"\\script\\global\\路人_易容术士.lua","易容术士"},
	{375,162,1632,3274,"\\script\\global\\路人_易容术士.lua","易容术士"},
	{375,37,1771,2978,"\\script\\global\\路人_易容术士.lua","易容术士"},
	{375,78,1498,3276,"\\script\\global\\路人_易容术士.lua","易容术士"},
	{375,80,1628,3071,"\\script\\global\\路人_易容术士.lua","易容术士"},
	
	{258,1,1514,3147,"\\script\\global\\零贩功能.lua","零贩"},
	{258,162,1596,3271,"\\script\\global\\零贩功能.lua","零贩"},
	{258,37,1750,2999,"\\script\\global\\零贩功能.lua","零贩"},
}


Include([[\script\event\springfestival07\head.lua]]);

tab_springfestivalNPC = 
{

--2007新年活动圣诞老人替换北斗老人
	{108,520,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"北斗老人"},
	{108,521,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"北斗老人"},
	{108,522,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"北斗老人"},
	{108,523,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"北斗老人"},
	{108,524,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"北斗老人"},
	{108,525,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"北斗老人"},
	{108,526,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"北斗老人"},

	{644,520,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"圣诞老人"},
	{644,521,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"圣诞老人"},
	{644,522,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"圣诞老人"},
	{644,523,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"圣诞老人"},
	{644,524,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"圣诞老人"},
	{644,525,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"圣诞老人"},
	{644,526,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"圣诞老人"},
	
};

tab_zingplay_npc = {
-- ZingPlay使者已经过期 2008-09-27
-- 换成 教师节活动的恩师 2008-10-03
-- 换成 JxWeb沟通使者 2009-04-13
	{354,11,3150,5075,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","沟通使者"},
	{354,1,1611,3096,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","沟通使者"},
	{354,37,1725,3090,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","沟通使者"},
	{354,176,1557,2981,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","沟通使者"},
	{354,162,1654,3233,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","沟通使者"},
	{354,78,1599,3292,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","沟通使者"},
	{354,80,1737,2958,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","沟通使者"},
}

--220/192
local tbActNpcList =
{
	{311,176,1593,2943,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","试炼堂接引人"},
	{311,11,3108,5060,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","试炼堂接引人"},
	{311,1,1585,3230,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","试炼堂接引人"},
	{311,37,1740,3065,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","试炼堂接引人"},
	{311,162,1613,3190,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","试炼堂接引人"},
	{311,78,1608,3238,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","试炼堂接引人"},
	{311,80,1704,3058,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","试炼堂接引人"},
	
	{1327, 20,3554,6188, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","大石头"},
	{1327, 174,1628,3218, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","大石头"},
	{1327, 121,1963,4511, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","大石头"},
	{1327, 153,1612,3226, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","大石头"},
	{1327, 99,1615,3166, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","大石头"},
	{1327, 100,1626,3181, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","大石头"},
	{1327, 53,1632,3199, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","大石头"},
	
	
	{1393,176,1657,3261,"\\script\\missions\\dangboss\\gongnv_npc.lua","掌灯宫女"},
	{1393,176,1577,2957,"\\script\\missions\\dangboss\\gongnv_npc.lua","掌灯宫女"},
	{1393,176,1439,3267,"\\script\\missions\\dangboss\\gongnv_npc.lua","掌灯宫女"},
	{1393,176,1385,2977,"\\script\\missions\\dangboss\\gongnv_npc.lua","掌灯宫女"},


--	{1454, 80,1768,3029, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","大吉饼"},
--	{1454, 11,3136,5065, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","大吉饼"},
--	{1454, 162,1622,3184, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","大吉饼"},
--	{1454, 1,1596,3200, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","大吉饼"},
--	{1454, 78,1579,3230, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","大吉饼"},
--	{1454, 37,1776,3049, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","大吉饼"},
--	{1454, 176,1577,2950, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","大吉饼"},
	
	{218, 80,1737,2988, "\\script\\activitysys\\npcdailog.lua","估价先生"},
	{218, 11,3133,4987, "\\script\\activitysys\\npcdailog.lua","估价先生"},
	{218, 1,1620,3145, "\\script\\activitysys\\npcdailog.lua","估价先生"},
	{218, 37,1812,3090, "\\script\\activitysys\\npcdailog.lua","估价先生"},
	{218, 176,1496,2971, "\\script\\activitysys\\npcdailog.lua","估价先生"},
	{218, 162,1594,3210, "\\script\\activitysys\\npcdailog.lua","估价先生"},
	{218, 78,1546,3240, "\\script\\activitysys\\npcdailog.lua","估价先生"},
	
	--S? d鬾g l筰 npc B? Long c? - Modified by DinhHQ - 20110810
--	{1448,11,3123,4996,	"\\script\\activitysys\\npcdailog.lua","龙儿"},
--	{1448,1,1618,3144,	"\\script\\activitysys\\npcdailog.lua","龙儿"},
--	{1448,37,1809,3090,	"\\script\\activitysys\\npcdailog.lua","龙儿"},
--	{1448,176,1501,2974,	"\\script\\activitysys\\npcdailog.lua","龙儿"},
--	{1448,162,1589,3215,	"\\script\\activitysys\\npcdailog.lua","龙儿"},
--	{1448,78,1534,3241,	"\\script\\activitysys\\npcdailog.lua","龙儿"},
--	{1448,80,1737,2985,	"\\script\\activitysys\\npcdailog.lua","龙儿"},
	{1448,37,1769,3056, "\\script\\event\\jiefang_jieri\\201004\\longer.lua","龙儿"},
	
	{1576, 176,1408,3309, "\\script\\activitysys\\npcdailog.lua","武林盟主"},		-- 武林盟主雕像
	{1577, 176,1412,3311, "\\script\\activitysys\\npcdailog.lua","武林盟主"},		-- 武林盟主雕像
	
	{1801, 176,1420,3298, "\\script\\activitysys\\npcdailog.lua","武林盟主"},		-- 武林盟主新雕像
	{1802, 176,1424,3300, "\\script\\activitysys\\npcdailog.lua","武林盟主"},		-- 武林盟主新雕像
--	{455, 37,1762,3049, "\\script\\event\\other\\caipiao\\npcdialog.lua","财神"},

	{108, 176,1451,3233, "\\script\\missions\\arena\\npc\\officer.lua","竞技场官员"},
};

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\event\\other\\shensuanzi\\class.lua")
Include("\\script\\activitysys\\functionlib.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")

function main()

	DynamicExecute("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua","GameFloor1:Start")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor2\\gamefloor2.lua","GameFloor2:Start")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua","GameFloor3:Start")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor4\\gamefloor4.lua","GameFloor4:Start")
	
--月歌岛
	DynamicExecute("\\script\\missions\\yuegedao\\yuegedao\\yuegedaoworld.lua", "YueGeDaoWorld:Start")
	DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua", "YueGeMiGuWorld:Start")

	DynamicExecute("\\script\\changefeature\\initmap.lua", "AddDailogNpc")
	DynamicExecute("\\script\\global\\npc\\huoke.lua", "CallHuoKeInit")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor1\\yunchihead.lua", "AddEnterNpc")
	tbShenSuanZi:Init()
	
	OpenGlbMission(8)
	
	-- 启动数据统计任务
	OpenGlbMission(MSID_STAT_GOODS_SALE)
	
	mapcount = getn(maptab)
	for i = 1, mapcount do 
		idx = SubWorldID2Idx(maptab[i]);
		if (idx ~= -1) then 
			SubWorld = idx;
			OpenMission(2);
		end;
	end

	buildAllCityInfoLeague()
	
	-- 挂机地图任务
	load_mission_aexp();
	add_dialognpc(adddialognpc);
	add_dialognpc(nw_npclist)
	add_dialognpc(npclist_sevencity)
	add_newtasknpc(addnewtasknpc);
	add_xishancunnpc(xishancunnpc);
	
	add_spreadernpc(spreadernpc);		--加载游戏推广员
	add_killertasknpc(addkillertasknpc);
	add_alltollgatenpc();   --加载关卡任务的相关npc
	--add_allpartnernpc();     --加载同伴任务的相关npc
	--add_zhongqiunpc();		--加载中秋活动npc
	cd_addsignnpc()			--加载卫国战争报名点NPC
	wlls_autoexe()	--WLLS 武林联赛
	--两周年活动NPC    
	add_dialognpc(%tbActNpcList)
	tongwar_addsignnpc()
	add_tongnpc()	--加载帮会相关npc
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local szRegion = GetProductRegion();
	if (szRegion == "cn" or szRegion == "cn_ib") then
		add_dialognpc(addmasknpc)	--7大城市加载易容术士
		add_wulinnpc_2nd()	--第二届武林大会官员
		
		add_lv120skillnpc()		-- 120级技能任务
		-- 2006 圣诞活动
		add_dialognpc(ch06_addchristmasnpc);
		add_lottery_npc();	--武林募捐活动增加 4个襄阳礼官；3月初删除
	--	addGraveStone(); -- 2006 清明节活动
		qm07_addGraveStone()
	end

	if (szRegion == "cn_ib") then
		addEmissaryNpc()        -- 招募使龙脉任务
	end

	if (szRegion == "vn") then
		add_dialognpc(ACT2YEAR_YN_NPC);	--两周年活动NPC   by子非鱼 2008-10-09删除过期NPC
		AnonymVale_auto();			--托管地图
		add_dialognpc(tab_springfestivalNPC);
		add_dialognpc(addmoontown_mulao);	--收集神秘卷轴任务，明月镇npc by子非鱼 2008-10-09删除过期NPC
		--add_dialognpc(tbxmas2007_girl_binger) --2007圣诞活动，冰儿
		--add_dialognpc(newyear_2008_chunjiecailu) --2008新年采禄活动
		--西山屿
		add_dialognpc(tbaddJinShanDao_NpcAndTrap.tbDialogNpc);--增加对话npc
		tbaddJinShanDao_NpcAndTrap:AddTrapR()--增加右trap点
		tbaddJinShanDao_NpcAndTrap:AddTrapL()--增加左trap点
		tbaddJinShanDao_NpcAndTrap:AddMons()--增加怪物
		--add_obstacle_map();
		if (n_date <= 20200101) then			-- JxWeb活动结束时间
			add_dialognpc(tab_zingplay_npc);
		end
		if(SubWorldID2Idx(11) >= 0) then
			local npcidx = AddNpc(245, 1, SubWorldID2Idx(11), 390 * 8 * 32, 317 * 16 * 32, 1, "黄连姥姥");
			SetNpcScript(npcidx, "\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua");
		end
		add_dialognpc(au06_tab_kidnpc);
		
		tbChangeDestiny:addNpc();	-- 逆天改命
		tbNewPracticeMap:addNpc();	-- 新练级地图
		tbBeatTiger:AddNpc();		-- 寻花打虎
	end
	--增加大理黑洞trap点
	add_trap_daliheidong()
	--增加汴京西城门trap点
	add_trap_bianjingximen()
	add_heisha_entertrap();
	
	G_ACTIVITY:LoadActivitys()
	G_TASK:LoadAllConfig()
	G_ACTIVITY:OnMessage("ServerStart");
	
	tbTimeLineManager:LoadAllTimeLine(tbTimeLineList);
	AutoFunctions:Run()
	
	local szFile = "\\script\\event\\great_night\\great_night_head.lua"
	DynamicExecute(szFile, "OnGreatNightServerStart")
end;

function load_mission_aexp()
	mapTab = {235, 236, 237, 238, 239, 240, 241};
	nCount = getn(mapTab);
	
	oldSubWorld = SubWorld;
	for i = 1, nCount do
		idx = SubWorldID2Idx(mapTab[i]);
		if (idx ~= -1) then 
			SubWorld = idx;
			OpenMission(9);	-- 9为挂机Mission ID
		end;
	end;
	
	SubWorld = oldSubWorld;
end;

function add_dialognpc(Tab)
	for i = 1 , getn(Tab) do 
		local itemlist = Tab[i]
		SId = SubWorldID2Idx(itemlist[2]);
		if (SId >= 0) then
			
			npcindex = AddNpc(itemlist[1], 1, SId, itemlist[3] * 32, itemlist[4] * 32, 1, itemlist[6]);
			SetNpcScript(npcindex, itemlist[5]);
		else
			if itemlist[1] == 1454 then
				print(itemlist[6], itemlist[2])
			end
		end;
	end	
end;

function add_newtasknpc(Tab1)
	for i = 1 , getn(Tab1) do
		Mid = SubWorldID2Idx(Tab1[i][4]);
		if (Mid >= 0 ) then
			TabValue5 = Tab1[i][5] * 32
			TabValue6 = Tab1[i][6] * 32
			newtasknpcindex = AddNpc(Tab1[i][1],Tab1[i][2],Mid,TabValue5,TabValue6,Tab1[i][7],Tab1[i][8]);
			SetNpcScript(newtasknpcindex, Tab1[i][10]);
		end;
	end;
end;

