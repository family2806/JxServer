IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
--Include("\\script\\global\\writeaddressdialog.lua")

local tbFaction =
{
	[1] =
	{
		szShowName = "少林派",
		szFaction = "shaolin",
		nShortFaction = "sl",
		tbSkill = {318, 319, 321, 709, 1055, 1056, 1057},
		tbEquip =
		{
			{
				szFaction = "拳少林",
				nFirstEquipId = 2285,
				tbEquipName =
				{
					"白虎之普济珠链", "白虎之普济僧帽", "白虎之普济上戒", "白虎之普济护腕", "白虎之普济腰带",
					"白虎之普济袈裟", "白虎之普济缠手", "白虎之普济僧鞋", "白虎之普济腰坠", "白虎之普济下戒",
				},
			},
			{
				szFaction = "棍少林",
				nFirstEquipId = 2295,
				tbEquipName =
				{
					"白虎之雷音佛珠", "白虎之雷音僧帽", "白虎之雷音上戒", "白虎之雷音护腕", "白虎之雷音腰带",
					"白虎之雷音袈裟", "白虎之雷音僧棍", "白虎之雷音僧鞋", "白虎之雷音腰坠", "白虎之雷音下戒",
				},
			},
			{
				szFaction = "刀少林",
				nFirstEquipId = 2305,
				tbEquipName =
				{
					"白虎之摩尼项链", "白虎之摩尼僧帽", "白虎之摩尼上戒", "白虎之摩尼护腕", "白虎之摩尼腰带",
					"白虎之摩尼袈裟", "白虎之摩尼戒刀", "白虎之摩尼僧鞋", "白虎之摩尼腰坠", "白虎之摩尼下戒",
				},
			},
		},
	},
	[2] =
	{
		szShowName = "天王帮",
		szFaction = "tianwang",
		nShortFaction = "tw",
		tbSkill = {322, 325, 323, 708, 1058, 1059, 1060},
		tbEquip =
		{
			{
				szFaction = "锤天王",
				nFirstEquipId = 2315,
				tbEquipName =
				{
					"白虎之定光链", "白虎之定光盔", "白虎之定光上戒", "白虎之定光束腕", "白虎之定光腰带",
					"白虎之定光铠", "白虎之定光锤", "白虎之定光靴", "白虎之定光佩", "白虎之定光下戒",
				},
			},
			{
				szFaction = "枪天王",
				nFirstEquipId = 2325,
				tbEquipName =
				{
					"白虎之御风项链", "白虎之御风盔", "白虎之御风上戒", "白虎之御风束腕", "白虎之御风腰带",
					"白虎之御风铠", "白虎之御风枪", "白虎之御风靴", "白虎之御风腰坠", "白虎之御风下戒",
				},
			},
			{
				szFaction = "刀天王",
				nFirstEquipId = 2335,
				tbEquipName =
				{
					"白虎之飚风项链", "白虎之飚风盔", "白虎之飚风上戒", "白虎之飚风束腕", "白虎之飚风腰带",
					"白虎之飚风铠", "白虎之飚风宝刀", "白虎之飚风靴", "白虎之飚风腰坠", "白虎之飚风下戒",
				},
			},
		},
	},
	[3] =
	{
		szShowName = "唐门",
		szFaction = "tangmen",
		nShortFaction = "tm",
		tbSkill = {339, 302, 342, 710, 1069, 1070, 1071},
		tbEquip =
		{
			{
				szFaction = "飞刀唐门",
				nFirstEquipId = 2405,
				tbEquipName =
				{
					"白虎之匿影项链", "白虎之匿影冠", "白虎之匿影上戒", "白虎之匿影护腕", "白虎之匿影缠腰",
					"白虎之匿影甲", "白虎之匿影飞刀", "白虎之匿影履", "白虎之匿影腰坠", "白虎之匿影下戒",
				},
			},
			{
				szFaction = "弩唐门",
				nFirstEquipId = 2415,
				tbEquipName =
				{
					"白虎之极光项链", "白虎之极光冠", "白虎之极光上戒", "白虎之极光护腕", "白虎之极光束腰",
					"白虎之极光甲", "白虎之极光箭", "白虎之极光履", "白虎之极光坠", "白虎之极光下戒",
				},
			},
			{
				szFaction = "镖唐门",
				nFirstEquipId = 2425,
				tbEquipName =
				{
					"白虎之铄金项链", "白虎之铄金发冠", "白虎之铄金上戒", "白虎之铄金护腕", "白虎之铄金束腰",
					"白虎之铄金甲衣", "白虎之铄金飞镖", "白虎之铄金履", "白虎之铄金腰坠", "白虎之铄金下戒",
				},
			},
		},
	},
	[4] =
	{
		szShowName = "五毒教",
		szFaction = "wudu",
		nShortFaction = "wu",
		tbSkill = {353, 355, 711, 1066, 1067},
		tbEquip =
		{
			{
				szFaction = "掌五毒",
				nFirstEquipId = 2385,
				tbEquipName =
				{
					"白虎之毒砂项链", "白虎之毒砂发带", "白虎之毒砂上戒", "白虎之毒砂护腕", "白虎之毒砂腰带",
					"白虎之毒砂秘装", "白虎之毒砂缠手", "白虎之毒砂靴", "白虎之毒砂腰坠", "白虎之毒砂下戒",
				},
			},
			{
				szFaction = "刀五毒",
				nFirstEquipId = 2395,
				tbEquipName =
				{
					"白虎之幽灵项链", "白虎之幽灵发带", "白虎之幽灵上戒", "白虎之幽灵护腕", "白虎之幽灵腰带",
					"白虎之幽灵秘装", "白虎之幽灵宝刀", "白虎之幽灵靴", "白虎之幽灵腰坠", "白虎之幽灵下戒",
				},
			},
		},
	},
	[5] =
	{
		szShowName = "峨嵋派",
		szFaction = "emei",
		nShortFaction = "em",
		tbSkill = {380, 328, 712, 1061, 1062, 1114},
		tbEquip =
		{
			{
				szFaction = "剑峨眉",
				nFirstEquipId = 2345,
				tbEquipName =
				{
					"白虎之流云珠链", "白虎之流云发带", "白虎之流云上戒", "白虎之流云护腕", "白虎之流云束腰",
					"白虎之流云纱衣", "白虎之流云长剑", "白虎之流云靴", "白虎之流云香囊", "白虎之流云下戒",
				},
			},
			{
				szFaction = "掌峨眉",
				nFirstEquipId = 2355,
				tbEquipName =
				{
					"白虎之寒玉珠链", "白虎之寒玉发带", "白虎之寒玉上戒", "白虎之寒玉护腕", "白虎之寒玉束腰",
					"白虎之寒玉衫", "白虎之寒玉缠手", "白虎之寒玉靴", "白虎之寒玉香囊", "白虎之寒玉下戒",
				},
			},
		},
	},
	[6] =
	{
		szShowName = "翠烟门",
		szFaction = "cuiyan",
		nShortFaction = "cy",
		tbSkill = {336, 337, 713, 1063, 1065},
		tbEquip =
		{
			{
				szFaction = "刀翠烟",
				nFirstEquipId = 2365,
				tbEquipName =
				{
					"白虎之红颜珠链", "白虎之红颜簪", "白虎之红颜上戒", "白虎之红颜袖", "白虎之红颜束腰",
					"白虎之红颜衫", "白虎之红颜宝刀", "白虎之红颜靴", "白虎之红颜香囊", "白虎之红颜下戒",
				},
			},
			{
				szFaction = "内翠烟",
				nFirstEquipId = 2375,
				tbEquipName =
				{
					"白虎之幻彩珠链", "白虎之幻彩簪", "白虎之幻彩上戒", "白虎之幻彩袖", "白虎之幻彩腰带",
					"白虎之幻彩衫", "白虎之幻彩鸳鸯刀", "白虎之幻彩靴", "白虎之幻彩香囊", "白虎之幻彩下戒",
				},
			},
		},
	},
	[7] =
	{
		szShowName = "丐帮",
		szFaction = "gaibang",
		nShortFaction = "gb",
		tbSkill = {357, 359, 714, 1073, 1074},
		tbEquip =
		{
			{
				szFaction = "掌丐帮",
				nFirstEquipId = 2435,
				tbEquipName =
				{
					"白虎之护法项链", "白虎之护法头环", "白虎之护法上戒", "白虎之护法护腕", "白虎之护法束腰",
					"白虎之护法丐衣", "白虎之护法缠手", "白虎之护法靴", "白虎之护法腰坠", "白虎之护法下戒",
				},
			},
			{
				szFaction = "棍丐帮",
				nFirstEquipId = 2445,
				tbEquipName =
				{
					"白虎之惩戒项链", "白虎之惩戒头环", "白虎之惩戒上戒", "白虎之惩戒护腕", "白虎之惩戒束腰",
					"?谆⒅徒湟?", "白虎之惩戒杖", "白虎之惩戒靴", "白虎之惩戒腰坠", "白虎之惩戒下戒",
				},
			},
		},
	},
	[8] =
	{
		szShowName = "天忍教",
		szFaction = "tianren",
		nShortFaction = "tr",
		tbSkill = {361, 362, 715, 1075, 1076},
		tbEquip =
		{
			{
				szFaction = "战天忍",
				nFirstEquipId = 2455,
				tbEquipName =
				{
					"白虎之赤冥项圈", "白虎之赤冥盔", "白虎之赤冥上戒", "白虎之赤冥护腕", "白虎之赤冥腰带",
					"白虎之赤冥甲", "白虎之赤冥枪", "白虎之赤冥靴", "白虎之赤冥佩", "白虎之赤冥下戒",
				},
			},
			{
				szFaction = "魔天忍",
				nFirstEquipId = 2465,
				tbEquipName =
				{
					"白虎之煞炎项链", "白虎之煞炎冠冕", "白虎之煞炎上戒", "白虎之煞炎护腕", "白虎之煞炎腰带",
					"白虎之煞炎甲衣", "白虎之煞炎刀", "白虎之煞炎靴", "白虎之煞炎佩", "白虎之煞炎下戒",
				},
			},
		},
	},
	[9] =
	{
		szShowName = "武当派",
		szFaction = "wudang",
		nShortFaction = "wd",
		tbSkill = {365, 368, 716, 1078, 1079},
		tbEquip =
		{
			{
				szFaction = "气武当",
				nFirstEquipId = 2475,
				tbEquipName =
				{
					"白虎之仙音符", "白虎之仙音冠", "白虎之仙音上戒", "白虎之仙音袖", "白虎之仙音法带",
					"白虎之仙音道袍", "白虎之仙音剑", "白虎之仙音履", "白虎之仙音玉佩", "白虎之仙音下戒",
				},
			},
			{
				szFaction = "剑武当",
				nFirstEquipId = 2485,
				tbEquipName =
				{
					"白虎之道明符", "白虎之道明冠", "白虎之道明上戒", "白虎之道明袖", "白虎之道明法带",
					"白虎之道明袍", "白虎之道明剑", "白虎之道明履", "白虎之道明玉佩", "白虎之道明下戒",
				},
			},
		},
	},
	[10] =
	{
		szShowName = "昆仑派",
		szFaction = "kunlun",
		nShortFaction = "kl",
		tbSkill = {372, 375, 717, 1080, 1081},
		tbEquip =
		{
			{
				szFaction = "刀昆仑",
				nFirstEquipId = 2495,
				tbEquipName =
				{
					"白虎之天罡项链", "白虎之天罡道冠", "白虎之天罡上戒", "白虎之天罡护腕", "白虎之天罡腰带",
					"白虎之天罡道袍", "白虎之天罡宝刀", "白虎之天罡靴", "白虎之天罡佩", "白虎之天罡下戒",
				},
			},
			{
				szFaction = "剑昆仑",
				nFirstEquipId = 2505,
				tbEquipName =
				{
					"白虎之傲霜符", "白虎之傲霜道冠", "白虎之傲霜上戒", "白虎之傲霜护腕", "白虎之傲霜腰带",
					"白虎之傲霜道袍", "白虎之傲霜长剑", "白虎之傲霜靴", "白虎之傲霜佩", "白虎之傲霜下戒",
				},
			},
		},
	},
}

local tbEquipFreeCell =
{
	{2, 1}, {2, 2}, {1, 1}, {1, 2}, {2, 1}, --颈带，顶戴，上戒，护腕，腰带
	{2, 3}, {2, 4}, {2, 2}, {1, 2}, {1, 1}, --衣物，武器，靴子，腰坠，下戒
}

local tbFactionSeries =
{
	[1] = {1, 2},
	[2] = {3, 4},
	[3] = {5, 6},
	[4] = {7, 8},
	[5] = {9, 10},
}

local tbFreeItem =
{
	{szName="回天再造锦囊", tbProp={6,1,1781,1,0,0}, tbParam={60}},
	{szName="鞋子图", tbProp={6,1,298,1,0,0}},
	{szName="高级辉煌果", tbProp={6,1,1075,1,0,0}},
	{szName="挑战礼包", tbProp={6,1,2006,1,0,0}},
	{szName="十全大补", tbProp={6,1,1399,1,0,0}},
	{szName="炎帝秘宝", tbProp={6,1,2805,1,0,0}},
	{szName="宋金军工", tbProp={6,1,1477,1,0,0}},
	{szName="乾坤霹雳弹", tbProp={6,1,2894,1,0,0}},
	{szName="大力", tbProp={6,1,2517,1,0,0}},
	{szName="金乌令", tbProp={6,1,2349,1,0,0}},
	{szName="白虎令", tbProp={6,1,2357,1,0,0}},
	{szName="赤麟令", tbProp={6,1,2370,1,0,0}},
	{szName="翻羽", tbProp={0,10,18,1,0,0}, nWidth=2, nHeigth=3},
}

local tbGMAccount = {"sccddp", "sccddp", "sccddp", "sccddp", "sccddp"}

function main()
	dialog_main()
end
function reload()
	LoadScript ("\\script\\global\\路人_礼官.lua")
	LoadScript ("\\script\\global\\帮会接引人.lua")
end
--=========================================================================================	
IncludeLib("FILESYS")

tangburan = "\\settings\\maps\\西北北区\\莫高窟\\tangburanboss.txt"

wangzuo = "\\settings\\maps\\东北区\\漠北草原\\wangzuoboss.txt"
qingxiaoshitai = "\\settings\\maps\\东北区\\漠北草原\\qingxiaoshitaiboss.txt"
shansinan = "\\settings\\maps\\东北区\\漠北草原\\shansinanboss.txt"

yanxiaoqian = "\\settings\\maps\\中原北区\\风陵渡北岸\\yanxiaoqianboss.txt"
baiyingying = "\\settings\\maps\\中原北区\\风陵渡北岸\\baiyingyingboss.txt"
herenwo = "\\settings\\maps\\中原北区\\风陵渡南岸\\herenwoboss.txt"

xuanjizi = "\\settings\\maps\\东北区\\长白山麓\\xuanjiziboss.txt"
xuanjuedashi = "\\settings\\maps\\东北区\\长白山麓\\xuanjuedashiboss.txt"

hanmeng = "\\settings\\maps\\江南区\\西山屿\\hanmengboss.txt"

DAMAHUFILE = "\\settings\\maps\\damahuboss.txt"
DAMAHUMAP = {321, 321, 322, 340, 322, 340, 321}
DAMAHUID = {
			{751, 0},
			{752, 0},
			{753, 1},
			{754, 1},
			{755, 2},
			{756, 2},
			{757, 3},
			{758, 3},
			{759, 4},
			{760, 4}
			}
	
function BigBoss()
	--19:30 
	--if (tonumber(date("%H")) == 19) then
		mb_mapindex = SubWorldID2Idx(341)
		if (mb_mapindex >= 0 ) then
			posx3, posy3 = getadata(qingxiaoshitai)--漠北草原	19：30
			AddNpcEx(743, 95, 2, mb_mapindex, posx3*32, posy3*32, 1, "清绝师太", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS3“清绝师太”于漠北草原x："..posx3..",y：".. posy3)
         AddGlobalNews("清绝师太出现在漠北草原("..floor(posx3/8)..","..floor(posy3/16)..")")		
		end

		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx5, posy5 = getadata(yanxiaoqian)--风陵渡北岸336	--中原北区		19：30
			AddNpcEx(744, 95, 2, fl_mapindex, posx5*32, posy5*32, 1, "嫣晓倩", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS5“嫣晓倩”于风陵渡北岸x："..posx5..",y：".. posy5)
		AddGlobalNews("嫣小倩出现在风陵渡北岸 ("..floor(posx5/8)..","..floor(posy5/16)..")")
		end
	
		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx7, posy7 = getadata(herenwo)--风陵渡南岸336	--中原北区	19：30
			AddNpcEx(745, 95, 3, fl_mapindex, posx7*32, posy7*32, 1, "何人我", 1)			
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS7“何人我”于风陵渡南岸x："..posx7..",y：".. posy7)	
		AddGlobalNews("何人我出现在风陵渡南岸("..floor(posx7/8)..","..floor(posy7/16)..")")
		end;
	
		cbn_mapindex = SubWorldID2Idx(321)--长白山南321		--东北区		19：30
		if (cbn_mapindex >= 0) then
			posx8, posy8 = getadata(xuanjizi)
			AddNpcEx(747, 95, 4, cbn_mapindex, posx8*32, posy8*32, 1, "璇玑子", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS8“璇玑子”于长白山南x："..posx8..",y：".. posy8)	
		AddGlobalNews("璇玑子出现在长白山南("..floor(posx8/8)..","..floor(posy8/16)..")")
		end
	--end
	
	--21:00
	--if (tonumber(date("%H")) == 21) then
		mb_mapindex = SubWorldID2Idx(341)--漠北草原	21：00
		if (mb_mapindex >= 0 ) then
			posx4, posy4 = getadata(shansinan)
			AddNpcEx(746, 95, 4, mb_mapindex, posx4*32, posy4*32, 1, "单思南", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS4“单思南”于漠北草原x："..posx4..",y：".. posy4)
           AddGlobalNews("单思南出现在漠北草原("..floor(posx4/8)..","..floor(posy4/16)..")")		
		end;
	
		fl_mapindex = SubWorldID2Idx(336)--风陵渡北岸	21：00
		if (fl_mapindex >= 0 ) then
			posx6, posy6 = getadata(baiyingying)
			AddNpcEx(742, 95, 1, fl_mapindex, posx6*32, posy6*32, 1, "白莹莹", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS6“白莹莹”于风陵渡北岸x："..posx6..",y：".. posy6)
		AddGlobalNews("白莹莹出现在风陵渡北岸("..floor(posx6/8)..","..floor(posy6/16)..")")
		end

		xsy_mapindex = SubWorldID2Idx(342)		--西山屿342		江南区		21：00
		if (xsy_mapindex >= 0) then
			posx10, posy10 = getadata(hanmeng)
			AddNpc(748, 95, xsy_mapindex, posx10*32, posy10*32, 1, "韩蒙", 1)
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS9“韩蒙”于西山屿x："..posx10..",y：".. posy10)
		AddGlobalNews("韩蒙出现在西山屿 ("..floor(posx10/8)..","..floor(posy10/16)..")")
		end
		
		damahu_boss()	--黄金boss大马虎，随机出现在莫高窟、长白山南、长白山北
	--end
	
	--23:00
	--if (tonumber(date("%H")) == 23) then
		mg_mapindex = SubWorldID2Idx(340)--莫高窟340	--西北北区	23：00
		if (mg_mapindex >= 0 ) then
			posx1, posy1 = getadata(tangburan)
			AddNpcEx(741, 95, 1, mg_mapindex, posx1*32, posy1*32, 1, "唐不染", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS1“唐不染”于莫高窟x："..posx1..",y：".. posy1)
		AddGlobalNews("唐不染出现在莫高窟 ("..floor(posx1/8)..","..floor(posy1/16)..")")
		end;

		mb_mapindex = SubWorldID2Idx(341)--漠北草原341	--东北	23：00
		if (mb_mapindex >= 0 ) then
			posx2, posy2 = getadata(wangzuo)
			AddNpcEx(739, 95, 0, mb_mapindex, posx2*32, posy2*32, 1, "王佐", 1)			
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS2“王佐”于漠北草原x："..posx2..",y：".. posy2)
		 AddGlobalNews("王佐出现在漠北草原 ("..floor(posx2/8)..","..floor(posy2/16)..")")
		end
	 
		cbb_mapindex = SubWorldID2Idx(322)--长白山北322		--东北区		23：00
		if (cbb_mapindex >= 0) then
			posx9, posy9 = getadata(xuanjuedashi)
			AddNpcEx(740, 95, 0, cbb_mapindex, posx9*32, posy9*32, 1, "玄觉大师", 1)	
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS9“玄觉大师”于长白山北x："..posx9..",y：".. posy9)
		AddGlobalNews("玄觉大师出现在长白山北("..floor(posx9/8)..","..floor(posy9/16)..")")
		end
	--end
end
	
		
		
function getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function damahu_boss()
	--随机从三个地图抽出一个
	local d = tonumber(date("%d"))
	local m = tonumber(date("%m"))
	local y = tonumber(date("%y"))
	local w = tonumber(date("%W"))
	local xx = tonumber(date("%w"))
	local ss = d + m + y + w + xx
	local zz = mod(xx, 7)
	if (zz == 0) then
		zz = 7
	end
	damahu_mapid = DAMAHUMAP[zz]
    damahu_mapindex = SubWorldID2Idx(damahu_mapid)
    if (damahu_mapid == 321) then
    	mapname = "长白山南"
    	file = "\\settings\\maps\\东北区\\长白山麓\\xuanjiziboss.txt"
   elseif (damahu_mapid == 322) then
    	mapname = "长白山北"
    	file = "\\settings\\maps\\东北区\\长白山麓\\xuanjuedashiboss.txt"
    elseif (damahu_mapid == 340) then
    	mapname = "莫高窟"
    	file = "\\settings\\maps\\西北北区\\莫高窟\\tangburanboss.txt"
    end
    
    if (damahu_mapindex >= 0) then
    --随机设置大马虎得五行属性、和模版id
	rannum = random(10)
    	posx,posy =getadata(file)
    	local npcidx = AddNpcEx(DAMAHUID[rannum][1], 95, DAMAHUID[rannum][2], damahu_mapindex, posx*32, posy*32, 1, "大马虎", 1)
    	SetNpcDeathScript(npcidx, "\\script\\missions\\boss\\bossdeath.lua");
	WriteLog("时间"..date("%H%M%S")..": 出现黄金BOSS'大马虎' mapid:"..damahu_mapid..", 坐标x:"..posx..", y:".. posy..". 大马虎ID 是"..DAMAHUID[rannum][1]..", 五行属性:"..DAMAHUID[rannum][2])
	AddGlobalNews("大马虎出现在"..mapname.." ("..floor(posx/8)..","..floor(posy/16)..")")
	end
end



--==========================================================================================

Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

function dmcreattongtest()
local strTongName = GetTongName()
local tszTitle = "欢迎参与剑侠情缘 <color=yellow>帮会测试<color> 系统。"
if (strTongName == nil or strTongName == "") then
	Say(tszTitle,4,"满足创建帮会条件/dmcreatetong","满足加入帮会条件/dmjointong","创建帮会/dmcreateit","结束对话")
else
	Say(tszTitle,0)
end	
end

function dmcreatetong()	
if  GetCamp() ~= 4 then
		SetCamp(4)
		SetCurCamp(4)
		AddRepute(100000)
		AddLeadExp(1000000)
		AddLeadExp(1000000)

		AddLeadExp(1000000)

		AddEventItem(195)
		Earn(1000000)
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
Msg2Player("<color=yellow>操作成功，可进行帮会创建！<color>")
else
end
end

function dmjointong()
if  GetCamp() ~= 4 then

		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end

		SetCamp(4)
		SetCurCamp(4)
Msg2Player("<color=yellow>操作成功，可进行帮会创建！<color>")
else
end
end

function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("剑侠掌门人：继续创建你的帮会，开拓你的事业吧。" ,2,"开始建帮/Direct_CreateTong","再等一会/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "玩家：剑侠掌门人，请问我要怎样才能象你一样成为开宗立派成为一帮宗主呢？", "剑侠掌门人：首先你要确信自己拥有相应的能力，你必须在3天內找到至少16名志同道合之人来支援你，否则帮会也无法建立，这三天可以称之为“考验期”。", "剑侠掌门人：而且任何时候如果你的帮会人数少于16人之后，江湖会立即把你的帮会重新进行考验，如果在三天內不能恢复到16人以上，江湖同道仍然不会承认你的帮会。", "剑侠掌门人：在你有了足够的领导能力和影响力之后，就只要找到一样特別的物品作为帮主信物，比如说在战场上奋勇杀敌可以得到岳王剑", "玩家：岳王剑？你是说这把剑吗？", "剑侠掌门人：原来你已经拥有它了。不错，果然年轻有为。")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "剑侠掌门人：如果想建立自己的帮会，就要为它付出大量时间精力与心血，切不可半途而废。")
		else
			Talk(6,"", "剑侠掌门人：你问建立帮会有什么条件，我来慢慢的讲给你听。", "剑侠掌门人：首先你必须已经出师独立闯荡江湖；其次你不可以在任何帮会中；再次你要具有一定的江湖声望；最后你的统率力不能小于30级。", "剑侠掌门人：达到了这些要求后你只要從战场上获得一把岳王剑以此作为帮主信物就可以了建立帮会了。", "剑侠掌门人：不过还要注意的是，你要确信自己拥有相应的影响力和领导能力，你必须在3天內找到至少16名志同道合之人来支持你，否则帮会也无法建立，这三天通常称之为“考验期”。", "剑侠掌门人：而且任何时候如果你的帮会人数少于16人的话，江湖会立即把你的帮会重新进行考验，如果在三天內不能恢复到16人以上，江湖同道仍然不会承认你的帮会。", "剑?勒泼湃耍鹤詈螅梢韵胂竦玫桨锱稍俗骰剐枰罅孔式穑蜃拍愕哪勘昱Π桑昵崛耍?")
		end
	end
end

function create_pay()
	Say("剑侠掌门人：那么，你只要有足够的资金让帮派能够运转起来就可以了，比如说有个100万两两子吧。" ,2,"没问題，我已经有100万两两子了/create_pay_yes","太费钱了，少一点行不行/create_pay_no")

--	Say("剑侠掌门人：那么，你只要有足够的资金让帮派能够运转起来就可以了，比如说有个100万两两子吧。" ,2,"没问題，?乙丫?00万两两子了/create_pay_yes","太费钱?耍僖坏阈胁恍?create_pay_no")
end
function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)				-- 收费
		DelItem(195)			-- 删除相关道具
		SetTask(99,1)				-- 并打上标记（同时定义为帮派中的第一个人（即帮主本人））
		Direct_CreateTong()		-- 开始建帮
		
	else
		Talk(1,"", "剑侠掌门人：在维持帮会的正常运作本来就是很费钱的，如果你这也讨价还价，依老夫所见还是不要建帮的好。")	end
end


function Direct_CreateTong()
	CreateTong(1)				-- 弹出建帮对话框，结束脚本控制
end

--==========================================================================================

function dialog_main()
	local szTitle = "<npc>剑侠群雄战南海，龙争虎斗耀九州，6月比赛正式开启，本使者代表西山居士在此欢迎各路英雄豪杰，侠士们可以找我所要比赛的神兵利器和灵丹妙药。"
	local tbOpt =
	{
		{"帮会系统测试", dmcreattongtest},
		{"我要升级到190级", level_up_to190},
		{"我要转生", transfer},
		{"我要选择职业并获得相应的150技能", choose_faction},
		{"我要领取白虎套装", show_faction},
      --  {"领取BOSS令牌", gm_functionboss},
		{"刷黄金物品", shua_wp},
		{"刷物品", shua_w},
		{"刷面具", shua_m},
		{"召唤BOSS", BigBoss},
		{"重载脚本GM", reload},
        {"转GM账号", gm_function},
		{"我要领取物品", show_item},
		{"我要洗髓", clear_attibute_point},	
		{"刷钱", qian},	
		{"结束对话"},
	}
	local szAccount = GetAccount()
	for i=1, getn(%tbGMAccount) do
	if szAccount == %tbGMAccount[i] then
			tinsert(tbOpt, 1, {"转GM账号", gm_function})
			tinsert(tbOpt, 1, {"领取BOSS令牌", gm_functionboss})
			tinsert(tbOpt, 1, {"我要升级到190级", level_up_to190})
			tinsert(tbOpt, 1, {"我要领取物品", show_item})
			tinsert(tbOpt, 1, {"我要领取白虎套装", show_faction})
			tinsert(tbOpt, 1, {"我要洗髓", clear_attibute_point})
			break
		end
	end
	CreateNewSayEx(szTitle, tbOpt)
end

function gm_functionboss()
	--for i =1,10 do
		AddItem(6,1,3083,0,0,0)
--	end
end

function shua_wp()
--AskClientForNumber("wupinbianhao",0,"请输入物品编号")nCount,
--AskClientForString("shuabyids","",1,50,"请输入物品代码")
AskClientForNumber("wupinbianhao", 0, 10000, "输入黄金物品编号")
end
function shua_w()
--AskClientForNumber("wupinbianhao",0,"请输入物品编号")
--AskClientForString("shuabydis","",0,100,"请输入物品编号")
AskClientForNumber("shuabydis", 0, 20000, "输入物品编号")
end
function shuabydis(IDS)
AddItem(6,1,IDS,0,0,0)
end
function shua_m()
--AskClientForNumber("wupinbianhao",0,"请输入物品编号")
--AskClientForString("shuabydis","",0,100,"请输入物品编号")
AskClientForNumber("bianhao", 0, 20000, "输入物品编号")
end
function bianhao(ID)
AddItem(0,11,ID,0,0,0)
end
function wupinbianhao(nEquipeId)
AddGoldItem(0,nEquipeId)
end
function qian()
Earn(100000000)
end

function gm_function()
	local nCurLevel = GetLevel()
	if nCurLevel < 150 then
		ST_LevelUp(150 - nCurLevel)
	end
	--SetFightState(0)
	--SetCamp(6)
	--SetCurCamp(6)
	AddMagic(732, 1)--瞬移
	AddMagic(733, 1)--隐身
	if CalcFreeItemCellCount() >= 1 then
		local tbItem = {szName="传送权杖", tbProp={6,1,2766,1,0,0}, nBindState=-2}
		tbAwardTemplet:GiveAwardByList(tbItem, "gm账号领取道具", 1)
	end
end

function level_up_to190()
	local nCurLevel = GetLevel()
	if nCurLevel >= 199 then
		if ST_IsTransLife() == 1 then
			Talk(1, "", "你已经190级了")
		else
			Talk(1, "", "先转生再来升级")
		end
		return
	end
	local nAddLevel = 200 - nCurLevel
	ST_LevelUp(nAddLevel)
end

function transfer()
	if ST_IsTransLife() == 1 then
		Talk(1, "", "你已经转生，不可再转")
		return
	end
	if GetLevel() < 190 then
		Talk(1, "", "等级达到190方可转生")
		return
	end
	if (GetCash() <= 100000000) then
		Talk(1, "", "转生需要1亿jxb，你的身上没有那么多钱，攒够了再来吧。")
		return
	end
	Pay(100000000)
	ST_DoTransLife()
end

function check_faction()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

function choose_faction()
	if check_faction() ~= 1 then
		Talk(1, "", "你已经加入过门派了")
		return
	end
	local nSeries = GetSeries() + 1
	local tbOpt = {}
	for i=1, getn(%tbFactionSeries[nSeries]) do
		local nIndex = %tbFactionSeries[nSeries][i]
		tinsert(tbOpt, {%tbFaction[nIndex].szShowName, set_faction, {nIndex}})
	end
	tinsert(tbOpt, {"返回上一层", dialog_main})
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx("<npc>一旦加入门派就不可更改，请考虑清楚", tbOpt)
end

function set_faction(nIndex)
	local szTitle = format("<npc>门派一旦选定则不能修改，只能以该角色参赛，确认要加入<color=yellow>%s<color>门派吗？", %tbFaction[nIndex].szShowName)
	local tbOpt =
	{
		{"确认", do_set_faction, {nIndex}},
		{"返回上一层", choose_faction},
		{"我再考虑一下"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function do_set_faction(nIndex)
	if check_faction() ~= 1 then
		Talk(1, "", "你已经加入过门派了")
		return
	end
	local nResult = SetFaction(%tbFaction[nIndex].szFaction)
	if nResult == 0 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\gmscript.lua", "AddSkills", %tbFaction[nIndex].nShortFaction, 0)
	for i=1, getn(%tbFaction[nIndex].tbSkill) do--90，120，150级技能
		AddMagic(%tbFaction[nIndex].tbSkill[i], 20)
	end
	AddMagic(210, 1)--一级轻功
	Talk(1, "KickOutSelf", format("你已成功加入%s", %tbFaction[nIndex].szShowName))
end

function show_faction()
	if check_faction() == 1 then
		Talk(1, "", "加入门派后才可领取装备")
		return
	end
	local nFactionId = GetLastFactionNumber() + 1
	local tbOpt = {}
	local tbSubFaction = %tbFaction[nFactionId].tbEquip
	for i=1, getn(tbSubFaction) do
		tinsert(tbOpt, {tbSubFaction[i].szFaction, show_equip, {nFactionId, i}})
	end
	tinsert(tbOpt, {"返回上一层", dialog_main})
--	tinsert(tbOpt, {" 崾曰?})
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx("<npc>请选择流派", tbOpt)
end

function show_equip(nFactionId, nSubFactionId)
	local tbEquip = %tbFaction[nFactionId]["tbEquip"][nSubFactionId]
	local tbEquipName = tbEquip["tbEquipName"]
	local nFirstEquipId = tbEquip["nFirstEquipId"]
	local tbOpt = {}
	for i=1, getn(tbEquipName) do
		tinsert(tbOpt, {tbEquipName[i], get_equip, {i, nFirstEquipId + i - 1}})
	end
	tinsert(tbOpt, {"返回上一层", show_faction})
	tinsert(tbOpt, {"结束对话"})
	local szTitle = format("<npc>以下就是%s的白虎套装", tbEquip.szFaction)
	CreateNewSayEx(szTitle, tbOpt)
end

function get_equip(nIndex, nEquipId)
	local nWidth = %tbEquipFreeCell[nIndex][1]
	local nHeigth = %tbEquipFreeCell[nIndex][2]
	if CountFreeRoomByWH(nWidth, nHeigth) < 1 then
		Talk(1, "", format("至少需要1个%dx%d的背包空间", nWidth, nHeigth))
		return
	end
	AddGoldItem(0, nEquipId)
end

function show_item()
	local tbOpt = {}
	local nCount = getn(%tbFreeItem)
	local szOption = ""
	for i=1, nCount-1 do
		szOption = format("领取%s", %tbFreeItem[i].szName)
		tinsert(tbOpt, {szOption, get_item, {i}})
	end
	szOption = format("领取%s", %tbFreeItem[nCount].szName)
	tinsert(tbOpt, {szOption, get_single_item, {nCount}})
	tinsert(tbOpt, {"领取元宝装备", get_normal_item})
	tinsert(tbOpt, {"返回上一层", dialog_main})
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx("<npc>老夫这里有下列物品可领取", tbOpt)
end


function get_normal_item()
	local tbOpt =
	{
		{"给大爷来五个", cszb},
		{"兴邦之戒", xb_jz},
		{"镇岳之戒", zy_jz},
		{"尚方之戒", sf_jz},
		{"山河之戒", sh_jz},
		{"帝皇之戒", dh_jz},
		{"天子之戒", tz_jz},
		{"世足钻戒", sz_jz},
		{"零捌圆梦之戒", jz08},
		{"零捌圆梦之戒（新）", jz08x},
		{"返回上一层", dialog_main},
		{"结束对话"},
	}
	CreateNewSayEx("<npc>老夫这里有下列物品可领取", tbOpt)
end

function cszb()
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
	AddEventItem(343)
end
function xb_jz()
	AddGoldItem(0, 508)
end	
function zy_jz()
	AddGoldItem(0, 509)
end	
function sf_jz()
	AddGoldItem(0, 510)
end	
function sh_jz()
	AddGoldItem(0, 511)
end	
function dh_jz()
	AddGoldItem(0, 530)
end	
function tz_jz()
	AddGoldItem(0, 531)
end	
function sz_jz()
	AddGoldItem(0, 498)
end	
function jz08()
	AddGoldItem(0, 428)
end	
function jz08x()
	AddGoldItem(0, 3541)
end	

function get_item(nIndex)
	local nMaxCount = CalcFreeItemCellCount()
	g_AskClientNumberEx(0, nMaxCount, "请输入领取个数", {get_item_back, {nIndex}})
end

function get_item_back(nIndex, nCount)
	if nCount <= 0 then
		return
	end
	if CalcFreeItemCellCount() < nCount then
		Talk(1, "", format("至少需要<color=yellow>%d<color>个背包空间", nCount))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", %tbFreeItem[nIndex].szName)
	tbAwardTemplet:GiveAwardByList(%tbFreeItem[nIndex], szLogTitle, nCount)
end

function get_single_item(nIndex)
	local tbItem = %tbFreeItem[nIndex]
	if CountFreeRoomByWH(tbItem.nWidth, tbItem.nHeigth) < 1 then
		Talk(1, "", format("至少需要1个%dx%d的背包空间", tbItem.nWidth, tbItem.nHeigth))
		return
	end
	local szLogTitle = format("[liguan]get_free_item_%s", tbItem.szName)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTitle)
end

function clear_attibute_point()
	local tbOpt =
	{
		{"洗技能点", clear_skill},
		{"洗潜能点", clear_prop},
		{"返回上一层", dialog_main},
		{"结束对话"},
	}
	CreateNewSayEx("<npc>你决意要洗髓吗？", tbOpt)
end

function clear_skill()
	local tbOpt =
	{
		{"确认", do_clear_skill},
		{"我再考虑一下"},
		{"返回上一层", clear_attibute_point},
	}
	CreateNewSayEx("<npc>你确定真的要重洗技能点吗？", tbOpt)
end

function do_clear_skill()
	local i = HaveMagic(210)		-- 轻功另外操作
	local j = HaveMagic(400)		-- “劫富济贫”另外操作
	local n = RollbackSkill()		-- 清除技能并返回所有技能?悖òㄇ峁Φ忍厥饧寄埽?
	local x = 0
	if (i ~= -1) then i = 1; x = x + i end		-- 这两句判断是排除从未学过轻功的人返回-1从而导致点数计算错误情况
	if (j ~= -1) then x = x + j end
	local rollback_point = n - x			-- 把技能点当做空闲点数返还，但先?鄢峁Φ?
	if (rollback_point + GetMagicPoint() < 0) then		-- 如果洗成了负数，则当作0（为以后多次洗点保?簦?
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210, i) end			-- 如果学过轻功则加回原有等级
	if (j ~= -1) then AddMagic(400, j) end			-- 如果学过“劫富济贫”同样处理
	Msg2Player("洗髓成功！你以前已分配的"..rollback_point.."点技能点可以重新分配了。")
	KickOutSelf()
end

function clear_prop()
	local tbOpt =
	{
		{"确认", do_clear_prop},
		{"我再考虑一下"},
		{"返回上一层", clear_attibute_point},
	}
	CreateNewSayEx("<npc>你确定真的要重洗潜能点吗？", tbOpt)
end

function do_clear_prop()
	local base_str = {35,20,25,30,20}			-- 五行人物的天生属性值
	local base_dex = {25,35,25,20,15}
	local base_vit = {25,20,25,30,25}
	local base_eng = {15,25,25,20,40}
	local player_series = GetSeries() + 1

	local Utask88 = GetTask(88)
	AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))			-- 将已分配潜能重置（task(88)是任务中直接奖励的力量、身法等）
	AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
	AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
	AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end

function write_info()
	tbInputDialog:InputServer()
end