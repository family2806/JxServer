--天忍教帮助NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "军师 "
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(210) == 1 then
		allbrother_0801_FindNpcTaskDialog(210)
		return 0;
	end
UTask_tr = GetTask(4)

if (UTask_tr < 10*256) then						--未接天忍教入门任务，未入天忍教
	if (GetFaction() ~= "") then				--如果玩家已经属于另一门派
		Say("只要不涉及本教机密，问什么都行!", 3, "了解贵教/org", "了解各位高手 /member", "了解这里的布局/config")
		return
	else
		Say("只要不涉及本教机密，问什么都行!", 4, "了解贵教/org", "了解各位高手/member", "了解这里的布局/config", "怎么能入门?/task1")
		return	
	end
end;
	
if (UTask_tr == 70*256) then					--天忍教已经出师		
	Say("你不是出师了吗，还有什么不懂的?", 6, "继续了解天忍教/org", "了解之前的同门/member", "重新了解这里的布局/config", "还有什么要做的/task3","了解练功喜好/map_help","了解练本门武艺/skill_help")
	return
end;	

Say("有什么事尽管问.", 7,"与龙五对话 /Uworld1000_word", "了解本教/org", "了解同门/member", "了解这里的布局/config", "了解任务 /task3","了解练功喜好/map_help","了解练本门武艺/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("还想知道什么?", 4, "门派起源/o1", "地理位置 /o2", "江湖地位 /o3", "门派特色/o4")
end;


function member()
Say("想了解谁?", 10, "教主完颜洪烈/m1", "左护法端木睿 /m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士 /m7", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;


function config()
Say("还想知道什么?", 3, "附近区域/c1",  "外面布局/c2", "里面布局/c3")
end;


function task1()
Say("本门只收火系弟子，不分男女。想入门学艺，需要完成入门任务.", 1, "了解入门具体任务/v1")
end;


function task2()
Say("<#> 你已出师，不需要再做本教任务了，目前已经 "..UTask_tr.."<#>.", 0)
end;


function task3()

UTask_tr = GetTask(4)

if (UTask_tr > 5*256) and (UTask_tr < 10*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为", 1, "入门任务/v1")
end;

if (UTask_tr == 10*256) then
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 现在已入门, 接下来可以进行:", 1, "七杀洞任务/v2")
end;

if (UTask_tr > 10*256) and (UTask_tr < 20*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为", 1, "七杀洞任务/v2")
end;

if (UTask_tr == 20*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 接下来可以进行:", 1, "聪明小孩任务/v3")
end;

if (UTask_tr > 20*256) and (UTask_tr < 30*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为", 1, "聪明小孩任务/v3")
end;

if (UTask_tr == 30*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 接下来可以进行:", 1, "宝石任务/v4")
end;

if (UTask_tr > 30*256) and (UTask_tr < 40*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为", 1, "宝石任务/v4")
end;

if (UTask_tr == 40*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 接下来可以进行:", 1, "行刺任务/v5")
end;

if (UTask_tr > 40*256) and (UTask_tr < 50*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为 ", 1, "行刺任务/v5")
end;

if (UTask_tr == 50*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 接下来可以进行:", 1, "救人任务/v6")
end;

if (UTask_tr > 50*256) and (UTask_tr < 60*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为", 1, "救人任务/v6")
end;

if (UTask_tr == 60*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 接下来可以进行:", 1, "出师任务 /v7")
end;

if (UTask_tr > 60*256) and (UTask_tr < 70*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为", 1, "出师任务/v7")
end;

if (UTask_tr >= 70*256) and (UTask_tr < 80*256) then	
Say("<#> 想入门学艺，首先需要通过完成入门任务. 然后依次完成五个门派任务. 将学到武功，封名号。完成出师任务后就成艺出师。目前 "..UTask_tr.."<#>, 正在进行的任务为", 1, "重返师门/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("本教在大金建立，为对付武林中原，被信为国教，教主完颜洪烈也是大金的国师.", 4, "知道了/ok", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;

function o2()
Say("这是本教总坛，位于汴京东边秘密位置处.", 4, "知道了/ok", "门派起源/o1", "江湖地位/o3", "门派特色/o4")
end;

function o3()
Say("本教的政治背景很复杂，目的是帮助金国南下灭宋，一通天下", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "门派特色/o4")
end;

function o4()
Say("本教与其他门派最大的差别是：本教因为政治目的而建立。加入本教的人不是为了学艺，而是因为政治，这些人在本教的地位很高。本教形式严密，交规严谨，对于叛徒将严惩不怠.", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "江湖地位/o3")
end;

--------------------------------

function m1()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>215,195<color>   负责: <color=blue>任务color><enter> 金国国师，一代枭雄，多谋足智，但是，傲慢无比.", 10, "知道了/ok", "左护法端木睿/m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士/m7", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;

function m2()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>225,199<color>   负责: <color=blue>任务color><enter>, 文武双全，风流倜傥，半正半邪", 10, "知道了/ok", "教主完颜洪烈/m1", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士/m7", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;

function m3()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>207,189<color>   负责: <color=blue>任务color><enter>, 奸诈狡猾，不择手段达目的", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士/m7", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;

function m4()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>213,201<color>   负责: <color=blue>任务color><enter>, 金国七公主，文武双全，聪明伶俐，加入天忍教是为了监视完颜洪烈!", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "右护法耶律辟离/m3", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士/m7", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;

function m5()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>205,197<color>   负责: <color=blue>任务color><enter>, 性情暴躁，直率!", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "日月坛主乌合萨/m6", "天忍死士/m7", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;

function m6()
Say("位置 <color=blue>广场<color>   坐标: <color=blue>200,198<color>   负责: <color=blue>任务color><enter>, 武艺高强，有时让同门哭笑不得", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "天忍死士/m7", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;

function m7()
Say("位置 <color=blue>进入密室之路<color>   坐标: <color=blue>207,195<color>   负责: <color=blue>任务 color><enter>, 一个平常弟子，没有出色表现", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "塔里汗/m8", "武敌/m9", "奇佑/m10")
end;

function m8()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>207,199<color>   负责: <color=blue>交易兵器color>", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士/m7", "武敌/m9", "奇佑/m10")
end;

function m9()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>208,198<color>   负责: <color=blue>交易装备 color>", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士/m7", "塔里汗/m8", "奇佑/m10")
end;

function m10()
Say("位置 <color=blue>天忍教第三层<color>   坐标: <color=blue>210,198<color>   负责: <color=blue>交易药品<color>", 10, "知道了/ok", "教主完颜洪烈/m1", "左护法端木睿/m2", "右护法耶律辟离/m3", "风堂堂主完颜雪衣/m4", "火堂堂主兀敖/m5", "日月坛主乌合萨/m6", "天忍死士/m7", "塔里汗/m8", "武敌/m9")
end;

--------------------------------

function c1()
Say("向南就是汴京", 3, "知道了/ok", "外面布局/c2", "里面布局/c3")
end;

function c2()
Say("广场有进出密室的路", 3, "知道了/ok", "附近区域/c1", "里面布局/c3")
end;

function c3()
Say("密室有3层，第一层有山洞，第二层有七杀洞(190,190) ; 第三层有圣洞(218,192) . 总坛位于第三层.", 3, "知道了/ok", "附近区域/c1",  "外面布局/c2")
end;

--------------------------------

function v1()							
Talk(4, "", "通过完成任务, 你可以加入天忍教, 成为<color=blue>杀手 color>, 学到武功<color=blue>残阳如血<color>.<enter>接任务，需要达到10等级: 不做其他任何门派的入门任务","第一步: 到 <color=blue>进入密室的路进入密室<color> 见<color=blue>天忍死士color>. 接任务，到<color=blue>华山<color> 在<color=red>武王剑<color>.", "第二步: 到 <color=blue>华山<color> 打败 <color=blue> 大浣熊，大野猪color> 或者<color=blue>大刺猬color> 将获得<color=red>武王剑<color>.", "第三步: 返回天忍教, giao <color=red>武王剑<color> 给 <color=blue>天忍死士color>, 任务完成，如果他武王剑丢失，需要从头开始任务!")
end;


function v2()
Talk(4, "", "完成任务后, 被封为 <color=blue>无影杀手color>, 学到武功<color=blue>天忍刀法，天忍矛法，火莲焚火<color>.<enter>接该任务需要达到10级以上","第一步: 到 <color=blue>天忍教第三层<color> 见<color=blue>火堂堂主兀敖<color>. 接任务，进入<color=blue>七杀洞<color> 拿<color=red>3 块令牌<color>.", "第二步: 到第二层，进入<color=blue>七杀洞<color>, 打败 <color=blue>7 死囚color> 将获得<color=red>3 块令牌<color>.", "第三步: 返回<color=blue>第三层<color>交<color=red>令牌<color> 给 <color=blue>火堂堂主兀敖<color>, 任务完成. ")
end;


function v3()
Talk(5, "", "完成任务后, 被封为<color=blue>T?S?<color>, 学到武功<color=blue>幻影飞狐color>.<enter>接该任务需要达到20级和完成任务七杀令.","第一步: 到 <color=blue>广场<color> 见<color=blue>日月坛主乌合萨<color>, 接任务，回答问题，去找<color=blue>男孩<color> 拿回 <color=red>日月双轮 <color>", "第二步: 到东边树林找<color=blue>男孩 (213,203)<color>, 回答正确谜语，又接任务去找<color=red>小黄狗<color> v?<color=red>小灰驴color>", "第三步: 到西边树林找到<color=red>小黄狗(210,191)<color> 和<color=red>小灰驴 (196,195)<color>, 交给 <color=blue>男孩<color>换取<color=red>日月双轮 <color>.", "第4步: 返回交<color=red>日月双轮<color> 给 <color=blue乌合萨<color>, 任务完成.如果日月双轮丢失，需要从头开始任务!")
end;


function v4()
Talk(5, "", "完成任务后, 被封为<color=blue>幽冥死士color>, 学到武功<color=blue>烈火晴天，推山填海，飞鸿无极<color>.<enter>接该任务需要达到30级和完成聪明小孩任务.","第一步: 到 <color=blue>天忍教第三层<color> 见<color=blue>火堂堂主完颜雪衣<color>. 接任务到<color=blue>秦陵<color>找种宝石: <color=red>鸽血红，冰晶蓝，祖母绿，云梦紫color>.", "第二步: 到 <color=blue>秦陵<color>, 打败 <color=blue>盗宝贼<color>, 将获得3块: <color=red>鸽血红，冰晶蓝，祖母绿<color>.", "第三步: 去秦陵外面找一个<color=blue>农夫(296,158)<color>, 将买到<color=red>云梦紫 color>.", "第4步: 返回<color=blue>天忍教第三层<color>, 交四种宝石给 <color=blue> 完颜雪衣<color>, 任务完成. ")
end;


function v5()
Talk(4, "", "完成任务后, 被封为<color=blue>掌旗使color>, 学到武功<color=blue>悲酥清风<color>.<enter>接该任务需要达到40级和完成宝石任务.","第一步: 到 <color=blue>第三层<color> 见<color=blue>右护法耶律辟离<color>. 接任务到<color=blue> (剑阁蜀道) 坐云洞<color> 刺杀间谍<color=blue>廖歧 color>.", "第二步: 到 <color=blue>坐云洞<color> 打败 <color=blue>廖歧color> 拿到一幅<color=red>天忍秘书color>.", "第三步: 返回<color=blue>第三层<color> 交 <color=red>天忍秘书color> 给 <color=blue>耶律辟离<color>, 任务完成.如果天忍秘书丢失，需要重新开始任务!")
end;


function v6()
Talk(6, "", "完成任务后, 被封为<color=blue>护教使color>, 学到武功<color=blue>力魔夺魂<color>.<enter>接该任务需要达到50级和完成行刺任务.","第一步: 到 <color=blue>第三层<color> 见<color=blue>左护法端木睿color>. 接任务到 <color=blue>汴京铁塔<color> 救凤翕如", "第二步: 到 <color=blue>铁塔第一层<color>, 打败 <color=blue>刀兵队长，枪兵队长<color> 或者<color=blue>弓兵队长<color> 将获得<color=red>钥匙<color>, 打开<color=blue>第一层的宝箱<color>, 打开<color=blue>第一个机关<color>.", "第三步: 到<color=blue>铁塔第二层<color>, 打败 <color=blue>刀兵统领<color> 或者<color=blue>弓兵统领<color> 将获得<color=red>钥匙<color>,点击<color=blue>第二层的宝箱<color>, 打开<color=blue>第二个机关<color>.", "第4步: 到<color=blue>铁塔第三层<color>, 打败 <color=blue>总兵<color> 拿到<color=red>钥匙<color>, 点击<color=blue>第三层宝箱<color>, 打开<color=blue>第三个机关<color> 救得凤翕如", "第5步: 返回 <color=blue>天忍教<color>, 见<color=blue> 端木睿color> 复命，任务完成. ")
end;


function v7()
Talk(10, "", "完成任务后, 被封为<color=blue>萨满法王<color>, 顺利出师 <enter>接该任务需要达到50级和完成救人任务.","第一步: 到 <color=blue>第三层<color> 见<color=blue>教主完颜洪烈<color>. 接任务，去找<color=red>5把断剑<color>,到<color=blue>天忍圣洞<color>拿回<color=red>羊皮书color>.", "第二步:到 <color=blue>汴京<color> 找<color=red>5 把断剑<color>:<enter>第一把：到铁匠处见<color=blue>曲铁像218,190?<color>,接任务带 <color=red>银簪 <color> 给张寡妇，到东边找<color=blue>张寡妇213,199?<color>, 交银簪，获得<color=red>香囊<color>.交香囊给曲铁像,获得<color=red>掩日断剑<color>.", "第二把: 到 <color=blue>北门<color> 找<color=blue>孙秀才(229,184)<color>,回答正确谜语将获得 <color=red>断水断剑'<color>.", "第三把: 到 <color=blue>赌场<color> 找<color=blue>赌徒 (201,194)<color>,买到 <color=red>转魂断剑'<color>.", "第四把: 到 <color=blue>东北边<color> 找<color=blue>冬梅(230,190)<color>, 接任务帮助她找小海. 到 <color=blue>广场<color> 找到 <color=blue>小海(220,192)<color>, 劝他回家, 获得<color=red>去左断剑<color>.", "第五把: 到 <color=blue>将军寺color> 找<color=blue>乞丐(210,187)<color>, 连续施舍3次将获得<color=red>灭魂断剑' <color>.", "第三步: 返回天忍教，进入<color=blue>圣洞第一层<color>, 打败4个<color=blue>毒蛇精，蜘蛛精，蝎子精，毒蝎王<color>,依次获得<color=blue>天地玄黄、辰宿列张、江湖社稷、唯我教王口诀<color>, 继续到第2层", "第4步: 进入<color=blue>圣洞第二层<color>, 打败 <color=blue>毒蝎王<color> 将获得 <color=red>钥匙<color>,点击<color=blue>宝箱 (233,197)<color> 将获得 <color=red>羊皮书color>.", "第5步: 交<color=red>羊皮书color> 给<color=blue>完颜洪烈<color>, 任务完成。如果羊皮书丢失，需要重新开始任务!")
end;

function v8()
Talk(3,"","通过重返师门, 被封为<color=blue>圣教长老<color>, 学到镇派绝学<color=blue>天魔解体，偷天换日武功，魔焰七杀<color>.","第一步: 达到60级后，到<color=blue>天忍教第三层<color> 见<color=blue>教主color>, 申请重返天忍教.","第二步: 送给门派<color=red>50000 银两<color> 重返天忍教.")
end;

--------------------------------

function ok()
end;
