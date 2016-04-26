-- 正派支线任务脚本
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
----------------------------------------------------------------------邹长久-----------------------------------------------------------------------
function branch_zouchangjiu()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 40) or ( Uworld1058 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,50)
			Describe(name.."<#>：阁下可是邹长久。<enter>"
			..DescLink_ZouChangJiu.."<#>：正是，朋友找我有什么事吗。<enter>"
			..name.."<#>：你看这是什么。<enter>失去拓跋怀川的令牌。<enter>邹长久：这……你是拓跋老大派来的人，太好了，来得太及时了。<enter>"
			..name.."<#>：究竟有什么东西如此重要。<enter>邹长久：这个你不用管，拿着这些羊皮卷轴马上出城，否则就出不去了。如果能成功脱身，拿着这些卷轴去扬州找一个叫沈风的男子，他见到东西，自然会明白的。<enter>",
			1,"结束对话/branch_zouchangjiu1")	
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	else
		Describe(DescLink_ZouChangJiu.."<#>：人生有许多意外，若重新来过，可能选择就不同了。",1,"结束对话/no")
	end
end
---------------------------------------------------------------------沈风-----------------------------------------------------------------------
function branch_shenfeng()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 60) or ( Uworld1058 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,70)
			Describe(name.."<#>：沈风吗？<enter>"
			..DescLink_ShenFeng.."<#>：是我。<enter>"
			..name.."<#>：有些东西给你看。<enter>沈风：什么？<enter>你向沈风展示了羊皮卷轴。<enter>"
			..name.."<#>：成都的男人叫我来找你的。<enter>沈风：狗贼，爷爷不是沈风，你上当拉！你这条金狗，今天休想再活命！<enter>",
			1,"结束对话/branch_shenfeng1")	
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	else
		Describe(DescLink_ShenFeng.."<#>：恩，恩，我是沈风。",1,"结束对话/no")
	end
end

--------------------------------------------------------------------刘蕴古-----------------------------------------------------------------
function branch_liuyungu()
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1013 = nt_getTask(1013)
	local name = GetName()  
	if ( Uworld1060 == 20) or ( Uworld1060 == 30 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,30)
			Describe(
			name.."<#>：蕴古兄，据说宋朝目前广开擂台，鼓励天下英雄以武会友？<enter>"
			..DescLink_LiuYunGu.."<#>：是这样的，南宋朝廷提供给武林人士的比武擂台，用意在于宣扬习武之风，可见南廷正预谋强化边防，充实军力，以对抗我大金。<enter>"
			..name.."<#>：你可有更进一步的消息？<enter>刘蕴古：没有，只有参与擂台比赛的人，才能进入场地，这也是我一直摸不清头绪的原因。如果你……<enter>"
			..name.."<#>：我明白，我会亲自去演武场参加一场比赛的，只有这样，才能收集到第一手的情报。<enter>",
			1,"结束对话/branch_liuyungu2")	
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	elseif (( Uworld1060 == 40) or ( Uworld1060 == 50 )) and ( Uworld1013 == 20 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,50)
			Describe(
			DescLink_LiuYunGu.."<#>：打过了吧，好，你立即回去找拓跋将军，详细介绍擂台赛的情况，记得不要遗漏任何一个细微的地方。<enter>",
			1,"结束对话/branch_liuyungu3")	
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end	
	elseif ( Uworld1059 == 40) or ( Uworld1059 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,50)
			Describe(
			name.."<#>：刘蕴古吗？<enter>"
			..DescLink_LiuYunGu.."<#>：你是谁，胆敢对本官无礼。<enter>"
			..name.."<#>：不要假装了，我乃拓跋将军派来的人，要找你打听一些事。<enter>刘蕴古：拓跋？什么拓拔？我大宋千员战将中，没有这种蛮姓的。<enter>"
			..name.."<#>：拓跋将军令牌在此，刘先生还不相信吗？<enter>刘蕴古细细检查过令牌，忽然松了口气。<enter>刘蕴古：果然是拓跋将军的人，你要打听什么消息。<enter>"
			..name.."<#>：近日听闻了一些关于使节施宜生的传闻，将军着我来查明真伪。<enter>刘蕴古：施宜生？这家伙最近在南宋活动得相当频繁，而且言辞中多有透露关于大金的绝秘情报。<enter>"
			..name.."<#>：真有此事？那我得立即回去禀报将军，就此别过了。<enter>刘蕴古：路上小心。<enter>",
			1,"结束对话/branch_liuyungu1")	
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	
	else
		Describe(DescLink_LiuYunGu.."<#>：我吗？金玉绸缎，美酒名驹，只要你点得出名字，我就有卖。",1,"结束对话/no")
	end
end

---------------------------------------------------------------------醉汉-------------------------------------------------------------------------
function branch_zuihan()
	Uworld1059 = nt_getTask(1059)
	local name = GetName()  
	
	if ( Uworld1059 == 80) or ( Uworld1059 == 90 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,90)
			Describe(
			name.."<#>：酒鬼，醒醒。<enter>"
			..DescLink_JiuGui.."<#>：大梦一场，人生几何。让我醉吧……<enter>"
			..name.."<#>：你要醉，也不是现在。拓跋将军需要你。<enter>酒鬼：你说什么！……真是拓跋将军，真是他让你来的吗？十年了，我潜伏在这里，没有朋友，没有亲人，我甚至以为我的国家已经将我抛弃，原来大家都还记得我。你有什么需要我帮忙的吗。<enter>"
			..name.."<#>：我现在需要知道大金使节施宜生详细的作息规律，另外，你给我弄一些城门通行令，和宵禁以后允许上街的凭证。<enter>酒鬼：这些我早准备好了，你马上可以去收拾施宜生这条狗崽子拉。<enter>",
			1,"结束对话/branch_zuihan1")	
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	else
		Describe(DescLink_JiuGui.."<#>：醉了好，醉了什么都想不起，也不记得再没人记挂自己了。 ",1,"结束对话/no")
	end
end

function branch_zouchangjiu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shenfeng1()
	AddOwnExp(5000)
	nt_setTask(1058,80)
	Msg2Player("这个沈风明显是宋朝武士假扮的！")
	NewWorld(80,1795,3395)
	SetFightState(1)
end
	
function branch_liuyungu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_liuyungu2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,40)
	Msg2Player("你决定亲自去演武场参加一场pk比赛。")
end

function branch_liuyungu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_zuihan1()
	AddOwnExp(15000)
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	nt_setTask(1059,100)
	Msg2Player("化装为酒鬼的细作提供给了你一切通行便利，你可以顺利的去刺杀施宜生了。")
end

function no()
end

