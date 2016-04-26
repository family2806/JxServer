-- 中立支线任务脚本
-- by xiaoyang(2005\1\11)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")

----------------------------------------------------------江一萧--------------------------------------------------------------------------
function branch_jiangyixiao()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if (( Uworld1054 == 20) or ( Uworld1054 == 30 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,30)
			Describe(name.."<#>: 江先生, 柳南云叫我来找你.<enter>"
			..DescLink_JiangYiXiao.."<#>:  老柳啊？他叫你来做什么?.<enter>"
			..name.."<#>:  最近听说扬州出现宝器.<enter> 啊，原来是因为这个事啊。.<enter>"
			..name.."<#>:  在下来之前,已帮您扫干净了那些刺猬.<enter> 江一萧: 这样啊，这个大概是老柳的主意。我认识乐清秋先生，他曾是著名的兵器家。只是有一次出乎意料地失去了手臂，你快去找他。<enter> "
			..name.."<#>: 那多谢你.<enter>江一萧:不用客气，替我问候老柳.<enter>",
			1,"结束对话/branch_jiangyixiao1")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	else
		Describe(DescLink_JiangYiXiao.."<#>:  扬州比秦岭好受些，但是，肩上的任务依然沉重.",1,"结束对话/no")
	end
end
---------------------------------------------------------乐清秋-----------------------------------------------------------------------------
function branch_leqingqiu()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 40) or ( Uworld1054 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,50)
			Describe(name.."<#>:  乐先生, 听说你会兵器，江先生介绍我来这.<enter>"
			..DescLink_LeQingQiu.."<#>: 啊，江先生的事也是我的事.<enter>"
			..name.."<#>:  先生有什么事吗？ <enter>乐清秋: 哎呀，您已残废了，还有什么能说的......<enter>"
			..name.."<#>:  先生你说这个是什么意思呢？<enter> 我欠宝鸡赌徒一笔很大的钱，已经30年了还未还清，哪里能说什么刀剑。<enter>"
			..name.."<#>:  这个容易，我帮你解决.<enter>",
			1,"结束对话/branch_leqingqiu1")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	elseif ( Uworld1054 == 110 ) or ( Uworld1054 == 120 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,120)
			Describe(name.."<#>:  乐先生, 您的赌徒欠款已经还清了.<enter>"
			..DescLink_LeQingQiu.."<#>:  我知道了，真是出乎意料，你比我年轻那么多却这么勇敢。乐某真是白活了.<enter>"
			..name.."<#>:  乐先生不要这么说，你是一个很坚强的人，否则江先生就不会和您做朋友了.<enter>朋友......好! 你带见来我给你评鉴.<enter>"
			..name.."<#>:  谢谢!.<enter>乐清秋: 快去成为夺取武林人物的宝剑 .<enter>",
			1,"结束对话/branch_leqingqiu2")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	elseif ( Uworld1054 == 140 ) or ( Uworld1054 == 150 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,150)
			Describe(name.."<#>:  乐先生, 宝剑在这里.<enter>"
			..DescLink_LeQingQiu.."<#>:  这把剑，这把剑.<enter>"
			..name.."<#>:  这把剑怎么样？ <enter>"
			..name.."<#>:  废了 <enter>?<enter>"
			..name.."<#>:  那，那......<enter>你不用可惜，以你的勇气，以后一定能干大事业的.<enter>"
			..name.."<#>:  真是可惜了一把宝剑.<enter>勇敢之心才是最重要的武器!<enter>"
			..name.."<#>:  那是什么？ <enter>握锤！握锤是你拥有的最厉害的武器.<enter>"
			..name.."<#>:......谢谢，我明白了.<enter>",
			1,"结束对话/branch_leqingqiu3")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	else
		Describe(DescLink_LeQingQiu.."<#>: 人的一生只懂吃别人给的施舍!",1,"结束对话/no")
	end
end
-----------------------------------------------------------赌棍--------------------------------------------------------------------------
function branch_dugun()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 60) or ( Uworld1054 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,70)
			Describe(name.."<#>:  阿，你到了.<enter>"
			..DescLink_DuGun.."<#>:  谁?<enter>"
			..name.."<#>:  就是你啊.<enter> 你活腻了吧? <enter>"
			..name.."<#>:  不要开玩笑! 乐清秋欠你多少钱? <enter>你有钱还吗，问这干嘛?<enter>"
			..name.."<#>:  小事一桩，除了付钱，还有什么办法吗？<enter>有，但是，你做不到.<enter>"
			..name.."<#>:  有什么就说，不要支支吾吾的<enter> 行，出城取来路长天的人头，姓乐的就不用还债了。<enter>"
			..name.."<#>:  快去吧.<enter>",
			1,"结束对话/branch_dugun1")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	elseif ( Uworld1054 == 90 ) or ( Uworld1054 == 100 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,100)
			Describe(name.."<#>:  你已消灭<enter>"
			..DescLink_DuGun.."<#>:  你...真的取了路长天的命了 <enter>"
			..name.."<#>:  不信啊？去衙门看看<enter> 大侠，姓乐的债已经删了。 <enter>",
			1,"结束对话/branch_dugun2")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	else
		Describe(DescLink_DuGun.."<#>:  欠债还钱，杀人偿命.",1,"结束对话/no")
	end
end		
---------------------------------------------------双鹰镖局主人------------------------------------------------------
function branch_shuangying()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 20) or ( Uworld1055 == 30 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,30)
			Describe(name.."<#>:  您好，我是南云派来的人!.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>: 柳师傅派你来的？朋友请坐.<enter>"
			..name.."<#>:  尽管我退出江湖不久，但是，双鹰镖局的大名依然不绝于耳，这次怎么这么惨？<enter> 与其他镖局相比，我们镖局也算是比较幸运，损失少。对方出手太毒了，几十年来未曾遇到这么凶猛的土匪.<enter>"
			..name.."<#>: 有什么那么难说的？<enter> 我镖局有个人有幸脱身，他叫阿牛，正在城内，你快去找他.<enter>"
			..name.."<#>:  好的.<enter>希望你早日找到他，我代表30个镖局感谢你.<enter>",
			1,"结束对话/branch_shuangying1")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  运镖多年，今天算是完事了，早知会有今日.",1,"结束对话/no")
	end
end		
-----------------------------------------------------阿牛------------------------------------------------------------------------------
function branch_aniu()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 40) or ( Uworld1055 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,50)
			Describe(name.."<#>:  阿牛，镖局的主人叫我来找你，询问被抢的信息.<enter>"
			..DescLink_ANiu.."<#>: 你是局主找到的助手啊?<enter>"	
			..name.."<#>:  ng! <enter>朋友, 你快回去吧，局主已找到了3位高手，这些人在调查踪迹的过程中神秘的消失了。<enter>"
			..name.."<#>:  我已答应就不会后退.<enter>你让我感到羡慕，希望你是例外<enter>"
			..name.."<#>:  我会证明给你看我的本领!<enter> 很好，不要空谈哦<enter>"
			..name.."<#>:  你不信我就走了!<enter>朋友! 等一下。我有事要说.<enter>"
			..name.."<#>:  什么事？ <enter>这个盔甲送给你，希望局主没有认错人!<enter>"
			..name.."<#>:  多谢<enter>",
			1,"拿到甲衣，你要仔细检查/branch_aniu1")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	else
		Describe(DescLink_ANiu.."<#>:  那帮人身法灵敏，你要非常小心!",1,"结束对话/no")
	end
end

----------------------------------------------------------冷枪镖局主人-------------------------------------------------------------------
function branch_lengqiang()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 60) or ( Uworld1055 == 70 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,70)
			Describe(name.."<#>:  贺老板<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  不管阁下是谁，老夫已洗手金盆，退隐江湖，不再过问江湖的事了.<enter>"
			..name.."<#>:  西北区域出现劫镖车的盗贼，制造了很多血案，难道你只知道看吗? <enter> 小子，你懂什么?有多少武艺敢这样嚣张 <enter>"
			..name.."<#>:  贵公子可好?<enter>不行了，大夫说如果没有蜀冈山的50副猴脑，那我将白发人送黑发人.<enter>"
			..name.."<#>:  那行!<enter>",
			1,"结束对话/branch_lengqiang1")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	elseif (( Uworld1055 == 80) or ( Uworld1055 == 90 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,90)
			Describe(name.."<#>:  贺老板，猴脑我已带回来了.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  朋友, 我们萍水相逢，你何必需要这样呢?<enter>"
			..name.."<#>:  互相帮助是人之常情<enter>可以了，这个家伙的来历我已经弄清楚了。他们是荷花盗，经常出现在昆仑派。但是，请大侠留他们一条活路。我送你一些宝石，以表诚意。.<enter>",
			1,"结束对话/branch_lengqiang2")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	elseif ( Uworld1055 == 110 ) or ( Uworld1055 == 120 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,120)
			Describe(name.."<#>:  贺老板，你念情义，不杀她们。但是我想问，为什么你又放了她们?<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  其实，她们都是有家教的孩纸，那年清明，出去游玩，被镖师侮辱了。后来，她们得到高人的帮助，学得武功，她们才开始劫镖。其实，她们本性不坏。<enter>"
			..name.."<#>:  原来如此，谁都有苦楚啊，只希望通过这次，她们能汲取教训。否则会被他人杀害.<enter>冷枪镖局主人：希望如此. <enter>",
			1,"结束对话/branch_lengqiang3")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  江湖中人很早就给了个外号为贺冷枪，但是，自从有了家室，我已不像从前了!",1,"结束对话/no")
	end
end
---------------------------------------------------龙追舞-----------------------------------------------------------------------------
function branch_longzhuiwu()
	Uworld1057 = nt_getTask(1057)
	local name = GetName()
	if ( Uworld1057 == 80) then
		if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
			Describe(name.."<#>:  龙追舞，你知道柳南云吗？<enter>"
			..DescLink_LongZhuiWu.."<#>:  怎么不知道，十年前，正是我将他绝子绝孙.<enter>"
			..name.."<#>: 这笔债今天你要偿还<enter> 我在城外等你.<enter>",
			1,"结束对话/branch_longzhuiwu1")
		else
			Talk(1,"","对不起! 你的等级超过任务要求的等级，不能继续了，真是不好意思")
		end
	elseif ( Uworld1057 >= 90 ) then
		Talk(1,"","我只是龙追舞的徒弟，假扮他骗你罢了.")
	else
		Talk(1,"","不要整天烦我.")
	end
end


function branch_jiangyixiao1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_leqingqiu1()
	AddOwnExp(5000)
	nt_setTask(1054,60)
	Msg2Player("你承诺帮乐清秋解决他的债.")
end

function branch_leqingqiu2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,0)
	nt_setTask(1054,130)
	Msg2Player("乐清秋说剑正被城外的武林人士拿着，要你快点夺回!")
end

function branch_leqingqiu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level20();
end

function branch_dugun1()
	AddOwnExp(5000)
	nt_setTask(1054,80)
	Msg2Player("宝鸡赌徒告诉你，只需要消除路长天帮主就会删掉乐清秋的债.")
end

function branch_dugun2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shuangying1()
	AddOwnExp(15000)
	nt_setTask(1055,40)
	Msg2Player("双鹰镖局主人告诉你去找阿牛，他希望你可以解决这个困难.")
end

function branch_aniu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang1()	
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(15000)
	nt_setTask(1012,10)
	nt_setTask(1055,80)
	AddPlayerEvent(3) 
	Msg2Player("冷枪镖局主人告诉你去蜀岗山杀50只猴子，带猴脑回来给他儿子治病.")
end

function branch_lengqiang2()	
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang3()	
	AddOwnExp(15000)
	nt_setTask(1055,130)
	Msg2Player("冷枪镖局主人最终明白了荷花盗的真实来历。你可以回去见柳南云复命.")
end

function branch_longzhuiwu1()
	Msg2Player("龙追舞轻视你，说他在城外等你.")
end

function no()
end
