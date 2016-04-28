--唐门帮助NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "Qu秐 Gia"

function main(sel)

UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then						--未接唐门入门任务，未入唐门
	if (GetFaction() ~= "") then				--如果玩家已经属于另一门派
		Say("管家：我在唐门几十年了，没有什么是我不知道的，您想知道些什么？", 3, "了解贵门/org", "了解各位唐门高手/member", "了解此地布局/config")
		return
	else
		Say("管家：我在唐门几十年了，没有什么是我不知道的，您想知道些什么？", 4, "了解贵门/org", "了解各位唐门高手/member", "了解此地布局/config", "如何入门/task1")
		return	
	end
end;
	
if (UTask_tm == 70*256) then					--唐门已经出师		
	Say("管家：原来是以前的同门，有什么事吗？", 4, "重新了解唐门/org", "重新了解以前的同门/member", "重新回顾此地布局/config", "还有什么任务可做/task2")
	return
end;	

Say("管家：我在唐门几十年了，没有什么是我不知道的，你想知道些什么？", 4, "了解本门/org", "了解同门/member", "了解此地布局/config", "了解任务/task3")

end;

----------------------------------------------------------------------------------------------

function org()
Say("管家：想了解哪方面？", 4, "门派起源/o1", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;


function member()
Say("管家：想了解谁？", 10, "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;


function config()
Say("管家：想了解哪方面？", 3, "通往何地/c1",  "唐家堡/c2", "唐家堡四周/c3")
end;


function task1()
Say("管家：本门只收木系弟子，男女不限。想要入门学艺，可以通过和巴陵县的唐门弟子对话完成入门。")
end;


function task2()
Say("管家：你已出师，不必再做本门任务了。", 0)
end;


function task3()

UTask_tm = GetTask(2)

if (UTask_tm < 10*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "入门任务/v1")
end;

if (UTask_tm == 10*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前已入门，接下来可以做的是：", 1, "魔雨针任务/v2")
end;

if (UTask_tm > 10*256) and (UTask_tm < 20*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "魔雨针任务/v2")
end;

if (UTask_tm == 20*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "唐幽任务/v3")
end;

if (UTask_tm > 20*256) and (UTask_tm < 30*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "唐幽任务/v3")
end;

if (UTask_tm == 30*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "火器谱任务/v4")
end;

if (UTask_tm > 30*256) and (UTask_tm < 40*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "火器谱任务/v4")
end;

if (UTask_tm == 40*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "耿子奇任务/v5")
end;

if (UTask_tm > 40*256) and (UTask_tm < 50*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "耿子奇任务/v5")
end;

if (UTask_tm == 50*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "暗器谱任务/v6")
end;

if (UTask_tm > 50*256) and (UTask_tm < 60*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "暗器谱任务/v6")
end;

if (UTask_tm == 60*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "出师任务/v7")
end;

if (UTask_tm > 60*256) and (UTask_tm < 70*256) then	
Say("管家：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "出师任务/v7")
end;

if (UTask_tm >= 70*256) and (UTask_tm < 80*256) then	
Say("<#> 想入门学艺，需要完成入门任务，入门后，依次完成5任务，将学到武功，封称号。完成出师任务就能出师，目前已经"..UTask_tm.."<#>, 进行的任务为:", 1, "重返师门/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("管家：在外人眼中，本门是一个神秘的武林家族，以暗器和火器威震天下，行走江湖已达数百年之久。", 4, "知道了/ok", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;

function o2()
Say("管家：本门位于蜀南竹海之中，表面虽然清幽宁静，但实际却机关重重，居心叵测者定叫他有去无回！", 4, "知道了/ok", "门派起源/o1", "江湖地位/o3", "门派特色/o4")
end;

function o3()
Say("管家：本门与云南翠烟门并称“武林二门”，是一个亦正亦邪的门派，门下暗器、火器、医药、武功四堂，弟子个个功夫了得，江湖中人谈本门而色变。", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "门派特色/o4")
end;

function o4()
Say("管家：本门中人行事诡秘，遇事不按常理出牌，总给人一种亦正亦邪、琢磨不透的感觉。", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "江湖地位/o3")
end;

--------------------------------

function m1()
Say("位置：<color=blue>会客大厅<color>    坐标：<color=blue>202,199<color>    作用：<color=blue>任务<color><enter>心高气傲，为我独尊。虽然性情怪癖，十分固执，但是却具有泰山崩于前而面不改色的气度。", 10, "知道了/ok", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;

function m2()
Say("位置：<color=blue>暗器房<color>    坐标：<color=blue>199,200<color>    作用：<color=blue>任务<color><enter>暗器房长老，制作的暗器技艺高绝，匪夷所思，因此十分自傲。性格深沉、喜怒不形于色。", 10, "知道了/ok", "掌门唐仇/m1", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;

function m3()
Say("位置：<color=blue>火器房<color>    坐标：<color=blue>200,200<color>    作用：<color=blue>任务<color><enter>火器房长老，制造的火器威力极猛，令武林中人闻风丧胆。性情火爆，但是却不失赤子之心，后因儿子惨死，性情大变。", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;

function m4()
Say("位置：<color=blue>医药房<color>    坐标：<color=blue>200,200<color>    作用：<color=blue>任务<color><enter>医药房长老，精于医术、毒术。为人性格怪僻、又很固执。", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;

function m5()
Say("位置：<color=blue>武功房<color>    坐标：<color=blue>200,200<color>    作用：<color=blue>任务<color><enter>武功房长老，一位儒雅温和的长辈，虽然排在唐门四老之末，但是总相信唐门的武功有一天会和暗器一样闻名江湖。", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;

function m6()
Say("位置：<color=blue>议事大厅<color>    坐标：<color=blue>199,200<color>    作用：<color=blue>任务<color><enter>唐仇长子，成熟稳重，敏学多思，言语不多，眼神中总含有一抹忧郁的神色。", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐不染/m7", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;

function m7()
Say("位置：<color=blue>祭祖厅<color>    坐标：<color=blue>199,199<color>    作用：<color=blue>任务<color><enter>唐仇次子，性情豪放，心地纯良。", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐缺/m8", "唐轻/m9", "唐毒/m10")
end;

function m8()
Say("位置：<color=blue>广场<color>    坐标：<color=blue>508,323<color>    作用：<color=blue>兵器交易<color>", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐轻/m9", "唐毒/m10")
end;

function m9()
Say("位置：<color=blue>广场<color>    坐标：<color=blue>506,322<color>    作用：<color=blue>装备交易<color>", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐毒/m10")
end;

function m10()
Say("位置：<color=blue>广场<color>    坐标：<color=blue>504,322<color>    作用：<color=blue>药品交易<color>", 10, "知道了/ok", "掌门唐仇/m1", "追魂叟唐闲/m2", "焦髯叟唐云/m3", "绝春叟唐野/m4", "白袍叟唐鹤/m5", "唐一尘/m6", "唐不染/m7", "唐缺/m8", "唐轻/m9")
end;

--------------------------------

function c1()
Say("管家：南边有一个路口，通往成都。", 3, "知道了/ok", "唐家堡/c2", "唐家堡四周/c3")
end;

function c2()
Say("管家：中轴线：从南至北依次是会客大厅、正房、祭祖厅，可以进入。<enter>东边：从南至北依次是火器房、医药房，可以进入。<enter>西边：有议事厅、暗器房、武功房等建筑，可以进入。", 3, "知道了/ok", "通往何地/c1", "唐家堡四周/c3")
end;

function c3()
Say("管家：前门（南门）通往竹海三关。<enter>东门通往竹丝洞。<enter>西门通往翡翠湖。<enter>后门（北门）通往无心谷。", 3, "知道了/ok", "通往何地/c1", "唐家堡/c2")
end;

--------------------------------

function v1()							
Talk(6, "", "通过完成这个任务，你可以加入唐门，成为<color=blue>杂役<color>，学会武功<color=blue>霹雳弹<color>。<enter>第一步：在<color=blue>竹海三关入口<color>遇到一个<color=blue>唐门庄丁（453,358）<color>，接到任务，闯竹海三关。", "第二步：在第一关里打败<color=blue>大马猴<color>，得到<color=red>青色竹杖<color>。", "第三步：在第二关里回答<color=blue>唐门庄丁（468,350）<color>关于九宫图的问题，得到<color=red>白色竹杖<color>。打败第二关里的<color=blue>大马猴、大野猴<color>会得到答案。", "第四步：在第三关里回答<color=blue>唐门庄丁（473,343）<color>关于八卦的大问题，得到<color=red>紫色竹杖<color>。打败第三关里的<color=blue>大马猴、大野猴、大黑叶猴<color>会得到答案。", "第五步：在<color=blue>竹海三关出口<color>，将三柄竹杖交给<color=blue>唐门庄丁（479,339）<color>，任务完成。")
end;


function v2()
Talk(7, "", "通过完成这个任务，你升为<color=blue>庄丁<color>，学会武功<color=blue>唐门暗器、唐门刀法<color>。<enter>第一步：在<color=blue>武功房<color>遇到<color=blue>唐鹤<color>，接到任务，去<color=blue>成都<color>寻找<color=red>魔雨针<color>。", "第二步：在<color=blue>成都<color>，从<color=blue>卖蜀绣的梅娘（389,315）<color>处得知蜀绣名家孙婉针发精湛，提示玩家去找<color=blue>孙婉<color>。", "第三步：在成都东南芙蓉茶舍附近的一间民居里找到<color=blue>孙婉（394,323）<color>，接到任务，用<color=red>玛瑙戒指<color>换魔雨针。", "第四步：在成都<color=blue>杂货店<color>买到<color=red>玛瑙戒指<color>。", "第五步：回到孙婉家，把玛瑙戒指交给她，得到<color=red>魔雨针<color>。", "第六步：回到唐门<color=blue>武功房<color>，将<color=red>魔雨针<color>交给<color=blue>唐鹤<color>，任务完成。如果魔雨针丢失，需要重新做任务。")
end;


function v3()
Talk(8, "", "通过完成这个任务，你升为<color=blue>护院<color>，学会武功<color=blue>夺魂镖、心眼<color>。<enter>第一步：在<color=blue>议事大厅<color>遇到<color=blue>唐一尘<color>，接到任务，去<color=blue>北边无心谷<color>劝说师姑<color=blue>唐幽<color>。", "第二步：在<color=blue>无心谷<color>，点击唐幽小屋<color=blue>门前木牌（528,291）<color>，接到任务，在无心谷中找到<color=blue>四字口诀<color>。", "第三步：打败无心谷中的四只<color=blue>猞猁精<color>和<color=blue>浣熊精<color>，得到<color=red>四张丝帕<color>上的四句口诀。", "第四步：再次点击唐幽门前木牌，接到任务，去西边的<color=blue>翡翠湖<color>寻找<color=red>金项圈<color>。", "第五步：在<color=blue>翡翠湖<color>，打败<color=blue>赤焰鳄<color>，得到<color=red>金项圈<color>", "第六步：回到<color=blue>无心谷<color>，点击小屋门前木牌，唐幽要你把<color=red>金项圈<color>交给<color=blue>掌门唐仇<color>。", "第七步：到<color=blue>会客大厅<color>，把<color=red>金项圈<color>交给<color=blue>掌门唐仇<color>，任务完成。如果金项圈丢失，需要重新做任务。")
end;


function v4()
Talk(6, "", "通过完成这个任务，你升为<color=blue>阶前护卫<color>，学会武功<color=blue>追心箭、青木功<color>。<enter>第一步：在<color=blue>祭祖厅<color>遇到<color=blue>唐不染<color>，接到任务，夺回<color=red>《火器谱》<color>。", "第二步：在<color=blue>青城山东白云洞<color>，打败绑匪<color=blue>大头目狂沙<color>，接到任务，在洞中找到打开宝箱的<color=red>钥匙<color>。", "第三步：打败绑匪中四个<color=blue>小头目独耳、铁臂、鬼影、厉拳<color>中的一个，会得到<color=red>钥匙<color>。", "第四步：打开<color=blue>宝箱（230,199）<color>，得到<color=red>《火器谱》<color>。", "第五步：回到<color=blue>火器房<color>，将<color=red>《火器谱》<color>交给<color=blue>唐云<color>，任务完成。如果《火器谱》丢失，必须重新做任务。")
end;


function v5()
Talk(7, "", "通过完成这个任务，你升为<color=blue>入阁弟子<color>，学会武功<color=blue>漫天花雨、淬毒术<color>。<enter>第一步：在<color=blue>医药房<color>遇到<color=blue>唐野<color>，接到任务，化解唐野与耿子奇的恩怨。", "第二步：到<color=blue>青城山西部<color>找到<color=blue>耿子奇（230,245）<color>，先打败他的五只家畜：一只<color=blue>灰狼<color>、一只<color=blue>猛虎<color>、一只<color=blue>金钱豹<color>、一只<color=blue>野猪<color>和一只<color=blue>棕熊<color>，然后接到任务，想办法救治耿子奇女儿的怪病。", "第三步：回到唐门<color=blue>医药房<color>，从<color=blue>唐野<color>处得到治疗怪病的<color=blue>药方<color>。", "第四步：在<color=blue>青城山东北<color>的<color=blue>青阳峰<color>，打败<color=blue>黑鹰、凶鹫、灵雕<color>，会得到五种药方：<color=red>蟾蜍的皮，毒蛇的胆、罂粟的壳、毒蝎的尾、僵蚕的头<color>。", "第五步：将药方交给耿子奇，化解他与唐野师叔的恩怨。", "第六步：回到唐门医药房，与唐野对话，任务完成。")
end;


function v6()
Talk(7, "", "通过完成这个任务，你升为<color=blue>四老门人<color>，学会武功<color=blue>冰魄寒光、天罗地网<color>。<enter>第一步：在<color=blue>暗器房<color>遇到<color=blue>唐闲<color>，接到任务，寻找<color=red>《暗器谱》<color>。", "第二步：在<color=blue>议事大厅<color>，与<color=blue>唐一尘<color>对话，得知<color=blue>三师兄唐禾<color>和<color=blue>五师兄唐元<color>去过暗器房，两人有嫌疑。", "第三步：在<color=blue>江津村<color>找到<color=blue>唐元<color>，得知<color=blue>唐禾<color>去了<color=blue>青城山响水洞<color>。", "第四步：到<color=blue>青城山响水洞<color>，打败<color=blue>唐禾<color>，得知<color=red>《暗器谱》<color>就藏在山洞里。", "第五步：打败山洞里的<color=blue>铁锤魔君<color>或<color=blue>铁拳阎罗<color>，会得到<color=red>《暗器谱》<color>。", "第六步：回到唐门<color=blue>暗器房<color>，将<color=red>《暗器谱》<color>交给<color=blue>唐闲<color>，任务完成。如果《暗器谱》丢失，必须重新回响水洞打过。")
end;


function v7()
Talk(6, "", "通过完成这个任务，你升为<color=blue>千手神卫<color>，顺利出师。<enter>第一步：在<color=blue>会客大厅<color>遇到<color=blue>掌门唐仇<color>，接到任务，去<color=blue>竹丝洞<color>取回<color=red>七星绝命剑<color>。", "第二步：在<color=blue>竹丝洞第一层<color>打败<color=blue>莽汉头领<color>，会得到进入第二层的<color=red>钥匙<color>。", "第三步：在<color=blue>竹丝洞第二层<color>打败<color=blue>莽汉头领<color>或<color=blue>点睛虎<color>，会得到进入第三层的<color=red>钥匙<color>。", "第四步：在<color=blue>竹丝洞第三层<color>，有两个<color=blue>宝箱<color>，其中一个里面有<color=red>七星绝命剑<color>。", "第五步：回到唐门<color=blue>会客大厅<color>，将<color=red>七星绝命剑<color>交给<color=blue>掌门唐仇<color>，任务完成。如果七星绝命剑丢失，必须重新做任务。")
end;

function v8()
Talk(3,"","重返师门后，你被封为<color=blue>绿格长老<color>, 学到绝学<color=blue>小李飞刀，天罗地网，赞华秀<color>.","第一步：等级达到60，到<color=blue> 客厅<color> 见 <color=blue>唐仇掌门<color>, 申请重返唐门.","第二步：通过交<color=red>50000 两<color>, 重返唐门.")
end;

--------------------------------

function ok()
end;
