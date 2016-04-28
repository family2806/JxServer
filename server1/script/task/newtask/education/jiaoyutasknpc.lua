-- 新任务系统
-- BY:XIAOYANG(2004-11-29)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
-----------------------------------新手村武师-----------------------------
function education_wushi()
	Uworld1000 = nt_getTask(1000)      -- 新任务系统
	Uworld1065 = nt_getTask(1065)      -- 记录鲜肉数量的变量
	local name = GetName()  
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then   
		Talk(1,"Uworld1000_end1",name.."<#>：师傅，龙首领让我来找你。这是给您捎的鲜肉。")
	elseif (( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) then  
		Talk(1,"Uworld1000_end1",name.."<#>：师傅，龙首领让我来找你。这是给您捎的鲜肉。")
	elseif (( Uworld1000 == 10 ) or ( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) and ( Uworld1065 < 3 ) then 
		Talk(1,"","武师：啊，鲜肉都不够，朋友你太没意思了吧。先拿三块来。")
	elseif ( Uworld1000 == 180 ) and ( Uworld1065 < 5 ) then
		Talk(1,"","咋？又忘记给我带鲜肉拉，凑足五块再来。")
	elseif ( Uworld1000 == 180) or ( Uworld1000 == 190 ) then
		if ( Uworld1000 == 180 and Uworld1065 >= 5 ) then
			Uworld1065 = Uworld1065 - 5
			nt_setTask(1065,Uworld1065)
		elseif ( Uworld1000 == 180 ) then
			Talk(1,"no","咋？又忘记给我带鲜肉拉，凑足五块再来。")
		end
			nt_setTask(1000,190) --环节10start
			Talk(10,"Uworld1000_good4",
			name.."<#>：师傅。","武师：万万不敢当，你我平辈论交。咋？又拿肉来拉，呵呵，好！",name.."<#>：龙五实在让人气愤。","武师：恩恩，好肉，好肉。",name.."<#>：师傅，我在和你说话呢。","武师：哈哈，龙头儿为人耿直，其实是为你好。没有严格的训练，将来出江湖死的快啊。",name.."<#>：可他说话也太冲了。","武师：年轻人，万事需忍，只有磨练出金刚不坏的定力，你才能做成大事。",name.."<#>：哦，原来如此。","武师：不罗嗦，在村子里呆这么久你必然也闷了。想不想交几个朋友？",name.."<#>：随便。","武师：按F6打开好友界面，点击下方的查找按钮，就可在玩家姓名中选择，或者自己精确定位。当然，也可以按住ctrl和鼠标右键到对方身上，在弹出菜单中选择好友选项。")
	else 
		Talk(1,"","走南闯北惯了，真要闲下来还是不习惯。")
	end
end

-----------------------------------杂货铺老板-----------------------------
function zboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
		if ( Uworld1000 == 120 ) or ( Uworld1000 == 130 ) then
			nt_setTask(1000,130) --环节7start
			Describe(DescLink_ZaHuoPu.."<#>：年轻人，你找我有什么事吗。<enter>"
			..name.."<#>：龙首领让我来找您学点东西。<enter>杂货铺老板：呵呵，那个死人，又打发小朋友过来羞我。我哪里有什么东西可教给你啊。<enter>"
			..name.."<#>：您太客气了。<enter>杂货铺老板：话说回来，你以后行走江湖，可能会听到关于‘天煌龙器’的传闻。<enter>"
			..name.."<#>：天煌龙器？<enter>杂货铺老板：恩，那是一套秦朝皇帝征召七国名匠打造的盔甲，据说里面隐藏着巨大秘密。<enter>"
			..name.."<#>：哦？<enter>杂货铺老板：具体我也不清楚。哦，对了，我这里有些回城符，你今后在与野兽作战时，一旦疲惫了可以使用它回到城市或者乡镇里。<enter>"
			..name.."<#>：有这样的好东西？<enter>杂货铺老板：是啊，来，送你两张，再外送鞋子一双，否则那个死人又得说我小气了。<enter>"
			..name.."<#>：谁啊？啊！龙首领？<enter>杂货铺老板：呵呵，小朋友你加油哦。",
			2,"我要看看天煌龙器的图纸/Uworld1000_tianhuanglongqi","结束对话/Uworld1000_high7")
		else 
			Talk(1,"","杂货铺老板：出去闯荡什么江湖啊，在家老实过活多好。")
		end
end

------------------------------------药铺老板----------------------------------
function yboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 80 ) or ( Uworld1000 == 90 ) then
		nt_setTask(1000,90) --环节5start
		Talk(9,"Uworld1000_high5","药铺老板：客人好啊，您要点什么。",name.."<#>：我身上没什么钱，是龙首领让我来找你的。","药铺老板：哦，五爷让你来的。这样我明白了。其实也没什么可教的，先送你点药品以备不时之需吧。",name.."<#>：多谢你。","药铺老板：不用客气，出门在外谁能没个难处，好好用功吧，说不定将来你成了大侠，我还有需要仰仗的地方。",name.."<#>：您太客气了。","药铺老板：以后有什么伤患只管来找我，如果想单个购买，可以按住shift加鼠标右键。",name.."<#>：好，我知道了。","药铺老板：恩，去找村镇里的铁匠吧。") 
	else 
		Talk(1,"","药铺老板：受伤的时候千万记得服药，小病不治，大病难医啊。")
	end
end

------------------------------------铁匠--------------------------------------
function tboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName() 
	 	if ( Uworld1000 == 100 ) or ( Uworld1000 == 110 ) then
			nt_setTask(1000,110) --环节6start
			Talk(11,"Uworld1000_high6","铁匠：哟，您来拉。",name.."<#>：呵呵，恩，来了。","铁匠：想要点儿啥？",name.."<#>：我是来打听消息的。","铁匠：五爷的人？",name.."<#>：是。","铁匠：那就好办。我这什么武器都有，按照你的五行选择武器会有可能激活暗藏属性哦。",name.."<#>：是嘛。","铁匠：你按住F4打开背包，按F3打开装备界面，用鼠标左键把武器装备到武器栏里就可以使用了。",name.."<#>：谢谢您。","铁匠：别客气，找杂货铺老板娘去吧，她可是个美人。")
		else
			Talk(1,"","铁匠：买把兵器防身太有必要了，否则谁见你都得打你主意。")
		end
end    

-----------------------------------城市铁匠-----------------------------------
function education_tiejiang()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 380 ) or ( Uworld1000 == 390 ) then
		nt_setTask(1000,390) --环节20start
		Talk(12,"Uworld1000_repair","铁匠：神器已出，天下必然更加混乱。这苍茫的时代，何时才会终结啊。",name.."<#>：先生，您在说什么？","铁匠：你是五哥派来的？",name.."<#>：是。","铁匠：传说中始皇帝倾一国之力打造的‘天煌龙器’又再现江湖，不知道将挑起多少腥风血雨啊。",name.."<#>：究竟什么是‘天煌龙器’？","铁匠：这个以后你自会知道。来，这是五哥存在我这里的一件铠甲，你拿去吧。",name.."<#>：多谢您。","铁匠：这东西藏在秘室日久，已经有些锈蚀，你可以在我这里上油打磨一番。",name.."<#>：哦，那具体怎么做？","铁匠：再次和我聊天，点击购买装备下面那个修字，就可以用箭头来点击你要修理的装备了。",name.."<#>：那我修修吧。")
	elseif ( Uworld1000 == 400 ) or ( Uworld1000 == 410 ) then  --缺少对盔甲是否修理好的判断
		nt_setTask(1000,410) --环节21start
		Talk(9,"Uworld1000_luck1","铁匠：怎样，已经修好了吧。",name.."<#>：恩，修好了。","铁匠：你看到装备上的暗属性被激活没有？",name.."<#>：看到了，这是怎么回事？我没有去找激活的装备啊。","铁匠：因为这件装备是与你自身属性相生的，这样的装备，第一个暗属性将自动激活。金生水，水生木，木生火，火生土，土生金。",name.."<#>：哦，太好了。这下我彻底明白五行激活了。","铁匠：现在我将给你一个特别的奖励。",name.."<#>：那是什么？","铁匠：我将给你一个特殊状态，幸运增加10点，不过只能持续1小时哦。")
	else 
		Talk(1,"","铁匠：买把兵器防身太有必要了，否则谁见你都得打你主意。")
	end
end

function Uworld1000_repair() --增加双加过百衣一件
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 390 ) then
		local nItemIdx = 0;
		if ( GetSex() == 0 ) then --金
				if (GetSeries() == 0 ) then
					nItemIdx = AddItem(0,2,0,1,2,255,7);--水衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --木
					nItemIdx = AddItem(0,2,0,1,3,255,7);--火衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --水
					nItemIdx = AddItem(0,2,0,1,1,255,7);--木衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --火
					nItemIdx = AddItem(0,2,0,1,4,255,7);--土衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --土
					nItemIdx = AddItem(0,2,0,1,0,255,7);--金衣
					SetCurDurability(nItemIdx,14)
				end
			else 
				if (GetSeries() == 0 ) then --金
					nItemIdx = AddItem(0,2,9,1,2,255,7);--女水衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --木
					nItemIdx = AddItem(0,2,9,1,3,255,7);--女火衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --水
					nItemIdx = AddItem(0,2,9,1,1,255,7);--女木衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --火
					nItemIdx = AddItem(0,2,9,1,4,255,7);--女土衣
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --土
					nItemIdx = AddItem(0,2,9,1,0,255,7);--女金衣
					SetCurDurability(nItemIdx,14)
			end
		end
	end
	nt_setTask(1000,400) --环节20end
	Msg2Player("铁匠让你将盔甲修理好，就在铁匠处可以修理。")	
end

function Uworld1000_luck1()
	local name = GetName()  
	Talk(4,"Uworld1000_luck2",name.."<#>：那是什么意思。","铁匠：幸运就是你在与野兽的搏斗中，将会有更高的可能获得好装备。幸运值最高为255，现在我免费给你1小时的幸运，好自珍重。",name.."<#>：恩，我会的。","铁匠：好，江湖路远啊。你可以回去找让你来的人了，他会将五哥的一封信交给你。")
end

function Uworld1000_luck2()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 410 ) then
	  	AddSkillState(441, 1, 1, 64800)        --增加幸运10一小时的判断
		AddOwnExp(2000)
	end
	nt_setTask(1000,420) --环节21end
	Msg2Player("您获得了幸运1小时，接下来1小时内，您将会有可能打到更好的装备。")
	if  ( curCamp == 0 ) then
		Msg2Player("铁匠告诉你可以回去凤翔找傲云宗了。")
	elseif  ( curCamp == 2 ) then
		Msg2Player("铁匠告诉你可以回去汴京找拓跋怀川了。")
	elseif  ( curCamp == 1 )  then
		Msg2Player("铁匠告诉你可以回去临安找柳南云了。")
	end
end

----------------------------临安钱庄老板----------------------------------------

function education_qianzhuanglaoban()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		nt_setTask(1000,370) --环节19start
		Talk(4,"Uworld1000_yinpiao","钱庄老板：你是五哥的人？",name.."<#>：是。","钱庄老板：快请坐，当年我承过五哥的恩情，他的事就是我的事。",name.."<#>：其实只是五爷嘱咐我来城里转转。","钱庄老板：哦，这样。来，我告诉你一些行走江湖需要注意的事项。")
	end
end

---------------------------武林盟传人-----------------------------------------------
function education_wulinmengchuanren()
Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 340 ) or ( Uworld1000 == 350 ) then 
		nt_setTask(1000,350) --环节18start
		Talk(6,"Uworld1000_goon3","武林盟传人：呵呵，小友，你来了。",name.."<#>：您知道我要来？","武林盟传人：在下以前当过算命先生，姻缘前程，财气富贵是一看包准的。",name.."<#>：呵呵，先生真会调侃。","武林盟传人：柳老板那里的许多货物，你在江湖上怕都难找到。",name.."<#>：哦，那么有什么限制没。");
	end
end

function Uworld1000_tianhuanglongqi()
	Describe("<link=image:\\spr\\Ui3\\新任务系统\\任务图标\\tianhuanglongqi_01.spr>天煌龙器<link>",1,"结束观看/Uworld1000_high7")
end

function Uworld1000_high7()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 130 ) then
		if ( GetSex() == 0 ) then 
			AddItem(0,5,1,1,1,20)         --增加一双鞋子
		elseif ( GetSex() == 1 ) then 
			AddItem(0,5,3,1,1,20)
		end
		AddItem(5,0,0,0,0,0)         --增加两个回城符
		AddItem(5,0,0,0,0,0)
		AddOwnExp(200)
		nt_setTask(1000,140) --环节7end
		Msg2Player("您获得了两张回城符。")
		Msg2Player("您获得了一双鞋子。")
		Msg2Player("接下来请您回去龙五处。")
		seteducationnpcpos()
	end
end

function Uworld1000_high5()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 90 ) then
		for i=1,3 do
			AddItem(1,0,0,2,0,0)                          --增加三瓶红药
		end
		AddOwnExp(200)
		nt_setTask(1000,100) --环节5end
		Msg2Player("您获得了三个红药水。")
		Msg2Player("接下来请您到村镇的铁匠处对话，")
		seteducationnpcpos()
	end
end

function Uworld1000_high6()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 110 ) then
		AddOwnExp(200)
		nt_setTask(1000,120) --环节6end
		Msg2Player("接下来请您到杂货铺找老板娘（老板）对话。")
		seteducationnpcpos()
	end
end

function Uworld1000_end1()
	local name = GetName()  
	local Uworld1065 = nt_getTask(1065)
	local Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 10 ) then
		Uworld1065 = Uworld1065-3
		nt_setTask(1065,Uworld1065)
	end
	nt_setTask(1000,30) --环节2start
	Talk(5,"Uworld1000_wuxing","武师：又是鲜肉？奶奶的最近来学本事的人倒不少。都紧赶慢赶去送死啊。",name.."<#>：国恨家仇，都要报的。","武师：瞧不出来，还挺有志气。好吧，看你有些疲惫，想是在村外遭了番野兽袭击，来来来，按v键，便可以打坐回气回血了。今后闯荡江湖，免不了凶险的时候，能回的一丝一毫气息，说不定就捡条命。",name.."<#>：哦，我懂了。","武师：阴阳相生，五行互克。我现在教给你一套五行拳法。")
end

function Uworld1000_wuxing()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 30 ) then
		AddOwnExp(350)	
		if ( GetSeries() == 0 ) then
			AddMagic(445)   --金
		elseif ( GetSeries() == 1 ) then
			AddMagic(446) 	--木
		elseif ( GetSeries() == 2 ) then	
			AddMagic(447) 	--水
		elseif ( GetSeries() == 3 ) then
			AddMagic(448) 	--火
		elseif ( GetSeries() == 4 ) then
			AddMagic(449) 	--土
		end
	end
		nt_setTask(1000,40) --环节2end
		seteducationnpcpos()
		Msg2Player("您学会了五行拳法.")
		Talk(2,"","武师：这套功夫只为修身，真正练起来太慢。你只要懂得用相应武功攻击克制的敌人，就能事半功倍。金克木，木克土，土克水，水克火，火克金。","武师：为武之道，勤加修炼为要。哎，口又渴了，喝酒煮肉，围炉烧火去。你练练就回去找龙头儿交代吧。")
end

function Uworld1000_good4()
	local name = GetName()  
	Talk(9,"Uworld1000_changewuxing",name.."<#>：哦，原来这样方便。","武师：你可以去尝试一下，再来找我。",name.."<#>：好了，我已经尝试过了。","武师：恩，如果你想进一步和自己的朋友结为兄弟的话，可以去南岳镇寺庙找一个和尚。",name.."<#>：恩，我记住了。","武师：江湖路远，朋友多一个，就多了分助力，你好自为之。","武师：好了，这里有一把带暗属性的宝剑，还有一条带五行属性的项链，我送给你。把它们都装备上，你会看到由于五行的缘故，你剑上的暗属性被激活了。",name.."<#>：果然。","武师：今后想激活装备，点开F4，看每个装备栏下显示的金色文字就知道要找什么属性的装备了。你回去吧。有不懂的打开F1锦囊查看，任务方面打开F11。")
end

function Uworld1000_changewuxing()
	local name = GetName()  
	Talk(2,"Uworld1000_high9","武师：对了，上回发给你的武功技能其实是无效的，为的不过看你这人的忍耐能力。现在传授给你真正的技能。","武师：大巧若拙，只要你勤加练习，靠这套武功说不定便能成为不世高手，成败一念间，好自为之。")
end

function Uworld1000_high9()
	Uworld1000 = nt_getTask(1000)
	local Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld1000 == 190 ) then
		if ( GetSex() == 0 ) then 
			if ( GetSeries() == 0 ) then--金
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,1,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 1 ) then--木
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,0,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 2 ) then--水	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,3,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 3 ) then--火
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 4 ) then--土
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --项链  
			end
		else 
			if ( GetSeries() == 0 ) then--金
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,1,60,2,2,0,0,0,0) --项链  		
			elseif ( GetSeries() == 1 ) then--木
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,0,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 2 ) then--水	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,3,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 3 ) then--火
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --项链  
			elseif ( GetSeries() == 4 ) then--土
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --剑    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --项链  
			end
		end
	end
	if (( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 )) and ( Uworld1067 <  10 ) then
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
	end
	AddOwnExp(800)
	nt_setTask(1000,200) 
	Msg2Player("武师告诉你一些交友方法，并说可以在F1锦囊中查看到。你可以回去找龙五了。")
	Msg2Player("您获得了一把宝剑和一条项链，可以用项链激活剑。")
	Msg2Player("您已经得到了真正的五行攻击技能。")
	seteducationnpcpos()
end

function Uworld1000_yinpiao()
	local name = GetName()  
	Talk(1,"Uworld1000_get","钱庄老板：我这里有流通全国的银票。银票是方便玩家在游戏内正常贸易交流而提供的一种虚拟物品。银票可通过一卡通向游戏充值获得，目前只在金山游戏内流通。一张30元的点卡可充成两张银票；一张15元的点卡可充成一张银票。玩家可在临安的钱庄兑换银票。每张银票可以兑换成7天游戏时间、1500点新游戏点数或 1500 金山币。点卡换成银票后，不可再换回点卡。银票之间不可以相互兑换。但银票可以兑换成铜钱，即一张银票能兑换成15枚铜钱，银票换成铜钱后，不可再换回银票。好了，去找城市里的铁匠吧。")
end

function Uworld1000_get()
	AddOwnExp(5000)
	nt_setTask(1000,380)	--环节19end
	Msg2Player("钱庄老板让你去找城市里的铁匠。")	
	seteducationnpcpos()
end


function Uworld1000_goon3()
	local name = GetName()  
	Talk(3,"Uworld1000_queding","武林盟传人：是有的，只要求你充过游戏点卡就可以领。",name.."<#>：是这样，那我明白了。","武林盟传人：呵呵，小友天资聪颖，接下来你去趟临安吧。找临安的钱庄老板，坐标是(180，191),他也会给你些指点。可以找城市里的车夫载你过去。")
end

function Uworld1000_queding()
	AddOwnExp(5000)
	nt_setTask(1000,360) --环节18end 
	Msg2Player("武林盟传人让你去找临安的钱庄老板。")	
	seteducationnpcpos()
end

function no()
end