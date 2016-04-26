-- 新任务系统中立支线管理npc
-- BY：XIAOYANG（2004-11-30）

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_liunanyun()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002) --中立主线
	Uworld186 = nt_getTask(186)
	Uworld1054 = nt_getTask(1054) --中立20-30支线
	Uworld1055 = nt_getTask(1055) --中立30-40支线
	Uworld1056 = nt_getTask(1056) --中立40-50支线
	Uworld1057 = nt_getTask(1057) --中立50-60支线
	Uworld1012 = nt_getTask(1012) --中立支线的杀怪任务变量
	Uworld197 = nt_getTask(197) --中立全奖励
	local name = GetName()
----------------------------------------------------教育任务-----------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 1 ) then 
			nt_setTask(1000,310) --环节16start
			Talk(3,"Uworld1000_zhfz1",name..": 五爷叫我来的，这是五爷的信!","真是五哥的信。五哥的朋友就是我的朋友，以后有生意，我会照顾你，哈哈。","你可以进城玩，用Tab键打开地图看城内布局，然后来找我.")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 1 )  then
			nt_setTask(1000,330) --环节17start
			Talk(2,"Uworld1000_zhfz2",name..": 我看过了..","现在去找武林传人吧.")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 1 ) and ( Uworld1002 < 10 ) then
			nt_setTask(1000,430) --环节22start
			Talk(5,"Uworld1000_zhfz3","事情都办完了。这是五哥给你的袋子，他嘱咐你不用去见他了，自己漂泊江湖吧，袋中的信要早点看!",name..":......替我感谢五爷.","以后，完成一个主线任务后就来见我。我有一些小任务交给你，如果完成了将会有奖励等着你，就算是替五哥帮助你了..",name..": 好的。我记住了。","其他任务你也可以做，可以获得不是经验值，只是他们会对你有成见，所以，有几件宝物不能给你。你可以进村镇找龙五问问。")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 1 ) and ( Uworld1002 > 10 ) then
			Talk(1,"Uworld1000_finishzhongli","你已接了各方任务，需要说的我也说了，你去吧.")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 1 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1002 < 10 ) then 
			Say("为什么又回来了？是不是忘了拿信袋？.",2,"遵命Uworld1000_zhfz4","不是! 只是回来看看你而已!/Uworld1000_no2")
		else
			Talk(1,"","在行走江湖的路上，有不懂的就按<color=red>F12<color> 看锦囊。如果你正在接<color=red>任务<color>, 就不能接其他任务了..")
		end
-----------------------------------------------------------------中立支线-----------------------------------------------------------------------------
	else
		if (( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1)) or (( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1)) or (( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1)) or  (( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1)) then
			Describe(DescLink_LiuNanYun.."<#>:  我对你的表现很满意，送你一件宝物。",1,"领取宝物/allprize_zhongli")
		elseif ( Uworld1057 == 90 ) or ( Uworld1057 == 100 ) then
			nt_setTask(1057,100)
			Describe(DescLink_LiuNanYun.."<#>: 谢谢.......我将不会忘记你.",1,"结束对话/Uworld1057_zfz5")
		elseif ( Uworld1057 == 60 ) or ( Uworld1057 == 70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,70)
				Describe(DescLink_LiuNanYun.."<#>:  你已努力做我交给的任务，我很感激.<enter>"
				..name.."<#>:  柳大爷! 最近你有点异常<enter> 异常？哈哈，很可能。也许是因为我伪装已久.<enter>"
				..name.."<#>:  柳大爷! 你有心事啊？<enter>没什么，我告诉你一个没有人知道的秘密.<enter>"
				..name.."<#>:  要不不说了，我不想知道你的心事，知道了需要承担很多事情.<enter>真是遗憾，在这个世界上，只有你能帮我.<enter>"
				..name.."<#>:...... 既然如此，你说吧.<enter> 我是一个可怜的人.<enter>"
				..name.."<#>:  什么？ <enter>我也是一个普通的武林人士，依靠自己生活。但是，由于年少轻狂，有一次在酒楼，我失手杀了一个沾花惹草的公子。谁知道他是盗贼唯一的儿子。"
				..name.."<#>:  他是该死。!<enter> 龙追舞精通易容术，武艺又高，纵横武林20多年，没有人打得过他。<enter>"
				..name.."<#>:  你放心，我将为您报仇.<enter> 也只有你能胜任了，他经常假装成妇女进入大理，我知道的只有这么多了.<enter>",
				1,"结束对话/Uworld1057_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color> 看日程. 里面只保存着你执行过的步骤!")
			end
		elseif ( Uworld1057 == 40 ) or ( Uworld1057 == 50 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,50)
				Describe(DescLink_LiuNanYun.."<#>:  接着回答宋金问题.",1,"结束对话/branch_songjinproblem")				
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color>  看日程. 里面只保存着你执行过的步骤!")
			end
		elseif (( Uworld1057 == 20 ) or ( Uworld1057 == 30 )) and ( Uworld1012 == 20 ) then --增加了判断是否在宋金pk了一场的变量Uworld1011
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,30)
				Describe(DescLink_LiuNanYun.."<#>:  做的很好.",1,"结束对话/Uworld1057_zfz4")				
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color>  看日程. 里面只保存着你执行过的步骤!")
			end
		elseif ( Uworld1056 == 70 ) or ( Uworld1056 == 80 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,80)
				Describe(DescLink_LiuNanYun.."<#>:  做的很好，组织将重赏与你.",
				1,"结束对话/Uworld1056_zfz5")
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color>  看日程. 里面只保存着你执行过的步骤!")
			end
		elseif (( Uworld1056 == 40 ) or ( Uworld1056 == 50 )) and ( Uworld1012 == 20 ) then --增加了判断是否在宋金pk了一场的变量Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,50)
				Describe(DescLink_LiuNanYun.."<#>:  扬州有渝湘津在比武场胜了百余场，没有人敢去挑战他。所以，他拿出一笔大钱叫我们消除姓渝的。他可能不是坏人，但是，利益在眼前，能怎么办呢。你说对吗?<enter>"
				..name.."<#>:  对的.<enter>"
				..name.."<#>: 我不想杀他.<enter> 除非你退出江湖，如果不杀他，我们的名声就没有了，没有人再请我们了。江湖很刻薄，你无权选择.<enter>",
				1,"结束对话/Uworld1056_zfz4")
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color>  看日程. 里面只保存着你执行过的步骤!")
			end
		elseif ( Uworld1056 == 27 ) or ( Uworld1056 == 30 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,30)
				Describe(DescLink_LiuNanYun.."<#>:  最近突然接到非常危险的任务，关系到扬州比武场。你去那里再比一次，需要胜一场才能回来见我。<enter>",
				1,"结束对话/Uworld1056_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color>  看日程. 里面只保存着你执行过的步骤!")
			end
		elseif (( Uworld1056 == 20 ) or ( Uworld1056 == 25 )) and ( Uworld1012 == 20 ) then --增加了判断是否在pk了一场的变量Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,25)
				Describe(DescLink_LiuNanYun.."<#>:  怎么样，知道天外有天，人外有人了吧.<enter>",1,"结束对话/Uworld1056_zfz6")
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color>  看日程. 里面只保存着你执行过的步骤!")
			end																			
		elseif ( Uworld1055 == 130 ) or ( Uworld1055 == 140 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1055,140)
				Describe(name.."<#>:  南云，西北镖车的事已经解决完了.<enter>"
				..DescLink_LiuNanYun.."<#>:  是谁做的?<enter>"
				..name.."<#>:  一伙女贼，自称是荷花盗.<enter> 是她们？我听说过。在故主的感恩礼物内有一块性能矿石，你带一些宝石，隐性装备去找神秘铁匠合成一个装备。<enter>",
				1,"结束对话/Uworld1055_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","做任务时，遇到什么问题，可以按<color=red>F12<color>  看日程. 里面只保存着你执行过的步骤!")
			end
		elseif ( GetLevel() >= 20)  then
			Say(" 谁都不重要，只需要有本领就行!",3,"我想做一些主线任务./Uworld1000_zhfz6","我想做一些支线任务/Uworld1000_zhfz7","放下屠刀立地成佛，我不想杀人。/Uworld1000_no2")
		else
			Talk(1,"","以后行走江湖，有不懂的就按<color=red>F12<color> 看锦囊")
		end
	end
end

function Uworld1000_zhfz6()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002)
	local name = GetName()
	if ( Uworld1002 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","你快去新手村找龙五，记得带好他的信。如果丢了引接信，没人相信你了!")
		Msg2Player("柳南云叫你去新手村找龙五，将有新的任务!")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","柳南云 : 你还有任务，完成后，龙五将交给你其他任务.")
	elseif ( Uworld1002 ~= 0 ) then
		Talk(1,"","你已踏上杀手之路，不能回头。你不是已经接任务了吗?.")
	else
		Talk(1,"","主线任务是在你达到一定级别后才能接的，只需人物等级20以上就可以接了。如果完成......将有奖励等着你.")
	end
end

function Uworld1000_zhfz7()
	Uworld1054 = nt_getTask(1054) --中立20-30支线
	Uworld1055 = nt_getTask(1055) --中立30-40支线
	Uworld1056 = nt_getTask(1056) --中立40-50支线
	Uworld1057 = nt_getTask(1057) --中立50-60支线
	local name = GetName()
	Describe(DescLink_LiuNanYun.."<#>:  这个时间只属于强者。你只有一个唯一的存在方式，就是：战斗!",6,
	"我想领奖做支线任务的方法/Uworld1000_zhfz8" ,
	"我想做任务从20级 到 29级/Uworld1054_zfz1",
	"我想做任务从30级到 39级/Uworld1055_zfz1",
	"我想做任务从40级 到 49级/Uworld1056_zfz1",
	"我想做任务从50级 到 59级/Uworld1057_zfz1",
	"要不以后做!/no")
end

function Uworld1000_zhfz8()
	Describe(DescLink_LiuNanYun.."<#>:  支线任务的根本是主线任务，当达到一定等级后才能接。比如，当你的等级为32,你需要接30级主线前的任务，然后才能接支线任务。之前",1,"结束对话/no")
end

function Uworld1054_zfz1()
	Uworld1054 = nt_getTask(1054) --中立20-30级之间的支线任务变量
	Uworld1002 = nt_getTask(1002) --中立主线任务变量
	local name = GetName()
	if ( Uworld1002 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1054 == 0 ) or ( Uworld1054 == 10 )) then
		nt_setTask(1054,10)
		Describe(DescLink_LiuNanYun.."<#>:  现在江湖，使用剑的高手，可以算上武当和峨眉.<enter>"
		..name.."<#>:  好像没有人才.<enter>你错了，正因为没有合适的兵器。好剑是是你的性命使用的剑.<enter>"
		..name.."<#>:  以强欺弱不是正道.<enter>柳南云: 哈哈，你这样说，人家不一定这样想<enter>"
		..name.."<#>:  你说的也有理<enter>想作呕杀手，利器很重要。听说扬州渔民在一个暴风骤雨的夜晚发现在海底出现了奇异的景象，需要调查。<enter>"
		..name.."<#>:  好的.<enter> 我有朋友姓江一萧，你去找他帮忙，他将不会拒绝。<enter>"
		..name.."<#>:  这样太好了。江一萧平常喜欢什么？最好是准备好点的礼物.<enter>不需要，他在秦岭任职，那里正被刺猬破坏，首先去秦岭打50个刺猬。<enter>"
		..name.."<#>:  小事一桩。<enter>",
		1,"结束对话/Uworld1054_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","对不起! 你的等级未达任务要求，等到20级，在接相应的主线任务后再来找我.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","对不起! 你的等级超过了任务要求，不能接任务。")
	elseif ( Uworld1002 < 20 ) then
		Talk(1,"","对不起! 你未做相应等级的中立主线任务，请到<color=red>汴京<color>找傅南冰.")
	else
		Talk(1,"","人生有很多我做梦都想不出的奇妙东西!")
	end
end

function Uworld1054_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,10)
	nt_setTask(1054,20)
	AddPlayerEvent(2) 
	Msg2Player("柳南云叫你去扬州找江一萧，询问神兵出世的信息，到秦岭打50个刺猬.")
end

function Uworld1055_zfz1()
	Uworld1055 = nt_getTask(1055) --中立30-40级之间的支线任务变量
	Uworld1002 = nt_getTask(1002) --中立主线任务变量
	local name = GetName()
	if ( Uworld1002 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1055 == 0 ) or ( Uworld1055 == 10 )) then
		nt_setTask(1055,10)
		Describe(DescLink_LiuNanYun.."<#>:  有大生意了.<enter>"
		..name.."<#>:  生意？<enter> 西北镖局的镖车接连被劫，护送镖师每人能逃脱，36镖局拿出一笔打钱让我们调查凶犯.<enter>"
		..name.."<#>:  西北人原本就很好战! <enter>你可以到凤翔找双鹰镖局的主人，他将给你说明情况.<enter>",
		1,"结束对话/Uworld1055_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","对不起! 你的等级未达任务要求，等到30级，接相应的主线任务后再来找我吧.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","对不起! 你的等级超过任务要求，不能继续接任务")
	elseif ( Uworld1002 < 70 ) then
		Talk(1,"","对不起!你未做相应等级的中立主线任务，请到<color=red>汴京<color>找副帮主.")
	else
		Talk(1,"","人生有很多我做梦都想不出的奇妙东西!")
	end
end

function Uworld1055_zfz2()
	AddOwnExp(15000)
	nt_setTask(1055,20)
	Msg2Player("最近西北发生大案，柳南云叫你到凤翔找双鹰镖局主人问个明白。")
end

function Uworld1055_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level30();
end

function Uworld1056_zfz1()
	Uworld1056 = nt_getTask(1056) --中立40-50级之间的支线任务变量
	Uworld1002 = nt_getTask(1002) --中立主线任务变量
	local name = GetName()
	if ( Uworld1002 >= 120 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1056 == 0 ) or ( Uworld1056 == 10 )) then
		nt_setTask(1056,10)
		Describe(DescLink_LiuNanYun.."<#>:  你感觉做高手容易吗?.<enter>"
		..name.."<#>:  我不知道，只感觉好受.<enter> 好受？那是因为你没有遇到绝世高手!快去扬州比赛一场吧。 <enter>",
		1,"结束对话/Uworld1056_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","对不起! 对不起，你的等级未达任务要求，等到40级, 接了相应的主线任务后再来找我.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","对不起! 你的等级超过任务要求，不能继续接任务?")
	elseif ( Uworld1002 < 120 ) then
		Talk(1,"","对不起!你未做相应等级的中立主线任务，请到<color=red>汴京<color>找副帮主.")
	else
		Talk(1,"","人生有很多我做梦都想不出的奇妙东西!")
	end
end

function Uworld1056_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,20) 
	Msg2Player("柳南云叫你去比武场打一场，证明你的本领。")	
end

function Uworld1056_zfz3()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,40)
end

function Uworld1056_zfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level40();
end

function Uworld1057_zfz1()
	Uworld1057 = nt_getTask(1057) --正派50-60级之间的支线任务变量
	Uworld1002 = nt_getTask(1002) --正派主线任务变量
	local name = GetName()
	if ( Uworld1002 >= 190 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ((  Uworld1057 == 0 ) or ( Uworld1057 == 10 ))  then
			nt_setTask(1057,10)
			Describe(DescLink_LiuNanYun.."<#>:...我和你一起的日子就要结束了.<enter>"
			..name.."<#>:  为什么突然这样说?<enter> 做杀手不能做一世。手上沾有很多血，也不是好事.<enter>"
			..name.."<#>:  你想洗手不做了?<enter>对，我已准备了一些钱，为余生做打算.<enter>"
			..name.."<#>:......也好.<enter>  在去之前，我想你再帮我最后一次.<enter>"
			..name.."<#>:  柳大侠尽管说。<enter>你到宋金战场，拿200点积分。不要问我原因.<enter>",
			1,"结束对话/Uworld1057_zfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","对不起! 对不起，你的等级未达任务要求，等到50, 接了相应的主线任务后再来找我.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","对不起! 你的等级超过任务要求，不能继续接任务?")
	elseif ( Uworld1002 < 190 ) then
		Talk(1,"","对不起!你未做相应等级的中立主线任务，请到<color=red>汴京<color>找副帮主.")
	else
		Talk(1,"","人生有很多我做梦都想不出的奇妙东西!")
	end
end

function Uworld1057_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(60000)
	nt_setTask(1012,10)
	nt_setTask(1057,20) 
	Msg2Player("柳南云叫你参加宋金大战，拿200点积分奖励回去，看起来有重要的任务等着你.")	
end

function Uworld1057_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level50();
end

function Uworld1000_zhfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --环节16end 
	Msg2Player("柳南云叫你回城休息，再来找他.")	
end

function Uworld1000_zhfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --环节17end 
	Msg2Player("柳南云叫你你找武林传人.")	
	seteducationnpcpos()
end

function Uworld1000_zhfz3()
	AddItem(6,1,131,1,0,0,0)  --增加龙五的包袱
	AddOwnExp(20000)
	nt_setTask(186,10)
	nt_setTask(1000,440) --环节22end
	Msg2Player("你获得一个信袋，柳南云叫你快点打开信袋，拿着信去找要找的人.")	
end

function Uworld1000_zhfz4()
	AddItem(6,1,131,1,0,0,0)  --增加龙五的包袱
	nt_setTask(186,10)
	Msg2Player("你获得一个信袋，柳南云叫你快点打开信袋，拿着信去找要找的人.")	
end

function Uworld1000_zhfz5()
	Talk(1,"","你去各新手村找龙五，记得拿好他的信。如果信丢了，就没人相信你了!")
	Msg2Player("柳南云叫你去新手村找龙五，将有新任务!")		
end

function Uworld1000_no2()
	Talk(1,"","江湖上，没有风平浪静的时候，你要保重。然后回来这里，我有任务交给你.")
end

function allprize_zhongli()
	Uworld197 = nt_getTask(197) --正派全奖励
	local i=random(1,1200)
	if ( i >= 1 ) and ( i <= 99) then
		AddEventItem(490)
	elseif ( i >= 100 ) and ( i <= 199) then
		AddEventItem(491)
	elseif ( i >= 200 ) and ( i <= 299) then
		AddEventItem(492)
	elseif ( i >= 300 ) and ( i <= 399) then
		AddEventItem(493)
	elseif ( i >= 400 ) and ( i <= 499) then
		AddEventItem(494)
	elseif ( i >= 500 ) and ( i <= 599) then
		AddEventItem(495)
	elseif ( i >= 600 ) and ( i <= 699) then
		AddEventItem(496)
	elseif ( i >= 700 ) and ( i <= 799) then
		AddEventItem(497)
	elseif ( i >= 800 ) and ( i <= 899) then
		AddEventItem(498)
	elseif ( i >= 900 ) and ( i <= 999) then
		AddEventItem(499)
	elseif ( i >= 1000 ) and ( i <= 1099) then
		AddEventItem(500)
	elseif ( i >= 1100 ) and ( i <= 1200) then
		AddEventItem(501)
	end
	Msg2Player("恭喜你获得1个藏宝图碎片.")
	if ( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(197,SetBit(GetTask(197),1,1))
	Msg2Player("恭喜你获得1 个金枫濯链光")
	elseif ( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(197,SetBit(GetTask(197),2,1))
	Msg2Player("恭喜你获得1  金枫公瑾三叹.")
	elseif ( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(197,SetBit(GetTask(197),3,1))
	Msg2Player("恭喜你获得1 金枫兰亭玉")
	elseif ( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(197,SetBit(GetTask(197),4,1))
	Msg2Player("恭喜你获得1金枫铜雀春深.")
	end	
	Msg2Player("你已完成该等级任务.")
end

function Uworld1000_finishzhongli()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("你已完成初入任务.")
end

function no()
end
