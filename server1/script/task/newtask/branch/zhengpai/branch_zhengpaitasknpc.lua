-- 正派支线任务脚本
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")

----------------------------------------------------------------------痴僧-----------------------------------------------------------------------
function branch_chiseng()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
	if ( Uworld1050 == 20) or ( Uworld1050 == 30 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,30)
			Describe(DescLink_ChiSeng.."<#>：哈哈哈哈哈，我得意的笑，我得意的笑。<enter>"
			..name.."<#>：……这家伙是不是脑子有毛病啊。<enter>痴僧：啊，米豆腐。是煮，你好。<enter>"
			..name.."<#>：和尚，你搞什么东西啊，听不懂听不懂。<enter>痴僧：阿弥陀佛，施主，你好。<enter>"
			..name.."<#>：晕啊。<enter>痴僧：晕乎哉？不晕也。<enter>"
			..name.."<#>：不和你蘑菇，听说最近大理一直有人在秘密散部一个传闻。<enter>痴僧：啊，米豆腐。贫僧一直在天龙寺参禅拜佛，哪里知道什么传闻。<enter>"
			..name.."<#>：大和尚，你不老实。<enter>痴僧：贫僧三十岁前，法号老实和尚。<enter>"
			..name.."<#>：呵呵，真受不了你。我只是想问问关于天煌龙器的事情。<enter>痴僧：天啥器？<enter>"
			..name.."<#>：天煌龙器。<enter>痴僧：哦，想打听消息可以，不过要知道消息，都得给和尚去弄点珍奇的古谱来。<enter>"
			..name.."<#>：什么谱？<enter>痴僧：你这个笨施主，当然是围棋棋谱。天龙寺外有些藏宝人，最近似乎带着前代国手的名谱'天残地缺'，给弄五本来，就告诉你。<enter>"
			..name.."<#>：行。",
			1,"结束对话/chiseng1")	
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	elseif ( Uworld1050 == 40 ) or ( Uworld1050 == 50 ) and ( GetItemCount(504) >= 5 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,50)
			Describe(DescLink_ChiSeng.."<#>：弄到了没，弄到了没？<enter>"
			..name.."<#>：这里，你要的五本棋谱。<enter>痴僧：好！有信用，讲承诺。那贫僧就告诉你关于天煌龙器的消息吧。<enter>"
			..name.."<#>：好。<enter>痴僧：天煌龙器，其实就是天煌龙器。<enter>"
			..name.."<#>：什么？<enter>痴僧：其实俺不过是村儿里一农民，化了妆来这假扮痴僧的。其实，其实……天龙寺的人都下山去化缘了，可能过不多久就会回来。<enter>"
			..name.."<#>：你给我记着，回头我非杀了你不可。<enter>痴僧：我就在这呆着，我永不下山，你杀我呀，你来杀我呀。嘿嘿。",
			1,"结束对话/chiseng2")
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	elseif ( Uworld1050 == 40 ) or ( Uworld1050 == 50 ) and ( GetItemCount(504) < 5 ) then
		Describe(DescLink_ChiSeng.."<#>：你手上的棋谱不够也敢来？<enter>",1,"结束对话/no")
	else
		Describe(DescLink_ChiSeng.."<#>:世上奇迹无数，宝贝万千，贵乎不贪啊，善哉，善哉。",1,"结束对话/no")
	end
end

----------------------------------------------------------------箭头----------------------------------------------------------------------
function branch_jiantou()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
	if ( Uworld1050 == 80 ) or ( Uworld1050 == 90 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,90)
			Describe(name.."<#>：请问您是箭头大哥吗。<enter>"
			..DescLink_JianTou.."<#>：箭头这个人，已经不存在于世上了。<enter>"
			..name.."<#>：我是傲云宗介绍来的。<enter>箭头：云宗？他最近好吗。<enter>"
			..name.."<#>：他很好，他让我来，是想向您打听关于天煌龙器的消息。<enter>箭头：天煌龙器？那是许久前的往事了，要说起来，得从岳飞将军遇刺讲起。<enter>"
			..name.."<#>：岳将军遇刺？<enter>箭头：当年岳将军对阵金军，大破铁浮屠，刀斩拐子马，十荡十决那是何等的气概，杀得金国自国主以下人人心胆俱裂。金狗当然遇杀将军而后快。<enter>"
			..name.."<#>：可是我从不曾听说过将军遇刺的事情。<enter>箭头：这消息，现在还知道的人，已不多了。<enter>"
			..name.."<#>：那将军是怎样遇刺的。<enter>箭头：当年神宗十三道金牌令箭将岳将军从前线招回，大家都以为将军被招杀于风波亭，其实他是被武林中人救了出来。<enter>"
			..name.."<#>：解救出来？那将军现在何处。<enter>箭头：哎，就在这华山派，将军隐居不久，便被神秘刺杀了。<enter>"
			..name.."<#>：什么！<enter>箭头：将军当年的铠甲神光如炬，仿佛黑暗中的朝阳。大家都传说，那便是天煌龙器。不过详细的情况我也不清楚，不过你可以去问一个人。<enter>"
			..name.."<#>：谁？<enter>箭头：岑雄。他是当年岳将军随身护卫的后代，应该会比较清楚。此人现居凤翔，你去打探打探就能找到他的住所了。<enter>"
			..name.."<#>：谢谢您。<enter>箭头：你去吧，这番话，也算报答了当日云宗的救命之恩。<enter>",
			1,"结束对话/jiantou1")
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	else
		Describe(DescLink_JianTou.."<#>：华山天下险哪。<enter>",1,"结束对话/no")
	end
end

----------------------------------------------------------------岑雄---------------------------------------------------------------------------
function branch_cenxiong()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
		if ( Uworld1050 == 100 ) or ( Uworld1050 == 110 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,110)
				Describe(name.."<#>：岑雄大哥。<enter>"
				..DescLink_CenXiong.."<#>：这位朋友，我并不认识你，大哥一说愧不敢当。<enter>"
				..name.."<#>：是箭头大哥让我来找你的。<enter>岑雄：箭头？他近些年还好吗？<enter>"
				..name.."<#>：还行。他让我代为问候你。<enter>岑雄：哦，朋友找我有什么事？<enter>"
				..name.."<#>：据说当年岳飞将军北征金国时，曾经穿有一套神奇的铠甲。<enter>岑雄：对，父亲曾说过，岳爷爷骁勇盖世，添上那身铠甲，直如神仙一般。<enter>"
				..name.."<#>：那套铠甲可是天煌龙器？<enter>岑雄：正是！<enter>"
				..name.."<#>：现在它在哪里？<enter>岑雄：失踪了。自从岳爷爷在华山被刺，这套铠甲就如在人世消失了般，再没人知道它的下落。<enter>"
				..name.."<#>：岑大哥可曾查探过？<enter>岑雄：自然有的，可惜神器下落没有查到，却被我发现了当年刺杀岳爷爷的杀手！<enter>"
				..name.."<#>：什么！此人叫什么名字，现在哪里！<enter>岑雄：他叫潘如龙，现就在凤翔城外居住。<enter>",
				1,"结束对话/cenxiong1")
			else
				Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
			end
		else
			Describe(DescLink_CenXiong.."<#>：戎马一生，男儿的热血都挥洒在战场上，还有比这更好的归宿吗？<enter>",1,"结束对话/no")
		end
end

----------------------------------------------------------------贺兰芝---------------------------------------------------------------------------
function branch_helanzhi()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 20 ) or ( Uworld1051 == 30 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,30)
			Describe(name.."<#>：兰芝姐，你好。<enter>"
			..DescLink_HeLanZhi.."<#>：您是？<enter>"
			..name.."<#>：我是慕容老师遣来的，慕容老师目前正在临安铸甲，缺少属性矿石，兰芝姐当年曾经有过两颗，所以老师让我过来问候您，顺便看您还保留了宝石没有。<enter>贺兰芝：啊，师傅的东西我当然保存着。只是当年成婚的时候，嫁到夫家来，宝石放在陪嫁的嫁妆箱子里，后来清点东西却忽然丢了。也不知是不是遗落在村子里了。<enter>"
			..name.."<#>：哦，这样不巧啊。<enter>贺兰芝：这样吧，你去我老家江津村问问吴老太太吧。<enter>"
			..name.."<#>：好的。<enter>贺兰芝：慢着，走之前，先送你一件带孔的铠甲，当年是师傅专门为我打造，现在我不在江湖上走动了，留着也没用，你拿去吧。说不定留到找着属性石头的时候，会有些奇妙的事情。<enter>",
			1,"结束对话/helanzhi1")
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	else
			Describe(DescLink_HeLanZhi.."<#>：年轻的时候有许多梦想，现在只要老公好好的，比什么都重要了。<enter>",1,"结束对话/no")	
	end
end

----------------------------------------------------------------吴老太太-------------------------------------------------------------------
function branch_wulaotai()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 40 ) or ( Uworld1051 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,50)
			Describe(name.."<#>：吴老太太。<enter>"
			..DescLink_WuLaoTai.."<#>：……<enter>"
			..name.."<#>：老太太？<enter>吴老太太：……<enter>"
			..name.."<#>：老太太似乎患了怪病，没法说话，还是先回去找傲云宗吧。<enter>",
			1,"结束对话/wulaotai1")
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	elseif ( Uworld1051 == 150 ) or ( Uworld1051 == 160 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,160)
			Describe(DescLink_WuLaoTai.."<#>：……<enter>",
			1,"将药酒给吴老太太服下/wulaotai2")
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	else
			Describe(DescLink_WuLaoTai.."<#>：老身这把年纪，怕是再回不去京城了。<enter>",1,"结束对话/no")	
	end
end
--------------------------------------------------------------龚阿牛-------------------------------------------------------------------------
function branch_taokan()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 100 ) or ( Uworld1051 == 110 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,110)
			Describe(DescLink_TaoKan.."<#>：妈妈的，这头恶狼，真是要人命。害了我数十个弟兄性命。<enter>"
			..name.."<#>：你有什么困难吗？<enter>龚阿牛：你是谁？找我干吗？我这正烦着，没空理睬你。<enter>"
			..name.."<#>：我手里有些狼骨，想请您帮忙泡制一坛上好药酒。<enter>龚阿牛：不是不可以，但伏牛山里现在有一头恶狼做怪，官府严令襄阳城的猎户即日捕杀，完不成的话大家都要遭殃。我正为这事犯愁，没功夫帮你。<enter>"
			..name.."<#>：这个简单，我可以帮你把恶狼杀掉。<enter>龚阿牛：真是太好了！一看朋友的气派，我就知道你不是凡人。狼骨我这就为你下酒，等你杀掉恶狼，估计我这里也已泡制好了。<enter>",
			1,"结束对话/taokan1")
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	elseif ( Uworld1051 == 130 ) or ( Uworld1051 == 140 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,140)
			Describe(name.."<#>：龚大哥，狼我帮你杀掉了。<enter>"
			..DescLink_TaoKan.."<#>：太好了，药酒在此，你收好。这下总算是把官府的事给了了，也能好好过个年。<enter>",
			1,"结束对话/taokan2")
		else
			Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
		end
	else
			Describe(DescLink_TaoKan.."<#>：再狠的狼子也有打盹的时候，我大宋不过是一时疏忽，夺回失地那还不跟吃碟小菜似的。<enter>",1,"结束对话/no")	
	end
end

----------------------------------------------------------混混---------------------------------------------------------------------------
function branch_hunhun()
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Uworld1011 = nt_getTask(1011) --正派支线杀怪变量
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
		if ( Uworld1001 >= 210 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and (( Uworld1053 == 0 ) or ( Uworld1053 == 10))  then
				nt_setTask(1053,10)
				Describe(DescLink_HunHun.."<#>我要告诉你一个秘密。曾经有人在组织里打听关于岳飞被刺的经过。临渊崖与岳飞的仇恨大家都知道，当年钟杨二王死得多么惨烈，不过岳飞身边不乏高手暗中保护。我也不知道究竟是不是我们的人将他干掉了，只是听说有人醉酒后承认过，他参与了刺杀岳飞的行动。<enter>"
				..name.."<#>：这样的秘密，你为何要告诉我呢。<enter>混混：废话，你以为我想。可这个人最近忽然和我们失去了联系，听说他是去宋金战场了。靠，一个玩阴的人，居然还跑去为国而战。我他妈就不信了，不过没办法，还是烦牢你去一趟，也参加到宋金战役中，找找此人的下落，顺便拿二百个积分回来。<enter>",
				1,"结束对话/hunhun3")
		elseif (( Uworld1053 == 20 ) or ( Uworld1053 == 25 )) and ( Uworld1011 == 20 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,25)
				Describe(DescLink_HunHun.."<#>：干得漂亮，积分也拿得好。",
				1,"结束对话/hunhun5")
			else
				Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
			end
		elseif ( Uworld1053 == 27 ) or ( Uworld1053 == 30 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,30)
				Describe(DescLink_HunHun.."<#>：回答我关于宋金的几个问题。你注意，一旦进入答题阶段，就无法在答完题目前脱离，你做好准备没有。<enter>",
				2,"可以开始了/branch_songjinproblem","结束对话/no")
			else
				Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
			end
		elseif ( Uworld1053 == 40 ) or ( Uworld1053 == 50 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,50)
				Describe(DescLink_HunHun.."<#>：回答的都对，你这家伙真不是一般的强啊。好了，最近我才收到上面的消息，那人其实是潜伏到了宋金战场中去刺杀宋金两国的主将。<enter>"
				..name.."<#>：刺杀两国主将？<enter>混混：没错，咱们对宋朝没好印象，对金狗也一样！只要有钱赚，就杀！你去临安城外找他，他的名字叫齐即风，然后就和他一块行动吧。这件事要真干成了，那就会天下大乱，到时候，咱们的机会就到了。<enter>",
				1,"结束对话/hunhun4")
			else
				Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
			end
		elseif ( Uworld1052 == 40 ) or ( Uworld1052 == 50 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				nt_setTask(1052,50)
				Describe(name.."<#>：你好，我是"
				..name.."。<enter>"
				..DescLink_HunHun.."<#>：是你啊，怎么这么晚才到。其他人员早就进场了。你先进去演武场打赢一场，我要看看你的实力。<enter>",
				1,"结束对话/hunhun1")
			else
				Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
			end
		elseif ( Uworld1052 == 60 ) and ( Uworld1011 == 10 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				Describe(DescLink_HunHun.."<#>：妈的一场pk都打不过你还有脸来见我？快去赢一个人来。<enter>",1,"结束对话/no")
			else
				Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
			end
		elseif (( Uworld1052 == 60 ) or ( Uworld1052 == 70 )) and ( Uworld1011 == 20 ) then --扬州演武场战胜了一场
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				nt_setTask(1052,70)
				Describe(DescLink_HunHun.."<#>：嘿嘿，不错不错。你果然是好样的。<enter>"
				..name.."<#>：过奖了。<enter>混混：这些年我一直很头痛，本来演武场是个一本万利的买卖，可有个怪物居然在这里接连打胜了上百场，搞得许多人都不敢来挑战了。这家伙让我很是一个头痛啊。<enter>"
				..name.."<#>：你的意思是？<enter>混混：嘿嘿，我的意思，你明白。喀嚓！哼哼。<enter>"
				..name.."<#>：他在哪里？<enter>混混：他的名字叫渝湘津，这人隐蔽得非常好，我到现在都没发现他的踪迹。你如果能把他干掉，就是为组织立了大功，今后升迁的好处自不必说。<enter>",
				1,"结束对话/hunhun2")
			else
				Talk(1,"","对不起，您的等级已超过该任务所需等级，无法再继续执行了，非常抱歉。")
			end
		elseif ( Uworld1052 == 1000 )  then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				Describe(DescLink_HunHun.."<#>：兄弟，够威够力啊，今后就指望你了。<enter>",
				1,"结束对话/no")
			else
				Talk(1,"","兄弟，好好干。")
			end
	else
			Describe(DescLink_HunHun.."<#>：有些家伙就是软弱，杀人不过头点地，怕个屁，越怕越被人欺负。<enter>",1,"结束对话/no")	
		end
end



function chiseng1()
	AddOwnExp(5000)
	nt_setTask(1050,40)
	Msg2Player("痴僧让你替他去找五本《天残地缺》棋谱来，似乎寺外的藏宝客身上就有。")
end



function chiseng2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function jiantou1()
	AddOwnExp(5000)
	nt_setTask(1050,100)
	Msg2Player("箭头告诉你，去凤翔找叫岑雄的男子打听消息。")
end

function cenxiong1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function helanzhi1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function wulaotai1()
	AddOwnExp(15000)
	nt_setTask(1051,60)
	Msg2Player("吴老太太似乎身染怪病，你决定回去找傲云宗商量下一步的行动。")
end

function taokan1()
	AddOwnExp(15000)
	nt_setTask(1051,120)
	Msg2Player("襄阳的猎户龚阿牛正为伏牛山上出没的恶狼伤脑筋，你决定帮他解决这个麻烦。")
end

function taokan2()
	AddOwnExp(15000)
	nt_setTask(1051,150)
	Msg2Player("龚阿牛将泡制好的狼骨酒交给你，你可以去找吴老太太，将药酒给她服用了。")
end

function wulaotai2()
	local name = GetName()  
	Describe(DescLink_WuLaoTai.."<#>：咳……咳，……小朋友，谢谢你的药酒。我总算可以说话了。<enter>"
	..name.."<#>：老太太，当年贺兰芝嫁出村的时候，她曾经把两颗石头遗落在村里，您可曾看到。<enter>吴老太太：看到了，看到了。我一直帮兰芝好好保存着，可惜她一直没有回来，现在你来了，也正好了却老太婆一桩心事。<enter>"
	..name.."<#>：您收藏着？这真太好了。<enter>吴老太太：将它拿去吧，年轻后生，路上小心啊。<enter>",
	1,"结束对话/wulaotai3")
end

function wulaotai3()
	AddOwnExp(15000)
	nt_setTask(1051,170)
	Msg2Player("吴老太太饮下药酒后恢复了过来，她给了你两颗金系的暗属性宝石。你可以回去找傲云宗复命了。")
end

function hunhun1()
	Uworld1011 = nt_getTask(1011)
	AddOwnExp(30000)
	nt_setTask(1011,10) --杀怪变量置为10，
	nt_setTask(1052,60)
	Msg2Player("混混让你进入比武场打赢一场比赛。")
end

function hunhun2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function hunhun3()
	Uworld1011 = nt_getTask(1011)
	AddOwnExp(60000)
	nt_setTask(1011,10) --设置变量为10，记录参加宋金的参数
	nt_setTask(1053,20)
	Msg2Player("混混让你去宋金战场参加两国间的大战，并获得二百个积分。看来，有一个真正危险的任务在等待着你。")
end

function hunhun4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function hunhun5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function no()
end

