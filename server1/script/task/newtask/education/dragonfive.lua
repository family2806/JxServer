-- 新任务系统教学任务主要NPC  （\游戏运行资源\script\global\dragonfive.lua）
-- 下一步进行到新手村武师处		 (\游戏运行资源\script\global\各派接引弟子\轻功_武师模版.lua)
-- BY：XIAOYANG（2004-11-29）

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
Include("\\script\\task\\partner\\master\\partner_mastertask.lua")
---------------------------------龙五对话-------------------------------------

function Uworld1000_word()
	Say("乱世风烟，兵火四起，我这里有些任务能帮助你的吧。",5,"我是来做教育任务的/iwantdotask","我想取消教育任务/iwantkilltask","我是来做20级以上主线任务的/iwantgetmastertask","我想看看关于任务的详细介绍/iwantseetask","过一阵子再说吧/no")
end

function iwantdotask()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld1014 = nt_getTask(1014)
	local name = GetName()
	if ( Uworld1000 == 0 ) and ( GetLevel() <= 1 ) then --等级小于1而且第一次登陆游戏，这里还需修改。
		Say("龙五：欢迎你来到剑侠情缘的世界。你要不要到我这里学习一些很重要的知识呢？这些知识可以帮助你更好的在这世间生存。",2,"好啊，我求之不得/Uworld1000_goon","算了吧，你这个老头懂什么/Uworld1000_no")
	elseif ( GetLevel() > 1 ) and ( Uworld1000 == 0 ) then --等级大于1，没有做过教学任务的玩家
		Say("龙五：欢迎你来到我们的村子，你要不要学习一些在剑侠世界中生存的诀窍呢？",2,"好啊/Uworld1000_goon","算了，以后再说吧。/Uworld1000_no")
	elseif ( Uworld1000 == 40 ) or ( Uworld1000 == 50 ) then 
		nt_setTask(1000,50) --环节3start
		Talk (9,"Uworld1000_good2",name.."<#>：龙首领，我已经去找武师学过了。","龙五：这么快？",name.."<#>：我也升级了。","龙五：那刚好，按F3打开属性面板，看到四个亮色的加号没：分别是力量，身法，内功，外功。",name.."<#>：看到了。","龙五：力量影响使用近身武器人物的外功系基本攻击。每增加5点力量，增加1点基本攻击；身法影响使用远程武器人物的外功系基本攻。每增加5点身法，增加1点基本攻击。同时身法影响人物命中和闪避，每增加1点身法，金木水火土分别加4点命中。",name.."<#>：这么复杂？","龙五：我早说了，你记不得可以点开F12看我给你留的信，还有不懂的可以看F1里的锦囊。",name.."<#>：恩，这样就方便多了。")
	elseif (( Uworld1000 == 60 ) or ( Uworld1000 == 70 )) and ( GetLevel() >= 3 ) then
		nt_setTask(1000,70) --环节4start
		Talk (5,"Uworld1000_high4",name.."<#>：龙首领，我在村外修练了一阵子，自觉有所进步。","龙五：进步？你出去仍是被人杀的料。",name.."<#>：……","龙五：这几年大战频频，商人们倒是发了国难财。不过这些家伙南北奔涉，挣的是辛苦钱。你依次去找找村里的药铺老板，铁匠和杂货铺老板娘，他们见的多，肚子里掏点货出来够你受用。先去找药铺老板吧。",name.."<#>：……")	
	elseif ( Uworld1000 == 140 ) or (Uworld1000 == 150 ) then
		nt_setTask(1000,150) --环节8start
		Talk (5,"Uworld1000_high8","龙五：怎么样，学的东西不少吧。",name.."<#>：还好。","龙五：先去歇着，等到<color=red>5级<color>来找我，要学的东西还多，别嫌烦，大家都这么过来的。",name.."<#>：明白。","龙五：对了，你现在如果不累，可以去武师那学轻功，不学也没什么影响。")
	elseif (( Uworld1000 == 160 ) or ( Uworld1000 == 170 )) and ( GetLevel() >= 5 ) then
		nt_setTask(1000,170) --环节9start
		Talk (9,"Uworld1000_good3","龙五：回来拉。最近到月圆时候了，晚上常有狼嚎声，出去练功的时候注意点。",name.."<#>：一两头狼算什么。","龙五：算什么？你有本事去杀一千头来。",name.."<#>：呵，您这不是故意难为我嘛。","龙五：为人处事，要喜怒不惊。你这么容易自骄怎么行？",name.."<#>：……明白了。","龙五：你要不相信，可以找别人问。你这点功夫算什么。",name.."<#>：怎么问？","龙五：按回车键（Enter）切换到聊天模式，然后直接输入你要说的话，回车键（Enter）发送。在输入栏的左边是频道选择的按钮，鼠标点击该按钮便可以选择对话频道，这样就可以任意选择你想说话的频道。")
	elseif (( Uworld1000 == 200 ) or ( Uworld1000 == 210 )) then
		nt_setTask(1000,210) --环节11start
		Talk (5,"Uworld1000_high10","龙五：问的如何。",name.."<#>：是我不对。","龙五：好，你能有所领悟，证明资质不坏，大家都跟我讲了。你可再去修练修练，不久后，我有个重要决定要告诉你。",name.."<#>：是什么决定？","龙五：<color=red>10级<color>的时候再说，去吧。对了，村子里有位野叟，他那里经常有些小任务可以完成，不失为一个赚取经验的机会，而且他会时不时送你些东西作为特别的回报。")
	elseif (( Uworld1000 == 220 ) or ( Uworld1000 == 230 )) and ( GetLevel() >= 10 ) then --新手村教育任务结束
		nt_setTask(1000,230) --环节12start
		Talk (7,"Uworld1000_high11","龙五：好快啊，一转眼你就学完我这里所有的东西了。",name.."<#>：学完了？","龙五：别高兴，现在你只是够资格加入武林当中的十大门派。",name.."<#>：十大门派是怎么回事？","龙五：没看到村子里的那些各派弟子吗？宋金局势难辨，江湖步步凶险，各大门派都大肆招人扩充实力。人在江湖，身不由己，要走什么路，你自己决定。",name.."<#>：龙……五，你还有什么要交代的吗。","龙五：此去路远难行，自己好生照顾自己。去找接引弟子入门派吧，到了门派里，找帮助npc，就可以找到我，一定要和我联系，有些事还需交代。记得对任务不清楚的时候按F12，对操作不熟按F1。")
	elseif ( Uworld1000 == 260 ) or (Uworld1000 == 270 ) then
		nt_setTask(1000,270) --环节14start(1)
		Talk (3,"Uworld1000_good","龙五：外面世道乱，是需要用些霹雳手段，我对你要求严，实在是看好你的资质，希望别辜负我一番苦心。武功修炼分内外之别，五行也分内功系和外功系的区别。你在选择修习武攻的时候要看清楚。",name.."<#>：内外功有什么区别？","龙五：在武器上的附加属性是可以给你的功夫加成的。如你是内功系的话，那么内冰，内火，内毒等等的武器附加属性在激活后都可以得到加成，而外冰，外火等则无法给你加成了。反之亦然。",name.."<#>：哦，原来如此。")	
	elseif (( Uworld1000 == 280 ) or ( Uworld1000 == 290) ) and ( GetLevel() >= 20 ) then
		nt_setTask(1000,290) --环节15start
		Talk (5,"Uworld1000_high13","龙五：这是怎么来的，这是怎么来的。",name.."<#>：……五爷，几日不见，你老多了。","龙五：金狗前几日又来过，杂货铺的老板娘被……",name.."<#>：五爷！","龙五：罢了罢了，饶是我颇费苦心，多番运筹，到头来还是打不过金狗，老啦，世界是你们年轻人的。")
	elseif ( Uworld1000 >= 10) and ( Uworld1000 <= 440 ) then
		Talk (1,"","龙五：独自在江湖流浪总是辛苦的，你要勤加练习，才能出人头地，纵使你一心向善，也要足以自保啊。有不明白的地方可以按下<color=red>F12<color>，翻阅任务书信。")
	elseif ( Uworld1000 == 1000 ) then
		Talk(1,"","龙五：江湖险恶，万事需要小心。今后无法照顾你，好自珍重。路，永远是自己走出来的！")
	end
end

function iwantkilltask()
	Uworld1000 = nt_getTask(1000)
	Uworld1067 = nt_getTask(1067)
	local name = GetName()
	if ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		if ( Uworld1067 ~= 10 ) then
			education_changewuxing()
		end
		nt_setTask(1000,1000)
		Msg2Player("您已经成功取消了教育任务。在任务面板上您会看到自己的教育任务已经完成的提示，其实是没有领到包裹的，您可以选择与龙五对话领取包裹。而且你将来也不能再做教育任务了。")
	elseif ( Uworld1000 == 1000 ) then
		Talk(1,"","龙五：您已顺利完成教育任务，无需取消了。")
	else
		Talk(1,"","龙五：阁下跟我闹着玩吧，您又没接教育任务。")
	end
end

function iwantgetmastertask()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld1014 = nt_getTask(1014)
	local name = GetName()
	if ( Uworld1001 == 320 ) then
		Talk(1,"Uworld1000_zhenghigh1000","龙五：能完成莫愁交给你的艰巨任务，不是人人都可以办到的，龙某以你为荣！")
	elseif ( Uworld1002 == 310 ) then
		Talk(1,"Uworld1000_zhonghigh1000","龙五：能从临渊崖走出来的杀手，一百个里也就一个吧，你就是那一个，以自己为荣耀吧，你有这个资格。")
	elseif ( Uworld1003 == 430 ) then
		Talk(1,"Uworld1000_xiepai1000","龙五：无论你选择了怎样的路，能走到这一步都付出许多血泪，我这里有些东西要送给你。")
	elseif  (GetLevel() >= 20 ) then -- 等级大于20的玩家
		Say("龙五：你已在江湖上有一番根基，要不要做些其他任务呢？",2,"我想做20级以上的任务/Uworld1000_more","我只是随便看看，不用管我/Uworld1000_no")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","龙五：您的等级没有达到要求，请20级以后再来吧。")
	elseif ( GetLastFactionNumber() == -1 ) then
		Talk(1,"","龙五：对不起，你没有加入任何门派，这些任务就不太适合你完成了。")
	end
end

function iwantseetask()
	Describe(DescLink_LongWu.."<#>：新任务系统分为<color=red>教育任务，主线任务和支线任务<color>。<color=red>教育任务<color>是所有玩家都可以接到的任务，目的是为您介绍一些剑网中的特色和操作方式。可以选择<color=red>取消教育任务<color>，但是将来也无法再完成。<color=red>主线任务<color>目前从<color=red>20<color>至<color=red>60<color>级，每<color=red>10<color>级有一个，按<color=red>正派(少林，武当，峨嵋，丐帮，昆仑)，中立(翠烟，唐门，天王)，邪派(天忍，五毒)<color>阵营分为三条线路,必须是入了各大门派的玩家才能进行。无论您是任何阵营都可以完成，并获得最终的黄金装备奖励，但各阶段的特殊奖励只有本阵营可以得到，经验奖励不限阵营。<color=red>支线任务<color>必须接到相应等级的任务才能做，同样按整数级划分，如您要接邪派30-39级支线任务，您必须先接到邪派30级主线任务。并必须在任务规定的等级区间内完成，否则无法继续,在做教育任务的同时是无法做支线任务的。各种任务为您准备了丰厚的奖励和特殊的体验，希望您能尽情享受武侠世界中的快意恩仇。与任务链相关的介绍请去野叟处询问。",1,"结束对话/no")
end

function Uworld1000_goon()
	Talk (1,"Uworld1000_title","龙五：那好吧，现在我们开始教学。话说在前面，既然入了我庄子，就一视同仁，觉得我严那也是没办法的。")
end


function Uworld1000_more() --此处为20级任务的入口之一
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	if (( Uworld1001 < 10 ) or ( Uworld1002 < 10 ) or ( Uworld1003 < 10 ))  and ( GetLastFactionNumber() ~= -1 ) then
	Say("龙五:你想做哪个阵营的任务?",4,"正派阵营/Uworld1000_camp1","中立阵营/Uworld1000_camp2","邪派阵营/Uworld1000_camp3","我再想想吧./Uworld1000_no")
	elseif ( HaveCommonItem(6,1,131) > 0 ) then
		Talk(1,"","龙五:你不是已经拿到我给你的包袱了,那么便立即打开它吧,以后再会.")
	elseif ( GetLastFactionNumber() == -1 ) then
		Talk(1,"","龙五：这位朋友，你没有入任何门派，是无法来我这里接到任务的。")
	else
		Talk(1,"","朋友,今后的路需要你自己去走了,一切珍重。")
	end
end

function Uworld1000_camp1()
	Uworld1001= nt_getTask(1001)
	Uworld183 = nt_getTask(183)
  	if ( Uworld1001 < 10 ) then
	  	AddItem(6,1,131,0,0,0)
	  	nt_setTask(183,10)
	  	Msg2Player("得到龙五给你的一个包袱。")
	else 
		Talk(1,"","龙五：你不是已经开始做正派阵营的任务了吗？怎么还接。")
	end
end

function Uworld1000_camp2()
	Uworld186 = nt_getTask(186)
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 < 10 ) then
  	AddItem(6,1,131,0,0,0)
  	nt_setTask(186,10)
  	Msg2Player("得到龙五给你的一个包袱。")
  else 
		Talk(1,"","龙五：你不是已经开始做中立阵营的任务了吗？怎么还接。")
	end
end

function Uworld1000_camp3()
	Uworld189 = nt_getTask(189)
	Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 < 10 ) then
	  	AddItem(6,1,131,0,0,0)
	  	nt_setTask(189,10)
	  	Msg2Player("得到龙五给你的一个包袱。")
  	else 
		Talk(1,"","龙五：你不是已经开始做邪派阵营的任务了吗？怎么还接。")
	end
end

function Uworld1000_no()
	Talk (1,"","龙五：好吧，我不强迫你。不过遇到危险或者迷惑的时候，记得打开F1，那些锦囊妙计可能会帮到你。就此别过，前路珍重。")
end

function Uworld1000_title()
	local name = GetName()  
	Talk (4,"Uworld1000_and","龙五：欢迎你来到这里，我是这个村子的首领。现在外面世道很乱，君主偏安东南，金蛮子杀人不眨眼，远远的能听到马鞍子和刀鞘磨擦的声音，人心都快磨碎了。晚上铁灰色的云里，全是大火。伴着草风吹来的血腥味浓得吃不下饭。你出去的时候一定要小心。",name.."<#>：我第一次来，许多事情都不懂，有些什么要注意的吗。","龙五：你这样的少年人我见得多了，村里恰好有教育年轻人的课程，学一点，总归是好的。出了这里，性命随时会丢掉。","龙五：不管怎么乱，总归要活的。",name.."<#>：恩，我有一番志业。那血红的战云，总有一天要为我开解。")
	
end

function Uworld1000_and()
	local name = GetName()
	if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --巴陵
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>209/186<color>。")
	elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --龙泉村
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>197/216<color>。")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --龙门镇
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>237/239<color>。")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --石鼓镇
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>207/203<color>。")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --稻香村
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>208/184<color>。")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --永乐镇
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>207/214<color>。")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --朱仙镇
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>217/192<color>。")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --江津村
		Talk(1,"","龙五：你吗？呵呵。不多说，你去村外找我们村的武师吧，去之前先杀些动物，寻三块鲜肉给他。他的坐标是<color=red>454/391<color>。")
 	end
 	Talk(5,"Uworld1000_find","龙五：他是好酒的人，带点下酒菜过去，保不准能教你点看家本领。走不快可以按R键跑起来。","龙五：看到右上脚的小地图了吗，没看到的话按键盘上的tab键可以打开。上面有坐标，第一个数字是东西方向，左边是西，右边是东。第二个数字是南北方向，上面是北，下面是南。","龙五：照着坐标跑过去，小地图右下画面有几个小图标，你自己打开一看就明白。鼠标右键点在小地图上可以拖动查看其他地域。好，我也乏了，你先去吧。",name.."<#>：明白。","龙五：对了，以后我告诉你的事有不记得的，打开<color=red>F12<color>，那里面有我留给你的书信，信里说的清楚。")
end


function Uworld1000_find()
	nt_setTask(1000,10) --让玩家去找武师，任务变量设为10，环节一start
	Msg2Player("龙五让你去村外找武师，去前先杀动物拿到三块鲜肉。") 
	seteducationnpcpos()
end


function Uworld1000_good2()
	local name = GetName()
	Talk(4,"Uworld1000_high3","龙五：外功加生命，内功加内力。五行不同，加的血和内力也不同。你现在可以尝试加加，规律是：每加一点外功对应金木水火土各加8、5、6、7、3点生命。",name.."<#>：那内功呢？","龙五：每加一点内功对应金木水火土各加1、3、3、2、4点内力。",name.."<#>：原来如此，看来我要慎重加点。","龙五：今天也乏了，先去休息吧，明日再来找我。记得，先练到3级。外面风大，晚上别着凉了。")
	
end

function Uworld1000_high3()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 50 ) then
		AddOwnExp(350)						
		nt_setTask(1000,60) --环节3end
		Msg2Player("龙五让你3级的时候再去找他")
	end
end

function Uworld1000_high4()			
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 70 ) then
		AddOwnExp(350)			
		nt_setTask(1000,80) --环节4end
		Msg2Player("龙五让你去找各个铺子老板对话，先去找药铺老板。")
		seteducationnpcpos()
	end
end

function Uworld1000_high8()
	nt_setTask(1000,160) --环节8end
	Msg2Player("龙五让你到5级才来找他，现在可以去武师那学轻功。")
end

function Uworld1000_good3()
	local name = GetName()
	Talk(6,"Uworld1000_high9","龙五：在游戏中您遇到的任何问题，都可以通过聊天的方式向其他玩家寻求帮助，也可以通过同样的方式帮助别人。按住<color=red>ctrl键<color>再用鼠标点击任何一个你想与之对话的人,就可以与他对话了.刚开始的时候，只能从聊天频道的<附近玩家>频道与玩家对话。",name.."<#>：你告诉我这么多干嘛？","龙五：去试试找人问，一个新手村的小虾米,你算不算是江湖大侠。",name.."<#>：算你狠。","龙五：聊完就去找武师吧，别忘了去的时候给他捎带<color=red>5块鲜肉。<color>好好练习。",name.."<#>：……")
end

function Uworld1000_high9()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 170 ) then
		AddOwnExp(800)
		nt_setTask(1000,180) --环节9end
		Msg2Player("龙五要你先找人聊天，然后去找武师。别忘记带5块鲜肉。")
		seteducationnpcpos()
	end
end

function Uworld1000_high10()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 210 ) then
		AddOwnExp(400)
		nt_setTask(1000,220) --环节11end
		Msg2Player("龙五要你10级再去找他。")
	end
end

function Uworld1000_high11()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 230 ) then
		AddOwnExp(3000)
		nt_setTask(1000,240) --环节12end
		Msg2Player("龙五说你已可入十大门派，可去找村里的门派弟子。入门后可以去帮助NPC处找到龙五。")
	end
end

function Uworld1000_good()
	local name = GetName()
	Talk(4,"Uworld1000_high12","龙五：你所学得的武功可按F5显示。单击技能左右键设置栏，出现技能选择菜单时，可以将鼠标挪到某一技能上。","龙五：用键盘上的<color=red><q>、<w>、<e>、<a>、<s>、<d>、<z>、<x>、<c>键<color>可设定技能快捷切换方式。",name.."<#>：哦，这样就有操作技巧了。","龙五：恩，接下来的修炼将是非常辛苦，你做好准备就去吧。20级的时候来找我，我会在此等你。")
end

function Uworld1000_high12()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 270 ) then
		AddOwnExp(3000)
		nt_setTask(1000,280) --环节14end
		Msg2Player("龙五说你可在20级时来找他。")
	end
end

function Uworld1000_high13()
	local name = GetName()
	local curCamp = nt_getCamp();
	if  ( curCamp == 0 ) then --缺少支线npc的坐标
		Talk(3,"Uworld1000_find2","龙五：你去找一个叫傲云宗的人,他会继续给你些帮助的，他在凤翔。",name.."<#>：五爷，你今后有什么打算。","龙五：你放心，姓龙的不会轻易丢了这条命，我还要和金狗斗到底！")
	elseif  ( curCamp == 1 ) then --缺少支线npc的坐标
		Talk(3,"Uworld1000_find2","龙五：你去找一个叫柳南云的人,他会继续给你些帮助的，他在临安。",name.."<#>：五爷，你今后有什么打算。","龙五：你放心，姓龙的不会轻易丢了这条命，我还要和金狗斗到底！")
	elseif  ( curCamp == 2 ) then --缺少支线npc的坐标
	  	Talk(3,"Uworld1000_find2","龙五：你去找一个叫拓跋怀川的镖师,他会继续给你些帮助的，他在汴京。",name.."<#>：五爷，你今后有什么打算。","龙五：你放心，姓龙的不会轻易丢了这条命，我还要和金狗斗到底！")
	end
end

function Uworld1000_find2()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 290 ) then
		AddOwnExp(5000)
		nt_setTask(1000,300)
		Msg2Player("龙五说让你去找一个人，他可以帮助你。")
	end
end

function Uworld1000_zhenghigh1000()
Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 == 320 ) then
		AddOwnExp(150000)
		prize()
		
		Msg2Player("你完成了莫愁交给你的任务，龙五非常欣赏你，好好鼓励了你一番，可是，似乎有些暗流在地下缓缓涌动着，江湖之路，也许才刚刚开始。")
	end
end

function Uworld1000_zhonghigh1000()
Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 == 310 ) then
		AddOwnExp(150000)
		prize()
		
		Msg2Player("你完成了傅南冰交给你的杀手任务，你已是江湖上一个出名的杀手了，这不见得是好事情，在城市的某个角落里，已经有眼睛开始悄悄注视着你。")
	end
end

function Uworld1000_xiepai1000()
Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 == 430 ) then
		prize()
		
		Msg2Player("你完成了邪派的主线任务，今后也许有更多挑战在等待你吧，一个冷血的人。")
	end
end

function education_changewuxing()
	Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		nt_setTask(1067,10)
		Msg2Player("旧的五行技能为测试技能，没有实际攻击效果，已为您替换新的武功技能。")
	end
end