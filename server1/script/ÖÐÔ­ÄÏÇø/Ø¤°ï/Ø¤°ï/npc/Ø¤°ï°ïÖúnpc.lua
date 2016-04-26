--丐帮派帮助NPC
-- By: Dan_Deng(2003-11-25)

Include("\\script\\global\\map_helper.lua")
npc_name = "丐帮"

function main(sel)
	UTask_gb = GetTask(8)
	player_faction = GetFaction()
	if (player_faction == "gaibang") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say("Ta theo 我入丐帮已经50年了，算起来也是何帮主的师叔了。有什么不懂的就问我.",6,"了解本帮/faction","了解本帮人物/member","了解任务 /task_get","了解练功特长/map_help","了解本帮武艺/skill_help","不问了!/nothing")
	elseif (UTask_gb >= 70*256) then				-- 本门出师
		Say("你出师已有几年，难道还记得那时的艰苦吗？呵呵呵 ",6,"温习本门故事 /faction","看望同门兄弟/member","我还可以帮什么吗/task_get","了解练功特长/map_help","了解本帮武艺/skill_help","不问了!/nothing")
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say("欢迎来到丐帮! 不知有什么指教?",3,"了解贵帮/faction","了解各位英雄/member","不问了!/nothing")
	else													-- 新手
		Say("丐帮欢迎各位抗金的有志之士!",4,"了解贵帮/faction","了解各位英雄/member","了解入门条件/task_get","不问了!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say("那你想听本门哪个部分? ",5,"丐帮的起源/F1","地理位置 /F2","江湖地位 /F3","门派特色/F4","不问了!/nothing")
end

function F1()
	Say("本帮历史悠久，从宋朝开始就有天下第一帮的称号了。名震江湖，本帮英才如卧虎藏龙，哪个时代都有 ",2,"了解其他问题/main","不问了!/nothing")
end

function F2()
	Say("东南西北，哪里有乞丐，哪里就有丐帮!",2,"了解其他问题/main","不问了!/nothing")
end

function F3()
	Say("丐帮称为天下第一帮，遇到不少困难. ",2,"了解其他问题/main","不问了!/nothing")
end

function F4()
	Say("丐帮的特点是，讨饭生活，是最宝贵的家财，加入丐帮，需要放弃所有家产，乞讨生活。因为本帮分布广泛，所以，耳目众多，信息及时",2,"了解其他问题/main","不问了!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say("向我介绍哪个?",11,"帮主何人我 /Mhe","执法长老孟苍浪/Mmeng","掌棒长老罗匡生/Mluo","传功长老魏了翁/Mwei","掌砵长老佘三丈/Mshe","赵舵主 /Mzhao","孟远才/Myuan","张赞/Mzhang","李子 /Mli","王吴 /Mwang","不问了!/nothing")
end

function Mhe()
	Say("帮主何人我  位置：丐帮广场   坐标: 191,231<enter>狂放豪爽，粗中有细，极重义气。爱喝酒，手中永远一手拿棍，一手拿着酒壶，虽然常常喝得酩酊大醉，但是处理帮中大事决不会糊涂",2,"了解其他问题/main","不问了!/nothing")
end

function Mmeng()
	Say("执法长老孟苍浪   位置：丐帮广场   坐标: 194,236<enter>为人公正严明，执法如山，有时理性得几乎不近人情。与其早逝的兄长感情深厚，对其遗子孟远才一直十分疼爱",2,"了解其他问题/main","不问了!/nothing")
end

function Mluo()
	Say("掌棒长老罗匡生   位置：丐帮广场   坐标: 190,226<enter>为人忠厚。沉默寡言，一旦发言，则一针见血，常能见到他人所不能见。.",2,"了解其他问题/main","不问了!/nothing")
end

function Mwei()
	Say("传功长老魏了翁   位置：丐帮广场   坐标: 191,241<enter> 性情火爆耿直，疾恶如仇.",2,"了解其他问题/main","不问了!/nothing")
end

function Mshe()
	Say("掌砵长老佘三丈   位置：丐帮广场   坐标: 189,236<enter> 十分随和可亲的一个老头，经常会和人开玩笑，是帮中弟子最喜爱的一个长老。",2,"了解其他问题/main","不问了!/nothing")
end

function Mzhao()
	Say("赵舵主  位置：扬州四望亭北  坐标: 213,177<enter>性情谨慎，严明正直.",2,"了解其他问题/main","不问了!/nothing")
end

function Myuan()
	Say("孟远才   位置：丐帮区域外 <enter> 是无袋弟子，是执法长老孟苍浪的侄子。喜好名声，被各位长老教训过。但是他很聪明，说话很有趣",2,"了解其他问题/main","不问了!/nothing")
end

function Mzhang()
	Say("张赞   位置：广场   坐标: 48,84   负责: 交易兵器 ",2,"了解其他问题/main","不问了!/nothing")
end

function Mli()
	Say("李子  位置：广场   坐标: 51,85   负责: 交易装备",2,"了解其他问题/main","不问了!/nothing")
end

function Mwang()
	Say("王吴  位置：广场   坐标: 53,86   负责: 交易药品",2,"了解其他问题/main","不问了!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_gb = GetTask(8)
	if (UTask_gb < 10*256) then	-- 未入门
		Say("你现在未加入门派，如果想入门，只需要找到本门接引弟子，在新布其村，记住"..UTask_gb..".",4,"继续了解目前任务/T_enroll","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_gb >= 10*256) and (UTask_gb < 20*256) then
		Say("目前你的任务是买酒, 已记住 "..UTask_gb..".",4,"继续了解目前任务/T_L10","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_gb >= 20*256) and (UTask_gb < 30*256) then
		Say("目前你的任务是教训孟远才, 已记住"..UTask_gb..".",4,"继续了解目前任务/T_L20","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_gb >= 30*256) and (UTask_gb < 40*256) then
		Say("目前你的任务是闹鬼风波, 已记住"..UTask_gb..".",4,"继续了解目前任务/T_L30","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_gb >= 40*256) and (UTask_gb < 50*256) then
		Say("目前你的任务是保卫张俊, 已记住"..UTask_gb..".",4,"继续了解目前任务/T_L40","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_gb >= 50*256) and (UTask_gb < 60*256) then
		Say("目前你的任务是中原地形图, 已记住"..UTask_gb..".",4,"继续了解目前任务/T_L50","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_gb >= 60*256) and (UTask_gb < 70*256) then
		Say("目前你的任务是出师 已记住"..UTask_gb..".",4,"继续了解目前任务/T_L60","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_gb >= 70*256) and (UTask_gb < 80*256) then
		Say("目前你的任务是重返师门, 已记住"..UTask_gb..".",4,"继续了解目前任务/T_return","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	else
		Say("现在你可以自由行走江湖，暂时没有任务, 已记住"..UTask_gb..".",3,"了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	end
end

function T_all()
	Say("想了解什么任务 ",10,"入门任务/T_enroll","任务买酒/T_L10","任务教训孟远才/T_L20","任务闹鬼风波/T_L30","任务保卫张俊/T_L40","任务中原地图/T_L50","任务出师/T_L60","任务重返师门/T_return","了解其他问题/main","不问了!/nothing")
end

function T_enroll()
	Talk(1,"t_all","想入门学武艺，只属火系，问家人其他门派，同时等级为10级以上，到布奇新手村和本派弟子对话。首先要完成入门任务，然后依次完成5个任务，将学到武功，封称号。完成出师任务后将艺成出师")
end

function T_L10()
	Talk(5,"t_all","入门级10级以上后，你可以接任务去交易酒，通过完成任务，你将升为执袋弟子，学到武功<color=blue> 丐帮棒法, 丐帮拳法<color>. ","第一步：到<color=blue> 帮主何人我处<color> 接任务买五种酒: 中泉 <color=red>, 金陵春, 百花酿,京华露，双驹大曲. <color>. ","第二步: 到<color=blue> 扬州酒楼<color> 买四种酒, <color> 但是 <color=red>还有中泉酒<color> 被醉半醒< color>买去了","第三步: 找<color=blue> 到醉半醒 <color>酒楼旁边<color=blue>. 答应他的要求, <color=blue>得到中泉酒","第四步： 返回 <color=blue> 丐帮 <color>, 见<color=blue>何人我 color>交五种酒<color=red>给他 <color>完成任务")
end

function T_L20()
	Talk(4,"t_all","在完成任务交易酒后，你的等级升为20. 你可以接任务教训孟远才. 去完成此任务, 你被封为执棒弟子，学到武功<color=blue>化剑微移<color>. ","第一步: 到 <color=blue> 守林村<color>找一位<color=blue>丐帮弟子<color>, 接任务教训<color=blue>孟远才<color>. ","第二步: 找到孟远才, 打败他.","第三步: 返回color=blue>丐帮<color>, 见<color=blue>孟苍浪<color>复命, 完成任务 ")
end

function T_L30()
	Talk(6,"t_all","在完成任务教训孟远才后， 你的等级升为 30, 你可以接任务闹鬼风波. 去完成此任务, 你被封为执棒弟子， 学到武功<color=blue>降龙掌; 打狗阵<color>. ","第一步: 见<color=blue>罗匡生<color>, 接任务，替他去<color=blue> 扬州见赵舵主<color>拿回<color=red> 他写的书color>. ","第二步: 到<color=blue>扬州四望亭<color>见到<color=blue>赵舵主color>, 原来这些天，赵舵主的弟子在color=blue>蜀岗山 <color>闹事","第三步: 去<color=blue> 蜀岗山<color>, 打败金人的 <color=blue> 伏兵<color>, 救了丐帮弟子<color=blue> <color>. ","第四步： 返回color=blue>见<color>赵舵主，他已写完, <color=red>书<color>, 让你带去给<color=blue>罗匡生<color>. ","第五步: 返回color=blue>丐帮<color>, 交<color=red>书<color> 给<color=blue>罗匡生<color>, 完成任务")
end

function T_L40()
	Talk(6,"t_all","在完成任务闹鬼风波后， 你的等级升为 40, 你可以接任务保卫张俊. 通过vi謈 完成此任务, 你被封为龙头弟子，学到武功<color=blue>活不留手color>. ","第一步:  找传功长老<color=blue>魏了翁<color>, 接任务消灭<color=blue>杀手color>金人<color=blue>埋伏在罗霄山<color>, 保卫<color=blue>张俊<color>安全","第二步: 到 <color=blue> 龙冠洞<color> 找到金军杀手并消灭<color=blue>埋伏的杀手<color>, 你一定要拿到<color=red>密函<color>. ","第三步: 返回丐帮<color=blue>见<color>魏子翁, 交<color=red> 密函<color> 给<color=blue>魏子翁<color>, 原来密函中记录了朝廷中与金人勾结的官员名字，要求把<color=red> 密函<color>交给 <color=blue>张俊<color>. ","第四步： 到 <color=blue> 扬州一个秘密旅馆<color>找张俊<color=blue> <color>, 交密函给他. ","第五步 : 返回<color=blue> 丐帮<color>, 见<color=blue> 魏了翁<color> 报信, 完成任务")
end

function T_L50()
	Talk(10,"t_all","在完成任务保卫张俊后， 你的等级升为50, 你可以接任务中原地图. 去完成此任务, 你被封为大龙头. 学到武功<color=blue> 棒打恶狗，亢龙有悔<color>. ","第一步: 见帮主color=blue>何人我color> 接任务带<color=red>中原地图<color>到<color=blue>临安<color> 交给朝廷","第二步: 在<color=blue>皇宫门前<color>, 被卫兵拦下，没有令牌，进不了皇宫","第三步: 找到 <color=blue> 张俊 <color>, 要求他借令牌<color=red>金皇宫<color>. ","第四步： 返回<color=blue>皇宫门前<color>, 在和侍卫对话后，进入皇宫，见到太监<color=blue>曹公公<color>, 交 <color=red>中原地图 <color> 给他","第五步: 返回 <color=blue> 去<color> 张俊处,发现曹公公已和金人勾结，地图已被骗走","第六步: 第三次返回 <color=blue> 皇宫门前 <color>, 此次，曹公公已先知道，有令牌也不能进皇宫. ","第七步：你要贿赂<color=blue> 小太监<color>, 再一次进入皇宫<color=blue> 在御花园的一个密道<color> 见到 <color=blue>曹公公<color>. 在打败侍卫后，夺回< color=red>中原地图<color>. ","第八步：返回 <color=blue> 见 <color>张俊, 把<color=red>b中原地图 <color>给他. ","第九步: 返回color=blue>丐帮<color>, 见<color=blue>何人我color>报信, 完成任务 ")
end

function T_L60()
	Talk(4,"t_all","完成任务中原地图后， 等级50以上, 你可以接任务出师 通过完成此任务, 你被封为逍遥神丐，顺利出师","第一步: 见掌钵长老<color=blue>佘三章<color> 接任务 <color=blue>祥云洞<color> 找<color=red>9个布袋<color>. ","第二步: 进<color=blue>祥云洞<color>找一个宝箱<color=blue>找到<color>, 9 个<color=red>布袋<color>. ","第三步: 返回<color=blue>丐帮 <color>, 交 <color=red> 9 个布袋<color>给掌钵长老<color=blue>佘三章, <color>, 完成任务")
end

function T_return()
	Talk(3,"t_all","通过重返师门, 你被封为9袋长老。学到正派绝学<color=blue>: 逍遥功和醉蝶诳舞<color>. ","第一步: 在你等级超过60级后，去见帮主<color=blue>何人我<color>, 申请返回丐帮 ","第二步: 通过捐<color=red>50000 两<color>, 返回丐帮 ")
end

----------------- 结束 ---------------------------
function nothing()
end
