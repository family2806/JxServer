-- ×Ô¶¯¼ÓÔØnpc½Å±¾
Include( "\\script\\global\\addxishancunnpc.lua" )
Include( "\\script\\task\\tollgate\\killbosshead.lua" )
Include( "\\script\\task\\tollgate\\addtollgatenpc.lua" ) --¼ÓÔØ¹Ø¿¨ÈÎÎñÉæ¼°µÄNPC
Include( "\\script\\task\\partner\\partner_head.lua" )    --¼ÓÔØÍ¬°éÈÎÎñÉæ¼°µÄNPC
Include ("\\script\\missions\\freshman_match\\add_championnpc.lua")
Include("\\script\\event\\mid_autumn\\add_zhongqiunpc.lua")
Include("\\script\\missions\\newcitydefence\\cd_addsignnpc.lua")
Include("\\script\\misc\\league_cityinfo.lua")
Include ("\\script\\missions\\leaguematch\\wlls_autoexec.lua")	--WLLS ÎäÁÖÁªÈü
Include ("\\script\\missions\\statinfo\\head.lua")	--Êı¾İÍ³¼Æ
Include("\\script\\event\\wulin_2nd\\wulin_addmaster.lua")
Include("\\script\\global\\addspreadernpc.lua")			--ÓÎÏ·ÍÆ¹ãÔ±
Include("\\script\\missions\\tongwar\\tongwar_autoexec.lua")
Include("\\script\\task\\lv120skill\\head.lua")	-- 120¼¶¼¼ÄÜÈÎÎñ
Include("\\script\\tong\\addtongnpc.lua")
Include("\\script\\ÖĞÔ­±±Çø\\ãê¾©\\ãê¾©\\trap\\bianjing_ximen_trap.lua")
Include("\\script\\½­ÄÏÇø\\½ğÉ½µº\\addnpcandtrap.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua");	-- »ÆÁ¬ÀÏÛÅ
Include("\\script\\event\\change_destiny\\npc.lua");	-- ÄæÌì¸ÄÃü
Include("\\script\\missions\\newpracticemap\\addnpc.lua");	-- ĞÂÁ·¼¶µØÍ¼	
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua"); -- Ñ°»¨´ò»¢
Include("\\script\\misc\\timeline\\timelinemanager.lua") --Ê±¼äÖá
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\Î÷ÄÏÄÏÇø\\´óÀí¸®\\´óÀí¸®\\trap\\dali_heidong_trap.lua")

if (GetProductRegion() =="cn" or GetProductRegion() == "cn_ib") then
	-- ¶ÁÈëÕĞÄ¼Ê¹ÈÎÎñÍ·ÎÄ¼ş
	Include("\\script\\task\\lord\\head.lua");
end

if (GetProductRegion() == "vn") then
	-- 2006 ÖĞÇï½Ú»î¶¯Í·ÎÄ¼ş
	Include("\\script\\event\\mid_autumn06\\autoexe.lua");
	Include("\\script\\global\\judgeoffline_special.lua")	--ÓÃÓÚÎŞÃû¹È¡ª¡ªÍĞ¹Ü·şÎñÆ÷µØÍ¼
	Include("\\script\\event\\collect_juanzhou\\autoaddnpc.lua")--ÊÕ¼¯ÉñÃØ¾íÖáÈÎÎñ£¬Ã÷ÔÂÕònpc
	Include("\\script\\event\\act2years_yn\\head.lua")       --Ô½ÄÏÁ½ÖÜÄê»î¶¯£¬Ã÷ÔÂÕònpc
	--Include("\\script\\event\\vnchristmas2007\\addnpc.lua") --Ô½ÄÏ2007Ê¥µ®½Ú,±ù¶ùnpc
	--Include("\\script\\event\\newyear_2008\\cailu\\addnpc.lua")	--Ô½ÄÏ2008´º½Ú²ÉÂ»npc
	Include("\\script\\Á½ºşÇø\\ÄÏÔÀÕò\\heisha_autoexec.lua")	-- Ô½ÄÏÔö¼ÓÄÏÔÀÕòtoºÚÉ³¶´trapµã
	
	Include("\\script\\event\\great_night\\great_night_head.lua")	--Ë«Áú¶´»Æ½ğÖ®ºË
end
	

MSID_LOCALNEWS = 17 --ÏµÍ³×Ô¶¯·¢ËÍLocalNews¼ÆÊ±Æ÷ÊÂ¼ş±àºÅ

maptab={};
--maptab[1]=209;
--maptab[2]=210;
--maptab[3]=211;
--maptab[1]=212;
clearskillmap = {243, 245, 247, 249, 251, 253,255}

adddialognpc = {
	{822,387,1306,2564,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\messenger_flynpc.lua","°×Òí"},
	{822,388,1306,2564,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\messenger_flynpc.lua","°×Òí"},
	{822,389,1306,2564,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\messenger_flynpc.lua","°×Òí"},
	{832,390,1586,2600,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\messenger_temnpc.lua","ÄÉÀ¼Çà³Ç"},
	{832,391,1586,2600,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\messenger_temnpc.lua","ÄÉÀ¼Çà³Ç"},
	{832,392,1586,2600,"\\script\\task\\tollgate\\messenger\\shanshenmiao\\messenger_temnpc.lua","ÄÉÀ¼Çà³Ç"},
	{842,393,1386,2442,"\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_turenpc.lua","ÏôÕò"},
	{842,394,1386,2442,"\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_turenpc.lua","ÏôÕò"},
	{842,395,1386,2442,"\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_turenpc.lua","ÏôÕò"},

	{377,387,1570,3132,"\\script\\task\\tollgate\\messenger\\messenger_flyrukou.lua","æä¹Ù"},
	{377,388,1570,3132,"\\script\\task\\tollgate\\messenger\\messenger_flyrukou.lua","æä¹Ù"},
	{377,389,1570,3132,"\\script\\task\\tollgate\\messenger\\messenger_flyrukou.lua","æä¹Ù"},

	{377,390,1320,3185,"\\script\\task\\tollgate\\messenger\\messenger_templerukou.lua","æä¹Ù"},
	{377,391,1320,3185,"\\script\\task\\tollgate\\messenger\\messenger_templerukou.lua","æä¹Ù"},
	{377,392,1320,3185,"\\script\\task\\tollgate\\messenger\\messenger_templerukou.lua","æä¹Ù"},

	{377,393,1412,3203,"\\script\\task\\tollgate\\messenger\\messenger_turerukou.lua","æä¹Ù"},
	{377,394,1412,3203,"\\script\\task\\tollgate\\messenger\\messenger_turerukou.lua","æä¹Ù"},
	{377,395,1412,3203,"\\script\\task\\tollgate\\messenger\\messenger_turerukou.lua","æä¹Ù"},

	{309,80,1806,3145,"\\script\\global\\faeshi.lua","·£¶ñÊ¹"},
	{310,80,1788,3172,"\\script\\global\\shangshanshi.lua","ÉÍÉÆÊ¹"},	-- Ôö¼ÓÑïÖİÉÍÉÆ·£¶ñÊ¹
	{387,176,1314,3194,"\\script\\½­ÄÏÇø\\ÁÙ°²\\ÁÙ°²\\npc\\Ö°ÄÜ_ÉñÃØÌú½³.lua","ÉñÃØÌú½³"},
	{769,11,3210,4974,"\\script\\task\\tollgate\\killer\\nieshichen.lua","Äôß±³¾"},
	{769,1,1506,3198,"\\script\\task\\tollgate\\killer\\nieshichen.lua","Äôß±³¾"},
	{769,37,1647,3050,"\\script\\task\\tollgate\\killer\\nieshichen.lua","Äôß±³¾"},
	{769,176,1372,3010,"\\script\\task\\tollgate\\killer\\nieshichen.lua","Äôß±³¾"},
	{769,162,1573,3227,"\\script\\task\\tollgate\\killer\\nieshichen.lua","Äôß±³¾"},
	{769,78,1512,3206,"\\script\\task\\tollgate\\killer\\nieshichen.lua","Äôß±³¾"},
	{769,80,1700,2963,"\\script\\task\\tollgate\\killer\\nieshichen.lua","Äôß±³¾"},
	{1783,  174, 1644,3308, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
	{1783,  121, 2036,4507, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
	{1783,  153, 1609,3257, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
	{1783,  101, 1694,3118, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
	{1783,  99,  1578,3209, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
	{1783,  100, 1614,3167, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
	{1783,  20,  3534, 6197, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
	{1783,  53,  1593, 3188, "\\script\\global\\°ï»á½ÓÒıÈË.lua", "°ï»á½ÓÒıÈË"},
}

nw_npclist = {
	{1434, 176, 1478, 3238, "\\script\\nationalwar\\npc.lua", "ÄÚ¸óÉĞÊé"},	-- ÄÚ¸óÉĞÊé£¨ËÎ£©
	{1435, 37,  1785, 3041, "\\script\\nationalwar\\npc.lua", "ÄÚ¸óÉĞÊé"},	-- ÄÚ¸óÉĞÊé£¨½ğ£©
}

-- Æß³Ç´óÕ½
npclist_sevencity = {
--	{950, 1, 	1642, 3270, "\\script\\missions\\sevencity\\dialog_npc.lua", "Æß³Ç´óÕ½½ÓÍ·ÈË"},
--	{950, 11, 	3186, 5182, "\\script\\missions\\sevencity\\dialog_npc.lua", "Æß³Ç´óÕ½½ÓÍ·ÈË"},
--	{950, 162, 	1680, 3276, "\\script\\missions\\sevencity\\dialog_npc.lua", "Æß³Ç´óÕ½½ÓÍ·ÈË"},
--	{950, 37, 	1692, 3212, "\\script\\missions\\sevencity\\dialog_npc.lua", "Æß³Ç´óÕ½½ÓÍ·ÈË"},
	{950, 78, 	1582, 3380, "\\script\\missions\\sevencity\\dialog_npc.lua", "Æß³Ç´óÕ½½ÓÍ·ÈË"},
--	{950, 80, 	1692, 3218, "\\script\\missions\\sevencity\\dialog_npc.lua", "Æß³Ç´óÕ½½ÓÍ·ÈË"},
--	{950, 176, 	1689, 3289, "\\script\\missions\\sevencity\\dialog_npc.lua", "Æß³Ç´óÕ½½ÓÍ·ÈË"},
}

addnewtasknpc={
{697,80,4,37,1679,3045,0,"ÍØ°Ï»³´¨",0,"\\script\\ÖĞÔ­±±Çø\\ãê¾©\\ãê¾©\\npc\\passerby_tuoba.lua"},
{698,30,4,78,1615,3185,0,"ÁõÔÌ¹Å",0,"\\script\\ÖĞÔ­ÄÏÇø\\ÏåÑô\\ÏåÑô\\npc\\passerby_liuyungu.lua"},
{699,35,5,176,1695,3387,0,"Ê©ÒËÉú",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_shiyisheng.lua"},
{700,25,5,80,1796,3393,0,"ÕıÅÉÎäÊ¿",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_shenfeng.lua"},
{701,45,5,78,1781,3213,0,"ÈîÃ÷Ô¶",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_ruanmingyuan.lua"},
{702,55,5,78,1359,3514,0,"Ê¢Òü",0,"\\script\\task\\newtask\\branch\\xiepai\\enemy_shengyin.lua"},
{671,25,5,1,1764,3052,0,"ÅËÈçÁú",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_panrulong.lua"},
{672,45,5,11,3369,4865,0,"ÓåÏæ½ò",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_yuxiangjin.lua"},
{668,55,5,176,1666,2562,0,"Æë¼´·ç",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_qijifeng.lua"},
{660,80,4,1,1587,3303,0,"°ÁÔÆ×Ú",0,"\\script\\Î÷±±ÄÏÇø\\·ïÏè\\Â·ÈËnpc\\passerby_aoyunzong.lua"},
{662,50,4,80,1849,3050,0,"»ì»ì",0,"\\script\\ÖĞÔ­ÄÏÇø\\ÑïÖİ\\npc\\passerby_hunhun.lua"},
{661,80,4,176,1368,3050,0,"ÁøÄÏÔÆ",0,"\\script\\½­ÄÏÇø\\ÁÙ°²\\ÁÙ°²\\npc\\passerby_liunanyun.lua"},
{675,35,5,131,1878,3400,0,"ºÉ»¨µÁ±ÌÓñ",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_hehuadaobiyu.lua"},
{675,35,5,131,1898,3430,0,"ºÉ»¨µÁÈçÑÌ",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_hehuadaoruyan.lua"},
{675,35,5,131,1889,3404,0,"ºÉ»¨µÁÔøÃÎ",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_hehuadaocengmeng.lua"},
{676,55,5,162,1728,2969,0,"×ÏÃæÄ§ÍõÁú×·Îè",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_longzhuiwu.lua"},
{670,30,5,80,1395,3443,0,"ÎäÁÖÈËÎïËÎÔÆ·É",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwulouqianxue.lua"},
{670,30,5,80,1383,3447,0,"ÎäÁÖÈËÎïÇØÊ±·ç",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwuqinshifeng.lua"},
{670,30,5,80,1377,3435,0,"ÎäÁÖÈËÎïÀ¶Õ½",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwulanzhan.lua"},
{670,30,5,80,1381,3418,0,"ÎäÁÖÈËÎïÒüË«Í«",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwuyinshuangtong.lua"},
{670,30,5,80,1390,3405,0,"ÎäÁÖÈËÎï·ÑÀä",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_wulinrenwufeileng.lua"},
{669,25,5,80,2004,2876,0,"³¯Ìì°ï°ïÖ÷Â·³¤Ìì",0,"\\script\\task\\newtask\\branch\\zhongli\\enemy_luchangtian.lua"},
{663,80,4,20,3545,6223,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{663,80,4,53,1618,3169,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{663,80,4,121,2010,4484,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{663,80,4,99,1625,3194,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{663,80,4,100,1621,3170,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{663,80,4,101,1692,3140,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{663,80,4,174,1639,3291,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{663,80,4,153,1622,3242,0,"ÁúÎå",0,"\\script\\task\\newtask\\education\\Â·ÈË_ÁúÎå.lua"},
{646,80,4,162,1469,3168,0,"Äª³î",0,"\\script\\Î÷ÄÏÄÏÇø\\´óÀí¸®\\´óÀí¸®\\npc\\Â·ÈË_Äª³î.lua"},
{648,80,4,162,1468,3167,0,"ÄªÇÉ¶ù",0,"\\script\\Î÷ÄÏÄÏÇø\\´óÀí¸®\\´óÀí¸®\\npc\\Â·ÈË_ÄªÇÉ¶ù.lua"},
{649,80,4,11,3226,5118,0,"¹«×ÓĞ¦",0,"\\script\\Î÷ÄÏ±±Çø\\³É¶¼\\³É¶¼\\Â·ÈËnpc\\Â·ÈË_¹«×ÓĞ¦.lua"},
{678,20,5,179,2033,2755,0,"Äş½«¾ü",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_ningjiangjun.lua"},
{647,20,5,162,1635,2977,0,"Äª³î",0,"\\script\\task\\newtask\\master\\zhengpai\\Õ½¶·_Äª³î.lua"},
{653,30,5,141,1540,3324,0,"½çÁ÷·ç",0,"\\script\\task\\newtask\\master\\zhengpai\\Õ½¶·_½çÁ÷·ç.lua"},
{679,30,5,136,1613,3194,0,"Â¬ÉÆÏñ",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_lushanxiang.lua"},
{654,40,5,173,1555,3054,0,"×Ïµ¶ÏÀ",0,"\\script\\task\\newtask\\master\\zhengpai\\Õ½¶·_×Ïµ¶ÏÀ.lua"},
{680,40,5,5,1455,3437,0,"Ğì×ÔÁ¦",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_xuzili.lua"},
{655,50,5,24,2114,3323,0,"Ô¹¶¾",0,"\\script\\task\\newtask\\master\\zhengpai\\Õ½¶·_Ô¹¶¾.lua"},
{681,50,5,66,1596,3300,0,"º®½­¶ÀµöÛÅ",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_hanjiangdudiaosou.lua"},
{667,60,5,79,1683,3144,0,"ÉñÃØÈË",0,"\\script\\task\\newtask\\master\\zhengpai\\Õ½¶·_ÄÏ¹¬·ÉÔÆ.lua"},
{666,60,5,103,1750,2668,0,"¿Õ¼Å´óÊ¦",0,"\\script\\task\\newtask\\master\\zhongli\\enemy_shaolinkongji.lua"},
{651,80,4,176,1630,2992,0,"ÃÏ·²",0,"\\script\\½­ÄÏÇø\\ÁÙ°²\\ÁÙ°²\\npc\\Â·ÈË_ÃÏ·².lua"},
{650,80,4,80,1703,3119,0,"ÏÄÎŞÇÒ",0,"\\script\\ÖĞÔ­ÄÏÇø\\ÑïÖİ\\npc\\Â·ÈË_ÏÄÎŞÇÒ.lua"},
{665,80,4,103,1774,2842,0,"¿Õ¼Å´óÊ¦",0,"\\script\\ÖĞÔ­±±Çø\\ÉÙÁÖÅÉ\\ÉÙÁÖÅÉ\\npc\\passerby_shaolinkongji.lua"},
{677,80,4,59,1640,3186,0,"º®½­¶ÀµöÛÅ",0,"\\script\\Á½ºşÇø\\ÌìÍõ°ï\\ÌìÍõ°ï\\npc\\passerby_hanjiangdudiaosou.lua"},
{723,25,5,332,1262,2821,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1220,2833,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1244,2881,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1252,2934,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1250,3002,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1307,3007,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1368,3060,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1428,3046,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1476,3049,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{723,25,5,332,1470,3097,0,"²Ø±¦¿Í",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_cangbaoke.lua"},
{738,35,5,90,1792,3137,0,"¶ñÀÇ",0,"\\script\\task\\newtask\\branch\\zhengpai\\enemy_elang.lua"},

-- Ğ°½ÌÖ÷ÏßÈÎÎñËù¶ÔÓ¦ NPC 

{720,45,2,195,593,3070,0,"Â½·Ç",0,"\\script\\task\\newtask\\master\\xiepai\\Õ½¶·_Â½·Ç.lua"},

{718,90,2,121,2016,4490,0,"¶ËÄ¾Çå",0,"\\script\\task\\newtask\\master\\xiepai\\Â·ÈË_¶ËÄ¾Çå.lua"},

{714,90,2,176,1628,3209,0,"²Ì¹«¹«",0,"\\script\\task\\newtask\\master\\xiepai\\Â·ÈË_²Ì¹«¹«.lua"},

{722,30,2,90,1814,3283,0,"Ğ¡ì÷¶ù",0,"\\script\\task\\newtask\\master\\xiepai\\Õ½¶·_Ğ¡ì÷¶ù.lua"},

{719,90,2,80,1592,3118,0,"ïÚÊ¦",0,"\\script\\task\\newtask\\master\\xiepai\\ÑïÖİ_ïÚÊ¦.lua"},

{716,45,2,21,2710,3947,0,"ÏÄºî¸´",0,"\\script\\task\\newtask\\master\\xiepai\\Õ½¶·_ÏÄºî¸´.lua"},

{715,90,2,174,1593,3256,0,"¸µÀ×Êé",0,"\\script\\task\\newtask\\master\\xiepai\\Â·ÈË_¸µÀ×Êé.lua"},

{717,55,2,92,1944,3214,0,"Ğ¤ÎŞ³£",0,"\\script\\task\\newtask\\master\\xiepai\\Õ½¶·_Ğ¤ÎŞ³£.lua"},

{721,65,2,40,1688,3032,0,"Í½µ¥´óÈË",0,"\\script\\task\\newtask\\master\\xiepai\\Õ½¶·_Í½µ¥´óÈË.lua"},

{694,80,2,94,1551,3149,0,"ÁÎ¶¨",0,"\\script\\task\\newtask\\master\\xiepai\\Õ½¶·_ÁÎ¶¨.lua"},

----Ñ×µÛ±¦²Ønpc
--{1321,80,4,176,1420,3309,0,"¶¡¶¡¹ÃÄï",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1321,80,4,176,1664,3244,0,"¶¡¶¡¹ÃÄï",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1321,80,4,176,1559,2917,0,"¶¡¶¡¹ÃÄï",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1321,80,4,176,1373,2970,0,"¶¡¶¡¹ÃÄï",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1320,80,4,37,1714,3173,0,"Ñ×µÛ±¦²Ø",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1320,80,4,37,1642,3145,0,"Ñ×µÛ±¦²Ø",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
--{1320,80,4,37,1622,3019,0,"Ñ×µÛ±¦²Ø",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},
{1320,80,4,37,1857,2968,0,"Ñ×µÛ±¦²Ø",0,"\\script\\missions\\yandibaozang\\npc\\yandibaozang_main.lua"},

{389,80,4,851,1577,3184,0,"Ò©ÉÌ",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},
{389,80,4,851,1607,3178,0,"Ò©ÉÌ",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},
--{389,80,4,852,1577,3184,0,"Ò©ÉÌ",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},
--{389,80,4,852,1607,3178,0,"Ò©ÉÌ",0,"\\script\\missions\\yandibaozang\\npc\\yaoshang.lua"},

}


addmasknpc = {
	{375,1,1554,3137,"\\script\\global\\Â·ÈË_Ò×ÈİÊõÊ¿.lua","Ò×ÈİÊõÊ¿"},
	{375,11,3164,4957,"\\script\\global\\Â·ÈË_Ò×ÈİÊõÊ¿.lua","Ò×ÈİÊõÊ¿"},
	{375,162,1632,3274,"\\script\\global\\Â·ÈË_Ò×ÈİÊõÊ¿.lua","Ò×ÈİÊõÊ¿"},
	{375,37,1771,2978,"\\script\\global\\Â·ÈË_Ò×ÈİÊõÊ¿.lua","Ò×ÈİÊõÊ¿"},
	{375,78,1498,3276,"\\script\\global\\Â·ÈË_Ò×ÈİÊõÊ¿.lua","Ò×ÈİÊõÊ¿"},
	{375,80,1628,3071,"\\script\\global\\Â·ÈË_Ò×ÈİÊõÊ¿.lua","Ò×ÈİÊõÊ¿"},
	
	{258,1,1514,3147,"\\script\\global\\Áã··¹¦ÄÜ.lua","Áã··"},
	{258,162,1596,3271,"\\script\\global\\Áã··¹¦ÄÜ.lua","Áã··"},
	{258,37,1750,2999,"\\script\\global\\Áã··¹¦ÄÜ.lua","Áã··"},
}


Include([[\script\event\springfestival07\head.lua]]);

tab_springfestivalNPC = 
{

--2007ĞÂÄê»î¶¯Ê¥µ®ÀÏÈËÌæ»»±±¶·ÀÏÈË
	{108,520,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"±±¶·ÀÏÈË"},
	{108,521,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"±±¶·ÀÏÈË"},
	{108,522,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"±±¶·ÀÏÈË"},
	{108,523,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"±±¶·ÀÏÈË"},
	{108,524,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"±±¶·ÀÏÈË"},
	{108,525,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"±±¶·ÀÏÈË"},
	{108,526,1576,3111,[[\script\event\springfestival08\allbrother\beidoulaoren.lua]],"±±¶·ÀÏÈË"},

	{644,520,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"Ê¥µ®ÀÏÈË"},
	{644,521,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"Ê¥µ®ÀÏÈË"},
	{644,522,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"Ê¥µ®ÀÏÈË"},
	{644,523,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"Ê¥µ®ÀÏÈË"},
	{644,524,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"Ê¥µ®ÀÏÈË"},
	{644,525,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"Ê¥µ®ÀÏÈË"},
	{644,526,1583,3116,[[\script\event\shengdan_jieri\200811\npc_shengdanlaoren.lua]],"Ê¥µ®ÀÏÈË"},
	
};

tab_zingplay_npc = {
-- ZingPlayÊ¹ÕßÒÑ¾­¹ıÆÚ 2008-09-27
-- »»³É ½ÌÊ¦½Ú»î¶¯µÄ¶÷Ê¦ 2008-10-03
-- »»³É JxWeb¹µÍ¨Ê¹Õß 2009-04-13
	{354,11,3150,5075,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","¹µÍ¨Ê¹Õß"},
	{354,1,1611,3096,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","¹µÍ¨Ê¹Õß"},
	{354,37,1725,3090,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","¹µÍ¨Ê¹Õß"},
	{354,176,1557,2981,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","¹µÍ¨Ê¹Õß"},
	{354,162,1654,3233,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","¹µÍ¨Ê¹Õß"},
	{354,78,1599,3292,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","¹µÍ¨Ê¹Õß"},
	{354,80,1737,2958,	"\\script\\event\\other\\jxweb_npc\\npc_jxweb.lua","¹µÍ¨Ê¹Õß"},
}

--220/192
local tbActNpcList =
{
	{311,176,1593,2943,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","ÊÔÁ¶ÌÃ½ÓÒıÈË"},
	{311,11,3108,5060,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","ÊÔÁ¶ÌÃ½ÓÒıÈË"},
	{311,1,1585,3230,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","ÊÔÁ¶ÌÃ½ÓÒıÈË"},
	{311,37,1740,3065,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","ÊÔÁ¶ÌÃ½ÓÒıÈË"},
	{311,162,1613,3190,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","ÊÔÁ¶ÌÃ½ÓÒıÈË"},
	{311,78,1608,3238,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","ÊÔÁ¶ÌÃ½ÓÒıÈË"},
	{311,80,1704,3058,"\\script\\missions\\dungeon\\dungeons\\shiliantang\\jieyinren.lua","ÊÔÁ¶ÌÃ½ÓÒıÈË"},
	
	{1327, 20,3554,6188, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","´óÊ¯Í·"},
	{1327, 174,1628,3218, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","´óÊ¯Í·"},
	{1327, 121,1963,4511, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","´óÊ¯Í·"},
	{1327, 153,1612,3226, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","´óÊ¯Í·"},
	{1327, 99,1615,3166, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","´óÊ¯Í·"},
	{1327, 100,1626,3181, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","´óÊ¯Í·"},
	{1327, 53,1632,3199, "\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\shitouernpc.lua","´óÊ¯Í·"},
	
	
	{1393,176,1657,3261,"\\script\\missions\\dangboss\\gongnv_npc.lua","ÕÆµÆ¹¬Å®"},
	{1393,176,1577,2957,"\\script\\missions\\dangboss\\gongnv_npc.lua","ÕÆµÆ¹¬Å®"},
	{1393,176,1439,3267,"\\script\\missions\\dangboss\\gongnv_npc.lua","ÕÆµÆ¹¬Å®"},
	{1393,176,1385,2977,"\\script\\missions\\dangboss\\gongnv_npc.lua","ÕÆµÆ¹¬Å®"},


--	{1454, 80,1768,3029, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","´ó¼ª±ı"},
--	{1454, 11,3136,5065, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","´ó¼ª±ı"},
--	{1454, 162,1622,3184, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","´ó¼ª±ı"},
--	{1454, 1,1596,3200, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","´ó¼ª±ı"},
--	{1454, 78,1579,3230, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","´ó¼ª±ı"},
--	{1454, 37,1776,3049, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","´ó¼ª±ı"},
--	{1454, 176,1577,2950, "\\script\\event\\zhongqiu_jieri\\200909\\dajibing\\head.lua","´ó¼ª±ı"},
	
	{218, 80,1737,2988, "\\script\\activitysys\\npcdailog.lua","¹À¼ÛÏÈÉú"},
	{218, 11,3133,4987, "\\script\\activitysys\\npcdailog.lua","¹À¼ÛÏÈÉú"},
	{218, 1,1620,3145, "\\script\\activitysys\\npcdailog.lua","¹À¼ÛÏÈÉú"},
	{218, 37,1812,3090, "\\script\\activitysys\\npcdailog.lua","¹À¼ÛÏÈÉú"},
	{218, 176,1496,2971, "\\script\\activitysys\\npcdailog.lua","¹À¼ÛÏÈÉú"},
	{218, 162,1594,3210, "\\script\\activitysys\\npcdailog.lua","¹À¼ÛÏÈÉú"},
	{218, 78,1546,3240, "\\script\\activitysys\\npcdailog.lua","¹À¼ÛÏÈÉú"},
	
	--S? dông l¹i npc B? Long c? - Modified by DinhHQ - 20110810
--	{1448,11,3123,4996,	"\\script\\activitysys\\npcdailog.lua","Áú¶ù"},
--	{1448,1,1618,3144,	"\\script\\activitysys\\npcdailog.lua","Áú¶ù"},
--	{1448,37,1809,3090,	"\\script\\activitysys\\npcdailog.lua","Áú¶ù"},
--	{1448,176,1501,2974,	"\\script\\activitysys\\npcdailog.lua","Áú¶ù"},
--	{1448,162,1589,3215,	"\\script\\activitysys\\npcdailog.lua","Áú¶ù"},
--	{1448,78,1534,3241,	"\\script\\activitysys\\npcdailog.lua","Áú¶ù"},
--	{1448,80,1737,2985,	"\\script\\activitysys\\npcdailog.lua","Áú¶ù"},
	{1448,37,1769,3056, "\\script\\event\\jiefang_jieri\\201004\\longer.lua","Áú¶ù"},
	
	{1576, 176,1408,3309, "\\script\\activitysys\\npcdailog.lua","ÎäÁÖÃËÖ÷"},		-- ÎäÁÖÃËÖ÷µñÏñ
	{1577, 176,1412,3311, "\\script\\activitysys\\npcdailog.lua","ÎäÁÖÃËÖ÷"},		-- ÎäÁÖÃËÖ÷µñÏñ
	
	{1801, 176,1420,3298, "\\script\\activitysys\\npcdailog.lua","ÎäÁÖÃËÖ÷"},		-- ÎäÁÖÃËÖ÷ĞÂµñÏñ
	{1802, 176,1424,3300, "\\script\\activitysys\\npcdailog.lua","ÎäÁÖÃËÖ÷"},		-- ÎäÁÖÃËÖ÷ĞÂµñÏñ
--	{455, 37,1762,3049, "\\script\\event\\other\\caipiao\\npcdialog.lua","²ÆÉñ"},

	{108, 176,1451,3233, "\\script\\missions\\arena\\npc\\officer.lua","¾º¼¼³¡¹ÙÔ±"},
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
	
--ÔÂ¸èµº
	DynamicExecute("\\script\\missions\\yuegedao\\yuegedao\\yuegedaoworld.lua", "YueGeDaoWorld:Start")
	DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua", "YueGeMiGuWorld:Start")

	DynamicExecute("\\script\\changefeature\\initmap.lua", "AddDailogNpc")
	DynamicExecute("\\script\\global\\npc\\huoke.lua", "CallHuoKeInit")
	DynamicExecute("\\script\\missions\\tianchimijing\\floor1\\yunchihead.lua", "AddEnterNpc")
	tbShenSuanZi:Init()
	
	OpenGlbMission(8)
	
	-- Æô¶¯Êı¾İÍ³¼ÆÈÎÎñ
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
	
	-- ¹Ò»úµØÍ¼ÈÎÎñ
	load_mission_aexp();
	add_dialognpc(adddialognpc);
	add_dialognpc(nw_npclist)
	add_dialognpc(npclist_sevencity)
	add_newtasknpc(addnewtasknpc);
	add_xishancunnpc(xishancunnpc);
	
	add_spreadernpc(spreadernpc);		--¼ÓÔØÓÎÏ·ÍÆ¹ãÔ±
	add_killertasknpc(addkillertasknpc);
	add_alltollgatenpc();   --¼ÓÔØ¹Ø¿¨ÈÎÎñµÄÏà¹Ønpc
	--add_allpartnernpc();     --¼ÓÔØÍ¬°éÈÎÎñµÄÏà¹Ønpc
	--add_zhongqiunpc();		--¼ÓÔØÖĞÇï»î¶¯npc
	cd_addsignnpc()			--¼ÓÔØÎÀ¹úÕ½Õù±¨ÃûµãNPC
	wlls_autoexe()	--WLLS ÎäÁÖÁªÈü
	--Á½ÖÜÄê»î¶¯NPC    
	add_dialognpc(%tbActNpcList)
	tongwar_addsignnpc()
	add_tongnpc()	--¼ÓÔØ°ï»áÏà¹Ønpc
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	local szRegion = GetProductRegion();
	if (szRegion == "cn" or szRegion == "cn_ib") then
		add_dialognpc(addmasknpc)	--7´ó³ÇÊĞ¼ÓÔØÒ×ÈİÊõÊ¿
		add_wulinnpc_2nd()	--µÚ¶ş½ìÎäÁÖ´ó»á¹ÙÔ±
		
		add_lv120skillnpc()		-- 120¼¶¼¼ÄÜÈÎÎñ
		-- 2006 Ê¥µ®»î¶¯
		add_dialognpc(ch06_addchristmasnpc);
		add_lottery_npc();	--ÎäÁÖÄ¼¾è»î¶¯Ôö¼Ó 4¸öÏåÑôÀñ¹Ù£»3ÔÂ³õÉ¾³ı
	--	addGraveStone(); -- 2006 ÇåÃ÷½Ú»î¶¯
		qm07_addGraveStone()
	end

	if (szRegion == "cn_ib") then
		addEmissaryNpc()        -- ÕĞÄ¼Ê¹ÁúÂöÈÎÎñ
	end

	if (szRegion == "vn") then
		add_dialognpc(ACT2YEAR_YN_NPC);	--Á½ÖÜÄê»î¶¯NPC   by×Ó·ÇÓã 2008-10-09É¾³ı¹ıÆÚNPC
		AnonymVale_auto();			--ÍĞ¹ÜµØÍ¼
		add_dialognpc(tab_springfestivalNPC);
		add_dialognpc(addmoontown_mulao);	--ÊÕ¼¯ÉñÃØ¾íÖáÈÎÎñ£¬Ã÷ÔÂÕònpc by×Ó·ÇÓã 2008-10-09É¾³ı¹ıÆÚNPC
		--add_dialognpc(tbxmas2007_girl_binger) --2007Ê¥µ®»î¶¯£¬±ù¶ù
		--add_dialognpc(newyear_2008_chunjiecailu) --2008ĞÂÄê²ÉÂ»»î¶¯
		--Î÷É½Óì
		add_dialognpc(tbaddJinShanDao_NpcAndTrap.tbDialogNpc);--Ôö¼Ó¶Ô»°npc
		tbaddJinShanDao_NpcAndTrap:AddTrapR()--Ôö¼ÓÓÒtrapµã
		tbaddJinShanDao_NpcAndTrap:AddTrapL()--Ôö¼Ó×ótrapµã
		tbaddJinShanDao_NpcAndTrap:AddMons()--Ôö¼Ó¹ÖÎï
		--add_obstacle_map();
		if (n_date <= 20200101) then			-- JxWeb»î¶¯½áÊøÊ±¼ä
			add_dialognpc(tab_zingplay_npc);
		end
		if(SubWorldID2Idx(11) >= 0) then
			local npcidx = AddNpc(245, 1, SubWorldID2Idx(11), 390 * 8 * 32, 317 * 16 * 32, 1, "Hoµng Liªn Bµ Ngo¹i");
			SetNpcScript(npcidx, "\\script\\event\\jiefang_jieri\\200904\\denggao\\npc.lua");
		end
		add_dialognpc(au06_tab_kidnpc);
		
		tbChangeDestiny:addNpc();	-- ÄæÌì¸ÄÃü
		tbNewPracticeMap:addNpc();	-- ĞÂÁ·¼¶µØÍ¼
		tbBeatTiger:AddNpc();		-- Ñ°»¨´ò»¢
	end
	--Ôö¼Ó´óÀíºÚ¶´trapµã
	add_trap_daliheidong()
	--Ôö¼Óãê¾©Î÷³ÇÃÅtrapµã
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
			OpenMission(9);	-- 9Îª¹Ò»úMission ID
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

