-------------------------------------------------------------------------
-- FileName		:	nexttask.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 21:46:30
-- Desc			:	新任务系统正派，中立主线下一个任务的触发
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")

-----------------------------------------正派主线---------------------------------
function mastertask()
	Uworld1001 = nt_getTask(1001)
	name = GetName()
	if (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1001,70)
		Describe(DescLink_MoChou.."<#>：许久不见，我已听说你在江湖上一些成就了。<enter>"
				..name.."<#>：啊，是莫愁姑娘。 <enter>莫愁：恩，这些日子我也没闲着。经过多方查探，已经发现了‘天煌龙器’的下落。 <enter>"
				..name.."<#>：需要我做什么？ <enter>莫愁：成都府的信相寺里，最近多了个香客，名叫公子笑。根据我们的调查，他就是多年前曾经在巴蜀一代著名的巨富公子笑。此人当年富可敌国，狂放不羁，手下门徒清客数千，颇有当年战国四公子遗风。 <enter>莫愁：忽有一年，一月间他典当所有家产，携巨资失踪。近来却忽然出现在信相寺，据说是为早逝的娘子念经超度。我们的探子回报，这些年来公子笑一直在搜罗‘天煌龙器’，其中的护腕‘黄金鳞’就落在他手上。 <enter>"
				..name.."<#>：竟有此事。 <enter>莫愁：公子笑一直仗义疏财，为人潇洒。你此去不可以武力强求，若他一意拒绝便回来，我们再想办法。 <enter>",
				1, "结束对话/taskfinish1") 
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1001,140)
		Describe(DescLink_MoChou.."<#>：哎，不知道该怎样和你讲。 <enter>"
				..name.."<#>：怎么了莫愁姑娘？有话只管说啊。 <enter>莫愁：哎，这次真是终日打鹰，却被鹰啄瞎了眼。 <enter>"
				..name.."<#>：从来不见你如此沮丧。 <enter>莫愁：客栈暗中在各地潜伏着一个错综复杂的情报网，扬州一带由一个叫夏无且的客栈老人负责。 <enter>"
				..name.."<#>：难道，他出事了？ <enter>莫愁：没错。<enter>莫愁：近来不断收到扬州附近客栈的人传来消息，‘天煌龙器’中的上戒‘九现之指’在扬州出现。可夏无且在近月来的上报中竟然支字不提，只说查不到任何消息。以他的能力，太可疑了。 <enter>"
				..name.."<#>：你希望我怎么办？ <enter>莫愁：去扬州，查明真相。这是我的手令，见令如见人。 <enter>",
				1,"结束对话/taskfinish3") 
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1001,210)
		Describe(DescLink_MoQiaoEr.."<#>：大势不好拉！<enter>"
				..name.."<#>：怎么了。<enter>莫巧儿：我姐姐，我姐姐被一群黑衣人掳去了。 <enter>"
				..name.."<#>：什么！客栈如此隐蔽，你姐姐怎么会被人发觉？ <enter>莫巧儿：我也不知道，现在我脑子里一片混乱。所以才来找你。 <enter>"
				..name.."<#>：那帮黑衣人有什么特征？或者留下什么痕迹没有。 <enter>莫巧儿：毫无特征，他们就像一个模子里刻出来的。我们连布在外面的十七道暗岗被害都无所察觉，他们身手高得吓人，只一招就将姐姐擒下。我赶到时，只看到他们像黑鸟般翻墙而去。 <enter>"
				..name.."<#>：江湖中什么时候出了这样一群高手？这件事大不简单，应该和天煌龙器有关。 <enter>莫巧儿：是！我一急忘记告诉你，黄金鳞和九现之指都失踪了。 <enter>"..name.."：哎，这事发生得太突然，毫无头绪，一时也无从查起。你仔细想想，你姐姐在被掳去前，可曾说过什么。 <enter>莫巧儿：对了，姐姐曾说，如果她失踪的话，可以去临安找一个叫孟凡的老人。 <enter>"
				..name.."<#>：哦，有这条线索就好办。你等着，我去找他。 <enter>莫巧儿：恩。<enter>",
				1,"结束对话/taskfinish5")
	elseif (( Uworld1001 == 270 ) or ( Uworld1001 == 280 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1001,280)
		Describe(DescLink_MengFan.."<#>：愁儿的下落我已经探访到了。<enter>"
				..name.."<#>：在哪里。<enter>孟凡：一个让人无法相信的地方。<enter>"
				..name.."<#>：……<enter>孟凡：襄阳衙门的地下暗道！<enter>"
				..name.."<#>：什么？官府的地方。难道朝廷也牵扯其中。<enter>孟凡：这我也不知道了。我查到龙器的下落出现在鄱阳湖边，必须过去。你可先去襄阳，伺机而动。听说是个身材高大，使剑的中年男子带她入内的。若打不过，千万别送死，等我回来。<enter>"
				..name.."<#>：孟大叔你放心，我有分寸。<enter>孟凡：那我去也。<enter>",
				1,"结束对话/taskfinish9")
	end 
end 

function taskfinish1()
		AddOwnExp(10000)
		nt_setTask(1001,80)
		Msg2Player("莫愁让你去成都信相寺找公子笑调查黄金鳞的下落.")
end

function taskfinish3()
		AddOwnExp(15000)
		nt_setTask(1001,150)
		Msg2Player("莫愁让你去扬州找一个叫夏无且的人查探九现之指的下落.")
end

function taskfinish5()
		AddOwnExp(30000)
		nt_setTask(1001,220)
		Msg2Player("莫巧儿让你去临安找一个叫孟凡的老人,他也许知道莫愁的下落.")
end

function taskfinish9()
		AddOwnExp(50000)
		nt_setTask(1001,290)
		Msg2Player("孟凡让你去襄阳地道，他说莫愁被神秘人掳去了那里.让你见机行事。")
end

-------------------------------------中立主线----------------------------------------------

function middletask()
	Uworld1002 = nt_getTask(1002)
	name = GetName()
	if (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1002,70)
		Describe(DescLink_FuNanBin.."<#>：时间过去不久，你却已干成几票买卖，看来你是个得力的人选。 <enter>"..name.."：有什么行动了？ <enter>傅南冰：杀手这行有个传闻，江湖上有三个人不得杀。 <enter>"..name.."：哪三个？ <enter>傅南冰：岳武穆岳爷爷，这是武圣人，万众拜服，是不可杀。 <enter>傅南冰：武林盟主独孤剑，一剑在手，奔龙逐电，是不敢杀。 <enter>傅南冰：杀人王卢善像，千人尸骨万人坟，他便是杀神的现世化身，是不能杀。 <enter>"..name.."：前两个，我绝不动手。 <enter>傅南冰：要你杀的就是卢善像。此人做恶太多，有人出大价钱买他的命。 <enter>"..name.."：什么地方，什么时间。 <enter>傅南冰：快活林，十日之内。这人是杀手行里的祖师爷级人物。你不要反被人杀。 <enter>"..name.."：拼的是实力，我不如他，我死，心甘情愿。 <enter>傅南冰：有命就回来见我吧。 <enter>",1,"结束对话/middlegoon1")
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1002,120)
		Describe(DescLink_FuNanBin.."<#>：机会来了！ <enter>"..name.."：什么机会？<enter>傅南冰：临渊崖的大动作已经开始了。 <enter>"..name.."：具体说说吧。 <enter>傅南冰：临渊崖内消息都是单线联系，我也只知道，让你去找翠烟门的大师姐郦秋水。她会告诉你下一步的安排。 <enter>"..name.."：翠烟门？ <enter>傅南冰：是。临渊崖的主力是由几大门派精英组成，翠烟门就是其中之一。只是这个秘密江湖上很少人知道罢了。 <enter>"..name.."：那好吧，我去找她。 <enter>",1,"结束对话/middlegoon2")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1002,190)
		Describe(DescLink_FuNanBin.."<#>： 你好,‘天煌八器’中最为锋利的战枪‘龙断’曾经为天王帮镇帮之宝，可惜后来被异人盗去。天王帮也是临渊崖重要的一支，且帮主杨瑛就是临渊崖的主人。多年来一直搜索不到龙断的下落，近日听闻战枪被盗与天王帮内的寒江独钓叟有所干系，此人对天王帮贡献极大，主人不宜亲自出手，想让你代为过问。 <enter>",1,"结束对话/middlegoon3")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1002,250)
		Describe(DescLink_FuNanBin.."<#>：大事不妙，根据内线消息，正派的秘密组织武林客栈已搜集到两件神器，若让他们集齐则我们的计划永无完成之日。为了天下人的希望，你一定要去夺回来，而且你一定能夺回来的。神器被一个叫莫愁的女子交到了客栈三大掌柜中武功最高的掌柜，也就是少林派寂灭二神僧之一，空寂的手里。他就藏在少林寺内，把他找出来，把宝器夺过来。临渊崖的希望都在你手里攥着了，南冰伏首万拜！ <enter>",1,"结束对话/middlegoon4")
		end 
end 

function middlegoon1()
	AddOwnExp(10000)
	nt_setTask(1002,80)
	Msg2Player("傅南冰让你去快活林杀掉卢善像.")
end

function middlegoon2()
	AddOwnExp(15000)
	nt_setTask(1002,130)
	Msg2Player("傅南冰让你去翠烟门找郦秋水.")
end

function middlegoon3()
	AddOwnExp(30000)
	nt_setTask(1002,200)
	Msg2Player("傅南冰让你去天王帮找寒江独钓叟.")
end

function middlegoon4()
	AddOwnExp(50000)
	nt_setTask(1002,260)
	Msg2Player("傅南冰让你去少林寺找空寂大师.")
end
