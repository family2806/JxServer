--峨嵋派帮助NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "慧尼"

function main(sel)

UTask_em = GetTask(1)

if (UTask_em < 10*256) then						--未接峨嵋派入门任务，未入峨嵋派
	if (GetFaction() ~= "") then				--如果玩家已经属于另一门派
		Say("慧尼：施主有何事相询？", 3, "了解贵派/org", "了解各位女侠/member", "了解此地布局/config")
		return
	else
		Say("慧尼：施主想加入本派吗？或者有什么需要贫尼相助的？", 4, "了解贵派/org", "了解各位女侠/member", "了解此地布局/config", "如何入门/task1")
		return	
	end
end;
	
if (UTask_em == 70*256) then					--峨嵋派已经出师		
	Say("慧尼：原来是以前的师妹，有什么可以帮你的吗？", 4, "重新了解峨嵋派/org", "重新了解以前的同门/member", "重新回顾此地布局/config", "还有什么任务可做/task2")
	return
end;	

Say("慧尼：师妹有何事相询？", 4, "了解本派/org", "了解同门/member", "了解此地布局/config", "了解任务/task3")

end;

----------------------------------------------------------------------------------------------

function org()
Say("慧尼：想了解哪方面？", 4, "门派起源/o1", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;


function member()
Say("慧尼：想了解谁？", 13, "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;


function config()
Say("慧尼：想了解哪方面？", 4, "通往何地/c1", "前山/c2", "主建筑群/c3", "后山/c4")
end;


function task1()
Say("慧尼：本派只收水系女弟子。想要入门学艺，可以通过和巴陵县的峨眉门派接应人对话完成入门。")
end;


function task2()
Say("慧尼：你已出师，不必再做本派任务了。", 0)
end;


function task3()

UTask_em = GetTask(1)

if (UTask_em < 10*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "入门任务/v1")
end;

if (UTask_em == 10*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前已入门，接下来可以做的是：", 1, "铜镜任务/v2")
end;

if (UTask_em > 10*256) and (UTask_em < 20*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "铜镜任务/v2")
end;

if (UTask_em == 20*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "伏虎任务/v3")
end;

if (UTask_em > 20*256) and (UTask_em < 30*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "伏虎任务/v3")
end;

if (UTask_em == 30*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "火狐任务/v4")
end;

if (UTask_em > 30*256) and (UTask_em < 40*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "火狐任务/v4")
end;

if (UTask_em == 40*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "曲谱任务/v5")
end;

if (UTask_em > 40*256) and (UTask_em < 50*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "曲谱任务/v5")
end;

if (UTask_em == 50*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "信相寺任务/v6")
end;

if (UTask_em > 50*256) and (UTask_em < 60*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "信相寺任务/v6")
end;

if (UTask_em == 60*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你接下来可以做的是：", 1, "出师任务/v7")
end;

if (UTask_em > 60*256) and (UTask_em < 70*256) then	
Say("慧尼：想要入门学艺，可以通过完成入门任务实现。入门后，依次完成五个门派任务，可以学到武功，获得头衔。完成出师任务后，就可艺成出师。你目前正在进行中的任务是：", 1, "出师任务/v7")
end;

if (UTask_em >= 70*256) and (UTask_em < 80*256) then	
Say("<#> 想入门学艺，首先要通过完成入门任务，然后，依次完成五个门派任务，将会学到武功，被封称号。完成出师任务后，将会艺成出师。目前"..UTask_em.."<#>,在进行的任务为:", 1, "出师任务 /v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("慧尼：峨嵋派是一个由女子所创的武林门派，后因祖师入了佛门，又以称女子为“蛾眉”和佛教圣地之“峨眉山”的双重含义而得名。", 4, "知道了/ok", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;

function o2()
Say("慧尼：峨嵋山位于蜀地西南，因山势逶迤，如娥眉细而长，美而艳，故名。山脉峰峦起伏，重岩迭翠，气势磅礴，雄秀幽奇，素有“峨嵋天下秀”的美誉。", 4, "知道了/ok", "门派起源/o1", "江湖地位/o3", "门派特色/o4")
end;

function o3()
Say("慧尼：与少林、武当并称为中原正派武林的三大门派，在天下女子所创的门派中，以峨嵋派为第一。", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "门派特色/o4")
end;

function o4()
Say("慧尼：峨嵋派门规极严，门下弟子皆为女子。峨嵋弟子均洁身自好，不仅武功高强，而且多才多艺，琴棋书画无所不通。", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "江湖地位/o3")
end;

--------------------------------

function m1()
Say("位置：<color=blue>正殿里<color>    坐标：<color=blue>199,200<color>    作用：<color=blue>任务<color><enter>不苟言笑，但是为人慈和，宽容豁达。一心想把峨嵋派发扬光大，具有强烈的自我牺牲意识。", 13, "知道了/ok", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m2()
Say("位置：<color=blue>峨眉山脚清音亭<color>    坐标：<color=blue>239,332<color>    作用：<color=blue>任务<color><enter>精于茶道，但是性格孤傲，冷若冰霜，目无下尘，虽然江湖上有数不清的人拜倒在她的石榴裙下，她却总是不理不睬。", 13, "知道了/ok", "掌门清晓师太/m1", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m3()
Say("位置：<color=blue>峨眉山迎客石<color>    坐标：<color=blue>227,322<color>    作用：<color=blue>任务<color><enter>精于音律，聪慧敏感，在感情上非常矜持，总是把感情埋在心底，决不轻易表露。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m4()
Say("位置：<color=blue>峨眉山半山坡<color>    坐标：<color=blue>229,320<color>    作用：<color=blue>任务<color><enter>才女一个，气质娴静典雅，表面上单纯善良、多愁善感，其实外柔内刚，面对感情时非常的执着，明知前方是万丈悬崖，也会毫不犹豫地跳下去。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m5()
Say("位置：<color=blue>峨眉山钻天坡入口<color>    坐标：<color=blue>221,321<color>    作用：<color=blue>任务<color><enter>一个活泼开朗，机灵可爱的小姑娘。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m6()
Say("位置：<color=blue>峨眉山后堂附近<color>    坐标：<color=blue>242,305<color>    作用：<color=blue>任务<color><enter>性格随和可亲，充满爱心，喜欢小动物，但有时显得过于软弱。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m7()
Say("位置：<color=blue>左偏殿里<color>    坐标：<color=blue>201,199<color>    作用：<color=blue>任务<color><enter>性情稳重大方，心思缜密，在众多师姐妹中，和秦倚风的感情最好。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m8()
Say("位置：<color=blue>峨眉山钻天坡出口<color>    坐标：<color=blue>231,313<color>    作用：<color=blue>任务<color><enter>性格内向，沉默寡言。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m9()
Say("位置：<color=blue>前殿里<color>    坐标：<color=blue>200,198<color>    作用：<color=blue>任务<color><enter>性情柔弱，徘徊在佛祖与红尘之间，苦了自己，也苦了自己所爱的人。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m10()
Say("位置：<color=blue>讲经堂里<color>    坐标：<color=blue>197,200<color>    作用：<color=blue>任务<color><enter>为人果断，爱憎分明。", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙灵/m11", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m11()
Say("位置：<color=blue>广场<color>    坐标：<color=blue>247,305<color>    作用：<color=blue>兵器交易<color>", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙心/m12", "尼姑妙洁/m13")
end;

function m12()
Say("位置：<color=blue>广场<color>    坐标：<color=blue>246,307<color>    作用：<color=blue>装备交易<color>", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙洁/m13")
end;

function m13()
Say("位置：<color=blue>广场<color>    坐标：<color=blue>244,306<color>    作用：<color=blue>药品交易<color>", 13, "知道了/ok", "掌门清晓师太/m1", "折梅仙子叶冰痕/m2", "拂云仙子秦倚风/m3", "横波仙子何怜飘/m4", "移光仙子谢云萝/m5", "映雪仙子穆云慈/m6", "拜月仙子苏词馨/m7", "尼姑妙尘/m8", "尼姑妙隐/m9", "尼姑妙如/m10", "尼姑妙灵/m11", "尼姑妙心/m12")
end;

--------------------------------

function c1()
Say("慧尼：山脚有两个路口，东边路口通往成都，南边路口通往长江源头。", 4, "知道了/ok", "前山/c2", "主建筑群/c3", "后山/c4")
end;

function c2()
Say("慧尼：上山途中依次有清音亭、钻天坡、迎客石、半山坡等景点。", 4, "知道了/ok", "通往何地/c1", "主建筑群/c3", "后山/c4")
end;

function c3()
Say("慧尼：有前殿、讲经堂、正殿、左偏殿等主要建筑，可以进入。", 4, "知道了/ok", "通往何地/c1", "前山/c2", "后山/c4")
end;

function c4()
Say("慧尼：后山有猛虎山洞和鳄鱼湖。", 4, "知道了/ok", "通往何地/c1", "前山/c2", "主建筑群/c3")
end;

--------------------------------

function v1()							
Talk(6, "", "通过完成这个任务，你可以加入峨嵋派，成为<color=blue>布衣尼<color>，学会武功<color=blue>飘雪穿云<color>。<enter>第一步：在山下<color=blue>清音亭<color>遇到<color=blue>叶冰痕<color>，接到任务，过“茶”关。", "第二步：在上山路的<color=blue>迎客石<color>旁遇到<color=blue>秦倚风<color>，过“琴”关。", "第三步：在上山路的<color=blue>半山坡<color>处遇到<color=blue>何怜飘<color>，过“文”关。", "第四步：在<color=blue>钻天坡入口<color>处遇到<color=blue>谢云萝<color>，闯钻天坡，打败<color=blue>羽衣尼<color>，得到<color=red>白玉如意<color>。", "第五步：到<color=blue>正殿<color>将<color=red>白玉如意<color>交给<color=blue>掌门清晓师太<color>，任务完成。")
end;


function v2()
Talk(9, "", "通过完成这个任务，你升为<color=blue>羽衣尼<color>，学会武功<color=blue>峨眉剑法、峨嵋掌法、秋风叶<color>。<enter>第一步：在<color=blue>前殿<color>遇到<color=blue>尼姑妙隐<color>，接到任务，得到<color=red>左半面铜镜<color>。", "第二步：在<color=blue>山下<color>找到<color=blue>妙隐相公（240,328）<color>，得到<color=red>右半面铜镜<color>。", "第三步：在<color=blue>成都铁匠铺<color>找到<color=blue>铁匠<color>，接到任务寻找<color=red>亮银矿<color>。", "第四步：到成都<color=blue>西郊树林<color>中找到<color=red>亮银矿<color>。", "第五步：把亮银矿交给成都<color=blue>铁匠<color>，得到修补好的完整<color=red>铜镜<color>。", "第六步：回到<color=blue>前殿<color>，与<color=blue>妙隐<color>对话，接到任务，把<color=red>铜镜<color>交给<color=blue>妙隐相公<color>。如果铜镜丢失，需要重新做任务。", "第七步：来到<color=blue>山下<color>，把<color=red>铜镜<color>交给<color=blue>妙隐相公<color>。", "第八步：回到<color=blue>前殿<color>，向<color=blue>尼姑妙隐<color>复命，任务完成。")
end;


function v3()
Talk(4, "", "通过完成这个任务，你升为<color=blue>锦衣尼<color>，学会武功<color=blue>四象同归、望月、风雨飘香<color>。<enter>第一步：在<color=blue>讲经堂<color>遇到<color=blue>尼姑妙如<color>，接到任务，去<color=blue>后山猛虎山洞<color>收服猛虎。", "第二步：在<color=blue>后山猛虎山洞<color>，连续打败<color=blue>虎王白虎精（221,202）<color>三次。", "第三步：回到<color=blue>讲经堂<color>，向<color=blue>尼姑妙如<color>复命，任务完成。")
end;


function v4()
Talk(5, "", "通过完成这个任务，你升为<color=blue>白莲仙子<color>，学会武功<color=blue>一叶知秋、流水、冰心诀<color>。<enter>第一步：在<color=blue>后堂附近<color>遇到<color=blue>穆云慈<color>，接到任务，去<color=blue>后山鳄鱼湖<color>寻找<color=red>火狐<color>。", "第二步：去找火狐之前，先去<color=blue>成都杂货店<color>买<color=red>鸡腿<color>。", "第三步：在<color=blue>后山鳄鱼湖<color>打败<color=blue>蜥蜴王<color>，找到<color=red>火狐<color>。", "第四步：回到<color=blue>后堂附近<color>，将<color=red>火狐<color>交给<color=blue>穆云慈<color>，任务完成。如果火狐丢失，必须重新做任务。")
end;


function v5()
Talk(8, "", "通过完成这个任务，你升为<color=blue>青莲仙子<color>，学会武功<color=blue>不灭不绝、梦蝶<color>。<enter>第一步：在<color=blue>左偏殿<color>遇到<color=blue>苏词馨<color>，接到任务，寻找<color=red>《百鸟朝凤》曲谱<color>。", "第二步：到<color=blue>青城山神仙洞<color>找到隐居的<color=blue>高人（234,204）<color>，先打败他养的<color=blue>灵兽<color>，然后接到任务，想办法得到<color=red>《芙蓉锦鸡图》<color>。", "第三步：到<color=blue>成都太平镖局<color>，与<color=blue>镖局老板（377,316）<color>对话，接到任务，想办法弄到<color=red>灵麝香囊、鹰睛护身符<color>和<color=red>碧玺戒指<color>。", "第四步：在成都<color=blue>薛小妹（383,315）<color>处得到<color=red>灵麝香囊<color>；在成都信相寺<color=blue>慈云法师（402,319）<color>处得到<color=red>鹰睛护身符<color>；在成都<color=blue>辛员外（400,309）<color>处得到<color=red>碧玺戒指<color>。", "第五步：回到<color=blue>成都太平镖局<color>，用三样东西向<color=blue>镖局老板<color>换取<color=red>《芙蓉锦鸡图》<color>。", "第六步：回到<color=blue>青城山神仙洞<color>，用《芙蓉锦鸡图》向<color=blue>高人<color>换取<color=red>《百鸟朝凤》曲谱<color>。", "第七步：回到峨嵋<color=blue>左偏殿<color>，将<color=red>《百鸟朝凤》曲谱<color>交给<color=blue>苏词馨<color>，任务完成。如果《百鸟朝凤》曲谱丢失，必须重新做任务。")
end;


function v6()
Talk(5, "", "通过完成这个任务，你升为<color=blue>散花天女<color>，学会武功<color=blue>佛光普照、佛心慈佑、慈航普渡<color>。<enter>第一步：在<color=blue>正殿<color>遇到<color=blue>掌门清晓师太<color>，接到任务，将<color=red>《金线绣像金刚经》<color>送往<color=blue>成都信相寺<color>。", "第二步：在<color=blue>成都信相寺<color>，与<color=blue>慈云法师<color>对话，得知方丈慈海大师去了<color=blue>后院地道<color>。", "第三步：进入<color=blue>后院地道<color>，打败<color=blue>叛僧头目<color>，救出慈海大师，交出<color=red>《金线绣像金刚经》<color>。如果《金线绣像金刚经》丢失，必须重新做任务。", "第四步：回到峨嵋<color=blue>正殿<color>，向<color=blue>掌门清晓师太<color>复命，任务完成。")
end;


function v7()
Talk(4, "", "通过完成这个任务，你升为<color=blue>金顶圣女<color>，顺利出师。<enter>第一步：在<color=blue>正殿<color>遇到<color=blue>掌门清晓师太<color>，接到任务，夺回掌门信物<color=red>烟玉指环<color>。", "第二步：在<color=blue>长江源头<color>打败叛徒<color=blue>清和<color>，得到<color=red>烟玉指环<color>。", "第三步：回峨嵋<color=blue>正殿<color>，将<color=red>烟玉指环<color>交给<color=blue>掌门清晓师太<color>，任务完成。如果烟雨指环丢失，必须重新做任务。")
end;

function v8()
Talk(3,"","通过重返师门任务，你被封为<color=blue> 金顶圣女 <color>,学到镇派绝学<color=blue> 不灭不绝，佛光普照<color>.","第一步：你的等级超过60级后，在<color=blue> 正殿 <color>见 <color=blue>掌门清晓师太<color>, 请求重返峨嵋派.","第二步：通过交<color=red>50000两<color>, 重返峨嵋派.")
end;

--------------------------------

function ok()
end;
