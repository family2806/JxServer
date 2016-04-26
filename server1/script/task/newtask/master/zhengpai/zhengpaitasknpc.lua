-------------------------------------------------------------------------
-- FileName		:	路人_莫愁.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 22:53:08
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

function mochou()
	Uworld1001 = nt_getTask(1001)  --正派
	local name = GetName()  
	if ( Uworld1001 == 10 ) or ( Uworld1001 == 20 )then
		nt_setTask(1001,20) 
		Describe(name.."<#>：请问你可是"..DescLink_MoChou.."<#>姑娘？<enter>莫愁：你是哪位。<enter>"
				..name.."<#>：我这里有封别人带给你的书信，你看过便知了。 <enter>莫愁接过信函。莫愁：这，这信上有毒！ <enter>"
				..name.."<#>：什么？<enter>莫愁：你，你好狠，装得如此无辜。说，是什么人派你来的！ <enter>"
				..name.."<#>：交给我那信的人不许我说，我也相信他不会如此做。 <enter>莫愁：好！好！好！你不说，今天别想活着从这里走出去！ <enter>"
				..name.."<#>：就是把命扔在这里我也绝不会泄露他的名字。 <enter>莫愁：不给你点厉害，你是不会松口的！我在城外码头边等你，要杀我就来吧！ <enter>",
				1,"结束对话/Uworld1001_finish1")
	elseif ( Uworld1001 == 40 ) or ( Uworld1001 == 50 )then
		nt_setTask(1001,50)
		Describe(name.."<#>：没想到你武技居然这么高。 <enter>"
				..DescLink_MoChou.."<#>：你再不说，我就废去你全身武功，说不说！<enter>"
				..name.."<#>：不说。<enter>莫愁：……<enter>"
				..name.."<#>：你杀了我吧。 <enter>莫愁：没想到，没想到，龙五的手下竟如此铮铮铁骨。 <enter>"
				..name.."<#>：你休想拿言语来诳我，我是绝对不会说的。 <enter>莫愁：哎，朋友，这只是一计而已，为的是试你。不信你自己看信吧，上面说的清楚。 <enter>"
				..name.."<#>：……果然，这究竟是怎么一回事。 <enter>莫愁：为了看阁下是否值得托付大事。 <enter>"
				..name.."<#>：大事？<enter>莫愁：对，这话要说太长，我简短的跟你讲讲。近来失踪已久的‘天煌龙器’重现江湖。这是一套由北海寒铁锻冶成的稀世铠甲。当年始皇嬴政灭六国，合七国名匠铸甲咸阳，铸造时咸阳上空血色彤云经年不退，当时出生的孩子，十个里有九个身体上带有铠形胎迹。铸成之日七国匠师三百二十一人在封炉一刻气血干枯而亡。 <enter>"
				..name.."<#>：竟然有这种宝物？我一点都不知道。 <enter>莫愁：这是历代只在宫廷间传说的秘闻。这套铠甲上应天命，是夺天意的灵器，谁要是得到它，真不知会有什么事发生。 <enter>"
				..name.."<#>：嬴政独夫之后，秦不是立刻灭亡了吗。这也不见得是什么好东西。 <enter>莫愁：你错了。就在项羽下巨鹿，坑杀三十万秦卒的前夜，这套龙甲自咸阳宫神秘失踪了。 <enter>"
				..name.."<#>：这能说明什么。 <enter>莫愁：你不宜知道太多，只是，为了这东西，可惜那三百多名巧匠啊，如果他们仍活着，绝艺有一半留存下来，金贼哪里有嚣张之机。 <enter>"
				..name.."<#>：不过是死物，有什么好希奇。 <enter>莫愁：你又错了，战国时我中土的兵器制造可谓绝顶，巨匠汇粹，不然以区区秦国偏居西北一隅，凭什么统一天下？ <enter>"
				..name.."<#>：这和我有什么关系呢。 <enter>莫愁：我想让你帮我。 <enter>"
				..name.."<#>：怎么帮？<enter>莫愁：我要帮一个人，救一个人。 <enter>"
				..name.."<#>：帮谁？又救谁？ <enter>莫愁：你现在功力尚浅，等你有所成，我自会找你。 <enter>"
				..name.."<#>：既然姑娘是五爷的朋友，我一定帮忙。 <enter>莫愁：恩，你无事时不妨去找傲云宗，他是我武林客栈三掌柜。自会给你些帮助。 <enter>"
				..name.."<#>：好，那在下告辞了。 <enter>莫愁：慢，这个是我的妹妹莫巧儿，刚学艺下山，今后你们会常有联系。 <enter>",
				1, "与莫巧儿对话/Uworld1001_talk")
	elseif (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1, "mastertask", "好好努力。")
	elseif ( Uworld1001 == 110 ) or ( Uworld1001 == 120 ) then
		nt_setTask(1001,120)
		Talk(1, "Uworld1001_finish3", "<#>莫愁:这,这不就是黄金鳞吗?"..name.."<#>你本事不小.")
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		Talk(1, "mastertask", "好好努力。")
	elseif ( Uworld1001 == 180 ) or ( Uworld1001 == 190 )then
		nt_setTask(1001,190)
		Talk(1, "Uworld1001_finish4", "<#>莫愁:九现之指!"..name.."<#>,我果然没有看错人.")
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		Talk(1, "mastertask","好好努力。")
	elseif ( Uworld1001 == 300 ) or ( Uworld1001 == 310 ) then
		nt_setTask(1001,310)
		Describe(name.."<#>：有话就说吧，把莫愁交出来！ <enter>"
				..DescLink_ShenMiRen.."<#>：你以为是我掳去了莫愁？ <enter>"
				..name.."<#>：难道不是吗！ <enter>神秘人：哎，误会了。 <enter>"
				..name.."<#>：你什么意思。 <enter>神秘人：我是武林客栈的主人，莫愁是被我救到襄阳疗伤的。 <enter>"
				..name.."<#>：还要胡说吗！ <enter>莫愁："
				..name.."<#>不得无礼！这位便是客栈主人——南宫飞云！ <enter>",
				1, "与莫愁对话/Uworld1001_talk5")
	else
		Describe(DescLink_MoChou.."<#>:江湖是什么,大概就是在一个个黄昏细雨,刀光喋血的日子里,依然不顾一切,去守护自己所爱的人吧.无论他知不知道......", 
				1, "结束对话/no")
	end
end

---------------------------------------莫巧儿------------------------------------------------
function moqiaoer()
	Uworld1001 = nt_getTask(1001)  --正派
	local name = GetName()  
	if ( Uworld1001 == 10 ) or ( Uworld1001 == 20 )then
		nt_setTask(1001,20) 
		Describe(name.."<#>：请问你可是"
			..DescLink_MoChou.."<#>姑娘？<enter>莫愁：你是哪位。<enter>"
			..name.."<#>：我这里有封别人带给你的书信，你看过便知了。 <enter>莫愁接过信函。莫愁：这，这信上有毒！ <enter>"
			..name.."<#>：什么？<enter>莫愁：你，你好狠，装得如此无辜。说，是什么人派你来的！ <enter>"
			..name.."<#>：交给我那信的人不许我说，我也相信他不会如此做。 <enter>莫愁：好！好！好！你不说，今天别想活着从这里走出去！ <enter>"
			..name.."<#>：就是把命扔在这里我也绝不会泄露他的名字。 <enter>莫愁：不给你点厉害，你是不会松口的！我在城外码头边等你，要杀我就来吧！ <enter>",
			1,"结束对话/Uworld1001_finish1")
	elseif ( Uworld1001 == 40 ) or ( Uworld1001 == 50 )then
		nt_setTask(1001,50)
		Describe(name.."<#>：没想到你武技居然这么高。 <enter>"
			..DescLink_MoChou.."<#>：你再不说，我就废去你全身武功，说不说！<enter>"..name.."<#>：不说。<enter>莫愁：……<enter>"
			..name.."<#>：你杀了我吧。 <enter>莫愁：没想到，没想到，龙五的手下竟如此铮铮铁骨。 <enter>"
			..name.."<#>：你休想拿言语来诳我，我是绝对不会说的。 <enter>莫愁：哎，朋友，这只是一计而已，为的是试你。不信你自己看信吧，上面说的清楚。 <enter>"
			..name.."<#>：……果然，这究竟是怎么一回事。 <enter>莫愁：为了看阁下是否值得托付大事。 <enter>"
			..name.."<#>：大事？<enter>莫愁：对，这话要说太长，我简短的跟你讲讲。近来失踪已久的‘天煌龙器’重现江湖。这是一套由北海寒铁锻冶成的稀世铠甲。当年始皇嬴政灭六国，合七国名匠铸甲咸阳，铸造时咸阳上空血色彤云经年不退，当时出生的孩子，十个里有九个身体上带有铠形胎迹。铸成之日七国匠师三百二十一人在封炉一刻气血干枯而亡。 <enter>"
			..name.."<#>：竟然有这种宝物？我一点都不知道。 <enter>莫愁：这是历代只在宫廷间传说的秘闻。这套铠甲上应天命，是夺天意的灵器，谁要是得到它，真不知会有什么事发生。 <enter>"..name.."<#>：嬴政独夫之后，秦不是立刻灭亡了吗。这也不见得是什么好东西。 <enter>莫愁：你错了。就在项羽下巨鹿，坑杀三十万秦卒的前夜，这套龙甲自咸阳宫神秘失踪了。 <enter>"
			..name.."<#>：这能说明什么。 <enter>莫愁：你不宜知道太多，只是，为了这东西，可惜那三百多名巧匠啊，如果他们仍活着，绝艺有一半留存下来，金贼哪里有嚣张之机。 <enter>"..name.."<#>：不过是死物，有什么好希奇。 <enter>莫愁：你又错了，战国时我中土的兵器制造可谓绝顶，巨匠汇粹，不然以区区秦国偏居西北一隅，凭什么统一天下？ <enter>"
			..name.."<#>：这和我有什么关系呢。 <enter>莫愁：我想让你帮我。 <enter>"
			..name.."<#>：怎么帮？<enter>莫愁：我要帮一个人，救一个人。 <enter>"
			..name.."<#>：帮谁？又救谁？ <enter>莫愁：你现在功力尚浅，等你有所成，我自会找你。 <enter>"
			..name.."<#>：既然姑娘是五爷的朋友，我一定帮忙。 <enter>莫愁：恩，你无事时不妨去找傲云宗，他是我武林客栈三掌柜。自会给你些帮助。 <enter>"..name.."<#>：好，那在下告辞了。 <enter>莫愁：慢，这个是我的妹妹莫巧儿，刚学艺下山，今后你们会常有联系。 <enter>",1,"与莫巧儿对话/Uworld1001_talk")
	elseif (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1, "mastertask", "好好努力。")
	elseif ( Uworld1001 == 110 ) or ( Uworld1001 == 120 ) then
		nt_setTask(1001, 120)
		Talk(1, "Uworld1001_finish3", "<#>莫愁:这,这不就是黄金鳞吗?"..name.."<#>你本事不小.")
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		Talk(1,"mastertask","好好努力。")
	elseif ( Uworld1001 == 180 ) or ( Uworld1001 == 190 )then
		nt_setTask(1001,190)
		Talk(1,"Uworld1001_finish4","莫愁:九现之指!<#>"..name.."<#>,我果然没有看错人.")
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		Talk(1,"mastertask","好好努力。")
	elseif ( Uworld1001 == 300 ) then
		nt_setTask(1001,310)
		Describe(name.."<#>：有话就说吧，把莫愁交出来！<enter>"
			..DescLink_ShenMiRen.."<#>：你以为是我掳去了莫愁？ <enter>"
			..name.."<#>：难道不是吗！ <enter>神秘人：哎，误会了。 <enter>"
			..name.."<#>：你什么意思。 <enter>神秘人：我是武林客栈的主人，莫愁是被我救到襄阳疗伤的。 <enter>"
			..name.."<#>：还要胡说吗！ <enter>莫愁："
			..name.."<#>不得无礼！这位便是客栈主人——南宫飞云！ <enter>",
			1, "与莫愁对话/Uworld1001_talk5")
	else
		Describe(DescLink_MoQiaoEr.."<#>:愁姐姐命很苦，是她独自将我养大的。我知道她一直喜欢一个男人，但她从来不说那个男人的名字。",1,"结束对话/no")
	end
end

----------------------------------------公子笑-----------------------------------------------
function gongzixiao()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 80 ) or ( Uworld1001 == 90 ) then
		nt_setTask(1001,90)
		Describe(name.."<#>：笑公子。<enter>"
				..DescLink_GongZiXiao.."<#>：对不起，在下正为亡妻守灵，无论有什么事，过了丧期再说吧。 <enter>"
				..name.."<#>：请您节哀，不过这件事事关重大，还请借一步说几句话，话说完我马上走。 <enter>公子笑：我的话从不说两次，请回吧。 <enter>"
				..name.."<#>：公子，在下实在是为黄金鳞而来！ <enter>公子笑：哈哈哈哈哈……公子笑发出亢长而仿如悲嚎的笑声。<enter>"
				..name.."<#>：公子……<enter>公子笑：黄金鳞，又是黄金鳞。为了这死物，我抛弃了亿万身家，富贵荣华，落得夫人也横死异乡。后来人却依然趋之若骛。 <enter>"
				..name.."<#>：公子……<enter>公子笑：罢了罢了，黄金鳞我交给手下界流风守护，他就在药王洞一层，你自去找，能胜得过他,东西就自己拿走。 <enter>"
				..name.."<#>：谢公子相告，还请节哀。 <enter>公子笑：年轻人，为了莫须有的东西而放弃身边人是多么愚蠢，你以后就会知道了。 <enter>",
				1,"结束对话/taskfinish2")
	else 
		Describe(DescLink_GongZiXiao.."<#>:追鹰逐兽,争名夺利,年轻的时候但求一口豪气,人总会明白张扬的代价,可惜,我的代价却是自己的妻子.早知道是这样,哎,世上又有什么事是早知的呢?",1,"结束对话/no")
	end
end

----------------------------------------夏无且--------------------------------------------------

function xiawuqie()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 150 ) or ( Uworld1001 == 160 ) then
		nt_setTask(1001,160)
		Describe(name.."<#>：您是夏无且？<enter>"..DescLink_XiaWunQie.."<#>：是我。<enter>"
				..name.."<#>：我是客栈的人。 <enter>夏无且：怎么从未见过你。 <enter>"
				..name.."<#>：不用见我，认识它就行了。 <enter>失去手令。<enter>夏无且：你，你是愁姑的人。 <enter>"
				..name.."<#>：我为什么来夏先生应该清楚。 <enter>夏无且：知道。扬州最近一切正常，上使请屋里坐，我这就安排酒菜。 <enter>"
				..name.."<#>：夏先生无须拐弯抹角了，‘天煌龙器’您知道吗。 <enter>夏无且：自然知道。<enter>"
				..name.."<#>：在扬州出现了您怎么又不知道呢。 <enter>夏无且：是吗，我从未收到消息。 <enter>"
				..name.."<#>：夏先生不用隐瞒了，我早已知道，‘九现之指’就在你手上！交出来吧。 <enter>夏无且：竟然，愁姑竟然已经知道了。 <enter>"
				..name.."<#>：夏先生，我一诳你就露馅了。现在说出下落还不迟。 <enter>夏无且：我若不说呢。 <enter>夏无且被你击倒在地。<enter>"
				..name.."<#>：说吧。<enter>夏无且：罢了，是夏某无义在先，你去点苍洞三层吧，我委托我的兄弟紫刀侠守护着。 <enter>"
				..name.."<#>：夏先生，以你今日位高权重，我不知道你为何会见利忘义。 <enter>夏无且：哈哈哈哈！你以为区区蝇头小利可以让我背弃于我有大恩德的客栈吗？你太小看夏某了。 <enter>夏无且伤势过重晕了过去，你心中仍有疑问，可他的手下已匆匆赶来，你只能迅速离开。<enter>",
				1, "结束对话/taskfinish4")
	else
		Describe(DescLink_XiaWunQie.."<#>:人这辈子都会有想做的事,只是有些事是做不得的,做不成的。有些人甘愿放弃,我却不,我要争,能在世上走一遭就不易了,还在乎那许多干吗呢。", 1, "结束对话/no")
	end
end

---------------------------------------孟凡---------------------------------------------------------

function mengfan()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 220 ) or ( Uworld1001 == 230 ) then
		nt_setTask(1001,230)
		Describe(name.."<#>：是孟凡大叔吗。<enter>"..DescLink_MengFan.."<#>：你是哪位。 <enter>"
				..name.."<#>：客栈的人。 <enter>莫凡：什么客栈？<enter>"
				..name.."<#>：心中暗想，也许孟凡并不知道客栈。"
				..name.."<#>：哦，我开个玩笑。您应该知道莫愁姑娘吧。她……<enter>孟凡：等等，什么客栈，什么莫愁？阁下是否找错人了。 <enter>"
				..name.."<#>：孟大叔，您是信不过我吧。 <enter>孟凡：我实在不知道你讲什么。 <enter>"
				..name.."<#>：莫愁姑娘被一群黑衣人掳去了，天煌龙器失踪了！你要不信，可以飞鸽传书找巧儿姑娘对峙！<enter>孟凡：……莫愁被人掳走？什么时候的事。<enter>"
				..name.."<#>：就这几日！ <enter>孟凡：这事太突然了，你去响水洞杀掉客栈的大仇人怨毒，若提他首级来见，我就信你。 <enter>",
				1, "结束对话/taskfinish6")
	elseif ( Uworld1001 == 250 ) or ( Uworld1001 == 260 ) then
		nt_setTask(1001,260)
		Describe(name.."<#>：孟大叔，首级在此，这下你信了吧。事情紧急，千万不能再耽误了。<enter>"
				..DescLink_MengFan.."<#>：小友，是我误会你了。期间我已派手下有所查探，我相信这件事和客栈的主人有关。 <enter>"
				..name.."<#>：主人？主人是谁。 <enter>孟凡：这个，恕我无可奉告……我只能告诉你，他是个江湖上以为他早就死去的人。 <enter>"
				..name.."<#>：早就死去？<enter>孟凡：具体情况我查明后会再通知你，事不宜迟，你先去修练吧，将来有要借重你的大地方。 <enter>"
				..name.."<#>：有情况请一定立即通知我。 <enter>孟凡：一定。巧儿那里你不必回去了，我已代为妥善安置。 <enter>",
				1, "结束对话/taskfinish7")
	elseif ( Uworld1001 == 270 ) or ( Uworld1001 == 280 ) then
		Talk(1,"mastertask","你等级已经这么高了吗？")
	else
		Describe(DescLink_MengFan.."<#>:别人都说我了不起,其实没有什么。唯一能让我感到满意的是,年轻时候曾经拥有过的梦想,如今依然在.",1,"结束对话/no")
	end
end

-------------------------------------------------------------------------------------------------------------
function no()
end


function Uworld1001_finish1()
	DelItem(455)
	AddOwnExp(5000)
	nt_setTask(1001,30)   --环节二end
	Msg2Player("莫愁让你去城外码头边找她。")
end

function Uworld1001_finish2()
	AddOwnExp(5000)
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level20();
	Msg2Player("莫愁说她会再找你的.")
	Talk(1,"mastertask","好好努力。")
end

function Uworld1001_finish3()
	AddOwnExp(10000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level30();
	Msg2Player("莫愁说以后自会找你.")
	Talk(1,"mastertask","好好努力。")
end

function Uworld1001_finish4()
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level40();
	Msg2Player("莫愁说以后自会找你.她为你进行了脱骨洗髓，现在你可以重新自由分配一次技能点了。如果你不属于正派阵营，则得不到这次机会。")
	Talk(1,"mastertask","好好努力。")
end

function Uworld1001_talk()
	local name = GetName()  
	Describe(DescLink_MoQiaoEr.."<#>：你好。<enter>"
	..name.."<#>：你好，以后还望你多加指点。<enter>莫巧儿：你太客气了，互相请教吧。总要做一番功业出来。<enter>"
	..name.."<#>：恩！<enter>",1,"结束对话/Uworld1001_finish2") 
end

function Uworld1001_talk5()
	local name = GetName()  
	Describe(name.."<#>：南宫……飞云。多年前，被前代天忍教主打落山崖的南宫大侠！ <enter>"
	..DescLink_MoChou.."<#>：正是。<enter>"
	..name.."<#>：<#>是我错了。 <enter>南宫飞云：不必介怀，你也是担心莫愁的安危。 <enter>"
	..name.."<#>：谢谢你能理解，南宫大侠。 <enter>莫愁：我被一群黑衣人挟持，是主人救了我。 <enter>"
	..name.."<#>：那是些什么人？ <enter>莫愁：不清楚，但我怀疑是临渊崖的高手干的。 <enter>"
	..name.."<#>：那是什么组织？ <enter>莫愁：道上一个正邪之间的杀手组织。 <enter>"
	..name.."<#>：他们是为了龙器？ <enter>莫愁：对。我之所以收集龙器，是为了帮主人救出他的夫人，完颜若雪。 <enter>"
	..name.."<#>：啊！若雪夫人当年也……？ <enter>莫愁：恩，夫人没有死，夫人只是被囚禁在一个神秘的地方。只有找齐龙器，从中取出那个神秘地方的地图，才能救出夫人。 <enter>",
	1,"与南宫飞云对话/Uworld1001_talk6")
end

function Uworld1001_talk6()
	local name = GetName()  
	Describe(name.."<#>：南宫大侠。<enter>"
	..DescLink_NanGongFeiYun.."<#>：小友为客栈做的事我都听愁儿说了，我无以为报，惭愧得很。 <enter>"
	..name.."<#>：南宫大侠不必担心，我一定帮您找到夫人。 <enter>南宫飞云：我称得上什么大侠？妻子也救不出来，呵呵呵。 <enter>莫愁：主人，你又长嘘短叹什么，不理你了。走，我们自己聊去。 <enter>",
	1,"再次与莫愁对话/Uworld1001_talk7")
end

function Uworld1001_talk7()
	local name = GetName()  
	Describe(name.."<#>：……莫愁，你是不是，喜欢南宫大侠。 <enter>"
	..DescLink_MoChou.."<#>：去去去，就你多嘴，人家和你很熟吗？ <enter>"
	..name.."<#>：呵呵呵。<enter>莫愁：呵呵呵，和他一样，两个大傻子。 <enter>"
	..name.."<#>：呵呵呵。<enter>莫愁：扑哧，你还真有意思。好了，此间也告一段落，接下来我会陪主人去一趟大理天龙寺，你可以回去找龙五叙叙旧。可能会过一段日子再联系你吧。 <enter>"
	..name.."<#>：好，希望你们能开心。 <enter>莫愁：……谢谢你这段时间的帮助，我不会忘记你的。 <enter>",
	1,"结束对话/Uworld1001_finish10")
end

function Uworld1001_finish10()
	AddOwnExp(90000)
	nt_setTask(1001,320)
	AddSkillState( 509, 1, 0, 180);
	ex_add_zl_level60();
	Msg2Player("莫愁说她要与南宫飞云去大理天龙寺处理些事情，让你回去找龙五。也许今后，没有相见的日子了。")
end

function taskfinish2()
	AddOwnExp(10000)
	nt_setTask(1001,100)
	Msg2Player("公子笑让你去药王洞一层找他的属下界流风.")
end

function taskfinish4()
	AddOwnExp(15000)
	nt_setTask(1001,170)
	Msg2Player("你还想说什么,可夏无且的手下却循声走来,只得匆匆离开.去点苍洞三层找紫刀侠.")
end

function taskfinish6()
	AddOwnExp(30000)
	nt_setTask(1001,240)
	Msg2Player("孟凡让你去响水洞将怨毒杀掉，提其首级来见。")
end

function taskfinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level50();
	Msg2Player("孟凡让你先在江湖上修练，他去打听莫愁的下落，一有消息马上通知你。")
	Talk(1,"mastertask","好好努力。")
end
