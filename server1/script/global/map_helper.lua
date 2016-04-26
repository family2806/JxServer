-- map_helper.lua
-- By: Dan_Deng(2004-06-28)
-- 主维护表，各五行、等级练级迷宫
Include("\\script\\activitysys\\npcdailog.lua")

lv_str={	"<#>不到十级","<#>十多级","<#>二十多级","<#>三十多级","<#>四十多级","<#>五十多级","<#>六十多级","<#>七十多级","<#>八十多级","<#>九十级以上"}
map0 = {	"<#>各个新手村",
			"<#>本门附近、各大城市近郊",
			"<#>剑阁中原、剑阁西南、剑阁西北、罗宵山、武陵山、秦陵",
			"<#>蜀冈山、苗岭、燕子洞，以及药王洞一层、快活林",
			"<#>经皇洞、伏牛山西、点苍洞三层、少林密室",
			"<#>响水洞、天心洞，以及洞庭湖底山洞、冰穴迷宫",
			"<#>青螺岛、一百零八罗汉阵，以及衡山派、襄阳衙门密道",
			"<#>大酋洞、青螺岛山洞，以及灵谷洞、老虎洞、临渝关",
			"<#>沙漠地表、飞天洞、芙蓉洞、两水洞、冰河洞、清溪洞、长白山脚",
			"<#>沙漠山洞一、二、三层，以及荐菊洞、蚩尤洞、长白山南麓、长白山北麓"}
map1 = {	"<#>各个新手村",
			"<#>本门附近、各大城市近郊",
			"<#>剑阁中原、剑阁西南、剑阁西北、罗宵山、武陵山、秦陵",
			"<#>武夷山、秦陵一层，以及白云洞、土匪洞",
			"<#>青城山、点苍山，以及凤眼洞、点苍洞一层、神仙洞",
			"<#>响水洞、孽龙洞、玉华洞，以及千寻塔一、二层",
			"<#>羊角洞、竹丝洞一层，以及衡山派、千寻塔三层",
			"<#>龙眼洞、秦陵二层，以及竹丝洞二层、长江源头、临渝关",
			"<#>沙漠地表、武陵洞、阳中洞、古阳洞、雁石洞、药王洞三层、秦陵三层、长白山脚",
			"<#>沙漠山洞一、二、三层，以及药王洞四层、荐菊洞、长白山南麓、长白山北麓"}
map2 = {	"<#>各个新手村",
			"<#>本门附近、各大城市近郊",
			"<#>剑阁中原、剑阁西南、剑阁西北、罗宵山、武陵山、秦陵",
			"<#>白云洞、蜀冈山、土匪洞，以及伏牛山东、金光洞",
			"<#>凤眼洞、点苍洞一层、神仙洞，以及伏牛山西、经皇洞",
			"<#>响水洞、千寻塔一、二层，以及信相寺地道、恶霸地道",
			"<#>千寻塔三层、一百零八罗汉阵，以及禁地迷宫、衡山派",
			"<#>长江源头、山宝洞，以及桃花源、药王洞二层、临渝关",
			"<#>沙漠地表、飞天洞、芙蓉洞、阳中洞、古阳洞、药王洞三层、长白山脚",
			"<#>沙漠山洞一、二、三层，以及蚩尤洞、荐菊洞、长白山南麓、长白山北麓"}
map3 = {	"<#>各个新手村",
			"<#>本门附近、各大城市近郊",
			"<#>剑阁中原、剑阁西南、剑阁西北、罗宵山、武陵山、秦陵",
			"<#>伏牛山东、金光洞，以及秦陵一层、武夷山",
			"<#>锁云洞、龙宫洞，以及点苍洞二层、青城山、点苍山",
			"<#>响水洞、汴京铁塔一、二、三层，以及祥云洞一层、御花园山洞",
			"<#>祥云洞二、三、四层，以及天忍圣洞、羊角洞、竹丝洞一层",
			"<#>药王洞二层、老虎洞、祥云洞五层、灵谷洞、临渝关",
			"<#>沙漠地表、武陵洞、无名洞、雁石洞、秦陵三层、长白山脚",
			"<#>沙漠山洞一、二、三层，以及药王洞四层、轩辕洞、长白山南麓、长白山北麓"}
map4 = {	"<#>各个新手村",
			"<#>本门附近、各大城市近郊",
			"<#>剑阁中原、剑阁西南、剑阁西北、罗宵山、武陵山、秦陵",
			"<#>苗岭、药王洞一层、快活林，以及伏牛山东、金光洞、雪豹洞一、二层",
			"<#>见性峰山洞、鸡冠洞、黄河源头，以及锁云洞、点苍洞二层",
			"<#>响水洞、冰穴迷宫、留仙洞一层，以及铁塔一、二、三层",
			"<#>衡山派、襄阳衙门秘道，以及留仙洞二、三、四层",
			"<#>桃花源、留仙洞五、六层，以及秦陵二层、龙眼洞、临渝关",
			"<#>沙漠地表、两水洞、无名洞、冰河洞、清溪洞、长白山脚",
			"<#>沙漠山洞一、二、三层，以及药王洞四层、轩辕洞、长白山南麓、长白山北麓"}

function map_help()
	ser = GetSeries() + 1
	lvl = floor(GetLevel()/10 + 1)
	if (lvl > 10) then lvl = 10 end
	if (ser == 1) then
		Say(npc_name.."<#>：对于<color=red>金系"..lv_str[lvl].."<#><color>的你来说，现在最佳的练功场所有"..map0[lvl].."<#>等地点。",0)
	elseif (ser == 2) then
		Say(npc_name.."<#>：对于<color=red>木系"..lv_str[lvl].."<#><color>的你来说，现在最佳的练功场所有"..map1[lvl].."<#>等地点。",0)
	elseif (ser == 3) then
		Say(npc_name.."<#>：对于<color=red>水系"..lv_str[lvl].."<#><color>的你来说，现在最佳的练功场所有"..map2[lvl].."<#>等地点。",0)
	elseif (ser == 4) then
		Say(npc_name.."<#>：对于<color=red>火系"..lv_str[lvl].."<#><color>的你来说，现在最佳的练功场所有"..map3[lvl].."<#>等地点。",0)
	else
		Say(npc_name.."<#>：对于<color=red>土系"..lv_str[lvl].."<#><color>的你来说，现在最佳的练功场所有"..map4[lvl].."<#>等地点。",0)
	end
end

function skill_help()
	fact_num = GetLastFactionNumber() + 1
	if (fact_num == 1) then				-- 少林
		Talk(5,"","象你<color=red>少林派<color>的话，武艺大概可以有三种不同的路线：","第一条路线俗称为“拳少林”，以行龙不雨、少林拳法、罗汉阵、龙爪虎抓、如来千叶、达摩渡江这些技能为主。","第二条路线俗称为“棍少林”，以金刚伏魔、少林棍法、罗汉阵、横扫六合、如来千叶、横扫千军这些技能为主。","第三条路线俗称为“刀少林”，以金刚伏魔、少林刀法、罗汉阵、摩诃无量、如来千叶、无相斩这些技能为主。","除此之外，还有不动明王、狮子吼、易筋经这三种武艺，并不增加你的攻击伤害力，但却在其它方面对你也有不小的帮助。")
	elseif (fact_num == 2) then		-- 天王
		Talk(5,"","象你<color=red>天王帮<color>的话，武艺大概可以有三种不同的路线：","第一条路线俗称为“刀天王”，以惊雷斩、天王刀法、泼风斩、无心斩、天王战意、破天斩这些技能为主。","第二条路线俗称为“枪天王”，以回风落雁、天王枪法、阳关三叠、血战八方、天王战意、追星逐月这些技能为主。","第三条路线俗称为“锤天王”，以斩龙诀、天王锤法、行云诀、乘龙诀、天王战意、追风诀这些技能为主。","除此之外，还有静心诀、断魂刺、金钟罩这三种武艺，并不增加你的攻击伤害力，但却在其它方面对你也有不小的帮助。")
	elseif (fact_num == 3) then		-- 唐门
		Talk(5,"","象你<color=red>唐门<color>的话，武艺大概可以有四种不同的路线：","第一条路线俗称为“飞刀唐”，以霹雳弹、唐门暗器、追心箭、小李飞刀、心眼、慑魂月影这些技能为主。","第二条路线俗称为“袖箭唐”，以霹雳弹、唐门暗器、漫天花雨、天罗地网、心眼、暴雨梨花这些技能为主。","第三条路线俗称为“飞镖唐”，以霹雳弹、唐门暗器、夺魂镖、散花镖、心眼、九宫飞星这些技能为主。","第四条路线俗称为“陷阱唐”，以地焰火、毒刺骨、穿心刺、寒冰刺、雷击术、乱环击这些技能为主。")
	elseif (fact_num == 4) then		-- 五毒
		Talk(5,"","象你<color=red>五毒教<color>的话，武艺大概可以有三种不同的路线：","第一条路线俗称为“掌毒”，以毒砂掌、五毒掌法、幽冥骷髅、天罡地煞手、五毒奇经、阴风蚀骨这些技能为主。","第二条路线俗称为“刀毒”，以血刀毒杀、五毒刀法、百毒穿心、朱蛤青冥、五毒奇经、玄阴斩这些技能为主。","第三条路线俗称为“诅咒毒”，以九天狂雷、赤焰蚀天、冰蓝玄晶、穿衣破甲、穿心毒刺、断筋腐骨这些技能为主。","除此之外，还有杂难药经、无形蛊、万蛊蚀心这三种武艺，并不增加你的攻击伤害力，但却在其它方面对你也有不小的帮助。")
	elseif (fact_num == 5) then		-- 峨嵋
		Talk(4,"","象你<color=red>峨嵋派<color>的话，大概可以有三种不同的发展路线：","第一条路线俗称为“剑宗峨嵋”，以一叶知秋、峨嵋剑法、推窗望月、不灭不绝、佛法无边、三峨霁雪这些技能为主。","第二条路线俗称为“气宗峨嵋”，以飘雪穿云、峨嵋掌法、四象同归、佛光普照、佛法无边、风霜碎影这些技能为主。","第三条路线俗称为“全辅峨嵋”，以慈航普渡、梦蝶、流水、佛心慈佑、清音梵唱、普渡众生这些技能为主。")
	elseif (fact_num == 6) then		-- 翠烟
		Talk(4,"","象你<color=red>翠烟门<color>的话，武艺大概可以有两种不同的路线：","第一条路线俗称为“单刀翠烟”，以风花雪月、翠烟刀法、雨打梨花、牧野流星、冰骨雪心、冰踪无影这些技能为主。","第二条路线俗称为“双刀翠烟”，以风卷残雪、翠烟双刀、浮云散雪、碧海潮生、冰骨雪心、冰心仙子这些技能为主。","除此之外，还有冰心倩影、护体寒冰、雪影这几种武艺，并不增加你的攻击伤害力，但却在其它方面对你也有不小的帮助。")
	elseif (fact_num == 7) then		-- 丐帮
		Talk(4,"","象你<color=red>丐帮<color>的话，武艺大概可以有两种不同的路线：","第一条路线俗称为“掌丐”，以见人伸手、丐帮掌法、降龙掌、亢龙有悔、醉蝶狂舞、飞龙在天这些技能为主。","第二条路线俗称为“棍丐”，以沿门托钵、丐帮棒法、打狗阵、棒打恶狗、醉蝶狂舞、天下无狗这些技能为主。","除此之外，还有化险为夷、滑不留手、逍遥功这几种武艺，并不增加你的攻击伤害力，但却在其它方面对你也有不小的帮助。")
	elseif (fact_num == 8) then		-- 天忍
		Talk(4,"","象你<color=red>天忍教<color>的话，武艺大概可以有三种不同的路线：","第一条路线俗称为“战忍”，以残阳如血、天忍矛法、烈火情天、偷天换日、天魔解体、云龙击这些技能为主。","第二条路线俗称为“魔忍”，以弹指烈焰、天忍刀法、推山填海、魔焰七杀、天魔解体、天外流星这些技能为主。","第三条路线俗称为“诅咒忍”，以火莲焚华、幻影飞狐、飞鸿无迹、悲酥清风、厉魔夺魂、慑魂乱心这些技能为主。")
	elseif (fact_num == 9) then		-- 武当
		Talk(4,"","象你<color=red>武当派<color>的话，武艺大概可以有两种不同的路线：","第一条路线俗称为“气宗武当”，以怒雷指、武当拳法、剥及而复、无我无剑、太极神功、天地无极这些技能为主。","第二条路线俗称为“剑宗武当”，以沧海明月、武当剑法、剑飞惊天、三环套月、太极神功、人剑合一这些技能为主。","除此之外，还有七星阵、梯云纵、坐望无我这几种武艺，并不增加你的攻击伤害力，但却在其它方面对你也有不小的帮助。")
	elseif (fact_num == 10) then		-- 昆仑
		Talk(5,"","象你<color=red>昆仑派<color>的话，武艺大概可以有三种不同的路线：","第一条路线俗称为“刀昆仑”，以呼风法、昆仑刀法、一气三清、狂风骤电、霜傲昆仑、傲雪啸风这些技能为主。","第二条路线俗称为“剑昆仑”，以狂雷震地、昆仑剑法、天际迅雷、五雷正法、霜傲昆仑、雷动九天这些技能为主。","第三条路线俗称为“诅咒昆仑”，以束缚咒、羁绊符、北冥到海、欺寒傲雪、迷踪幻影、醉仙错骨这些技能为主。","除此之外，还有清风符、天清地浊、弃心符这几种武艺，并不增加你的攻击伤害力，但却在其它方面对你也有不小的帮助。")
	else									-- 白名
		Say(npc_name.."<#>：你连门派都没有，还提什么练法不练法的。",0)
	end
end

GV_TSK_CD_OPEN = 35
tbDEFENCE_SIGNMAP = { 518, 519 }
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
CD_LEVEL_LIMIT = 80		--最低参加守城等级

function main(sel)
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
    Msg2Player(szNpcName)
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--弹出对话框
	
	tbDailog.szTitleMsg = npc_name.."<#>：别看我不是江湖中人，你们这些人每天来来往往我看得多了。不是我吹牛，你们的情况我清楚得很。"
	
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
						
	tbDailog:AddOptEntry("宋金战场", CallRescrptFunc )
	tbDailog:AddOptEntry("查询练级地图", map_help )
	tbDailog:AddOptEntry("了解本门武艺", skill_help )
	tbDailog:AddOptEntry("闲聊", default_talk )
	tbDailog:AddOptEntry("离开")
	
	if ( GetGlbValue( GV_TSK_CD_OPEN ) == camp ) then
		tbDailog:AddOptEntry("参加守城战役", want2cd_signmap)
	end
	
	
	tbDailog:Show()
end

function want2cd_signmap()
	if ( GetLevel() < CD_LEVEL_LIMIT ) then
		Say(npc_name.."：啊？就你也想参加守城战役？等级还不到"..CD_LEVEL_LIMIT.."级，以你这身手去了也帮不上忙，可能还会搭了性命，还是留在城里吧。", 0)
		return
	end
	Say(npc_name.."：你想去守城？真的想去守城？啊！你真伟大！不过听说现在情况十分紧急！城内的防御只能撑2个小时，如果在两个小时内不能击退敌军的话那么就只有沦陷了！但是让不让你参加只有将军说了算，我可以带你过去。", 2, "我知道了，快带我过去吧。/sure2cd_signmap", "让我再准备一下。/no")
end

function sure2cd_signmap()
	LeaveTeam();
	local mapid = SubWorldIdx2ID( SubWorld )
	local camp = tbDEFENCE_RETURN[mapid][4]
	if ( camp == nil ) then
		Say(npc_name.."：咦？前方路途好像不通？", 0)
		return
	end
	if (camp == 1) then
		Msg2Player("进入了宋方守城地图")
	else
		Msg2Player("进入了金方守城地图")
	end
	SetTask(TASKID_FIRE_ADDR, SubWorldIdx2ID(SubWorld))
	SetFightState(0)
	NewWorld(bt_getsignpos(camp))	--camp在守城卫兵处定义
end

function bt_getsignpos(camp)
	if ( camp ~= 1 and camp ~= 2 ) then
		camp = 1;
	end;
	local a = random(getn(tbSIGNMAP_POS))
	
	return tbDEFENCE_SIGNMAP[camp], tbSIGNMAP_POS[a][1], tbSIGNMAP_POS[a][2]
end

function cd_about_compose()
	Say(npc_name..":最近战事实在是多，我已经没空帮你用碎片修补装备了，不过你可以去临安去找神秘铁匠帮忙，我的手艺也就是在他那里偷学来的，去找他一定没问题。", 0)
end

function CallRescrptFunc()
	if ( GetLevel() < 40 ) then
		Talk( 1, "", npc_name..": 刀枪无眼，低于40级不能参加宋金战场！" );
	else
		Say ( npc_name..": 请选择合适的战场参与战斗", 3, "宋金战场（宋方）/#DoRescriptFunc(1)", "宋金战场(金方）/#DoRescriptFunc(2)","取消/no" );
	end;
end;

function DoRescriptFunc(nSel)
	local tbsongjin_pos = {1608,3254};	--宋方坐标点
	local szstr = "宋";
	if (nSel == 2) then
		tbsongjin_pos = {1566,3277};
		szstr = "金";
	end;
	if ( GetLevel() >= 40 and GetLevel() < 60 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "低级宋金战场" );
	elseif ( GetLevel() >= 60 and GetLevel() < 90 ) then
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "中级宋金战场" );
	else
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- 不限制其使用回城符
		Msg2Player( "高级宋金战场" );
	end
end;

function no()
end