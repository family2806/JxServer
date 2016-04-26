-- 五毒教帮助NPC
-- By: Dan_Deng(2003-12-06)

function main(sel)
	UTask_wu = GetTask(10)
	player_faction = GetFaction()
	if (player_faction == "shaolin") then		-- 本门弟子
		RestoreLife()		-- 本门免费治疗
		RestoreMana()
		RestoreStamina()
		Say("在本教要是一天不练功就活不下去.你到这找我有什么事?",4,"了解本教事务/faction","了解各位兄长/member","了解任务/task_get","不问了!/nothing")
	elseif (UTask_wu >= 70*256) then				-- 本门出师
		Say("从本教出去的人很少有回来的，你这次回来有什么事情?",4,"回忆下本门的往事/faction","看看以前的道友/member","有什么我能帮助的/task_get","不问了!/nothing")
	elseif (player_faction ~= "") then			-- 非本门出师、其它门派（门派不为空即指非新手）
		Say("你可以穿过虫虫毒物进去看来是奇才.本教尊重英才. 欢迎参观!",3,"了解贵派/faction","了解各位道长/member","不问了!/nothing")
	else													-- 新手
		Say("你来拜访还是拜师？如果眼前没有礼物的话我是没有兴趣的。",4,"了解贵派/faction","了解各位道长g/member","了解入门条件/task_get","不问了!/nothing")
	end
end

----------------- 门派介绍部份 ----------------------------
function faction()
	Say("这样你想我介绍门派的什么?",5,"门派起源/F1","地理位置/F2","江湖地位/F3","门派特色/F4","不问了!/nothing")
end

function F1()
	Say("本教是近几年成立的但是发展很快. 内部组织严密. 教主黑面郎君正是五毒教的创始人",2,"了解其他问题/main","不问了!/nothing")
end

function F2()
	Say("本教周围是5座灵峰, 想进去要经过虫虫试炼. ",2,"了解其他问题/main","不问了!/nothing")
end

function F3()
	Say("本教的宗旨是'利益决定敌友',有利就做, 不管什么是非正邪。五毒教还有一条就是'得罪五毒教的人将死无全尸'.",2,"了解其他问题/main","不问了!/nothing")
end

function F4()
	Say("本教行踪隐秘，来去无踪.路边的茶馆老板也可能是五毒的门徒，眨眼就把人杀了，下手无形。甚至对同门也是无情的。教徒之间也可能会相互下毒。中毒之人会被看不起",2,"了解其他问题/main","不问了!/nothing")
end

----------------- 成员介绍部份 ----------------------------
function member()
	Say("想要了解本教的谁?",10,"教主黑面郎君 /M01","金蛇香主云不邪/M02","赤蝎香主屠异/M03","墨蛛香主桑珠/M04","银蟾香主白莹莹/M05","青蜈香主汤弼 /M06","毒牙/M101","毒刺/M102","毒心/M103","不问了!/nothing")
end

function M01()
	Say("教主黑面郎君      位置:总营坐标:  220/166<enter>是个冷淡无情的人, 铁石心肠,没人看过他笑. 只关心研究各类毒药,想用毒统治武林.",2,"了解其他问题/main","不问了!/nothing")
end

function M02()
	Say("金蛇香主云不邪     位置:金蛇寨      位置:156/170<enter> 举止说话似女人，当他阴恻恻地笑的时候，就是他要杀人的时候。认为天底下最有乐趣的事情就是看见一个人因为中毒而痛苦无比的样子.",2,"了解其他问题/main","不问了!/nothing")
end

function M03()
	Say("赤蝎香主屠异 位置:赤蝎寨      坐标: 169/184<enter> 贪婪成性，昆仑派璇玑子暗害师父下的毒就是用钱财贿赂他以后得到的",2,"了解其他问题/main","不问了!/nothing")
end

function M04()
	Say("墨蛛香主桑珠",2,"了解其他问题/main","不问了!/nothing")
end

function M05()
	Say("银蟾香主白莹莹 位置：银蟾寨  坐标: 220/209<enter> 面如桃花，心似蛇蝎，脸上永远带着妖媚的笑容，但是下手却比谁都狠，与昆仑派朱缺相勾结，迷惑武当派徐中原.",2,"了解其他问题/main","不问了!/nothing")
end

function M06()
	Say("青蜈香主汤弼 位置：青蜈寨 坐标: 200/201<enter> 毒恶无耻，当年害死了翠烟门“水仙使者”嫣晓倩的母亲.",2,"了解其他问题/main","不问了!/nothing")
end

function M101()
	Say("毒牙      位置      坐标: 182/194      负责: 兵器交易",2,"了解其他问题/main","不问了!/nothing")
end

function M102()
	Say("毒刺      位置      坐标: 184/193      负责: 装备交易",2,"了解其他问题/main","不问了!/nothing")
end

function M103()
	Say("毒心     位置      坐标: 187/191      负责: 药品交易",2,"了解其他问题/main","不问了!/nothing")
end

----------------- 任务介绍部份 ----------------------------
function task_get()
	UTask_wu = GetTask(10)
	if (UTask_wu < 10*256) then	-- 未入门
		Say("你现在还未入门。想要入门, 可以去本门弟子接引的任何一个新手村.",4,"继续了解现在的任务/T_enroll","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_wu >= 10*256) and (UTask_wu < 20*256) then
		Say("你现在接的任务是蜘蛛和砒霜",4,"继续了解现在的任务/T_L10","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_wu >= 20*256) and (UTask_wu < 30*256) then
		Say("你现在接的任务是人头状.",4,"继续了解现在的任务/T_L20","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_wu >= 30*256) and (UTask_wu < 40*256) then
		Say("你现在接的任务是木香鼎.",4,"继续了解现在的任务/T_L30","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_wu >= 40*256) and (UTask_wu < 50*256) then
		Say("你现在接的任务是眼镜王蟒蛇",4,"继续了解现在的任务/T_L40","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_wu >= 50*256) and (UTask_wu < 60*256) then
		Say("你现在接的任务是玉珊瑚",4,"继续了解现在的任务/T_L50","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_wu >= 60*256) and (UTask_wu < 70*256) then
		Say("你现在接的任务是避毒珠.",4,"继续了解现在的任务/T_L60","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	elseif (UTask_wu >= 70*256) and (UTask_wu < 80*256) then
		Say("你现在接的任务是重返师门.",4,"继续了解现在的任务/T_return","了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	else
		Say("你可以自由进出门派,暂时没有新任务.",3,"了解别的任务/T_all","了解其他问题/main","不问了!/nothing")
	end
end

function T_all()
	Say("想了解什么任务",10,"入门任务/T_enroll","蜘蛛和砒霜任务/T_L10","人头状任务 /T_L20","木香鼎任务/T_L30","眼镜王蟒蛇任务/T_L40","玉珊瑚任务/T_L50","避毒珠任务/T_L60","重返师门任务/T_return","了解其他问题/main","不问了!/nothing")
end

function T_enroll()
	Talk(1,"t_all","如果入门学艺，只需要属于木系和到10级。到任何一个新手村见本门接引弟子就可以。之后依次完成门派的5个任务。将学会武功得到名号。完成出师任务之后将成业出师")
end

function T_L10()
	Talk(5,"t_all","入门之后等级达到10级，你可以接蜘蛛和砒霜的任务。通过完成这个任务，你可以得到夺魂散人的称号，学到武功五毒刀法，五毒掌法","1: 到墨蛛寨遇到桑珠，抓十只蜘蛛，再去买10包砒霜给她练功","2: 到雁荡山上抓十只蜘蛛","3：到龙泉村的药店买十包砒霜","4：回到五毒教墨蛛寨交给桑珠，任务完成")
end

function T_L20()
	Talk(4,"t_all","完成蜘蛛和砒霜任务并且达到20级就可以接人头状任务。通过完成这个任务，可以获得催命使者的称号，学到武功赤炎蚀天，杂难药经","1: 在银蟾寨遇到白莹莹,接任务，去杀罗宵七鬼，拿回7个人头!","2: 来到罗霄山，打败罗宵七鬼","3: 回到银蟾寨找到白莹莹复命，完成任务")
end

function T_L30()
	Talk(6,"t_all","完成人头状任务并且达到30级,可以接木香鼎任务. 通过完成这个任务, 可以得到黑暗阎罗的称号, 学得武功幽冥骷髅，无形蛊，百毒穿心，冰蓝玄晶","1: 在赤蝎寨见到屠异，接任务，找到叛徒拿回木香鼎.","2: 到武夷山,打败叛徒, 拿回木香鼎.","3: 返回赤血寨, 屠异发现木香鼎是假的，要去拿回真的木香鼎","4: 回到武夷山,打败叛徒头目,拿回真的木香鼎!","5: 回到赤血寨,把真的木香鼎交给屠异，完成任务。")
end

function T_L40()
	Talk(5,"t_all","完成木香鼎任务并且等级达到40级, 你可以接眼镜王蟒蛇任务，通过完成这个任务,你得到封号无恸罗刹, 学到武功万蛊蚀心, 穿衣破甲","1: 在金蛇寨见到云不邪，接受任务，到金蛇血潭捉一只眼镜王蟒蛇给云不邪","2: 到金蛇血潭之前要到药店买麝香","3: 进入金蛇血潭，打败眼镜王蟒蛇","4: 返回金蛇寨, 把眼镜王蟒蛇交给云不邪，完成任务")
end

function T_L50()
	Talk(6,"t_all","完成眼镜王蟒蛇任务同时达到90级, 你可以接玉珊瑚任务，通过完成这个任务,你得到封号蛊毒尊者，学到武功穿心毒刺","1: 在青蜈寨见到汤弼, 接受任务，夺回玉珊瑚","2: 到武夷山, 进入玉华洞, 打败流寇, 得知玉珊瑚已被带到孽龙洞","3: 继续往孽龙洞，打败强盗，拿到玉珊瑚","4: 回到五毒教青蜈寨，将玉珊瑚交给汤弼，任务完成")
end

function T_L60()
	Talk(5,"t_all","完成玉珊瑚任务同时达到50级, 你可以接避毒珠. 通过完成这个任务,你得到封号幽冥鬼使，顺利出师","1: 去总寨找教主黑面郎君, 接受任务从雁荡派手中夺回避毒珠","2: 到雁荡山，进入羊角洞打败无数雁荡派弟子，最终掌门也坐不住交手了","3: 打败雁荡派掌门，拿回避毒珠.","4: 返回总寨，交避毒珠给黑面郎君，完成任务")
end

function T_return()
	Talk(3,"t_all","通过重返师门，你获得幽冥鬼王的称号，学到五毒奇经，天罡地煞，终极清明","1: 达到60级之后,到总寨见黑面郎君教主, 请重返五毒教","2: 送给门派50000两, 重返五毒教")
end

----------------- 结束 ---------------------------
function nothing()
end
