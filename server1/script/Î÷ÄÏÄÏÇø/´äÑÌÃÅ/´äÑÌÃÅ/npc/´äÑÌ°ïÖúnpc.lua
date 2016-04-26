-- 翠烟帮助NPC
-- By: Dan_Deng(2003-11-21)

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "傲梅"
	
function main(sel)
	UTask_cy = GetTask(6)
	player_faction = GetFaction()
	if (player_faction == "cuiyan") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say(" 我一出生就被抛弃，幸亏掌门救我，18年在这里长大，这里的树木都熟悉了.",7,"与龙五对话 /Uworld1000_word","了解本门典故/faction","了解各位姐妹/member","了解任务 /task_get","了解练功特长/map_help","了解本门武艺/skill_help","不问了!/nothing")
	elseif (UTask_cy >= 70*256) then				-- 本门出师
		if (UTask_cy == 80*256) and (GetTask(1) == 70*256) and (HaveMagic(93) == -1) then		-- 修正翠烟重返门派后的一个BUG，技能标记为未学“慈航普渡”
			Talk(1,""," 师姐的心情有点乱，不用担心，现在好了!")
		else
			Say(" 师姐难得回来，这次来看姐妹们有什么事吗?",6,"回忆本门往事/faction","回忆以前的姐妹们/member","我还能帮什么吗？/task_get","了解练功特长/map_help","了解本门武艺/skill_help","不问了!/nothing")
		end
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say(" 请问你到翠烟门是探亲还是访友呢？有什么不懂就问我.",3,"了解贵派/faction","了解翠烟各位姐妹/member","不问了!/nothing")
	else													-- 新手
		Say(" 你来玩还是来拜师？",4,"了解贵派/faction","了解翠烟各位姐妹/member","了解入门条件/task_get","不问了!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say(" 那你想我介绍哪方面呢?",5,"门派起源/F1","地理位置/F2","江湖地位/F3","门派特色/F4","不问了!/nothing")
end

function F1()
	Say(" 创立门派的祖师由于被男人负情，所以，隐居在云南边境，一天在路上遇见几个被虐待的女子，就领养并传授武艺，翠烟门也因此而创立.",2,"了解其他问题/main","不问了!/nothing")
end

function F2()
	Say(" 这里坐落在大理洱海苍山，风景美丽.",2,"了解其他问题/main","不问了!/nothing")
end

function F3()
	Say(" 本派和唐门被称为武林二门，由于神秘而名震江湖，是男子的梦想之地。对于外人，没人知道翠烟是天堂还是地狱.",2,"了解其他问题/main","不问了!/nothing")
end

function F4()
	Say(" 由于本门弟子人人都是绝色佳人，所以，让很多男子都心动。因此，师祖定了帮规，为了保护翠烟弟子，凡是想进入翠烟的男子都要有绝世武功，并交出一件稀有珍宝，同时世代不能离开翠烟门.",2,"了解其他问题/main","不问了!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say(" 那你想了解谁呢?",11,"掌门尹含烟/Myun","海棠使者郦秋水/Mli","水仙使者嫣晓倩/Myan","蔷薇使者何暮雪 /Mhe","梨花使者钟灵秀 /Mzhong","春香婆婆 /Mchun","若兰/Mruo","风竹/Mfeng","笑菊/Mxiao","傲梅/Mao","不问了!/nothing")
end

function Myun()
	Say("掌门尹含烟   位置：翠烟楼   坐标: 35,75<enter> 自幼在翠烟门中长大，认识了唐门唐一尘，使她爱上了他。两人克服重重困难，终于走到了一起，之后唐门和翠烟门共同进退，结成了同盟.",2,"了解其他问题/main","不问了!/nothing")

end

function Mli()
	Say("海棠使者郦秋水<enter> 性格高傲，瞧不起天下一切男人，有些蛮横不讲道理。因为反对尹含烟与唐一尘相爱.",2,"了解其他问题/main","不问了!/nothing")
end

function Myan()
	Say("水仙使者嫣晓倩, 位置：守玉亭, 坐标: 43, 90<enter>外表文弱，内心却十分坚强。幼年时其母被其父遗弃，贫病交加，被人欺辱而死. ",2,"了解其他问题/main","不问了!/nothing")
end

function Mhe()
	Say("蔷薇使者何暮雪. 位置：百花亭. 坐标: 52, 85<enter>性格温柔乖巧，爱上了天王帮右使杨湖，但是两人年龄相差悬殊（杨湖比何暮雪大许多），杨湖虽然也爱她，但是杨湖不愿放弃天王帮，终其一生留在翠烟门，儿女私情和事业放在一起，杨湖选择了后者，于是杨湖成了何暮雪心中永远的隐痛。. ",2,"了解其他问题/main","不问了!/nothing")
end

function Mzhong()
	Say("梨花使者钟灵秀enter>年纪最小，但是最有前途。父母被金人所害，家破人亡，所以深恨金人",2,"了解其他问题/main","不问了!/nothing")
end

function Mchun()
	Say("春香婆婆  位置：后花园   坐标: 40,74<enter> 春香婆婆是掌门的丫鬟，她对我们特别亲切.",2,"了解其他问题/main","不问了!/nothing")
end

function Mruo()
	Say("若兰  位置：广场   坐标: 48,84  负责: 交易兵器",2,"了解其他问题/main","不问了!/nothing")
end

function Mfeng()
	Say("风竹   位置：广场   坐标: 51,85   负责: 交易装备 ",2,"了解其他问题/main","不问了!/nothing")
end

function Mxiao()
	Say("笑桃   位置：广场   坐标: 53,86   负责: 交易药品",2,"了解其他问题/main","不问了!/nothing")
end

function Mao()
	Say("傲梅   就是我! ",2,"了解其他问题/main","不问了!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_cy = GetTask(6)
	if (UTask_cy < 10*256) then	-- 未入门
		Say("<#> 你目前正在接的任务是大曼陀罗花, 现在已经"..UTask_cy.."<#>.",4,"继续了解目前的任务/T_enroll","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_cy >= 10*256) and (UTask_cy < 20*256) then
		Say("<#> 你目前的任务是翠雨簪 , 现在已经"..UTask_cy.."<#>.",4,"继续了解目前的任务/T_L10","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_cy >= 20*256) and (UTask_cy < 30*256) then
		Say("<#> 你目前正在接的任务是大曼陀罗花, 现在已经"..UTask_cy.."<#>.",4,"继续了解目前的任务/T_L20","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_cy >= 30*256) and (UTask_cy < 40*256) then
		Say("<#> 你目前的任务是舞衣霓裳. 现在已经 "..UTask_cy.."<#>.",4,"继续了解目前的任务/T_L30","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_cy >= 40*256) and (UTask_cy < 50*256) then
		Say("<#> 你目前正在接的任务是消灭恶霸点苍山, 现在已经"..UTask_cy.."<#>.",4,"继续了解目前的任务/T_L40","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_cy >= 50*256) and (UTask_cy < 60*256) then
		Say("<#> 你目前正在接的任务是抓天蚕塔小偷, 现在已经"..UTask_cy.."<#>.",4,"继续了解目前的任务/T_L50","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_cy >= 60*256) and (UTask_cy < 70*256) then
		Say("<#> 你目前正在接的任务是禁地迷宫秘密, 现在已经"..UTask_cy.."<#>.",4,"继续了解目前的任务/T_L60","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_cy >= 70*256) and (UTask_cy < 80*256) then
		Say("<#> 你目前正在接的任务是重返师门, 现在已经"..UTask_cy.."<#>.",4,"继续了解目前的任务/T_return","了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	else
		Say("<#> 你现在可以自由进出门派，暂时没有心的任务, 现在已经"..UTask_cy.."<#>.",3,"了解其他任务/T_all","了解其他问题/main","不问了!/nothing")
	end
end

function T_all()
	Say(" 你想了解什么任务? ",10,"入门任务/T_enroll","任务翠雨簪/T_L10","任务大曼陀罗花/T_L20","任务舞衣霓裳/T_L30","任务消除点苍山恶霸 /T_L40","任务抓天蚕塔小偷/T_L50","任务禁地迷宫/T_L60","任务重返师门/T_return","了解其他问题/main","不问了!/nothing")
end

function T_enroll()
	Talk(1,"t_all","想入门学武艺，只需要属性为水系，未加入其他门派，等级10级以上，到布奇新手村和本门花使对话。然后，依次完成5个门派任务，将学到武功，封称号。完成出师任务后，将艺成出师。")
end

function T_L10()
	Talk(4,"t_all","入门后，等级10级以上, 你可以接任务翠雨簪. 完成此任务，你升为三品花使，学到 <color=blue>翠烟刀法和翠烟双刀<color>. ","第一步:  在<color=blue>翠烟楼<color> 见 <color=blue>掌门尹含烟<color> 接任务去 <color=blue>东南边树林<color> 找 <color=red> 翠雨簪<color> . ","第2步: 在东南边树林打败<color=blue>火狐 color> 拿回 <color=red> 翠雨簪<color> ","第3步: 回去 <color=blue>翠烟楼<color> 向掌门复命<color=blue>尹含烟<color>, 交 <color=red> 翠雨簪<color> 任务完成")
end

function T_L20()
	Talk(4,"t_all","完成任务翠烟簪后，等级20以上, 你可以接任务大曼陀罗花. 完成此任务你将升为<color=blue>二品护花使color>, 学到 <color=red>冰心左影<color> ","第一步: 在 <color=blue>守玉亭<color>, 见<color=blue>嫣晓倩<color> 接任务去 <color=blue>西北边<color> 摘<color=red>10 株大曼陀罗花<color> ","第2步: 摘花时要小心<color=blue>毒性发作前<color> 需要回去<color=blue>守玉亭<color> 解毒，否则，毒性发散到全身","第3步: 摘到10株大曼陀罗花, 回守玉亭复命, 完成任务")
end

function T_L30()
	Talk(7,"t_all","Sau khi 完成任务大曼陀罗花 和等级30, 你可以接任务舞衣霓裳. 完成此任务你将升为一品花使，并学到<color=blue>雾打梨花<color>. ","第一步: 在<color=blue>百花厅<color>, 见<color=blue>何暮雪<color> 接任务去 <color=blue>段老农<color> 在 <color=blue> 大理color> t了解种<color=blue> 舞衣霓裳<color>的秘密 ","第2步: 去大理段老农处发现他伤心，因为侄女被 <color=blue>点苍山<color> 的强盗抓了, 就去救 <color=blue>她<color> . ","第3步: 到 <color=blue>点苍山土匪洞<color>, 打败 <color=blue>土匪首领color>, 救出侄女. ","第4步: 知道种舞衣霓裳需要有<color=blue>银鳕鱼<color> 生长在 <color=blue>洱海<color>, <color=red>碧常凤蝶<color> 在<color=blue>蝴蝶泉旁边<color>, 和<color=red>红蚯蚓<color> 在 <color=blue>云农亭附近<color>. ","第5步:到洱海找<color=blue>船家<color> 买 <color=red>银鳕鱼<color>, 到蝴蝶泉拿碧常凤蝶，在农云亭挖蚯蚓","第6步: 去 <color=blue>百花殿<color> 拿种舞衣霓裳的秘籍, 告诉 <color=blue>何暮雪<color>, 同时，拿银鳕鱼，碧常凤蝶和红蚯蚓给她, 完成. ")
end

function T_L40()
	Talk(5,"t_all","完成任务同时等级到达40级, 你可以接任务除点苍山恶霸. 完成此任务你将升为花仙使者，学到 <color=blue>寒冰护身 <color> ","第一步: 见<color=blue>嫣晓倩<color> 在<color=blue>天殿<color>, 接任务消除<color=blue>恶霸 color> 在 <color=blue>大理color> ","第2步: 到大理找 <color=blue>恶霸<color>, 发现一条<color=blue>路<color> 进入密道打败 <color=blue>他的助手<color>, 解救密道里的少女，同时知道恶霸抓了几个姑娘上<color=blue>点苍山 <color> . ","第3步: 到 <color=blue>点苍山 <color>, 打败 <color=blue>助手，护院，保镖<color>, 拿到 <color=red>3 把钥匙<color>, 救出<color=blue> 少女 color> . ","第4步: 回到<color=blue>峨眉天殿<color>, 见嫣晓倩复命, 完成. ")
end

function T_L50()
	Talk(5,"t_all","完成任务点苍山任务，且等级达到50级以上, 你可以接任务天蚕塔. 完成此任务你将升为花精, 学到 <color=blue>雪影<color> ","第一步: 见<color=blue>掌门尹含烟<color> 在 <color=blue>翠烟楼<color>, 接任务，帮助崇圣寺抓<color=blue> 盗贼<color> 盗走了<color=red>梧桐观音<color> ","第2步: 到 <color=blue>崇圣寺color> 和<color=blue>虚圆方丈对话<color>, 进入天蚕塔，知道盗贼进入了 <color=blue>天蚕塔<color>. ","第3步: 进入天蚕塔，每层楼都要打败盗贼，夺回<color=red>梧桐观音<color>. ","第4步: 回去 <color=blue>翠烟楼<color>, 见尹含烟复命, 完成. ")
end

function T_L60()
	Talk(6,"t_all","完成任务天蚕塔后，等级达到50级, 你可以继续接禁地迷宫任务. 完成任务后，你被封为花仙，顺利出师","第一步: 见<color=blue>春香婆婆color> 在<color=blue>后花园<color>, 接任务去 <color=blue>禁地<color>找出门规事实. ","第2步: 首先在 <color=blue>禁地迷宫<color> 找到一块<color=red>丝帕<color>, 然后进入禁地最后是<color=blue>断肠谷<color> ","第3步: 和一位<color=blue>无名老者对话<color> 听他说立派师祖的事，获得<color=red>一封信color> 记录所有事情","第4步: 返回<color=blue>后花园后<color>, 和春香婆婆说找到的东西. ","第5步: 到<color=blue>翠烟楼<color> 带 <color=red>信color> 交给<color=blue>掌门<color>, 任务完成")
end

function T_return()
	Talk(3,"t_all","成才下山后，同时等级达到60级，你可以重返师门. 将升为花神，学到绝学<color=blue>牧野流星, 碧海潮生，冰骨雪心<color> ","第一步: 等级超过60级后，见<color=blue>尹含烟<color> 在<color=blue> 正室<color>, 请她返回翠烟","第2步: 交 <color=red>50000 两<color>, 返回翠烟")
end

----------------- 结束 ---------------------------
function nothing()
end
