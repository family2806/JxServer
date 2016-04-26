-- 新任务系统正派支线管理npc
-- BY：XIAOYANG（2004-11-30）

 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")

function task_aoyunzong()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001) --正派主线
	Uworld183 = nt_getTask(183)
	Uworld1050 = nt_getTask(1050) --正派20-30支线
	Uworld1051 = nt_getTask(1051) --正派30-40支线
	Uworld1052 = nt_getTask(1052) --正派40-50支线
	Uworld1053 = nt_getTask(1053) --正派50-60支线
	Uworld1011 = nt_getTask(1011) --正派支线的杀怪任务变量
	Uworld196 = nt_getTask(196) --正派全奖励
	local name = GetName()  
---------------------------------------------------------------教育任务------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 0 ) then 
			nt_setTask(1000,310) --环节16start
			Talk(3,"Uworld1000_zfz1",name.."：是五爷介绍我来的，这是五爷给你的信。","傲云宗：是五哥介绍来的，那肯定错不了。江湖路远，现在又是寒冬，来来来，先进屋喝壶热酒，吃只烤小羊腿，再做计议。","傲云宗：你可以先在城里四处逛逛，用Tab键点开地图观看一下城里的布局，熟悉熟悉再来找我。")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 0 ) then
			nt_setTask(1000,330) --环节17start
			Talk(2,"Uworld1000_zfz2",name.."：我已经看得差不多了。","傲云宗：那好，先去找武林盟传人吧。")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 0 ) and ( Uworld1001 < 10 ) then
			nt_setTask(1000,430) --环节22start
			Talk(5,"Uworld1000_zfz3","傲云宗：呵呵，辛苦了。五哥不会看错人的，这是他给你留的包袱，他嘱咐你不用回去看他了，自去江湖上闯荡吧。包袱里的信需及早看，不可耽误。切记，切记。",name.."：……请代我谢谢五爷。","傲云宗：这个自然，今后每完成一个主线任务都回我这里来，我有些小任务交给你，完成了会有意想不到的东西送给你。也算是替五哥帮帮你。",name.."：好！我记住了。","傲云宗：其他阵营的任务你不是不可以做，能得到不少的经验，只是他们对你有门户之见，一些珍贵的东西就不会送你了。你可以去找各村镇里的龙五打听打听。")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 0 ) and ( Uworld1001 > 10 ) then
			Talk(1,"Uworld1000_finishzhengpai","傲云宗：你既然已经开始接各阵营的任务了，那我这里也留不住你，你该学的都差不多了，自己去吧。")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 0 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1001 < 10) then 
			Say("怎么又回来了？是不是包袱丢在我这里了。",2,"是/Uworld1000_zfz4","不是，只是回来看看你/Uworld1000_no1")
		else
			Talk(1,"","傲云宗：找我喝酒？行啊。无欲则刚，在下距离如此圣道只差一步啊，羊肉火锅，好吃，嘿嘿。有不懂的地方就打开<color=red>F12<color>查看。提醒一句，如果你在<color=red>教育任务<color>内，是没有办法继续做其他等级任务的，请先做完教育任务，谢谢。")
		end
	else
---------------------------------------------------------------正派支线任务-----------------------------------------------------------------------	
		if (( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1)) or (( Uworld1051 == 1000 ) and ( GetBit(GetTask(196),2) ~= 1)) or (( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1)) or  (( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1)) then
			Describe(DescLink_AoYunZong.."<#>：为了对你做出的优异表现表示嘉奖，我决定给你些珍贵的宝物！",1,"领取宝物/allprize_zhengpai")
		elseif ( Uworld1053 == 70 ) or ( Uworld1053 == 80 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1053,80)
				Describe(DescLink_AoYunZong.."<#>：什么？岳元帅不是临渊崖的人刺杀的，那会是谁呢？难道这背后有更隐秘的势力在操纵一切吗？我越来越有这种感觉了。<enter>",1,"结束对话/Uworld1053_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1052 == 110 ) or ( Uworld1052 == 120 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,120)
				Describe(DescLink_AoYunZong.."<#>：干得漂亮！我就知道你不会辜负了我的希望。",
				1,"结束对话/Uworld1052_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end		
		elseif ( Uworld1052 == 80 ) or ( Uworld1052 == 90 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,90)
				Describe(DescLink_AoYunZong.."<#>：回来找我有事吗？这种时候，尽量减少联络。<enter>"
				..name.."<#>：云宗，你知道渝湘津这个人住哪里吗。<enter>傲云宗：这个人应该在成都城外，不过他不是个坏人，你还是留他一条性命吧。<enter>",
				1,"结束对话/Uworld1052_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end			
		elseif (( Uworld1052 == 20 ) or ( Uworld1052 == 30 )) and ( Uworld1011 == 20 ) then --增加了判断是否在宋金pk了一场的变量Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,30)
				Describe(DescLink_AoYunZong.."<#>：看到了吗，江湖中人外有人，天外有天。当年武林第一人之战，获胜呼声颇高的天王帮，武当派高手都纷纷落败，所谓技艺，绝无止境。<enter>"
				..name.."<#>： 那当年获得第一人称号的是谁？<enter>傲云宗：一位五毒教的高人。<enter>"
				..name.."<#>： 五毒教！<enter>傲云宗：是的，可惜此人夺得称号后不久，就消失了。据说他得胜后太过嚣张，居然约战独孤剑，那一战惊天动地，结果却是个谜。<enter>"
				..name.."<#>： 这小小的比武场，究竟藏着多少秘密啊。<enter>傲云宗：接下来的任务异常艰巨，也许你会落得和昔日那五毒教高手同样的下场。<enter>"
				..name.."<#>： 说吧，我不会感到害怕。<enter>傲云宗：我要你打入武林最神秘的杀手组织，临渊崖。据说当年岳元帅被害，与他们有莫大关系。一切我都已替你打点好，你只需去扬州找比武场外的混混。<enter>"
				..name.."<#>： 我到了那里怎么和他讲？<enter>傲云宗：你报上自己名字就好。剩下的，只能靠你自己了。今后尽量不要与我联系，等你的好消息。<enter>",
				1,"结束对话/Uworld1052_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end			
		elseif (( Uworld1051 == 170 ) or ( Uworld1051 == 180 )) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,180)
				Describe(name.."<#>：宝石我已拿回来了。<enter>"
				..DescLink_AoYunZong.."<#>：我看看……这果然是属性矿石，太好了。这下我看慕容不羁想不开口都难。他只需要一颗就好，剩下的就留给你吧。你将带孔的铠甲，概率宝石和属性矿石拿到神秘铁匠那里，也许可以合成出一套好东西。<enter>",
				1,"结束对话/Uworld1051_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end		
		elseif ( Uworld1051 == 80 ) or ( Uworld1051 == 90 ) and ( Uworld1011 == 20 ) then --增加了判断狼数量已够的变量Uworld1011
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,90)
				Describe(DescLink_AoYunZong.."<#>：狼杀完了？好，拿着狼骨去襄阳找龚阿牛，他是伏牛山一带出了名的好猎手，用狼骨泡制的药酒可以活血疏筋，肯定能制好吴老太太的病。<enter>",1,"结束对话/Uworld1051_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1051 == 60 ) or ( Uworld1051 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1051,70)
				Describe(DescLink_AoYunZong.."<#>：恩？怎么就回来了。<enter>"
				..name.."<#>：我先去找了贺兰芝，她让我去找吴老太太，石头可能落在她那了。可等我过去的时候，吴老太太却无法开口说话，看样子，我怀疑是患了怪病。<enter>傲云宗：怪病？哪有这么巧的事，恰好你去问石头下落的时候，就得了怪病。<enter>"
				..name.."<#>：难道这里面，会有什么隐情。<enter>傲云宗：……也不用瞒你了。慕容不羁早年曾经铸造过一把锋利无匹的匕首，可他一直隐瞒这件事。我怀疑匕首是落到了歹人手里，成为刺杀岳飞将军的凶器。<enter>"
				..name.."<#>：什么！<enter>傲云宗：所以我们必须先找到属性宝石，然后看能不能让慕容不羁亲自开口说出真相，以他今日的名声，不如此也确实无法让他开口了。不过吴老太太的病来得太巧了，巧得让我去猜测，这背后会不会有只巨手掩盖了一切。<enter>"
				..name.."<#>：那我该怎么办？<enter>傲云宗：尽快找到解药，否则我怀疑事情有变。去伏牛山东杀五十头青狼，取出狼骨来。我自有办法。<enter>",
				1,"结束对话/Uworld1051_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( Uworld1050 == 130 ) or ( Uworld1050 == 140 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,140)
				Describe(name.."<#>：我将那名杀手解决了，可他临死前却说自己不是行刺岳元帅的带头人。<enter>"
				..DescLink_AoYunZong.."<#>：看来问题远比我们想象的复杂。<enter>",
				1,"结束对话/Uworld1050_zfz4")	
			else
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end							
		elseif ( Uworld1050 == 60 ) or ( Uworld1050 == 70 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,70)
				Describe(name.."<#>：哎，我去的时候痴僧已经和天龙寺众下山办事去了。<enter>"
				..DescLink_AoYunZong.."<#>：恩，这样的话，不得不去找他了。<enter>"
				..name.."<#>：谁？<enter>傲云宗：一个隐居世外的人，我原本不想打扰他。<enter>"
				..name.."<#>：是谁？<enter>傲云宗：箭头，我的一个老朋友。你去华山派找他吧，他在那里已隐居有十年了吧，当年似乎曾听他提到过天煌龙器。<enter>",
				1,"结束对话/Uworld1050_zfz3")	
			else
				Talk(1,"Uworld1000_zfz6","做任务的时候遇到什么问题，可以按<color=red>F12<color>键观看任务面板的相关选项，查看自己当前的任务进行情况。当你进行到目前这步时，你在以前所做的等级任务已超出了它的范围，无法再继续完成了。")
			end
		elseif ( GetLevel() >= 20)  then
			Say("你想为武林出一份力吗？我这里有相当多的白道任务可以接。",3,"我想先做一些主线的任务/Uworld1000_zfz5","我想做一些支线任务/Uworld1000_zfz6","我吃多拉?没事找累/Uworld1000_no1")
		else
			Talk(1,"","傲云宗：找我喝酒？行啊。无欲则刚，在下距离如此圣道只差一步啊，羊肉火锅，好吃，嘿嘿。有不懂的地方就打开<color=red>F12<color>查看。")
		end
	end
end

function Uworld1000_zfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --环节16end
	Msg2Player("傲云宗让你先在城里休息休息，熟悉了城市情况后再来找他。")	
end

function Uworld1000_zfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --环节17end 
	Msg2Player("傲云宗让你先去找武林盟传人。")	
	seteducationnpcpos()
end

function Uworld1000_zfz3()
	AddItem(6,1,131,1,0,0,0)  --增加龙五的包袱
	nt_setTask(183,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --环节22end
	Msg2Player("你获得一个包袱，傲云宗让你尽快打开包袱，拿里面的信去找相应的人。")	
end

function Uworld1000_zfz4()
	AddItem(6,1,131,1,0,0,0)  --增加龙五的包袱
	nt_setTask(183,10)
	Msg2Player("你获得一个包袱，傲云宗让你尽快打开包袱，拿里面的信去找相应的人。")	
end

function Uworld1000_zfz5() --正派分支的任务选择脚本
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","傲云宗：你先去各新手村找个叫龙五的汉子。他人头广，引荐的信函需要此人开，不然就算你找到那些隐藏起来的家伙，他们也不会让你帮手的。")
		Msg2Player("傲云宗让你去新手村找叫龙五的人，他会引荐你获得一些任务。")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","傲云宗：你还在做教育任务呢，做完之后，龙五爷自然会安排给你其他任务，不要心急。")
	elseif ( Uworld1001 ~= 0 ) then
		Talk(1,"","傲云宗：朋友，你不是做了正派主线任务吗，不是在戏弄我吧，我是老实人，别骗我啊，真是。")
	else
		Talk(1,"","主线任务就是到达特定等级后就可以接到的任务，任何等级大于20级的人都可以完成，如果都做完的话......会有你意想不到的丰厚奖励吧。")
	end
end

function Uworld1000_zfz6()
	Uworld1050 = nt_getTask(1050)
	Uworld1051 = nt_getTask(1051)
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Describe(DescLink_AoYunZong.."<#>:江湖最近风雨飘摇，白道势力不断缩小，江湖道义日渐势微，该是你我振臂而起的时候了。",6,
	"我想先了解下支线任务的做法/Uworld1000_zfz7" ,
	"我想做二十到二十九级之间的任务/Uworld1050_zfz1",
	"我想做三十到三十九级之间的任务/Uworld1051_zfz1",
	"我想做四十到四十九级之间的任务/Uworld1052_zfz1",
	"我想做五十到五十九级之间的任务/Uworld1053_zfz1",
	"还是以后再来做吧，我最近自己都顾不过来/no")
end

function Uworld1000_zfz7()
	Describe(DescLink_AoYunZong.."<#>:支线任务是在主线任务的基础上，只能在特定的等级范围内，才可以接到，而且必须在该范围内完成的任务。如当您的等级为三十二级时，您的等级在三十到四十级之间。您首先必须接到三十级的主线任务，然后才可以到我这里接三十到四十级的支线任务。而且您必须在您的等级到达四十级之前完成它，否则任务会自动取消，您无法再继续做下去。复杂吧，条件困难吧，那是因为奖励够丰厚。等级超过六十级的朋友暂时没有合适的支线任务，因为近来江湖中的头面人物似乎在策划一项惊天地泣神鬼的事情，很快您就能得到消息了。",1,"结束对话/no")
end

function Uworld1050_zfz1()
	Uworld1050 = nt_getTask(1050) --正派20-30级之间的支线任务变量
	Uworld1001 = nt_getTask(1001) --正派主线任务变量
	local name = GetName()  
	if ( Uworld1001 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1050 == 0 ) or ( Uworld1050 == 10 )) then
		nt_setTask(1050,10)
		Describe(DescLink_AoYunZong.."<#>:最近江湖上一直在传说关于天煌龙器的流言，只知道这是一套宝甲，由精铁冶炼，据说获得这套铠甲的人，将拥有无上威力，成为不老不死的战神。有人出了很大的价钱让咱们探听天煌龙器的确切来历。<enter>"
		..name.."<#>：很大价钱？<enter>傲云宗：是一个你想象不到的天价。<enter>"
		..name.."<#>：就为了打探一套盔甲的来历？<enter>傲云宗：有人怀疑这是一个假消息，如果这件事是假的，你要探听出传播消息的来源，如果是真的，找出确凿证据。说实话，我也很想知道，这件盔甲凭什么让人不老不死。<enter>"
		..name.."<#>：“有什么线索能提供给我。<enter>傲云宗：去大理天龙寺找一个叫痴僧的人。这消息极有可能是从云南一代传播出来，痴僧乃一代奇人，知道许多不该知道的东西，他非常有趣，你找到他应该能问出些东西。<enter>"
		..name.."<#>：明白了。<enter>",1,"结束对话/Uworld1050_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达20级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1001 < 20 ) then
		Talk(1,"","对不起，你没有做相应等级的正派主线任务，可以先去<color=red>大理<color>找莫愁姑娘问问。")
	else
		Talk(1,"","杀人的时候，不去想这个人该不该杀的，其实不算个好杀手。做任何事情前都要考虑周到，可能因为这点，我才能做个出色的中间人吧，大家都愿意做我的买卖。")
	end
end

function Uworld1051_zfz1()
	Uworld1051 = nt_getTask(1051) --正派30-40级之间的支线任务变量
	Uworld1001 = nt_getTask(1001) --正派主线任务变量
	local name = GetName()  
	if ( Uworld1001 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1051 == 0 ) or ( Uworld1051 == 10 )) then
		nt_setTask(1051,10)
		Describe(DescLink_AoYunZong.."<#>：大宋不世出的名匠慕容不羁正在临安为宋主贺寿铸造一套宝甲，他需要金系的暗属性矿石一颗，你去给他找一下吧。<enter>"
		..name.."<#>：东西在哪里？<enter>傲云宗：去成都找叫贺兰芝的女子，她曾是慕容不羁的关门弟子，后来嫁为人妇，手上有两颗此类宝石。<enter>",
		1,"结束对话/Uworld1051_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达30级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1001 < 70 ) then
		Talk(1,"","对不起，你没有做相应等级的正派主线任务，可以先去<color=red>大理<color>找莫愁姑娘问问。")
	else
		Talk(1,"","杀人的时候，不去想这个人该不该杀的，其实不算个好杀手。做任何事情前都要考虑周到，可能因为这点，我才能做个出色的中间人吧，大家都愿意做我的买卖。")
	end
end

function Uworld1052_zfz1()
	Uworld1052 = nt_getTask(1052) --正派40-50级之间的支线任务变量
	Uworld1001 = nt_getTask(1001) --正派主线任务变量
	local name = GetName()  
	if ( Uworld1001 >= 140 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1052 == 0 ) or ( Uworld1052 == 10 )) then
		nt_setTask(1052,10)
		Describe(DescLink_AoYunZong.."<#>：我这么多年的江湖生涯，有句话想送给你。<enter>"
		..name.."<#>：是什么？<enter>傲云宗：<color=red>用剑用眼，杀人杀快。<color><enter>"
		..name.."<#>：是什么意思？<enter>傲云宗：对敌之时，观察是至关重要的。只有观察，才能发现高手的破绽，才能找出击败他的方法。这叫用剑用眼。一旦动手，速度就要快，快可以掩盖你的缺点，可以穿透敌人的封锁，一击必杀，不给对手任何反扑的机会，因为垂死者的反扑力量，是非常恐怖的。这叫杀人杀快。<enter>"
		..name.."<#>：这些道理对我太有用了。<enter>傲云宗：光听是无法成为高手的，你去比武场打一场pk，实际感受感受吧。<enter>",
		1,"结束对话/Uworld1052_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达40级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1001 < 140 ) then
		Talk(1,"","对不起，你没有做相应等级的正派主线任务，可以先去<color=red>大理<color>找莫愁姑娘问问。")
	else
		Talk(1,"","杀人的时候，不去想这个人该不该杀的，其实不算个好杀手。做任何事情前都要考虑周到，可能因为这点，我才能做个出色的中间人吧，大家都愿意做我的买卖。")
	end
end

function Uworld1053_zfz1()
	Uworld1053 = nt_getTask(1053) --正派50-60级之间的支线任务变量
	Uworld1001 = nt_getTask(1001) --正派主线任务变量
	local name = GetName()  
	if ( Uworld1001 >= 210 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ( Uworld1053 == 0 )  then
		if ( Uworld1052 == 1000 ) then
			Describe(DescLink_AoYunZong.."<#>：去找混混吧，没事千万别再来找我。临渊崖的眼线太多，密布这个城市的每个角落。",1,"结束对话/no")
		else
			Describe(DescLink_AoYunZong.."<#>：去扬州比武场找场外的混混，他会告诉你怎么做的。<enter>",1,"结束对话/no")
		end
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","对不起，你的等级没有达到该任务的需求，请到达50级，并接过相应主线任务后才来找我吧。")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","对不起，你的等级已超过该任务的需求，无法接到了。")
	elseif ( Uworld1001 < 210 ) then
		Talk(1,"","对不起，你没有做相应等级的正派主线任务，可以先去<color=red>大理<color>找莫愁姑娘问问。")
	else
		Talk(1,"","杀人的时候，不去想这个人该不该杀的，其实不算个好杀手。做任何事情前都要考虑周到，可能因为这点，我才能做个出色的中间人吧，大家都愿意做我的买卖。")
	end
end

function Uworld1050_zfz2()
	AddOwnExp(5000)
	nt_setTask(1050,20)
	Msg2Player("傲云宗让你去大理天龙寺找一个叫痴僧的人打听情况。")
end

function Uworld1050_zfz3()
	AddOwnExp(5000)
	nt_setTask(1050,80)
	Msg2Player("傲云宗让你去华山派找一个叫箭头的人打听情况。")
end

function Uworld1050_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level20();
end

function Uworld1051_zfz2()
	AddOwnExp(15000)
	nt_setTask(1051,20)
	Msg2Player("神匠慕容不羁需要金系的暗属性宝石一颗，傲云宗让你去成都找贺兰芝。")
end

function Uworld1051_zfz3()
	Uworld1011 = nt_getTask(1011) --正派支线杀怪变量
	AddOwnExp(15000)
	nt_setTask(1051,80)
	nt_setTask(1011,10) --10为启动参数，传给程序实现判断杀死怪物的数量
	AddPlayerEvent(1)
	Msg2Player("傲云宗告诉了你一个秘密，他怀疑吴老太太是被人故意下毒。他让你去伏牛山杀五十条青狼，取其骨以入药。")
end

function Uworld1051_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1051_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()	
	ex_add_zp_level30();
end

function Uworld1052_zfz2()
	Uworld1011 = nt_getTask(1011) --正派支线杀怪变量，设置为10，传参数给程序判断，比武场pk的判断
	AddOwnExp(30000)
	nt_setTask(1011,10)
	nt_setTask(1052,20)
	Msg2Player("傲云宗让你去比武场打一场比赛，实际感受真正的凶险。")
end

function Uworld1052_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1052_zfz4()
	AddOwnExp(30000)
	nt_setTask(1052,100)
	Msg2Player("傲云宗告诉你，渝湘津很有可能隐藏在成都。")
end

function Uworld1052_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level40();
end

function Uworld1053_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level50();
end

function allprize_zhengpai()
	Uworld196 = nt_getTask(196) --正派全奖励
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
	if ( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(196,SetBit(GetTask(196),1,1))
	Msg2Player("恭喜您获得了一串珍贵的金枫之濯之链光。")
	elseif ( Uworld1051 == 1000 )  and ( GetBit(GetTask(196),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(196,SetBit(GetTask(196),2,1))
	Msg2Player("恭喜您获得了一枚珍贵的金枫之公谨三叹。")
	elseif ( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(196,SetBit(GetTask(196),3,1))
	Msg2Player("恭喜您获得了一块珍贵的金枫之兰亭玉。")
	elseif ( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(196,SetBit(GetTask(196),4,1))
		Msg2Player("恭喜您获得了一枚珍贵的金枫之铜雀春深。")
	end	
	Msg2Player("您已经完成了该阶段任务。")
end

function Uworld1000_finishzhengpai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("你已顺利完成了教育任务。")
end

function no()

end

function Uworld1000_no1()
	Talk(1,"","傲云宗：江湖上并不风平浪静，你自己出门在外，一定要多留心眼。以后常回来转转，我有些任务给你。")
end