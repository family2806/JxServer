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
	tbDailog.szTitleMsg = "<npc> TÊt c¶ mäi ng­êi gäi ta lµ Tèng TÈu . "
	G_TASK:OnMessage("Ngµy nhÉn ", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function aboutluckyzongzi()
	Talk(1,"","T« ba mÑ  may m¾n tèng tö lµ ta dïng ba n¨m míi lµm ra tíi mét míi tèng tö phÈm lo¹i , ¨n råi cã thÓ gia t¨ng 30 ®iÓm ®Ých may m¾n trÞ gi¸ . bÊt qu¸ tr­íc m¾t cßn cã nho nhá thiÕu sãt , chØ cã thÓ ë ¨n tèng tö ®Ých ®Þa ph­¬ng ph¸t huy t¸c dông , cã høng thó ®Ých b»ng h÷u cã thÓ tíi thö mét chót . ")
end


function listen()
	Talk(1,"talk2","T« ba mÑ  khuÊt nguyªn lµ chiÕn quèc së quèc : n­íc Së ®Ých ®¹i thÇn . h¾n gi¬ hiÒn thô cã thÓ , nh­ng gÆp ph¶i quý téc ph¶n ®èi , bÞ l­u ®µi nguyªn t­¬ng l­u vùc . h¾n ë l­u ®µi trung , viÕt xuèng  c¸ch tao  chê th¬ thiªn . sau së kinh bÞ ph¸ , khuÊt nguyªn t©m hÖ tæ quèc , ë th¸ng n¨m s¬ n¨m ngµy nµy viÕt xuèng tuyÖt bót  nghi ngê sa  sau , «m th¹ch ®Çu mÞch la giang bá m×nh . ")
end;

function talk2()
	Talk(1,"talk3","T« ba mÑ  khuÊt nguyªn sau khi chÕt , d©n chóng ai ®au dÞ th­êng , rèi rÝt vät tíi mÞch la bê s«ng ®i b»ng treo khuÊt nguyªn . mäi ng­êi lÊy ra v× khuÊt nguyªn chuÈn bÞ c¬m ®oµn chê thøc ¨n nÐm vµo giang trong , ®Ó cho c¸ long t«m gi¶i ¨n no , còng sÏ kh«ng ®i c¾n khuÊt nguyªn ®Ých th©n thÓ . bëi v× sî c¬m ®oµn lµ giao long së thùc , mäi ng­êi nghÜ ra dïng luyÖn l¸ c©y tói c¬m , bªn ngoµi d©y d­a th¶i ti , lµm thµnh tèng tö . ")
end;

function talk3()
	Talk(1,"","T« ba mÑ  sau nµy , ë hµng n¨m ®Ých th¸ng n¨m s¬ n¨m , th× cã long chu c¹nh ®é  ¨n tèng tö ®Ých phong tôc , lÊy nµy tíi kû niÖm khuÊt nguyªn ®¹i phu . ®©y chÝnh lµ tiÕt ®oan ngä ®Ých lai lÞch . ")
end

function lucky()
	if (GetExtPoint(6) >= 32768) then	
		Talk(1,"","T« ba mÑ  ng­¬i kh«ng thÓ nhËn lÊy may m¾n nhu th­íc ")
--		SetExtPoint(6,0)
		WriteLog(date("%H%M%S").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." , nhËn lÊy may m¾n nhu th­íc thÊt b¹i  tr¹ng th¸i dÞ th­êng . ")
	else
		Say("T« ba mÑ  ng­¬i mÊu chèt lÊy bao nhiªu c¸ may m¾n nhu th­íc ? ",3,"NhËn lÊy m­êi may m¾n nhu th­íc /lucky10","NhËn lÊy mét may m¾n nhu th­íc /lucky1","C¸i g× ®Òu kh«ng lµm /no")
	end
end

function lucky10()
	if (GetExtPoint(6) >= 10) then	
		for i=1,10 do
			AddEventItem(405)			
			PayExtPoint(6,1)
		end
		Msg2Player("Ng­¬i lÊy ®­îc m­êi may m¾n nhu th­íc ")
		WriteLog(date("%H%M%S").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." , nhËn lÊy 10 c¸ may m¾n nhu th­íc . ")
	else
		Talk(1,"","T« ba mÑ  ng­¬i kh«ng thÓ nhËn lÊy nhiÒu nh­ vËy may m¾n nhu th­íc ")
	end
end

function lucky1()
	if (GetExtPoint(6) > 0) then
		AddEventItem(405)
		PayExtPoint(6,1)
		Msg2Player("Ng­¬i lÊy ®­îc mét may m¾n nhu th­íc ")
		WriteLog(date("%H%M%S").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." , nhËn lÊy 1 c¸ may m¾n nhu th­íc . ")
	else
		Talk(1,"","T« ba mÑ  ng­¬i kh«ng thÓ nhËn lÊy may m¾n nhu th­íc ")
	end
end

function make()
	i=GetCash()
	if (i>=2000) then
	  Say("T« ba mÑ  kh¸ch quan , lµm mét tèng tö muèn 2000 l­îng b¹c , kh«ng biÕt ng­¬i muèn lµm g× tèng tö ? ",7,"Hång t¶o tèng tö /yes1","B¶n lËt tèng tö /yes2","ThÞt heo tèng tö /yes3","ThÞt bß tèng tö /yes4","ThËp cÈm tèng tö /yes5","May m¾n tèng tö /luckyzongzi","C¸i g× ®Òu kh«ng lµm /no")
	else
	  Talk(1,"","T« ba mÑ  kh¸ch quan , lµm mét tèng tö muèn 2000 l­îng b¹c , tiÒn cña ng­¬i gièng nh­ kh«ng ®ñ , cã ph¶i hay kh«ng quªn mang ë trªn ng­êi ®©y ")
	end
end;

function luckyzongzi()
	if ((GetItemCountEx(394)>=1) and (GetItemCountEx(395)>=1) and (GetItemCountEx(396)>=1) and (GetItemCountEx(405)>=1) and (GetItemCountEx(397)>=1) and (GetItemCountEx(398)>=1) and (GetItemCountEx(399)>=1)) then 
		Talk(1,"","T« ba mÑ  lµm xong , ng­¬i xem mét chót , b¶o ng­¬i hµi lßng . ")
	  	DelItemEx(394)
	  	DelItemEx(395)
	  	DelItemEx(396)
	  	DelItemEx(405)
	  	DelItemEx(397)
	  	DelItemEx(398)
	  	DelItemEx(399)
	  	AddItem(6,0,70,1,0,0,0)
	  	Msg2Player("Ng­¬i lÊy ®­îc may m¾n tèng tö ")
		WriteLog(date("%H%M%S").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." , luyÖn chÕ liÔu mét con may m¾n tèng tö . ")
		Pay(2000)
	else
	  	Talk(1,"","T« ba mÑ  lµm may m¾n tèng tö cÇn hång t¶o  b¶n lËt  ®¹o mÔ  thÞt heo  tèng l¸  thÞt bß c¸c mét phÇn cïng <color=red> mét may m¾n nhu th­íc <color> , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
	end
end;

function yes1()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","T« ba mÑ  lµm xong , ng­¬i xem mét chót , b¶o ng­¬i hµi lßng . ")
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(1,7,0,1,0,0,0)
	  Pay(2000)
	  Msg2Player("Ng­¬i lÊy ®­îc hång t¶o tèng tö ")
	else
	  Talk(1,"","T« ba mÑ  lµm hång t¶o tèng tö cÇn hång t¶o  ®¹o mÔ cïng tèng l¸ c¸c hai ph©n , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
	end
end;

function yes2()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","T« ba mÑ  lµm xong , ng­¬i xem mét chót , b¶o ng­¬i hµi lßng . ")
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(6,0,60,1,0,0,0)
	  Pay(2000)
	  Msg2Player("Ng­¬i lÊy ®­îc b¶n lËt tèng tö ")
	else
	  Talk(1,"","T« ba mÑ  lµm b¶n lËt tèng tö cÇn b¶n lËt  ®¹o mÔ cïng tèng l¸ c¸c hai ph©n , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
	end
end;

function yes3()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2)) then 
	  Talk(1,"","T« ba mÑ  lµm xong , ng­¬i xem mét chót , b¶o ng­¬i hµi lßng . ")
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
	  Msg2Player("Ng­¬i lÊy ®­îc thÞt heo tèng tö ")
	else
	  Talk(1,"","T« ba mÑ  lµm thÞt heo tèng tö cÇn b¶n lËt  thÞt heo  ®¹o mÔ cïng tèng l¸ c¸c hai ph©n , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
	end
end;


function yes4()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(399)>=2)) then 
	  Talk(1,"","T« ba mÑ  lµm xong , ng­¬i xem mét chót , b¶o ng­¬i hµi lßng . ")
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
	  Msg2Player("Ng­¬i lÊy ®­îc thÞt bß tèng tö ")
	else
	  Talk(1,"","T« ba mÑ  lµm thÞt bß tèng tö cÇn thÞt bß  hång t¶o  ®¹o mÔ cïng tèng l¸ c¸c hai ph©n , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
	end
end;


function yes5()
	Say("T« ba mÑ  kh«ng dèi g¹t kh¸ch quan nãi , lµm thËp cÈm tèng tö lµ tæ truyÒn xuèng bÝ truyÒn , ta còng kh«ng cã bao lín n¾m chÆc , lµm xong lµ ng­¬i vËn khÝ , lµm kh«ng tèt tao ®¹p tµi liÖu ng­¬i còng ®õng o¸n ta , cã ®­îc hay kh«ng ? ",2,"H¶o /yes6","Kh«ng tèt /no")
end;

function yes6()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2) and (GetItemCountEx(399)>=2)) then 
	  i=random(1,100)
	  if (i<=30) then	
	    Talk(1,"","T« ba mÑ  lµm xong , ng­¬i xem mét chót , b¶o ng­¬i hµi lßng . ")
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
	    Msg2Player("Ng­¬i lÊy ®­îc thËp cÈm tèng tö ")
	    Pay(2000)
	  else
	    Talk(1,"","T« ba mÑ  ng­îng ngïng , thËt lµm chuyÖn xÊu liÔu . ")
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
	  Talk(1,"","T« ba mÑ  lµm thËp cÈm tèng tö cÇn hång t¶o  b¶n lËt  ®¹o mÔ  thÞt heo  thÞt bß cïng tèng l¸ c¸c hai ph©n , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
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
	  Say("T« ba mÑ  ta tæ th­îng chÝnh lµ v× hoµng cung lµm cèng phÈm ngù tèng ®Ých , lµm ®­îc tèng tö ®Òu lµ nh©n gian tiªn vÞ , ch¼ng qua lµ tay nghÒ nµy ®Õn ta ®©y thay mÆt thÊt truyÒn ph¶i kh«ng sai biÖt l¾m , nÕu nh­ ng­¬i chÞu lêi cña , ta cã thÓ ®em trong tay ng­¬i thËp cÈm tèng tö ®iÒu chÕ thµnh trong truyÒn thuyÕt ®Ých cèng phÈm ngù tèng , chØ lÊy ng­¬i 1000 b¹c . kh«ng biÕt ng­¬i muèn gia c«ng c¸i g× tèng tö ®©y ? ",6,"MËt tiÔn thËp cÈm tèng tö /yes7","T¸m b¶o thËp cÈm tèng tö /yes8","Tr¨m qu¶ thËp cÈm tèng tö /yes9","Thñy tinh thËp cÈm tèng tö /yes10","KhuÊt nguyªn thËp cÈm tèng tö /yes11","C¸i g× ®Òu kh«ng lµm /no")
	else
	  Talk(1,"","T« ba mÑ  kh¸ch quan , gia c«ng mét tèng tö muèn 1000 l­îng b¹c , tiÒn cña ng­¬i gièng nh­ kh«ng ®ñ , cßn lµ lÇn sau trë l¹i ®i . ")
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
		Talk(1,"","Xin chê chèc l¸t . ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","T« ba mÑ  tæ truyÒn tay cña nghÖ qu¶ nhiªn kh«ng sai , thËt lµm cho ta lµm ®­îc mËt tiÔn thËp cÈm tèng tö liÔu ")
	    		DelCommonItem(6,1,63)
	    		AddItem(6,1,64,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("Ng­¬i lÊy ®­îc mËt tiÔn thËp cÈm tèng tö ")
	  	else
	    		Talk(1,"","T« ba mÑ  thÊt b¹i , tèt nh­ vËy ®Ých tèng tö vèn lµ kh«ng ph¶i lµ dÔ dµng lµm ®­îc , chØ cã thÓ tr¶ l¹i cho ng­¬i c¸i nµy thËp cÈm tèng tö liÔu . ")
	    		Pay(1000)
	    		Msg2Player("Ng­¬i lÊy ®­îc thËp cÈm tèng tö ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","T« ba mÑ  lµm mËt tiÔn thËp cÈm tèng tö cÇn mét phÇn thËp cÈm tèng tö cïng tïy ý mét phÇn tèng tö tµi liÖu , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
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
	  	Talk(1,"","Xin chê chèc l¸t . ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","T« ba mÑ  tæ truyÒn tay cña nghÖ qu¶ nhiªn kh«ng sai , thËt lµm cho ta lµm ®­îc t¸m b¶o thËp cÈm tèng tö liÔu ")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,65,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("Ng­¬i lÊy ®­îc t¸m b¶o thËp cÈm tèng tö ")
  	  	else
	    		Talk(1,"","T« ba mÑ  thÊt b¹i , tèt nh­ vËy ®Ých tèng tö vèn lµ kh«ng ph¶i lµ dÔ dµng lµm ®­îc , chØ cã thÓ tr¶ l¹i cho ng­¬i c¸i nµy thËp cÈm tèng tö liÔu . ")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("Ng­¬i lÊy ®­îc thËp cÈm tèng tö ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
  	  	end
	else
	  	Talk(1,"","T« ba mÑ  lµm t¸m b¶o thËp cÈm tèng tö cÇn mét phÇn mËt tiÔn thËp cÈm tèng tö cïng tïy ý mét phÇn tèng tö tµi liÖu , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
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
	  	Talk(1,"","Xin chê chèc l¸t . ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","T« ba mÑ  tæ truyÒn tay cña nghÖ qu¶ nhiªn kh«ng sai , thËt lµm cho ta lµm ®­îc tr¨m qu¶ thËp cÈm tèng tö liÔu ")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,66,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("Ng­¬i lÊy ®­îc tr¨m qu¶ thËp cÈm tèng tö ")
	  	else
	    		Talk(1,"","T« ba mÑ  thÊt b¹i , tèt nh­ vËy ®Ých tèng tö vèn lµ kh«ng ph¶i lµ dÔ dµng lµm ®­îc , chØ cã thÓ tr¶ l¹i cho ng­¬i c¸i nµy thËp cÈm tèng tö liÔu . ")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("Ng­¬i lÊy ®­îc thËp cÈm tèng tö ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","T« ba mÑ  lµm tr¨m qu¶ thËp cÈm tèng tö cÇn mét phÇn t¸m b¶o thËp cÈm tèng tö cïng tïy ý mét phÇn tèng tö tµi liÖu , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
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
	  	Talk(1,"","Xin chê chèc l¸t . ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","T« ba mÑ  tæ truyÒn tay cña nghÖ qu¶ nhiªn kh«ng sai , thËt lµm cho ta lµm ®­îc thñy tinh thËp cÈm tèng tö liÔu ")
	    		DelItemEx(398)
	    		DelItemEx(399)
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,67,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("Ng­¬i lÊy ®­îc thñy tinh thËp cÈm tèng tö ")
	  	else
	    		Talk(1,"","T« ba mÑ  thÊt b¹i , tèt nh­ vËy ®Ých tèng tö vèn lµ kh«ng ph¶i lµ dÔ dµng lµm ®­îc , chØ cã thÓ tr¶ l¹i cho ng­¬i c¸i nµy thËp cÈm tèng tö liÔu . ")
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("Ng­¬i lÊy ®­îc thËp cÈm tèng tö ")
	  	end
	else
	  	Talk(1,"","T« ba mÑ  lµm thñy tinh thËp cÈm tèng tö cÇn mét phÇn tr¨m qu¶ thËp cÈm tèng tö cïng tïy ý mét phÇn tèng tö tµi liÖu , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
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
		Talk(1,"","Xin chê chèc l¸t . ")
	   	DelItemEx(GetTaskTemp(51)) 
	  	i = random(1,100)
	  	if (i<=temp) then	
	   		Talk(1,"","T« ba mÑ  ®©y lµ trong truyÒn thuyÕt ®Ých khuÊt nguyªn thËp cÈm tèng tö nha , ta rèt côc thùc hiÖn tæ th­îng ®Ých ­íc m¬ ®em nã lµm ®­îc ")
		        DelCommonItem(6,1,67)
		        sel=AddItem(6,1,68,1,0,0,0)
		        time=GetItemGenTime(sel)
		        name=GetName()
	   	 	Pay(1000)
	   	 	if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("Ng­¬i lÊy ®­îc khuÊt nguyªn thËp cÈm tèng tö ")
	    		n = GetGlbValue(1)+1
	    		SetGlbValue(1,n)
				WriteLog(date("%H%M%S").." tr­¬ng môc "..GetAccount().." , vai trß "..GetName().." , luyÖn chÕ thµnh c«ng mét con khuÊt nguyªn tèng tö  h«m nay khuÊt nguyªn thËp cÈm tèng tö ®Ých c¸ ®Õm v× "..n.." chØ . ")
    			AddGlobalNews("T« ba mÑ  nãi cho mäi ng­êi mét tin tøc tèt , trong truyÒn thuyÕt ®Ých khuÊt nguyªn tèng tö ®· bÞ nhµ ch¬i lµm ®­îc , mäi ng­êi tiÕp tôc cè g¾ng a ")
		else
			Talk(1,"","T« ba mÑ  thÊt b¹i , tèt nh­ vËy ®Ých tèng tö vèn lµ kh«ng ph¶i lµ dÔ dµng lµm ®­îc , chØ cã thÓ tr¶ l¹i cho ng­¬i c¸i nµy thËp cÈm tèng tö liÔu . ")
			DelCommonItem(6,1,67)
			AddItem(6,1,63,1,0,0,0)
			Pay(1000)
			if(flag) then
	    			DelItemEx(404)
	    		end
			Msg2Player("Ng­¬i lÊy ®­îc thËp cÈm tèng tö ")
		end
	else
		Talk(1,"","T« ba mÑ  lµm khuÊt nguyªn thËp cÈm tèng tö cÇn mét phÇn thñy tinh thËp cÈm tèng tö cïng tïy ý mét phÇn tèng tö tµi liÖu , ng­¬i tµi liÖu gièng nh­ kh«ng ®ñ a ? ")
	end
end


function quyuan()
	Talk(1,"","T« ba mÑ  khuÊt nguyªn bÝ truyÒn lµ ta tæ th­îng l­u l¹i bé s¸ch , bªn trong ghi l¹i gia c«ng thËp cÈm tèng tö ®Ých kh«ng hai ph¸p m«n , ®¸ng tiÕc bÞ ta mÊt m¸c ë cöa thµnh bªn ngoµi liÔu , c¸c ng­¬i cã lÏ cã thÓ ®i t×m t×m nh×n , sÏ ph¶i cã thu ho¹ch ®Ých . ")
end;

function no()
end;
