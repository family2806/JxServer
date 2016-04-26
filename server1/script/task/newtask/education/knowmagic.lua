-- 各门派武功路线（无需入门便可了解）
-- BY:xiaoyang (2004-11-30)
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function Uworld1000_knowmagic()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:武学之道，艺无止境。其实各派功夫，只要勤奋练习，都可有一番大大的作为。",11,
	"峨嵋派/Uworld1000_emei",
	"唐门/Uworld1000_tangmen",
	"天王帮/Uworld1000_tianwang",
	"天忍教/Uworld1000_tianren",
	"武当派/Uworld1000_wudang",
	"翠烟门/Uworld1000_cuiyan",
	"少林派/Uworld1000_shaolin",
	"丐帮/Uworld1000_gaibang",
	"昆仑派/Uworld1000_kunlun",
	"五毒教/Uworld1000_wudu",
	"我以后再来询问吧/no")
end

function Uworld1000_emei()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:关于峨嵋派的起源，据峨嵋派的拳志说：祖师原为一道姑，后入佛门。据孟宪超《峨眉拳》记载，“是时，师善技击，善研各家拳法，虑各家拳法繁杂，莫衷一是，女子御侮，多有不同，遂探各家之拳意，另辟蹊径，创不接手之拳法，独树一帜，积十三年，始臻大成，身旁弟子习之，呼之玉女拳法，同道相誉，称日峨眉拳，后弟子至峨眉山，偶谐其音，始称峨眉。”由此可见，峨嵋派是一个由女子所创的武林门派，后因祖师入了佛门，又以称女子为“蛾眉”和佛教圣地之“峨眉山”的双重含义而得名。",4,
	"剑宗/Uworld1000_emeijianzong",
	"气宗/Uworld1000_emeiqizong",
	"辅助/Uworld1000_emeifuzhu",
	"以后再问吧/no")
end

function Uworld1000_tangmen()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:四川唐门是饮誉武林的暗器家族，以暗器和火器雄踞蜀中，行走江湖达数百年之久。唐门人善于设计、发明和使用各种暗器与火器，威力惊人。",5,
	"飞刀/Uworld1000_tangmenfeidao",
	"弩箭/Uworld1000_tangmennujian",
	"飞镖/Uworld1000_tangmenfeibiao",
	"陷阱/Uworld1000_tangmenxianjing",
	"以后再问吧/no")
end

function Uworld1000_tianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:昔日钟相在洞庭湖起兵，自称楚王，起义军拥兵十余万，南抗赵宋，北抵金兵。后来楚王被杀，义军残部推举龙阳杨幺为领袖，即后来的大圣天王。大圣天王大公无私，立楚王少子钟子仪为太子。义军发展迅猛，朝廷恐慌，多次派兵前往镇压，后派岳飞前往洞庭湖剿灭义军。天王的部队被打得溃不成军，天王和太子被俘后也遭朝廷杀害。义军被镇压后元气大伤，所剩弟兄不足十之一二，只有天王之女杨瑛在外学艺，幸免遇难。杨瑛回到洞庭湖后，重新聚集散落四处的弟兄，组织了天王帮。杨瑛虽然身为女子，但是武艺高强，胆识过人，天王帮在她的带领下，日渐兴盛。",5,
	"刀天王/Uworld1000_daotianwang",
	"枪天王/Uworld1000_qiangtianwang",
	"锤天王/Uworld1000_chuitianwang",
	"辅助武功/Uworld1000_fuzhutianwang",
	"以后再问吧/no")
end

function Uworld1000_tianren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:天忍教是金国为了对付宋国武林人士而创建的组织，信奉的是金国的国教萨满教，教主是金国国师完颜宏烈，教中高手无数，还招募了宋国一些邪派高手和正派的叛徒。",4,
	"战忍/Uworld1000_zhanren",
	"魔忍/Uworld1000_moren",
	"诅咒忍/Uworld1000_zuzhouren",
	"以后再问吧/no")
end

function Uworld1000_wudang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:武当山又名太和山，是我国著名的道教名山。武当派信奉道教“玄天真武大帝”，据说“武当”二字即“非真武不足以当之”之意。武当派历史由来已久，被世人称为内家之宗。创派祖师是「邋遢真人」张三丰，张三丰本名张全一，又名张君宝，三丰是他的道号，据说张三丰是北宋末年武当山的道士，徽宗召他入京，道遇贼人，梦中元帝授其拳法，次日张三丰孤身杀贼百余人，遂创立内家拳派。又有传说，说张三丰源出少林、精通少林精髓五拳十八式，将其统纳于十段棉长拳之中，变战斗搏击之法为御敌防卫之法，风格遂与少林大为不同、因此别树一帜、开创武当门派，又称内家。张三丰武功深不可测，他以自悟的拳理结合道家冲虚圆通之道，创出了辉映后世、照耀千古的武当一派武功，被誉为不世出的奇人，堪称武林一代宗师。他不仅是武当内家拳的祖师，也是太极拳的始祖。内家拳又分太极，八卦，形意，太成诸门，而以太极门为主。武当武功有“五不传”之戒，即“柔骨质脆，心险，好斗，狂酒，轻露”者，不可传。",4,
	"剑宗/Uworld1000_wudangjianzong",
	"气宗/Uworld1000_wudangqizong",
	"辅助武功/Uworld1000_wudangfuzhu",
	"以后再问吧/no")
end

function Uworld1000_cuiyan()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:云南的一个神秘门派，据传其创派祖师是一位遭爱人遗弃的女侠，心灰意懒之际隐居到云南边陲，路途遇见几个被遗弃的孤女，顿生恻隐之心，带回抚养并传授武功。一代代传下来。翠烟门与唐门并称“武林二门”，因其神秘色彩而名动江湖，是江湖男子的一个迷离的美梦，对江湖男子而言，翠烟门到底是地狱还是天堂，谁也说不清。",4,
	"单刀/Uworld1000_cuiyandandao",
	"双刀/Uworld1000_cuiyanshuangdao",
	"辅助武功/Uworld1000_cuiyanfuzhu",
	"以后再说吧/no")
end

function Uworld1000_shaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:少林寺创建于北魏孝文帝太和十九年（公元四九五年）。当时，天竺僧人跋陀由西域来到中原，得到虔信佛学的孝文帝的礼敬。跋陀见嵩山很象一朵莲花，便有意在「花」中立寺，孝文帝遂在少室山建造少林寺供养跋陀。后来又过三十余年，南天竺僧人菩提达摩来到少林寺，广罗弟子，传授禅宗，成为中国佛教禅宗的开山祖师。 少林派，素来被称为武林第一门派，号称中原武林的泰山北斗。少林寺僧众习武源远流长。早在北魏年间少林建寺初期，即有武装僧众保卫寺庙财产。隋朝末年，天下大乱，群雄混战，割据洛阳的王世充与占据关中的李世民在嵩山一带厮杀。当时少林寺有十三武僧，应秦王李世民之邀出山参加了讨平王世充的战役，他们凭着超群技艺，活擒王世充的侄儿王仁则，逼降王世充。胜利后论功行赏，除昙宗一人受封大将军外，其余十二人不愿受封，回归少林，但均获赐紫罗袈裟，另赐少林寺大量的田地、银两，并赐「立僧兵」、「酒肉」等「荣宠」，自此少林寺遂以武闻名于世。后来更以“少林七十二绝技”名闻天下。",5,
	"拳少林/Uworld1000_quanshaolin",
	"棍少林/Uworld1000_gunshaolin",
	"刀山林/Uworld1000_daoshaolin",
	"辅助武功/Uworld1000_shaolinfuzhu",
	"以后再说吧/no")
end

function Uworld1000_gaibang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:丐帮的历史可说非常久远，从宋初开始就有天下第一帮的称号。丐帮名扬江湖，百年不衰，帮中卧虎藏龙，人材辈出。",4,
	"掌丐/Uworld1000_zhanggai",
	"棍丐/Uworld1000_gungai",
	"辅助武功/Uworld1000_gaibangfuzhu",
	"以后再说吧/no")
end

function Uworld1000_kunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:昆仑派远处西域，很少履及中原，创派祖师已远不可考。后来昆仑派出了个百年不遇的奇人，在中原武林闯下了赫赫威名，至此昆仑派开始闻名。其后昆仑派又出了几位得力掌门，不断壮大昆仑派，使之渐渐成为江湖上一大门派，雄据西域，与中原各大门派分庭抗礼。",5,
	"刀昆仑/Uworld1000_daokunlun",
	"剑昆仑/Uworld1000_jiankunlun",
	"诅咒昆仑/Uworld1000_zuzhoukunlun",
	"辅助武功/Uworld1000_kunlunfuzhu",
	"以后再说吧/no")
end

function Uworld1000_wudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:五毒教是近年来才在武林中突然兴起的新兴教派。五毒教组织严密，教主黑面郎君是五毒教的创始人。五毒教是一个神秘而恐怖的组织，江湖中人谈之色变。五毒教信奉的原则是“利益决定敌友”，只要有利可图，就可以为人所用，根本不管什么是非、对错、正邪。五毒教还有一个信条就是“谁得罪了五毒教，谁就会死无全尸”，那些与五毒教为敌的人都会莫名其妙地死掉。",5,
	"掌毒/Uworld1000_zhangdu",
	"刀毒/Uworld1000_daodu",
	"诅咒五毒/Uworld1000_zuzhouwudu",
	"辅助武功/Uworld1000_wudufuzhu",
	"以后再说吧/no")
end

function Uworld1000_emeijianzong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:剑宗：一叶知秋（入门）、峨嵋剑法（10级）、推窗望月（30级）、不灭不绝（60级）、佛法无边（镇派）、三峨霁雪（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_emeiqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:气宗：飘雪穿云（入门）、峨嵋掌法（10级）、四象同归（30级）、佛光普照（60级）、佛法无边（镇派）、风霜碎影（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_emeifuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:全辅：慈航普渡（20级）、梦蝶（30级）、流水（40级）、佛心慈佑（50级）、清音梵唱（60级）、普渡众生（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_tangmenfeidao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:飞刀：霹雳弹（入门）、唐门暗器（10级）、追心箭  （30级）、小李飞刀（60级）、心眼  （镇派）、慑魂月影（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_tangmennujian()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:弩箭：霹雳弹（入门）、唐门暗器（10级）、漫天花雨（30级）、天罗地网（60级）、心眼  （镇派）、暴雨梨花（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_tangmenfeibiao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:飞镖：霹雳弹（入门）、唐门暗器（10级）、夺魂镖（30级）、散花镖（60级）、心眼（镇派）、九宫飞星（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_tangmenxianjing()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:陷阱：地焰火（10级）、毒刺骨（20级）、穿心刺（30级）、寒冰刺（40级）、雷击术（50级）、乱环击（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_daotianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:刀天王：惊雷斩（入门）、天王刀法（10级）、泼风斩（30级）、无心斩（60级）、天王战意（镇派）、破天斩（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_qiangtianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:枪天王：回风落雁（入门）、天王枪法（10级）、阳关三叠（30级）、血战八方（60级）、天王战意（镇派）、追星逐月（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_chuitianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:锤天王：斩龙诀  （入门）、天王锤法（10级）、行云诀（30级）、乘龙诀（60级）、天王战意（镇派）、追风诀（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_fuzhutianwang()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:附加：静心诀（20级），断魂刺（40级），金钟罩（50级）。",1,"以后再来问吧/no")
end

function Uworld1000_zhanren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:战忍:残阳如血（入门）、天忍矛法（10级）、烈火情天（30级）、偷天换日（60级）、天魔解体（镇派）、云龙击（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_moren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:魔忍：弹指烈焰（入门）、天忍刀法（10级）、推山填海（30级）、魔焰七杀（60级）、天魔解体（镇派）、天外流星（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_zuzhouren()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:诅咒忍：火焚莲华（10级）、幻影飞狐（20级）、飞鸿无迹（30级）、悲酥清风（40级）、厉魔夺魂（50级）、慑魂乱心（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_wudangjiancong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:剑宗：沧海明月（入门）、武当剑法（10级）、剑飞惊天（30级）、三环套月（60级）、太极神功（镇派）、人剑合一（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_wudangqizong()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:气宗：怒雷指（入门）、武当拳法（10级）、剥及而复（30级）、无我无剑（60级）、太极神功（镇派）、天地无极（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_wudangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:各种附加武功包括：七星阵（20级）、梯云纵（40级）、坐望无我（50级）。",1,"以后再来问吧/no")
end

function Uworld1000_cuiyandandao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:单刀：风花雪月（入门）、翠烟刀法（10级）、雨打梨花（30级）、牧野流星（60级）、冰骨雪心（镇派）、冰踪无影（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_cuiyanshuangdao()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:双刀：风卷残雪（入门）、翠烟双刀（10级）、浮云散雪（30级）、碧海潮生（60级）、冰骨雪心（镇派）、冰心仙子（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_cuiyanfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:附加：冰心倩影（20级）、护体寒冰（40级）、雪影（50级）。",1,"以后再来问吧/no")
end

function Uworld1000_quanshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:拳少林：行龙不雨（入门）、少林拳法（10级）、罗汉阵（30级）、龙爪虎抓（50级）、如来千叶（镇派）、达摩渡江（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_gunshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:棍少林：金刚伏魔（入门）、少林棍法（10级）、罗汉阵（30级）、横扫六合（50级）、如来千叶（镇派）、横扫千军（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_daoshaolin()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:刀少林：金刚伏魔（入门）、少林刀法（10级）、罗汉阵（30级）、摩诃无量（50级）、如来千叶（镇派）、无相斩（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_shaolinfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:附加：不动明王（20级）、狮子吼（40级）、易筋经（60级）。",1,"以后再来问吧/no")
end

function Uworld1000_zhanggai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:掌丐：见人伸手（入门）、丐帮掌法（10级）、降龙掌（30级）、亢龙有悔（50级）、醉蝶狂舞（镇派）、飞龙在天（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_gungai()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:棍丐：沿门托钵（入门）、丐帮棒法（10级）、打狗阵（30级）、棒打恶狗（50级）、醉碟狂舞（镇派）、天下无狗（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_gaibangfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:附加：化险为夷（20级）、滑不留手（40级）、逍遥功（60级）。",1,"以后再来问吧/no")
end

function Uworld1000_daokunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:刀昆仑：呼风法（入门）、昆仑刀法（10级）、一气三清（30级）、狂风骤电（50级）、霜傲昆仑（镇派）、傲雪啸风（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_jiankunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:剑昆仑：狂雷震地（入门）、昆仑剑法（10级）、天际迅雷（30级）、五雷正法（60级）、霜傲昆仑（镇派）、雷动九天（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_zuzhoukunlun()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:诅咒昆仑：束缚咒（10级）、羁绊符  （20级）、北冥到海（30级）、欺寒傲雪（40级）、迷踪幻影（50级）、醉仙错骨（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_kunlunfuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:附加：清风符（10级）、天清地浊（30级）、弃心符（40级）。",1,"以后再来问吧/no")
end

function Uworld1000_zhangdu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:掌毒：毒砂掌（入门）、五毒掌法（10级）、幽冥骷髅（30级）、天罡地煞（60级）、五毒奇经（镇派）、阴风蚀骨（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_daodu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:刀五毒：血刀毒杀（入门）五毒刀法（10级）百毒穿心（30级）、朱蛤青冥（60级）、五毒奇经（镇派）、玄阴斩（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_zuzhouwudu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:诅咒五毒：九天狂雷（10级）、赤焰蚀天（20级）、冰蓝玄晶（30级）、穿衣破甲（40级）、穿心毒刺（50级）、断筋腐骨（90级）。",1,"以后再来问吧/no")
end

function Uworld1000_wudufuzhu()
	Describe(DescLink_GeDaMenPaiSkills.."<#>:附加武功：杂难药经（20级）、无形蛊（30级）、万蛊蚀心（40级）。",1,"以后再来问吧/no")
end



function no()
end
