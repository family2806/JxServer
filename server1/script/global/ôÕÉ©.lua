Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


Shijin2mijian=50
Mijian2babao=30
Babao2baiguo=30
Baiguo2shuijing=30
Shuijing2quyuan=3


function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>大家都叫粽嫂. "
	G_TASK:OnMessage("天忍", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function aboutluckyzongzi()
	Talk(1,"","苏三娘：幸运粽子是我用了三年时间才做出来的一个新的粽子品种，吃过了可以增加30点的幸运值。不过目前还有小小缺陷，只能在吃粽子的地方发挥作用，有兴趣的朋友可以来试一下。")
end


function listen()
	Talk(1,"talk2","苏三娘：屈原是战国楚国的大臣。他举贤授能，但遇到贵族反对，被流放沅湘流域。他在流放中，写下《离骚》等诗篇。后楚京被破，屈原心系祖国，在五月初五这天写下绝笔《怀沙》后，抱石投汨罗江身死。")
end;

function talk2()
	Talk(1,"talk3","苏三娘：屈原死后，百姓哀痛异常，纷纷涌到汨罗江边去凭吊屈原。大家拿出为屈原准备的饭团等食物丢进江里，让鱼龙虾蟹吃饱了，就不会去咬屈原的身体了。因为怕饭团为蛟龙所食，人们想出用楝树叶包饭，外缠彩丝，做成粽子。")
end;

function talk3()
	Talk(1,"","苏三娘：以后，在每年的五月初五，就有了龙舟竞渡、吃粽子的风俗，以此来纪念屈原大夫。这就是端午节的来历。")
end

function lucky()
	if (GetExtPoint(6) >= 32768) then	
		Talk(1,"","苏三娘：你不能领取幸运糯米！")
--		SetExtPoint(6,0)
		WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."，领取幸运糯米失败！状态异常。")
	else
		Say("苏三娘：你要领取多少个幸运糯米？",3,"领取十个幸运糯米/lucky10","领取一个幸运糯米/lucky1","什么都不做/no")
	end
end

function lucky10()
	if (GetExtPoint(6) >= 10) then	
		for i=1,10 do
			AddEventItem(405)			
			PayExtPoint(6,1)
		end
		Msg2Player("你得到十个幸运糯米")
		WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."，领取了10个幸运糯米。")
	else
		Talk(1,"","苏三娘：你不能领取这么多幸运糯米！")
	end
end

function lucky1()
	if (GetExtPoint(6) > 0) then
		AddEventItem(405)
		PayExtPoint(6,1)
		Msg2Player("你得到一个幸运糯米")
		WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."，领取了1个幸运糯米。")
	else
		Talk(1,"","苏三娘：你不能领取幸运糯米！")
	end
end

function make()
	i=GetCash()
	if (i>=2000) then
	  Say("苏三娘：客官，做一个粽子要2000两银子，不知你要做什么粽子？",7,"红枣粽子/yes1","板栗粽子/yes2","猪肉粽子/yes3","牛肉粽子/yes4","什锦粽子/yes5","幸运粽子/luckyzongzi","什么都不做/no")
	else
	  Talk(1,"","苏三娘：客官，做一个粽子要2000两银子，你的钱好像不够，是不是忘带在身上呢")
	end
end;

function luckyzongzi()
	if ((GetItemCountEx(394)>=1) and (GetItemCountEx(395)>=1) and (GetItemCountEx(396)>=1) and (GetItemCountEx(405)>=1) and (GetItemCountEx(397)>=1) and (GetItemCountEx(398)>=1) and (GetItemCountEx(399)>=1)) then 
		Talk(1,"","苏三娘：做好了，你看看，保你满意。")
	  	DelItemEx(394)
	  	DelItemEx(395)
	  	DelItemEx(396)
	  	DelItemEx(405)
	  	DelItemEx(397)
	  	DelItemEx(398)
	  	DelItemEx(399)
	  	AddItem(6,0,70,1,0,0,0)
	  	Msg2Player("你得到幸运粽子")
		WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."，制作了一只幸运粽子。")
		Pay(2000)
	else
	  	Talk(1,"","苏三娘：做幸运粽子需要红枣、板栗、稻米、猪肉、粽叶、牛肉各一份和<color=red>一个幸运糯米<color>，你的材料好像不够啊？")
	end
end;

function yes1()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","苏三娘：做好了，你看看，保你满意。")
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(1,7,0,1,0,0,0)
	  Pay(2000)
	  Msg2Player("你得到红枣粽子")
	else
	  Talk(1,"","苏三娘：做红枣粽子需要红枣、稻米和粽叶各两份，你的材料好像不够啊？")
	end
end;

function yes2()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","苏三娘：做好了，你看看，保你满意。")
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(6,0,60,1,0,0,0)
	  Pay(2000)
	  Msg2Player("你得到板栗粽子")
	else
	  Talk(1,"","苏三娘：做板栗粽子需要板栗、稻米和粽叶各两份，你的材料好像不够啊？")
	end
end;

function yes3()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2)) then 
	  Talk(1,"","苏三娘：做好了，你看看，保你满意。")
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(398)
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(398)
	  AddItem(6,0,61,1,0,0,0)
	  Pay(2000)
	  Msg2Player("你得到猪肉粽子")
	else
	  Talk(1,"","苏三娘：做猪肉粽子需要板栗、猪肉、稻米和粽叶各两份，你的材料好像不够啊？")
	end
end;


function yes4()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(399)>=2)) then 
	  Talk(1,"","苏三娘：做好了，你看看，保你满意。")
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(399)
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(399)
	  AddItem(6,0,62,1,0,0,0)
	  Pay(2000)
	  Msg2Player("你得到牛肉粽子")
	else
	  Talk(1,"","苏三娘：做牛肉粽子需要牛肉、红枣、稻米和粽叶各两份,你的材料好像不够啊？")
	end
end;


function yes5()
	Say("苏三娘：不瞒客官说，做什锦粽子是祖传下来的秘方，我也没有多大把握，做好了是你运气，做不好糟蹋了材料你也别怨我，成不成？",2,"好/yes6","不好/no")
end;

function yes6()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2) and (GetItemCountEx(399)>=2)) then 
	  i=random(1,100)
	  if (i<=30) then	
	    Talk(1,"","苏三娘：做好了，你看看，保你满意。")
	    DelItemEx(394)
	    DelItemEx(394)
	    DelItemEx(395)
	    DelItemEx(395)
	    DelItemEx(396)
	    DelItemEx(396)
	    DelItemEx(397)
	    DelItemEx(397)
	    DelItemEx(398)
	    DelItemEx(398)
	    DelItemEx(399)
	    DelItemEx(399)
	    AddItem(6,1,63,1,0,0,0)
	    Msg2Player("你得到什锦粽子")
	    Pay(2000)
	  else
	    Talk(1,"","苏三娘：不好意思，真的做坏了。")
	    DelItemEx(394)
	    DelItemEx(394)
	    DelItemEx(395)
	    DelItemEx(395)
	    DelItemEx(396)
	    DelItemEx(396)
	    DelItemEx(397)
	    DelItemEx(397)
	    DelItemEx(398)
	    DelItemEx(398)
	    DelItemEx(399)
	    DelItemEx(399)
	    Pay(2000)
	  end
	else
	  Talk(1,"","苏三娘：做什锦粽子需要红枣、板栗、稻米、猪肉、牛肉和粽叶各两份，你的材料好像不够啊？")
	end
end;

function skill()
	i=GetCash()
	if (i>=1000) then
	  if (GetItemCountEx(394) >= 1) then
	  		SetTaskTemp(51,394)
	  elseif (GetItemCountEx(395) >= 1) then
	  		SetTaskTemp(51,395)
	  elseif (GetItemCountEx(396) >= 1) then
	  		SetTaskTemp(51,396)
	  elseif (GetItemCountEx(397) >= 1) then
	  		SetTaskTemp(51,397)
	  elseif (GetItemCountEx(398) >= 1) then
	  		SetTaskTemp(51,398)
	  elseif (GetItemCountEx(399) >= 1) then
	  		SetTaskTemp(51,399)
	  end
	  Say("苏三娘：我祖上就是为皇宫做贡品御粽的，做出来的粽子都是人间仙味，只是这手艺到我这代失传得差不多了，如果你肯的话，我可以把你手中的什锦粽子调制成传说中的贡品御粽，只收你1000银子。不知你要加工什么粽子呢？",6,"蜜饯什锦粽子/yes7","八宝什锦粽子/yes8","百果什锦粽子/yes9","水晶什锦粽子/yes10","屈原什锦粽子/yes11","什么都不做/no")
	else
	  Talk(1,"","苏三娘：客官，加工一个粽子要1000两银子，你的钱好像不够，还是下次再来吧。")
	end
end;

function yes7()
	flag=nil
	local temp=Shijin2mijian
	if ((HaveCommonItem(6,1,63)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Shijin2mijian+10
		end
		Talk(1,"","请稍等片刻。")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","苏三娘：祖传的手艺果然没错，真让我做出来蜜饯什锦粽子了！")
	    		DelCommonItem(6,1,63)
	    		AddItem(6,1,64,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("你得到蜜饯什锦粽子")
	  	else
	    		Talk(1,"","苏三娘：失败了，这么好的粽子本来就不是容易做出来的，只能还给你这个什锦粽子了。")
	    		Pay(1000)
	    		Msg2Player("你得到什锦粽子")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","苏三娘：做蜜饯什锦粽子需要一份什锦粽子和任意一份粽子材料，你的材料好像不够啊？")
	end
end;

function yes8()
	flag=nil
	local temp=Mijian2babao
	if ((HaveCommonItem(6,1,64)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Mijian2babao+20
		end
	  	Talk(1,"","请稍等片刻。")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","苏三娘：祖传的手艺果然没错，真让我做出来八宝什锦粽子了！")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,65,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("你得到八宝什锦粽子")
  	  	else
	    		Talk(1,"","苏三娘：失败了，这么好的粽子本来就不是容易做出来的，只能还给你这个什锦粽子了。")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("你得到什锦粽子")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
  	  	end
	else
	  	Talk(1,"","苏三娘：做八宝什锦粽子需要一份蜜饯什锦粽子和任意一份粽子材料，你的材料好像不够啊？")
	end
end;


function yes9()
	flag=nil
	local temp=Babao2baiguo
	if ((HaveCommonItem(6,1,65)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Babao2baiguo+10
		end
	  	Talk(1,"","请稍等片刻。")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","苏三娘：祖传的手艺果然没错，真让我做出来百果什锦粽子了！")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,66,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("你得到百果什锦粽子")
	  	else
	    		Talk(1,"","苏三娘：失败了，这么好的粽子本来就不是容易做出来的，只能还给你这个什锦粽子了。")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("你得到什锦粽子")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","苏三娘：做百果什锦粽子需要一份八宝什锦粽子和任意一份粽子材料，你的材料好像不够啊？")
	end
end;

function yes10()
	flag=nil
	local temp=Baiguo2shuijing
	if ((HaveCommonItem(6,1,66)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Baiguo2shuijing+5
		end
	  	Talk(1,"","请稍等片刻。")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","苏三娘：祖传的手艺果然没错，真让我做出来水晶什锦粽子了！")
	    		DelItemEx(398)
	    		DelItemEx(399)
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,67,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("你得到水晶什锦粽子")
	  	else
	    		Talk(1,"","苏三娘：失败了，这么好的粽子本来就不是容易做出来的，只能还给你这个什锦粽子了。")
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("你得到什锦粽子")
	  	end
	else
	  	Talk(1,"","苏三娘：做水晶什锦粽子需要一份百果什锦粽子和任意一份粽子材料，你的材料好像不够啊？")
	end
end;



function yes11()
	flag=nil
	local temp=Shuijing2quyuan
	if ((HaveCommonItem(6,1,67)>0) and (GetTaskTemp(51) > 0)) then 
		if (GetItemCountEx(404)>0) then
			flag = 1
			temp = Shuijing2quyuan + 3
		end
		Talk(1,"","请稍等片刻。")
	   	DelItemEx(GetTaskTemp(51)) 
	  	i = random(1,100)
	  	if (i<=temp) then	
	   		Talk(1,"","苏三娘：这是传说中的屈原什锦粽子呀，我终于实现了祖上的梦想把它做出来了！")
		        DelCommonItem(6,1,67)
		        sel=AddItem(6,1,68,1,0,0,0)
		        time=GetItemGenTime(sel)
		        name=GetName()
	   	 	Pay(1000)
	   	 	if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("你得到屈原什锦粽子")
	    		n = GetGlbValue(1)+1
	    		SetGlbValue(1,n)
				WriteLog(date("%H%M%S").."：账号"..GetAccount().."，角色"..GetName().."，制作成功一只屈原粽子！今日屈原什锦粽子的个数为"..n.."只。")
    			AddGlobalNews("苏三娘：告诉大家一个好消息，传说中的屈原粽子已经被玩家做出来了，大家继续努力啊！")
		else
			Talk(1,"","苏三娘：失败了，这么好的粽子本来就不是容易做出来的，只能还给你这个什锦粽子了。")
			DelCommonItem(6,1,67)
			AddItem(6,1,63,1,0,0,0)
			Pay(1000)
			if(flag) then
	    			DelItemEx(404)
	    		end
			Msg2Player("你得到什锦粽子")
		end
	else
		Talk(1,"","苏三娘：做屈原什锦粽子需要一份水晶什锦粽子和任意一份粽子材料，你的材料好像不够啊？")
	end
end


function quyuan()
	Talk(1,"","苏三娘：屈原秘方是我祖上留下来的书籍，里面记载了加工什锦粽子的不二法门，可惜被我失落在城门外了，你们或许可以去找找看，应该会有收获的。")
end;

function no()
end;
