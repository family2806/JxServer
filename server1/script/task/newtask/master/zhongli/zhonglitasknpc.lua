-------------------------------------------------------------------------
-- FileName		:	zhonglitasknpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 14:42:00
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

-----------------------------------傅南冰对话--------------------------------
function funanbing()
	Uworld1002 = nt_getTask(1002)  --中立
	local name = GetName()  
	if ( Uworld1002 == 10 ) or ( Uworld1002 == 20 )then 
		nt_setTask(1002,20)
		Describe(name.."<#>：你是"..DescLink_FuNanBin.."？<enter>傅南冰：没错。<enter>"
				..name.."<#>：我是五爷介绍来的人，这里有他的亲笔书信。 <enter>傅南冰：你杀过人吗? <enter>"
				..name.."<#>：……没有。<enter>傅南冰：那你凭什么进临渊崖。五哥的信可以引荐，担保还不成。 <enter>"
				..name.."<#>：说你的条件。 <enter>傅南冰：杀人，杀一个难杀的人。 <enter>"
				..name.."<#>：谁？<enter>傅南冰：宁将军。<enter>"
				..name.."<#>：哪个宁将军。 <enter>傅南冰：南宋大将，通敌叛国，罪不可赦。 <enter>"
				..name.."<#>：该杀。<enter>傅南冰：他近来在罗宵山一带游玩，估计不出几日就要回营。若等他回去中军大帐，要近身都将万分困难。你去杀了他，才能入我山崖。 <enter>"
				..name.."<#>：好。<enter>",1,"结束对话/middlefinish1")
	elseif ( Uworld1002 == 40 ) or ( Uworld1002 == 50 ) then
		nt_setTask(1002,50)
		Describe(name.."<#>：他死了。 <enter>"..DescLink_FuNanBin.."<#>：我已收到消息，是我小看了你，"
				..name.."<#>。 <enter>"..name.."<#>：无所谓。<enter>傅南冰：今后有买卖我会再联系你。没有买卖的时候你不妨去临安找一个叫柳南云的人，他会给你些任务，自然都是有丰厚酬劳的。 <enter>"
				..name.."<#>：我知道了。 <enter>",1,"结束对话/middlefinish2")
	elseif (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1,"middletask","好好努力。")
	elseif ( Uworld1002 == 90 ) or ( Uworld1002 == 100 ) then
		nt_setTask(1002,100)
		Describe(name.."<#>：他死了。 <enter>"..DescLink_FuNanBin.."<#>：你竟真的把卢善像给杀了。 <enter>"
				..name.."<#>：他不如我，所以他死了。 <enter>傅南冰：好吧，这是上面传下来的赏格，拿去。 <enter>"
				..name.."<#>：多谢。<enter>傅南冰：不谢，你的能力我清楚了。山崖有个大计划，我希望你能参与进来。 <enter>"
				..name.."<#>：是什么计划？ <enter>傅南冰：目前还没有考虑妥当，到适当的时候，我会告诉你。 <enter>"
				..name.."<#>：我只希望你不要骗我。 <enter>傅南冰：现在的世道是什么样子？饥荒遍野，尸首相籍，父母易子而食，民众啸起山林，这样的天下已不是天下人的天下。如果我们的计划成功，世间将就此不同。我们在等待一个契机，一旦出现，我会立刻通知你。 <enter>"
				..name.."<#>：好。<enter>",1,"结束对话/middlefinish3") 
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		Talk(1,"middletask","好好努力。")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		Talk(1,"middletask","好好努力。")
	elseif ( Uworld1002 == 180 ) then
		Talk(1,"no","干得好，先去江湖上历练历练吧，以后我会再找你。")
	elseif ( Uworld1002 == 220 ) or ( Uworld1002 == 230 ) then
		nt_setTask(1002,230)
		Describe(DescLink_FuNanBin.."<#>：成功了？我就知道你会成功的。",1,"结束对话/middlefinish7")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		Talk(1,"middletask","好好努力。")
	elseif ( Uworld1002 == 290 ) or ( Uworld1002 == 300 ) then
		nt_setTask(1002,300)
		Describe(DescLink_FuNanBin.."<#>：怎样，得手了吗。 <enter>"
			..name.."<#>：东西都在这里。 <enter>傅南冰：太好了！我就知道你一定能成功。 <enter>"
			..name.."<#>：……龙器齐集，真能改变天下苍生命运吗？ <enter>傅南冰：怎么有此一问？ <enter>"
			..name.."<#>：我……我心里有些疑问。 <enter>傅南冰：哎，我也不知道。我只听说‘十龙聚首，天下始定，断其椎骨，新主出世’。 <enter>傅南冰：好了，一段时间内可能不会再找你。华山派有些事情需要我去处理，这段时间你的功绩我都上报了，以后少不了多有倚重，你且回五爷处领取赏格吧。再会了。 <enter>",1,"结束对话/middlefinish9")
	else
		Describe(DescLink_FuNanBin.."<#>:江湖险恶，当年一块出来的十三个弟兄，现在也只有我了。",1,"结束对话/no")
	end
end

------------------------------------郦秋水对话----------------------------------
function liqiushui()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 130 ) or ( Uworld1002 == 140 ) then
		nt_setTask(1002,140)
		Describe(DescLink_LiQiuShui.."<#>：你是干什么的？来翠烟门有何目的？ <enter>"
			..name.."<#>：我是崖里的人。南冰让我来找你。 <enter>郦秋水：哼，我不是告诉他们，不用找些废物来吗。 <enter>"
			..name.."<#>：没谁愿意跟着你。 <enter>郦秋水：哟，看不出你还很有性格。 <enter>"
			..name.."<#>：有这废话的工夫，事情早办完了。 <enter>郦秋水：好家伙，口气不小。剑门关有名首将叫徐自力，他身上有我们想要的东西。你去把它取来。 <enter>"
			..name.."<#>：是什么东西？ <enter>郦秋水：一件铠甲——白龙息。 <enter>"
			..name.."<#>：他在哪里。 <enter>郦秋水：经皇洞。 <enter>",1,"结束对话/middlefinish4")
	elseif ( Uworld1002 == 160 ) or ( Uworld1002 == 170 ) then 
		nt_setTask(1002,170)
		Describe(DescLink_LiQiuShui.."<#>：白龙息，这就是传说中的宝器吗。太好了。 <enter>"
			..name.."<#>：宝器？难道，这个是‘天煌龙器’。 <enter>郦秋水：你居然知道天煌龙器？ <enter>"
			..name.."<#>：原来听一个铁匠提到过。 <enter>郦秋水：铁匠？没想到世间知道这件事的人还不少，可见山外有山。朋友，是我小看你了。 <enter>"
			..name.."<#>：都是为临渊崖做事而已。关于龙器，你知道多少？ <enter>郦秋水：天煌龙器与组织的秘密息息相关，我只能告诉你这么多了，对不起。 <enter>郦秋水：这是给你的东西，收好。 <enter>",1,"结束对话/middlefinish5")
	elseif ( Uworld1002 == 180 ) and ( GetLevel() >= 50 ) then
		Talk(1,"","郦秋水:你成长得如此之快,快回去找傅南冰吧,他有重要任务交给你.")
	else 
		Describe(DescLink_LiQiuShui.."<#>：这辈子秋水是翠烟门的人，下辈子便做翠烟门的鬼吧。",1,"结束对话/no")
	end
end

------------------------------------寒江独钓叟-------------------------------------
function hanjiangdudiaosou()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 200 ) or ( Uworld1002 == 210 ) then
		nt_setTask(1002,210)
		Describe(DescLink_HanJiangDuDiaoSou.."<#>：一杆一笠任平生，一江烟波一江愁。 <enter>"
			..name.."<#>：寒老前辈，晚辈有礼了。 <enter>寒江独钓叟：你这小后生还挺有礼貌，找俺有啥事？ <enter>"
			..name.."<#>：杨帮主让我来问您几句话。 <enter>寒江独钓叟：什么话？<enter>"
			..name.."<#>：当年在天王帮失踪的秘器‘龙断’，您可知道它的消息。 <enter>寒江独钓叟：哦，这是许久以前的往事拉，俺的记性近来越来越差，那些陈年旧事早不记得拉。 <enter>"
			..name.."<#>：老前辈，帮主其实早已查明，只是碍于您是帮里老人，不好出面，您要再不说出来，胁只好不敬了。 <enter>寒江独钓叟：呵，呵呵，呵呵呵呵。好，好一个xxx。近来整个临渊崖都在传说你的事迹，果然是精悍果敢。不错，俺知道隐瞒不住的，‘龙断’就在俺手里。 <enter>"
			..name.."<#>：那就请您交出来吧。 <enter>寒江独钓叟：哎，想当年钟杨二王纵横洞亭，兵精将猛，俺曾经以为能改变这残酷的世道。可到头来还不是落的个兵败身死？有些事，是天命，天命不可违啊，人力如何能改变。改变了又如何？真的更好吗？ <enter>"
			..name.."<#>：老前辈，以后的事以后再说。现在您交出龙断，我可保您一条性命。 <enter>寒江独钓叟：哈哈哈，俺早就活够了，这条老命算得什么？ <enter>"
			..name.."<#>：你！<enter>寒江独钓叟：要龙断就去洞庭湖底迷宫吧，俺在那等你。 ",
			1, "结束对话/middlefinish6")
	elseif ( Uworld1002 >= 220 ) then
		Describe(name.."<#>：寒老前辈珍重，我回去一定为您说说话。 <enter>"..DescLink_HanJiangDuDiaoSou.."<#>：咳咳，不必了。小朋友，你记着，龙器齐集之日，天下必然大乱。 <enter>"
			..name.."<#>：在下谨记。 ", 1, "结束对话/no")
	else
		Describe(DescLink_HanJiangDuDiaoSou.."<#>:独钓寒江，心如止水，人一辈子，活明白就够了吧。",1,"结束对话/no")
	end
end

------------------------------------少林空寂--------------------------------------------
function shaolinkongji()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 260 ) or ( Uworld1002 == 270 ) then
		nt_setTask(1002,270)
		Describe(DescLink_KongJi.."<#>：阿弥陀佛，施主好重的杀气。 <enter>"
			..name.."<#>：行凶之人，当然有杀气。 <enter>空寂：多造杀孽，施主日后会沦入阿鼻地狱，苦海无边，回头是岸吧。 <enter>"
			..name.."<#>：我已经回不了头了。 <enter>空寂：只要放下，便是回头。 <enter>"
			..name.."<#>：我放得下自己，放不下万民。 <enter>空寂：以菩萨心肠行雷霆手段，阿弥陀佛。 <enter>"
			..name.."<#>：神僧，道不同不相为谋，请交出贵寺收藏的两件神器吧。 <enter>空寂：哎，请到少林后山山林，贫僧讨教几招。 <enter>",
			1, "结束对话/middlefinish8")
	elseif ( Uworld1002 >= 290 ) then
		Describe(name.."<#>：神僧，得罪了。 <enter>"..DescLink_KongJi.."<#>：阿弥陀佛，善恶皆有定论，天意不可违。施主去吧，前程自有因果。 <enter>",1,"结束对话/no")
	else
		Describe(DescLink_KongJi.."<#>：世间因果，自有定论，因缘前后，莫哭莫笑，阿弥陀佛。",1,"结束对话/no")
	end
end

--------------------------------------------------------------------------------------------

function no()
end

function middlefinish1()
	DelItem(456)
	AddOwnExp(5000)
	nt_setTask(1002,30)
	Msg2Player("傅南冰让你去杀掉在罗宵山游玩的宁将军。")
end

function middlefinish2()
	AddOwnExp(5000)

	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level20();
	Msg2Player("傅南冰说他会再找你的.")
	Talk(1,"middletask","好好努力。")
end

function middlefinish3()
	AddOwnExp(10000)
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level30();
	Msg2Player("傅南冰说临渊崖有个大计划,以后会再找你的.")
	Talk(1,"middletask","好好努力。")
end

function middlefinish4()
	AddOwnExp(15000)
	nt_setTask(1002,150)
	Msg2Player("郦秋水让你去经皇洞杀掉徐自力.")
end

function middlefinish5()
	Uworld1002 = nt_getTask(1002)
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level40();
	Msg2Player("傅南冰为你脱骨洗髓，现在你可以重新分配自己的技能点了。如果你不属于中立阵营，那么你得不到这个特殊机会。你可以回去找傅南冰了。")
end

function middlefinish6()
	AddOwnExp(30000)
	nt_setTask(1002,215)
	Msg2Player("寒江独钓叟让你去洞庭湖底迷宫找他,自会给你个交代.")	
end

function middlefinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level50();
	Msg2Player("傅南冰说以后会来找你的。")
	Talk(1,"middletask","好好努力。")
end

function middlefinish8()
	AddOwnExp(50000)
	nt_setTask(1002,280)
	Msg2Player("空寂神僧让你去少林后山找他。")	
end

function middlefinish9()
	AddOwnExp(40000)
	nt_setTask(1002,310)
	ex_add_zl_level60();
	AddSkillState( 509, 1, 0, 180);
	Msg2Player("傅南冰说他要去华山办些事，以后有机会再见了。你可以回龙五处拿些他给你的东西。")	
end
