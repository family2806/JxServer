-- 新任务系统邪派支线管理npc
-- BY：XIAOYANG（2005-1-17）
 
 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_tuobahuaichuan()
--------------------------------------------------------------------教学任务------------------------------------------------------------------
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)   --教学任务变量
	Uworld1003 = nt_getTask(1003)	 --邪派主线任务变量
	Uworld189 = nt_getTask(189)
	Uworld1058 = nt_getTask(1058) --邪派20-30支线
	Uworld1059 = nt_getTask(1059) --邪派30-40支线
	Uworld1060 = nt_getTask(1060) --邪派40-50支线
	Uworld1061 = nt_getTask(1061) --邪派50-60支线
	Uworld1013 = nt_getTask(1013) --邪派支线的杀怪任务变量
	Uworld198 = nt_getTask(198) --邪派全奖励
	local name = GetName()  
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 2 ) then 
			nt_setTask(1000,310) --环节16start
			Talk(3,"Uworld1000_xfz1",name.."：是五爷介绍我来的，这是五爷给你的信。","拓跋怀川：龙五的人？哼，他还记得我拓跋怀川啊。","拓跋怀川：你可以先在城里四处逛逛，用Tab键点开地图观看一下城里的布局。熟悉熟悉再来找我。")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 2 ) then
			nt_setTask(1000,330) --环节17start
			Talk(2,"Uworld1000_xfz2",name.."：我已经看得差不多了。","拓跋怀川：那好，先去找武林盟传人吧。")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 2 ) and ( Uworld1003 < 10 ) then
			nt_setTask(1000,430) --环节22start
			Talk(5,"Uworld1000_xfz3","拓跋怀川：回来了，喏，这是那家伙给你留的包袱，他嘱咐你不用回去看他了，自去江湖上闯荡吧。包袱里的信需及早看，不可耽误。切记，切记。",name.."：……请代我谢谢五爷。","拓跋怀川：要谢自己去谢。今后每完成一个主线任务都回我这里来，我有些小任务交给你，完成了会有意想不到的东西送给你。我可不会让那老家伙专美。",name.."：好！我记住了。","柳南云：其他阵营的任务你不是不可以做，能得到不少的经验，只是他们对你有门户之见，一些珍贵的东西就不会送你了。你可以去找各村镇里的龙五打听打听。")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 2 ) and ( Uworld1003 > 10 ) then
			Talk(1,"Uworld1000_finishxiepai","拓跋怀川：你既然已经开始接各阵营的任务了，那我这里也留不住你，你该学的都差不多了，自己去吧。")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 2 ) and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1003 < 10 ) then 
			Say("怎么又回来了？是不是包袱丢在我这里了。",2,"是/Uworld1000_xfz4","不是，只是回来看看你/Uworld1000_no3")
		else 
			Talk(1,"","拓跋怀川：拳倾南山，掌倒北海，你是要走镖吗？提醒一句，如果你在<color=red>教育任务<color>内，是没有办法继续做其他等级任务的，请先做完教育任务，谢谢。")
		end
----------------------------------------------------------------------邪派支线---------------------------------------------------------------	
	else
		if (( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1)) or (( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1)) or (( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1)) or  (( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1)) then
			Describe(DescLink_TuoBaHuaiChuan.."<#>：为了对你做出的优异表现表示嘉奖，我决定给你些珍贵的宝物！",1,"领取宝物/allprize_xiepai")
		elseif ( Uworld1061 == 110 ) or ( Uworld1061 == 120 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>：好，盛尹一死，我大金再无后顾之忧，做的好。这段时间你可以出去游山玩水，避避风头。<enter>",
				1,"结束对话/Uworld1061_xfz6")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1061 == 80 ) or ( Uworld1061 == 90 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>：哎……<enter>"
				..name.."<#>：将军为何事如此闷闷不乐？<enter>拓跋怀川：我大军南下日久，战事却一直进展缓慢，襄阳城高壁厚，兵精将猛，守备使盛尹更是智勇双全，战事拖得越久，我军补给越困难，如果入冬，恐怕有徒劳而返的可能。<enter>"
				..name.."<#>：将军的意思是？<enter>拓跋怀川：杀掉盛尹，则襄阳不战自溃。<enter>",
				1,"结束对话/Uworld1061_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1061 == 60 ) or ( Uworld1061 ==70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,70)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>：你回答的非常完美！",1,"结束对话/Uworld1061_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1061 == 40 ) or ( Uworld1061 == 50 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,50)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>：你是否已准备好回答我的问题？",2,"是的，我已准备好了/branch_songjinproblem","不，让我再想想吧/no")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif (( Uworld1061 == 20 ) or ( Uworld1061 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,30)
				Describe(
				name.."<#>：将军，积分我都拿满了。<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>：呵呵，果然进境神速，现下看来，你身上那股英武的气概已有如渊停岳峙，步下隐隐有龙虎之风，改日皇上要亲自招见你，必然问到宋金战场的一些战况，我先考考你。<enter>",
				1,"结束对话/Uworld1061_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1060 == 110 ) or ( Uworld1060 == 120 )then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>:这世上恐怕真的没有事可以难住你了。",
				1,"结束对话/Uworld1060_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif (( Uworld1060 == 80 ) or ( Uworld1060 == 90 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>：哈哈，好样的，只要有你出马，从来不会失败，我果然没有信错人。<enter>"
				..name.."<#>：不过是一场胜利，不值一提。<enter>拓跋怀川：可你知道在大宋朝引起了多大反响吗？<enter>"
				..name.."<#>：不知道。<enter>拓跋怀川：山雨欲来，人心惶惶。不过也将你推到了一个风口浪尖，我有些过意不去。<enter>"
				..name.."<#>：是我自己愿意的。<enter>拓跋怀川：那么好吧，我已经查的很清楚，南宋朝廷中提议推广擂台赛的官员乃是襄阳大豪阮明远，此人本乃少林寺的俗家弟子，也算是武林中人，才会提议这种强国之道，目前他在襄阳野外筹备擂台赛事宜的时候，这是个刺杀他的好机会，如果成功，将大大的降低宋国军民的斗志。我思来想去，只有你能担此重任。<enter>",
				1,"结束对话/Uworld1060_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1060 == 60 ) or ( Uworld1060 == 70 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,70)
				Describe(name.."<#>：将军，我已亲身经历过了宋朝的擂台比赛，确实凶险万分，非悍勇者不可胜。<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>：是吗，那我大金国武勇天下的名号放在哪里？你去，给我打胜一场，必须胜，让大家都瞧瞧，这天下是谁的天下！<enter>",
				1,"结束对话/Uworld1060_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1059 == 110 ) or ( Uworld1059 == 120 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>：人抓回来了？好！你又立了大功一件，将来一定有重重的封赏。<enter>",
				1,"结束对话/Uworld1059_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1059 == 60 ) or ( Uworld1059 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,70)
				Describe(
				name.."<#>：拓跋将军，不出你所料，施宜生在南宋大肆透露我军绝秘消息，心怀叵测。<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>：这个杂种！<enter>"
				..name.."<#>：将军息怒。<enter>拓跋怀川：……有了！你去一趟临安，把他秘密弄回来。这样一来可防泄秘，二来大金的使节在南宋都城失踪，我看他们如何交代，只要一着不慎，便有把柄握在咱们手里。<enter>"
				..name.."<#>：行。<enter>拓跋怀川：临安守备森严，不是你以往去过的地方可以相比，这次行动恐怕困难不小。<enter>"
				..name.."<#>：大不了一条命，不成功，便成仁。<enter>拓跋怀川：这个仁可以不成，还是不成的好。我在临安也安排了细作，你可以去临安酒馆边找个醉汉，此人天天喝得大醉，从没人能想到，他居然是我们的人。<enter>",
				1,"结束对话/Uworld1059_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif (( Uworld1059 == 20 ) or ( Uworld1059 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,30)
				Describe(name.."<#>：你要求的，我做到了，我疑惑的，请给出答复。<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>：哈哈哈哈，能得一强援真乃天佑大金。其实，我真实的身份乃大金国东京留守完颜庆熙麾下平南军斥侯营千户。<enter>"
				..name.."<#>：您竟然是位将军。<enter>拓跋怀川：其实我今天得到的一切，对你来说易如翻掌，只要能办好我交代的事情，我定然保荐你入朝为官。<enter>"
				..name.."<#>：听起来似乎不错。<enter>拓跋怀川：恩，现在有个相当重大的任务需要交给你，整个北方知道这件事的人不超过五个。<enter>"
				..name.."<#>：究竟是什么事？<enter>拓跋怀川：据细作回报，近日大金派往南宋的使者施宜生行动诡秘，可能有所异动，此人了解我国太多的内幕，你速去襄阳寻找我大金在南宋的细作首领刘蕴古，了解详情。<enter>"
				..name.."<#>：那好，明日我就动身。<enter>拓跋怀川：不！即刻就走，此事十万火急，一切拜托你了。<enter>",
				1,"结束对话/Uworld1059_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1058 == 90 ) or ( Uworld1058 == 100 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,100)
				Describe(DescLink_TuoBaHuaiChuan.."<#>：沈风被人假扮？我需要去查查，暂时你的任务完成了。<enter>",1,"结束对话/Uworld1058_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end																																			
		elseif (( Uworld1058 == 20 ) or ( Uworld1058 == 30 ))  and ( Uworld1013 == 20 ) then 
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,30)
				Describe(DescLink_TuoBaHuaiChuan.."<#>：杀完了吗？果然是大金国的男人！<enter>拓跋怀川：既然你这样能干，我就托付一件重大的事情给你。<enter>"
				..name.."<#>：先生请说。<enter>拓跋怀川：你既然去过巴蜀，对成都该不陌生。即刻持我的令牌潜入成都，找一个叫邹长久的人，他是我大金国布置的细作，找到他，将一些东西立即带出城，迟了恐怕就来不及了。<enter>",
				1,"结束对话/Uworld1058_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。");
			end
		elseif ( GetLevel() >= 20) then
			Say("怎么，江湖上呆腻了，想找点刺激的工作？没问题。",3,"我想先做些邪派阵营的主线任务/Uworld1000_xfz8","我想接邪派阵营的支线任务/Uworld1000_xfz88","江湖败类，人人得而诛之。谁稀罕做你的任务。/Uworld1000_no3")
		else
			Talk(1,"","拓跋怀川：你干吗呢？快走快走，现在没工夫管你，我忙得很。有不懂的地方就打开<color=red>F12<color>查看。")
		end
	end
end



function Uworld1000_xfz8()
	Uworld1000 = nt_getTask(1000)
	Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","拓跋怀川：你先去各新手村找个叫龙五的汉子。他人头广，引荐的信函需要此人开，不然就算你找到那些隐藏起来的家伙，他们也不会让你帮手的。")
		Msg2Player("傲云宗让你去新手村找叫龙五的人，他会引荐你获得一些任务。")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","拓跋怀川：你还在做教育任务呢，做完之后，龙五自然会安排给你其他任务，不要心急。")
	elseif ( Uworld1003 ~= 0 ) then
		Talk(1,"","拓跋怀川：朋友，你不是做了邪派主线任务吗，不是在戏弄我吧，我是老实人，别骗我啊，真是。")
	else
		Talk(1,"","主线任务就是到达特定等级后就可以接到的任务，任何等级大于20级的人都可以完成，如果都做完的话......会有你意想不到的丰厚奖励吧。")
	end
end

function Uworld1000_xfz88()
	Uworld1058 = nt_getTask(1058)
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1061 = nt_getTask(1061)
	Describe(DescLink_TuoBaHuaiChuan.."<#>:世上有几个人是靠安分发了财？要想出头，跟着我干吧。",6,
	"我想先了解下支线任务的做法/Uworld1000_xfz7" ,
	"我想做二十到二十九级之间的任务/Uworld1058_xfz1",
	"我想做三十到三十九级之间的任务/Uworld1059_xfz1",
	"我想做四十到四十九级之间的任务/Uworld1060_xfz1",
	"我想做五十到五十九级之间的任务/Uworld1061_xfz1",
	"还是以后再来做吧，我最近自己都顾不过来/no")
end

function Uworld1000_xfz7()
	Describe(DescLink_TuoBaHuaiChuan.."<#>:支线任务是在主线任务的基础上，只能在特定的等级范围内，才可以接到，而且必须在该范围内完成的任务。如当您的等级为三十二级时，您的等级在三十到四十级之间。您首先必须接到三十级的主线任务，然后才可以到我这里接三十到四十级的支线任务。而且您必须在您的等级到达四十级之前完成它，否则任务会自动取消，您无法再继续做下去。复杂吧，条件困难吧，那是因为奖励够丰厚。等级超过六十级的朋友暂时没有合适的支线任务，因为近来江湖中的头面人物似乎在策划一项惊天地泣神鬼的事情，很快您就能得到消息了。",1,"结束对话/no")
end

function Uworld1058_xfz1()
	Uworld1058 = nt_getTask(1058) --邪派20-30级之间的支线任务变量
	Uworld1003 = nt_getTask(1003) --邪派主线任务变量
	local name = GetName()  
	if ( Uworld1003 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1058 == 0 ) or ( Uworld1058 == 10 )) then
		nt_setTask(1058,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:中原武林人士一直就看不起大金，以为我们不过以蛮力取胜，其实我大金智将不以记数，哪是区区南宋可以相比，瞧瞧岳飞的死，就知道了。<enter>"
		..name.."<#>：如果不是宋人内部分崩离析，腐朽透顶，恐怕我们要取胜确实不易吧。<enter>拓跋怀川：是这样的，宋朝还是很有几个能打仗的将军，所以我们一刻都不能松懈，真正享福的时候，恐怕是夺取大宋河山以后了。<enter>"
		..name.."<#>：我正当壮年，拓跋先生有什么吩咐，请尽管直言。<enter>拓跋怀川：好，不久后大金即将展开大规模的战事，我需要你变得更强。且去蜀中唐门走一趟，杀掉五十只黑叶猴吧。<enter>",
		1,"结束对话/Uworld1058_xfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达20级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1003 < 20 ) then
		Talk(1,"","对不起，你没有做相应等级的邪派主线任务，可以先去<color=red>朱仙镇<color>找云儿姑娘问问。")
	else
		Talk(1,"","家国的命运掌握在我们自己手中，只要你愿意，华厦万间，良田千顷也不过等闲。")
	end
end

function Uworld1058_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(5000)
	nt_setTask(1058,20)
	nt_setTask(1013,10)
	AddPlayerEvent(4) 
	Msg2Player("拓跋怀川让你去成都的唐门杀五十只黑叶猴。")
end

function Uworld1058_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1058_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level20();
end

function Uworld1059_xfz1()
	Uworld1059 = nt_getTask(1059) --邪派30-40级之间的支线任务变量
	Uworld1003 = nt_getTask(1003) --邪派主线任务变量
	local name = GetName()  
	if ( Uworld1003 >= 110 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1059 == 0 ) or ( Uworld1059 == 10 )) then
		nt_setTask(1059,10) 
		Describe(
		name.."<#>：拓跋先生，这究竟是怎么回事，我从邹长久那里取到了几卷羊皮卷轴，他让我去扬州找个叫沈风的男人，可我过去的时候，居然被南宋的武林人士暗算。<enter>"
		..DescLink_TuoBaHuaiChuan.."<#>：哦？沈风竟然被人发现了，他怎么这样不小心。好吧，此事说来话长，也不是可以讲给一般人听，你要能在武夷山杀掉五十只黄狼，我就 全无保留的告诉你，否则你不值得我再托付任何事。<enter>",
		1,"结束对话/Uworld1059_xfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达30级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1003 < 100 ) then
		Talk(1,"","对不起，你没有做相应等级的邪派主线任务，可以先去<color=red>朱仙镇<color>找云儿姑娘问问。")
	else
		Talk(1,"","家国的命运掌握在我们自己手中，只要你愿意，华厦万间，良田千顷也不过等闲。")
	end
end

function Uworld1059_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(15000)
	nt_setTask(1059,20)
	nt_setTask(1013,10)
	AddPlayerEvent(5) 
	Msg2Player("拓跋怀川让你去武夷山杀掉五十只黄狼。")
end

function Uworld1059_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1059_xfz4()
	AddOwnExp(15000)
	nt_setTask(1059,80) 
	Msg2Player("拓跋怀川让你去临安找潜伏已久的细作，此人常扮做醉汉留连于酒楼边。")	
end

function Uworld1059_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level30();
end

function Uworld1060_xfz1()
	Uworld1060 = nt_getTask(1060) --邪派40-50级之间的支线任务变量
	Uworld1003 = nt_getTask(1003) --邪派主线任务变量
	if ( Uworld1003 >= 210 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1060 == 0 ) or ( Uworld1060 == 10 )) then
		nt_setTask(1060,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>：近日听说南宋境内正举行擂台比武，据说许多隐居已久的高手纷纷复出，我觉得其中必有隐情。你去襄阳找刘蕴古了解一下情况。<enter>",
		1,"结束对话/Uworld1060_xfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达40级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1003 < 200 ) then
		Talk(1,"","对不起，你没有做相应等级的邪派主线任务，可以先去<color=red>朱仙镇<color>找云儿姑娘问问。")
	else
		Talk(1,"","家国的命运掌握在我们自己手中，只要你愿意，华厦万间，良田千顷也不过等闲。")
	end
end

function Uworld1060_xfz2()
	AddOwnExp(30000)
	nt_setTask(1060,20) 
	Msg2Player("拓跋怀川让你去找刘蕴古调查宋朝演武场的情况。")	
end

function Uworld1060_xfz3()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,80) 
	Msg2Player("拓跋怀川让你去演武场战胜一场，为大金国争口气。")	
end

function Uworld1060_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1060_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level40();
end

function Uworld1061_xfz1()
	Uworld1061 = nt_getTask(1061) --邪派50-60级之间的支线任务变量
	Uworld1003 = nt_getTask(1003) --邪派主线任务变量
	local name = GetName()  
	if ( Uworld1003 >= 300 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and (( Uworld1061 == 0 ) or ( Uworld1061 == 10 )) then
		nt_setTask(1061,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>：我不清楚还有什么可以难住你。<enter>"
		..name.."<#>：您对我太抬爱了。<enter>拓跋怀川：当初的约定依然有效，完颜庆熙大人已向皇上禀明，擢升你为平南军都察校尉，世袭罔替。<enter>"
		..name.."<#>：谢主隆恩。<enter>拓跋怀川：与你立下的功劳相比，这根本算不得什么。庆熙大人已预备向皇上保奏你为果毅都尉，连折子都写好了，只是你没有军功，怕同僚心有所思。因此，我们决定让你参与南下讨宋的大军，在宋金战场上一试身手。其实以你的本事，这些考验太过轻微，可表面上总是要走的，拿两百个积分吧，成为我大金的战神。<enter>",
		1,"结束对话/Uworld1061_xfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达50级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1003 < 300 ) then
		Talk(1,"","对不起，你没有做相应等级的邪派主线任务，可以先去<color=red>朱仙镇<color>找云儿姑娘问问。")
	else
		Talk(1,"","家国的命运掌握在我们自己手中，只要你愿意，华厦万间，良田千顷也不过等闲。")
	end
end

function Uworld1061_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(60000)
	nt_setTask(1013,10)
	nt_setTask(1061,20)  
	Msg2Player("拓跋怀川已保荐你为果毅都尉，可你缺少军功，故让你去参与宋金大战，获取二百个积分。")	
end

function Uworld1061_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz5()
	AddOwnExp(30000)
	nt_setTask(1061,100)  
	Msg2Player("金国大军南下，受困襄阳，你奉命刺杀襄阳守备使盛尹。")	
end

function Uworld1061_xfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level50();
end

function Uworld1000_xfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --环节16end 
	Msg2Player("拓跋怀川让你先在城里休息休息，熟悉了城市情况后再来找他。")	
end

function Uworld1000_xfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --环节17end
	Msg2Player("拓跋怀川让你先去找武林盟传人。")
	seteducationnpcpos()	
end

function Uworld1000_xfz3()
	AddItem(6,1,131,1,0,0,0)  --增加龙五的包袱
	nt_setTask(189,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --环节22end
	Msg2Player("你获得一个包袱，拓跋怀川让你尽快打开包袱，拿里面的信去找相应的人。")	
end

function Uworld1000_xfz4()
  
	AddItem(6,1,131,1,0,0,0)  --增加龙五的包袱
	nt_setTask(189,10)
	Msg2Player("你获得一个包袱，拓跋怀川让你尽快打开包袱，拿里面的信去找相应的人。")	
end

function Uworld1000_xfz5()
	Talk(1,"","拓跋怀川：你先去各新手村找个叫龙五的汉子。他人头广，引荐的信函需要此人开，不然就算你找到那些隐藏起来的家伙，他们也不会让你帮手的。")
	Msg2Player("拓跋怀川让你去新手村找叫龙五的人，他会引荐你获得一些任务。")	
end

function Uworld1000_no3()
	Talk(1,"","拓跋怀川:江湖上并不风平浪静,你自己出门在外,一定多留心眼.以后常回来转转,我有些任务给你.")
end

function allprize_xiepai()
	Uworld198 = nt_getTask(198) --正派全奖励
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
	Msg2Player("恭喜您获得了一块珍贵的藏宝图碎片。")
	if ( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(198,SetBit(GetTask(198),1,1))
	Msg2Player("恭喜您获得了一串珍贵的金枫之濯之链光。")
	elseif ( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(198,SetBit(GetTask(198),2,1))
	Msg2Player("恭喜您获得了一枚珍贵的金枫之公谨三叹。")
	elseif ( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(198,SetBit(GetTask(198),3,1))
	Msg2Player("恭喜您获得了一块珍贵的金枫之兰亭玉。")
	elseif ( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(198,SetBit(GetTask(198),4,1))
	Msg2Player("恭喜您获得了一枚珍贵的金枫之铜雀春深。")
	end	
	Msg2Player("您已经完成了该阶段任务。")
end

function Uworld1000_finishxiepai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("你已顺利完成了教育任务。")
end

function no()
end