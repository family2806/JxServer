--天王帮帮助NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "文书"

function main(sel)

UTask_tw = GetTask(3)

if (UTask_tw < 10*256) then						--未接天王帮入门任务，未入天王帮
	if (GetFaction() ~= "") then				--如果玩家已经属于另一门派
		Say("文书：有啥问题不明白的，问俺准没错！", 3, "了解贵帮/org", "了解各位好汉/member", "了解此地布局/config")
		return
	else
		Say("文书：有啥问题不明白的，问俺准没错！", 4, "了解贵帮/org", "了解各位好汉/member", "了解此地布局/config", "如何入门/task1")
		return	
	end
end;
	
if (UTask_tw == 70*256) then					--天王帮已经出师		
	Say("文书：原来是以前的帮中兄弟，有什么事吗？", 4, "重新了解天王帮/org", "重新了解以前帮中兄弟/member", "重新回顾此地布局/config", "还有什么任务可做/task2")
	return
end;	

Say("文书：有啥问题不明白的，问俺准没错！", 4, "了解本帮/org", "了解同门/member", "了解此地布局/config", "了解任务/task3")

end;

----------------------------------------------------------------------------------------------

function org()
Say("文书：想了解哪方面？", 4, "门派起源/o1", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;


function member()
Say("文书：想了解谁？", 14, "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;


function config()
Say("文书：想了解哪方面？", 6, "通往何地/c1",  "岛中央/c2", "岛东/c3", "岛南/c4", "岛西/c5", "岛北/c6")
end;


function task1()
Say("文书：本门只收金系男弟子。想要入门学艺，可以通过和巴陵县的天王将领对话完成入门。")
end;


function task2()
Say("文书：你已出师，不必再做本帮任务了。", 0)
end;


function task3()

UTask_tw = GetTask(3)

if (UTask_tw < 10*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "入门任务/v1")
end;

if (UTask_tw == 10*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前已入门，接下来可以做的是：", 1, "鸡血石任务/v2")
end;

if (UTask_tw > 10*256) and (UTask_tw < 20*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "鸡血石任务/v2")
end;

if (UTask_tw == 20*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "白水洞任务/v3")
end;

if (UTask_tw > 20*256) and (UTask_tw < 30*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "白水洞任务/v3")
end;

if (UTask_tw == 30*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "天王令任务/v4")
end;

if (UTask_tw > 30*256) and (UTask_tw < 40*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "天王令任务/v4")
end;

if (UTask_tw == 40*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "解毒药任务/v5")
end;

if (UTask_tw > 40*256) and (UTask_tw < 50*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "解毒药任务/v5")
end;

if (UTask_tw == 50*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "水怪任务/v6")
end;

if (UTask_tw > 50*256) and (UTask_tw < 60*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "水怪任务/v6")
end;

if (UTask_tw == 60*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "出师任务/v7")
end;

if (UTask_tw > 60*256) and (UTask_tw < 70*256) then	
Say("文书：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "出师任务/v7")
end;

if (UTask_tw >= 70*256) and (UTask_tw < 80*256) then	
Say("<#> 想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是重返师门，现已 "..UTask_tw.."<#>.", 1, "重返师门v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("文书：昔日楚王钟相在洞庭湖起兵，南抗赵宋，北抵金兵。后来楚王被杀，义军推举杨幺为领袖，即大圣天王。义军发展迅猛，朝廷派兵镇压，义军溃败，天王被俘后惨遭杀害。天王之女杨瑛回到洞庭湖后，重新聚集散落四处的弟兄，组织了天王帮。", 4, "知道了/ok", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;

function o2()
Say("文书：天王岛乃是位于洞庭湖心的一个孤岛，既是当年义军的基地，也是如今本帮的总坛所在。", 4, "知道了/ok", "门派起源/o1", "江湖地位/o3", "门派特色/o4")
end;

function o3()
Say("文书：本帮在两湖一带威名极盛，人多势众，正邪两派都不敢对本帮小觑，因为本帮既反金兵、又反宋廷，所以宋金两廷对本帮是又怕又恨。", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "门派特色/o4")
end;

function o4()
Say("文书：本帮是一个十分团结的江湖大帮，帮中兄弟豪气冲天，极重义气，个个都是好汉。", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "江湖地位/o3")
end;

--------------------------------

function m1()
Say("位置：<color=blue>寝宫<color>    坐标：<color=blue>201,199<color>    作用：<color=blue>任务<color><enter>虽然身为女子，但是性格豪爽，武艺高强，果敢坚毅，胆识过人，巾帼不让须眉，天王帮在她的带领下，日渐兴盛。", 14, "知道了/ok", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m2()
Say("位置：<color=blue>天王大殿<color>    坐标：<color=blue>200,199<color>    作用：<color=blue>任务<color><enter>一位慈祥可亲的长者，对帮主杨瑛就像对亲生女儿一样疼惜，对帮中兄弟也十分爱护，在义军中得高望重。", 14, "知道了/ok", "帮主杨瑛/m1", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m3()
Say("位置：<color=blue>号令台东侧<color>    坐标：<color=blue>209,196<color>    作用：<color=blue>任务<color><enter>老成持重，为人谨慎，忠厚寡言。", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m4()
Say("位置：<color=blue>前殿<color>    坐标：<color=blue>200,199<color>    作用：<color=blue>任务<color><enter>人称“义公明”，为人性情耿直，嫉恶如仇，极重义气，光明磊落，爱憎分明，对杨瑛忠心耿耿。", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m5()
Say("位置：<color=blue>西偏殿门口<color>    坐标：<color=blue>202,193<color>    作用：<color=blue>任务<color><enter>人称“八面神”，为人争强好胜，处事八面玲珑。", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m6()
Say("位置：<color=blue>东偏殿门口<color>    坐标：<color=blue>218,198<color>    作用：<color=blue>任务<color><enter>人称“九窍灵狐”，人品潇洒俊逸，智谋过人，深明大义。", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m7()
Say("位置：<color=blue>水寨入口<color>    坐标：<color=blue>191,210<color>    作用：<color=blue>任务<color><enter>粗豪汉子，性情中人。", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m8()
Say("位置：<color=blue>号令台广场<color>    坐标：<color=blue>207,193<color>    作用：<color=blue>兵器交易<color>", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m9()
Say("位置：<color=blue>号令台广场<color>    坐标：<color=blue>205,194<color>    作用：<color=blue>装备交易<color>", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m10()
Say("位置：<color=blue>号令台广场<color>    坐标：<color=blue>212,195<color>    作用：<color=blue>药品交易<color>", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m11()
Say("位置：<color=blue>东边码头<color>    坐标：<color=blue>218,210<color>    作用：<color=blue>交通<color>", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "南边码头的船夫/m12", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m12()
Say("位置：<color=blue>南边码头<color>    坐标：<color=blue>176,216<color>    作用：<color=blue>交通<color>", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "西边码头的船夫/m13", "北边码头的船夫/m14")
end;

function m13()
Say("位置：<color=blue>西边码头<color>    坐标：<color=blue>183,189<color>    作用：<color=blue>交通<color>", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "北边码头的船夫/m14")
end;

function m14()
Say("位置：<color=blue>北边码头<color>    坐标：<color=blue>241,181<color>    作用：<color=blue>交通<color>", 14, "知道了/ok", "帮主杨瑛/m1", "天护法路云远/m2", "地护法夏诚/m3", "前使王佐/m4", "左使古柏/m5", "右使杨湖/m6", "孙道领/m7", "卖兵器的帮众/m8", "卖装备的帮众/m9", "卖药的帮众/m10", "东边码头的船夫/m11", "南边码头的船夫/m12", "西边码头的船夫/m13")
end;

--------------------------------

function c1()
Say("文书：没有陆路出口，在码头坐船可以到达巴陵县。", 6, "知道了/ok", "岛中央/c2", "岛东/c3", "岛南/c4", "岛西/c5", "岛北/c6")
end;

function c2()
Say("文书：天王帮总坛依次有前殿、号令台、天王大殿、寝宫等建筑。", 6, "知道了/ok", "通往何地/c1", "岛东/c3", "岛南/c4", "岛西/c5", "岛北/c6")
end;

function c3()
Say("文书：有码头和洞庭湖底山洞。", 6, "知道了/ok", "通往何地/c1", "岛中央/c2", "岛南/c4", "岛西/c5", "岛北/c6")
end;

function c4()
Say("文书：有码头和水寨。", 6, "知道了/ok", "通往何地/c1", "岛中央/c2", "岛东/c3", "岛西/c5", "岛北/c6")
end;

function c5()
Say("文书：有码头。", 6, "知道了/ok", "通往何地/c1", "岛中央/c2", "岛东/c3", "岛南/c4", "岛北/c6")
end;

function c6()
Say("文书：有码头和天王岛山洞。", 6, "知道了/ok", "通往何地/c1", "岛中央/c2", "岛东/c3", "岛南/c4", "岛西/c5")
end;

--------------------------------

function v1()							
Talk(6, "", "通过完成这个任务，你可以加入天王帮，成为<color=blue>侍卫<color>，学会武功<color=blue>斩龙诀<color>。<enter>第一步：在<color=blue>南边水寨入口<color>遇到<color=blue>孙道领<color>，接到任务，去<color=blue>巴陵县<color>买美酒<color=red>“蓬莱春”<color>。", "第二步：在<color=blue>巴陵县酒馆<color>接到任务，寻找酿酒所需的三种原料：<color=red>灵芝、玄参、何首乌<color>。", "第三步：到<color=blue>武陵山的东北部<color>捡拾<color=red>灵芝、玄参、何首乌<color>。", "第四步：回到<color=blue>巴陵县酒馆<color>，得知需要等待<color=blue>一个时辰<color>。一个时辰以后，回到酒馆得到<color=red>“蓬莱春”<color>。", "第五步：回到<color=blue>天王岛<color>，将<color=red>“蓬莱春”<color>交给<color=blue>孙道领<color>，任务完成。如果“蓬莱春”丢失，需要重新做任务。")
end;


function v2()
Talk(4, "", "通过完成这个任务，你升为<color=blue>侍卫长<color>，学会武功<color=blue>天王枪法、天王刀法、天王锤法、回风落雁<color>。<enter>第一步：在<color=blue>前殿<color>遇到<color=blue>王佐<color>，接到任务，去岛北边的<color=blue>天王岛山洞<color>得到<color=red>三块鸡血石<color>。", "第二步：在北边的<color=blue>天王岛山洞<color>，打败<color=blue>金猫王、猞猁精、大浣熊<color>，都会得到<color=red>鸡血石<color>。", "第三步：回到<color=blue>前殿<color>，将<color=red>三块鸡血石<color>交给<color=blue>王佐<color>，任务完成。")
end;


function v3()
Talk(4, "", "通过完成这个任务，你升为<color=blue>守寨悍将<color>，学会武功<color=blue>行云诀、无心斩、静心诀<color>。<enter>第一步：在<color=blue>东偏殿门口<color>遇到<color=blue>杨湖<color>，接到任务，去<color=blue>武陵山白水洞<color>灭匪。", "第二步：在<color=blue>武陵山白水洞<color>，依次打败三个", "第三步：")
end;


function v4()
Talk(4, "", "通过完成这个任务，你升为<color=blue>阶前护卫<color>，学会武功<color=blue>追心箭、青木功<color>。<enter>第一步：在<color=blue>祭祖厅<color>遇到<color=blue>唐不染<color>，接到任务，夺回<color=red>《火器谱》<color>。", "第二步：在<color=blue>青城山东白云洞<color>，打败绑匪<color=blue>大头目狂沙<color>，接到任务，在洞中找到打开宝箱的<color=red>钥匙<color>。", "第三步：打败绑匪中四个<color=blue>小头目独耳、铁臂、鬼影、厉拳<color>中的一个，会得到<color=red>钥匙<color>。", "第四步：打开<color=blue>宝箱（230,199）<color>，得到<color=red>《火器谱》<color>。", "第五步：回到<color=blue>火器房<color>，将<color=red>《火器谱》<color>交给<color=blue>唐云<color>，任务完成。如果《火器谱》丢失，必须重新做任务。")
end;


function v5()
Talk(7, "", "通过完成这个任务，你升为<color=blue>入阁弟子<color>，学会武功<color=blue>漫天花雨、淬毒术<color>。<enter>第一步：在<color=blue>医药房<color>遇到<color=blue>唐野<color>，接到任务，化解唐野与耿子奇的恩怨。", "第二步：到<color=blue>青城山西部<color>找到<color=blue>耿子奇（230,245）<color>，先打败他的五只家畜：一只<color=blue>灰狼<color>、一只<color=blue>猛虎<color>、一只<color=blue>金钱豹<color>、一只<color=blue>野猪<color>和一只<color=blue>棕熊<color>，然后接到任务，想办法救治耿子奇女儿的怪病。", "第三步：回到唐门<color=blue>医药房<color>，从<color=blue>唐野<color>处得到治疗怪病的<color=blue>药方<color>。", "第四步：在<color=blue>青城山东北<color>的<color=blue>青阳峰<color>，打败<color=blue>黑鹰、凶鹫、灵雕<color>，会得到五种药方：<color=red>蟾蜍的皮，毒蛇的胆、罂粟的壳、毒蝎的尾、僵蚕的头<color>。", "第五步：将药方交给耿子奇，化解他与唐野师叔的恩怨。", "第六步：回到唐门医药房，与唐野对话，任务完成。")
end;


function v6()
Talk(4, "", "通过完成这个任务，你升为<color=blue>四老门人<color>，学会武功<color=blue>冰魄寒光、天罗地网<color>。<enter>第一步：在<color=blue>暗器房<color>遇到<color=blue>唐闲<color>，接到任务，寻找<color=red>《暗器谱》<color>。", "第二步：在<color=blue>议事大厅<color>，与<color=blue>唐一尘<color>对话，得知<color=blue>三师兄唐禾<color>和<color=blue>五师兄唐元<color>去过暗器房，两人有嫌疑。", "第三步：在<color=blue>江津村<color>找到<color=blue>唐元<color>，得知<color=blue>唐禾<color>去了<color=blue>青城山响水洞<color>。", "第四步：到<color=blue>青城山响水洞<color>，打败<color=blue>唐禾<color>，得知<color=red>《暗器谱》<color>就藏在山洞里。", "第五步：打败山洞里的<color=blue>铁锤魔君<color>或<color=blue>铁拳阎罗<color>，会得到<color=red>《暗器谱》<color>。", "第六步：回到唐门<color=blue>暗器房<color>，将<color=red>《暗器谱》<color>交给<color=blue>唐闲<color>，任务完成。如果《暗器谱》丢失，必须重新回响水洞打过。")
end;


function v7()
Talk(5, "", "通过完成这个任务，你升为<color=blue>千手神卫<color>，顺利出师。<enter>第一步：在<color=blue>会客大厅<color>遇到<color=blue>掌门唐仇<color>，接到任务，去<color=blue>竹丝洞<color>取回<color=red>七星绝命剑<color>。", "第二步：在<color=blue>竹丝洞第一层<color>打败<color=blue>莽汉头领<color>，会得到进入第二层的<color=red>钥匙<color>。", "第三步：在<color=blue>竹丝洞第二层<color>打败<color=blue>莽汉头领<color>或<color=blue>点睛虎<color>，会得到进入第三层的<color=red>钥匙<color>。", "第四步：在<color=blue>竹丝洞第三层<color>，有两个<color=blue>宝箱<color>，其中一个里面有<color=red>七星绝命剑<color>。", "第五步：回到唐门<color=blue>会客大厅<color>，将<color=red>七星绝命剑<color>交给<color=blue>掌门唐仇<color>，任务完成。如果七星绝命剑丢失，必须重新做任务。")
end;

function v8()
Talk(3,"","通过完成这个任务，你升为<color=blue>惊天元帅<color>, 学到镇派绝学 <color=blue>天王战意, 武功: 无心斩，血战八方，御龙诀<color>.","第1步: 到60级以后，到<color=blue>大厅<color>见<color=blue>Bang ch? Dng A帮主杨瑛<color>, 请求重返天王帮.","第2步:送给门派 <color=red>50000两<color>重返天王帮.")
end;

--------------------------------

function ok()
end;
