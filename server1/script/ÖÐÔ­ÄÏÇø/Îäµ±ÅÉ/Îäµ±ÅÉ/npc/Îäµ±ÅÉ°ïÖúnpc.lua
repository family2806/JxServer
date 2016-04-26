--武当派帮助NPC

Include("\\script\\global\\map_helper.lua")
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
npc_name = "掌书"

function main(sel)

UTask_wd = GetTask(5)

if (UTask_wd == 30*256+50) and (HaveMagic(165) ~= -1) and (GetCamp() == 4) then		-- 学会了“无我无剑”并正常出师但变量值为30级任务超时的，进行容错。
	SetTask(5,70*256)
	Say("你的认为情况有点错误，我帮你修改!",1,"谢谢!/no")
	return
end

if (UTask_wd < 10*256) then						--未接武当派入门任务，未入武当派
	if (GetFaction() ~= "") then				--如果玩家已经属于另一门派
		Say("贫道可以帮什么 ", 3, "了解贵派/org", "了解各位大侠/member", "了解这里的布局/config")
		return
	else
		Say("贫道可以帮什么", 4, "了解贵派/org", "了解各位大侠/member", "了解这里的布局/config", "怎么入派?/task1")
		return
	end
end;
	
if (UTask_wd == 70*256) then					--武当派已经出师		
	Say("原来是之前的同门, 贫道可以帮什么", 6, "继续了解武当派/org", "了解之前的同门/member", "继续了解这里的布局/config", "还有什么任务要做/task3","了解练功特长/map_help","了解本门武艺/skill_help")
	return
end;

Say("贫道可以帮什么", 7,"与龙王对话 /Uworld1000_word", "了解本派/org", "了解同门/member", "了解这里的布局/config", "了解任务 /task3","了解练功特长/map_help","了解本门武艺/skill_help")

end;

----------------------------------------------------------------------------------------------

function org()
Say("想了解什么方面 ", 4, "门派起源/o1", "地理位置 /o2", "江湖地位 /o3", "门派特色/o4")
end;


function member()
Say("想了解谁?", 10, "掌门道一真人 /m1", "叶继美 /m2", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "姚石门/m6", "小道士清风/m7", "华宏/m8", "玉受 /m9", "小道士明月/m10")
end;


function config()
Say("想了解什么方面", 4, "附近地方/c1",  "山前/c2", "建筑物/c3", "山后/c4")
end;


function task1()
Say("本门只收土系弟子，男女都行. 想入门学艺，需要完成入门任务.", 1, "了解入门具体任务/v1")
end;


function task2()
Say("<#> 你已出世，不用做帮派任务了，目前已经"..UTask_wd.."<#>.", 0)
end;


function task3()

UTask_wd = GetTask(5)

if (UTask_wd < 10*256) then
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是 ", 1, "入门任务/v1")
end;

if (UTask_wd == 10*256) then
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 已入门，接下来可以进行:", 1, "道德经任务/v2")
end;

if (UTask_wd > 10*256) and (UTask_wd < 20*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是", 1, "道德经任务/v2")
end;

if (UTask_wd == 20*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 接下来可以进行:", 1, "道袍任务/v3")
end;

if (UTask_wd > 20*256) and (UTask_wd < 30*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是", 1, "道袍任务/v3")
end;

if (UTask_wd == 30*256) then
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 接下来可以进行:", 1, "画眉草任务/v4")
end;

if (UTask_wd > 30*256) and (UTask_wd < 40*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是", 1, "画眉草任务/v4")
end;

if (UTask_wd == 40*256) then
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 接下来可以进行:", 1, "润娘任务/v5")
end;

if (UTask_wd > 40*256) and (UTask_wd < 50*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是", 1, "润娘任务/v5")
end;

if (UTask_wd == 50*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 接下来可以进行:", 1, "行善任务/v6")
end;

if (UTask_wd > 50*256) and (UTask_wd < 60*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是", 1, "行善任务/v6")
end;

if (UTask_wd == 60*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 接下来可以进行:", 1, "出师任务 /v7")
end;

if (UTask_wd > 60*256) and (UTask_wd < 70*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是", 1, "出师任务/v7")
end;

if (UTask_wd >= 70*256) and (UTask_wd < 80*256) then	
Say("<#> 掌书：想入门学艺，首先要通过完成入门任务. 然后，依次完成门派5个任务. 将学到武功，被封称号.完成出师任务后，将成艺出师。你正在执行入门任务，现在已经"..UTask_wd.."<#>, 正在进行的任务是", 1, "重返师门/v8")
end;

end;

----------------------------------------------------------------------------------------------

function o1()
Say("本派信道教，玄天震武大帝。门派历史悠久，被世人称为内家至尊", 4, "知道了/ok", "地理位置/o2", "江湖地位/o3", "门派特色/o4")
end;

function o2()
Say("武当山也叫太华山，位于湖北境内，山势重叠雄伟，连绵千里。武当山山高险阻，上山的人会有默念出世的感觉.", 4, "知道了/ok", "门派起源/o1", "江湖地位/o3", "门派特色/o4")
end;

function o3()
Say("本门是武林道教圣地，与少林寺佛教齐名，天下武学，江湖有句话，北尊少林，南崇武当.", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "门派特色/o4")
end;

function o4()
Say("本派弟子行侠仗义，名震江湖，与同门相处讲义气。本门武艺注重修炼武功，以静制动，以刚克刚，以无形胜有形", 4, "知道了/ok", "门派起源/o1", "地理位置/o2", "江湖地位/o3")
end;

--------------------------------

function m1()
Say("位置 <color=blue>紫宵大殿<color>   坐标: <color=blue>200,198<color>   负责 <color=blue>任务 color><enter> 得道高人 , 心灵敦厚, 爱戴那些在江湖中重情重义，乐观的人", 10, "知道了/ok", "叶继美/m2", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "姚石门/m6", "小道士清风/m7", "华宏/m8", "玉受/m9", "小道士明月/m10")
end;

function m2()
Say("位置 <color=blue>h?Thanh Th駓<color>   坐标: <color=blue>213,190<color>   负责 <color=blue>任务color><enter> 武当大侠! 谦虚，上进", 10, "知道了/ok", "掌门道一真人/m1", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "姚石门/m6", "小道士清风/m7", "华宏/m8", "玉受/m9", "小道士明月/m10")
end;

function m3()
Say("位置 <color=blue>十方殿<color>   坐标: <color=blue>200,199<color>   负责 <color=blue>任务color><enter>武当大侠! 很好动，沉迷武学!", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "朱云泉/m4", "单思南/m5", "姚石门/m6", "小道士清风/m7", "华宏/m8", "玉受/m9", "小道士明月/m10")
end;

function m4()
Say("位置 <color=blue>城水湖东边<color>   坐标: <color=blue>219,192<color>   负责 <color=blue>任务color><enter>武当大侠! 性情谨慎，看问题周全", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "徐大岳/m3", "单思南/m5", "姚石门/m6", "小道士清风/m7", "华宏/m8", "玉受/m9", "小道士明月/m10")
end;

function m5()
Say("位置 <color=blue>龙虎殿<color>   坐标: <color=blue>200,199<color>   负责 <color=blue>任务color><enter>武当大侠! 年轻英雄，有情有义，文武双全.", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "徐大岳/m3", "朱云泉/m4", "姚石门/m6", "小道士清风/m7", "华宏/m8", "玉受/m9", "小道士明月/m10")
end;

function m6()
Say("位置 <color=blue>父母殿<color>   坐标: <color=blue>200,199<color>   负责 <color=blue>任务color><enter>武当大侠! 性情纯良，有时像小孩", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "小道士清风/m7", "华宏/m8", "玉受/m9", "小道士明月/m10")
end;

function m7()
Say("位置 <color=blue>磨针井 <color>   坐标: <color=blue>196,212<color>   负责 <color=blue>任务color><enter>武当书童，纯良可爱.", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "姚石门/m6", "华宏/m8", "玉受/m9", "小道士明月/m10")
end;

function m8()
Say("位置 <color=blue>广场<color>   坐标: <color=blue>210,195<color>   负责 <color=blue>交易兵器<color>", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "姚石门/m6", "小道士清风/m7", "玉受/m9", "小道士明月/m10")
end;

function m9()
Say("位置 <color=blue>广场 <color>   坐标: <color=blue>207,194<color>   负责 <color=blue>交易装备 color>", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "姚石门/m6", "小道士清风/m7", "华宏/m8", "小道士明月/m10")
end;

function m10()
Say("位置 <color=blue>广场<color>   坐标: <color=blue>209,197<color>   负责 <color=blue>交易药品<color>", 10, "知道了/ok", "掌门道一真人/m1", "叶继美/m2", "徐大岳/m3", "朱云泉/m4", "单思南/m5", "姚石门/m6", "小道士清风/m7", "华宏/m8", "玉受/m9")
end;

--------------------------------

function c1()
Say("东边可以去襄阳.", 4, "知道了/ok", "山前/c2", "建筑物/c3", "山后/c4")
end;

function c2()
Say("东边路上山有磨针井(196,212) 和无积湖(198,211) .", 4, "知道了/ok", "附近地方/c1", "建筑物/c3", "山后/c4")
end;

function c3()
Say("有十方殿(203,198) , 父母殿(203,194) , 龙虎殿 (213,196) , 紫宵大殿 (212,193) ", 4, "知道了/ok", "附近地方/c1", "山前/c2", "山后/c4")
end;

function c4()
Say("后山有火狼洞(240,187)和太子崖(232,183) .", 4, "知道了/ok", "附近地方/c1", "山前/c2", "建筑物/c3")
end;

--------------------------------

function v1()							
Talk(3, "", "通过完成任务, 你可以加入武当派务, 成为 <color=blue>道童<color>, 学到武功<color=blue>沧海明月<color>.<enter>需要等级10","第一步：到<color=blue>磨针井底<color> 见<color=blue>小道士清风 <color>, 接任务<color=blue>下井底<color> 找 <color=red>木桶 color>.", "第二步：下<color=blue>井底<color>, 打败<color=blue>大草莽, 有大鳄鱼<color> 或者<color=blue>大老虎<color>, 拿到 <color=red>木桶 color>.", "第三步：把<color=red>木桶color> 拿给 <color=blue>小道士清风 <color>, 完成任务")
end;


function v2()
Talk(4, "", "通过完成任务, 被封为<color=blue>闲散道人<color>, 学到武功<color=blue>武当剑法,武当拳法<color>.<enter>接该任务需要10级以上的弟子","第一步: 到 <color=blue>紫宵大殿<color> 见<color=blue>道一真人 <color>, 接任务到 <color=blue>叶继美color> 学<color=blue>'道德经<color>.", "第二步: 在紫宵大殿 <color=blue>城水湖西边<color> 见<color=blue>叶继美color> 学<color=blue>'道德经<color>.", "第三步: 返回 <color=blue>紫宵大殿<color>, 回答对问题<color=blue>道一真人<color>, 完成任务")
end;


function v3()
Talk(8, "", "通过完成任务, 被封为<color=blue>清修道人 <color>, 学到武功<color=blue>七星镇<color>.<enter> 接任务需要20级以上且已完成道德经任务.","第一步: 到 <color=blue>父母殿<color> 见<color=blue> 桃石门<color>, 接任务进入<color=blue>火狼洞<color> 找<color=red>天蚕道袍<color>.", "第二步: 到 <color=blue>火狼洞<color>, 打败<color=blue>红狼<color>, 拿到 <color=red>天蚕道袍<color>破烂的.", "第三步: 返回<color=blue>父母殿<color>找<color=blue> 桃石门<color>, 接任务到<color=blue>襄阳<color> 找<color=blue>杂货店老板<color> 想办法.", "第4步: 到 <color=blue>襄阳<color> 找<color=blue>杂货店老板(203,203)<color>, 知道她的小孩被<color=blue>野狼<color> 在<color=blue>火狼洞<color> 刁走.", "第5步: 进入<color=blue>火狼洞<color>, 打败<color=blue>野狼<color>, 救小孩，拿到<color=red>天蚕的头<color>.", "第六步: 返回<color=blue>襄阳杂货铺<color>, 拿到 <color=red>天蚕道袍<color> 已修好.", "第七步: 回去 <color=blue>父母殿<color>, 交<color=red>天蚕道袍<color> 已修好 给<color=blue> 桃石门<color>, 完成任务 如果天蚕道袍丢失, 要从头开始任务.")
end;


function v4()
Talk(4, "", "通过完成任务, 被封为<color=blue>巡山道人 <color>, 学到武功<color=blue>剑飞惊天<color>.<enter>接任务需要30级以上已成天蚕道袍任务.","第一步: 到 <color=blue>十方殿<color> 见<color=blue>徐大岳<color>, 接任务， 在<color=blue>72 小时内 color>到<color=blue>伏牛山东<color> 拿<color=red>5株画眉草<color>.", "第二步: 到 <color=blue>伏牛山东 <color>, 打败<color=blue>大火狐，大雪狼<color> 或者 <color=blue>大青狼<color>, 拿到 <color=red>画眉草<color>.", "第三步: 回去<color=blue>十方殿<color>, 交<color=red>5株画眉草<color> 给 <color=blue>徐大岳<color>, 如果规定时间未到, 任务完成. 如果过了规定时间，重新开始任务")
end;


function v5()
Talk(5, "", "通过完成任务, 被封为<color=blue>入关道人<color>, 学到武功<color=blue>世云踪<color>.<enter>接任务需要40级以上已完成画眉草任务","第一步: 到 <color=blue>清水湖东边<color> 见<color=blue>朱云泉<color>, 接任务到<color=blue>鸡冠洞<color> 交<color=red>掌门的信<color> 给 <color=blue>润娘<color>.", "第二步: 到 <color=blue>鸡冠洞<color> 见<color=blue>润娘 (202,184)<color>, 打败5 只 <color=blue>白玉虎color>, 然后接任务进入山洞找<color=red>润娘的信<color>.", "第三步: 打败 <color=blue>润娘家虎color> 或者 <color=blue>润娘家豹子<color>, 拿到 <color=red>润娘的回信<color>.", "第4步: 回去<color=blue>紫宵大殿<color>, 交 <color=red>润娘的信<color> 给 <color=blue>道一真人<color>, 完成任务 如果把润娘的信弄丢了, 要从头开始任务.")
end;


function v6()
Talk(6, "", "通过完成任务, 被封为 <color=blue>掌经道人<color>, 学到武功<color=blue>坐忘无我color>. <enter>接任务需要50级以上，同时要完成润娘任务.","第一步: 到 <color=blue>龙虎殿<color> 见<color=blue>单思南<color>, 接任务到<color=blue>天蚕洞<color> 为民除害.", "第二步: 到 <color=blue>天蚕洞<color>, 打败土匪头目<color=blue>铁阁<color>, 拿到 <color=blue>10000 两<color>.", "第三步: 回去<color=blue>龙虎殿<color>, 接任务把所有银两给 <color=blue>邓家大嫂<color> 在<color=blue>襄阳<color>. ", "第4步: 到 <color=blue>襄阳<color> 见<color=blue>邓家大嫂(205,204)<color>, 送10000两", "第5步: 回去 <color=blue>龙虎殿<color>, 见<color=blue>单思南<color> 复命, 完成任务")
end;


function v7()
Talk(10, "", "通过完成任务, 被封为<color=blue>玄武神侍color>, 顺利出师<enter>接任务需要50级以上已完成任务日行一善.","第一步: 到 <color=blue>紫宵大殿<color> 见<color=blue>道一真人<color>, 接任务到<color=blue>太子崖<color> 找<color=blue>3 宝箱<color>, 拿宝箱内的宝贝.", "第二步: 到 <color=blue>太子崖<color> 找3 宝箱: 点击鼠标进入<color=blue>宝箱 1 (237,181)<color>, 接任务到<color=blue>襄阳<color> 见<color=blue>药店老板<color> 找控制病情蔓延的办法", "点击<color=blue>宝箱 2 (237,179)<color>, 接任务 到 <color=blue>襄阳<color> 找<color=blue>铁匠<color> 想办法解决抗金兵的办法.", "点击<color=blue>宝箱 3 (233,177)<color>, 接任务 消灭 <color=blue>襄阳守将<color>.", "第三步: 到 <color=blue>襄阳<color> 找<color=blue>药店老板 (201,202)<color>, 接任务到<color=blue>伏牛山东<color> 找5 种药材: <color=red>合欢, 玄参，当归, 封棋，朱砂<color>. ", "到 <color=blue>襄阳<color> 见<color=blue>铁匠 (193,201)<color>, 接任务到<color=blue>襄阳西南<color> 找3 种矿石: <color=red>赤铜矿，磁铁矿，亮银矿<color>.", "到 <color=blue>襄阳<color> 与 <color=blue>衙门卫兵对话<color> 知道<color=blue>襄阳守将<color> 躲在 <color=blue>衙门密道<color>,进入密道, 打败守将, 完成任务", "第4步: 回去<color=blue>太子崖<color>, 点击<color=blue>3 个宝箱 <color>, 拿到 <color=red>玉清真经，上清真经，太清真经<color>.", "第5步: 返回<color=blue>紫宵大殿<color>, 交3 部真经给 <color=blue>道一真人<color>, 完成任务")
end;

function v8()
Talk(3,"","Sau khi 重返师门, 被封为<color=blue>玄武真君<color>, 学到镇派绝学<color=blue>太极神功，无我无剑，三环曹月<color>.","第一步: 等级达到60,到<color=blue>紫宵大殿<color> 见<color=blue>道一真人<color>,申请重返武当派.","第二步: 交<color=red>50000 两<color>, 重返武当派.")
end;

--------------------------------

function ok()
end;
