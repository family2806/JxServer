function givemedicine()
	Say("哈哈哈！真不枉我教你！让我看看你请我吃什么酒!",5, "献仙灵酒/givegod", "献虎骨酒/givetiger", "献鹿茸酒/giveantler", "献人参酒/givepanax", "师傅，味道怎么样？/no");
end

function givegod()
	if(GetItemCountEx(947) >= 1) then
		local i = random(1,3)
		if(i > 1) then
			DelItemEx(947);	
			AddItem(6,1,73,1,0,0);
			Say("好酒！好酒！这个百果露送给你，谢谢你送给我好酒！哈哈哈!",0);
			Msg2Player("获得一个百果露");
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..",人物"..GetName().."，于教师节活动得到1个百果露。");				
		else
			DelItemEx(947);
			Say("这瓶酒好像还不够久，或许我需要带回去再放一年才能发挥它的药性",0);
		end
	else
		Say("仙灵酒去哪了？仙灵酒去哪了？不要告诉我你把它喝完了！", 0);
	end
end

function givetiger()
	if(GetItemCountEx(948) >= 1) then
		local i = random(1,12)
		if(i > 7) then
			DelItemEx(948);	
			AddItem(6,1,72,1,0,0);
			Say("好酒！好酒！仙山宝露送给你！谢谢你送我好酒！哈哈哈!",0);
			Msg2Player("您获得一个仙山宝露");
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..", 人物"..GetName().."，于教师节活动得到1个天山玉露。");			
		else
			DelItemEx(948);
			Say("这瓶酒好像还不够久，或许我需要带回去再放一年才能发挥它的药性",0);
		end	
	else
		Say("虎骨酒去哪了？虎骨酒去哪了？不要告诉我你把它喝完了", 0);
	end
end

function giveantler()
	if(GetItemCountEx(949) >= 1) then
		local i = random(1,4)
		if(i > 1) then
			DelItemEx(949);	
			AddItem(6,1,125,1,0,0);
			Say("好酒！好酒！桂花酒送给你！谢谢你送我好酒！哈哈哈!",0);
			Msg2Player("获得一瓶桂花酒");
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..",人物"..GetName().."，于教师节活动得到1瓶桂花酒。");			
		else
			DelItemEx(949);
			Say("这瓶酒好像还不够久，或许我需要带回去再放一年才能发挥它的药性",0);
		end		
	else
		Say("鹿茸酒去哪了？鹿茸酒去哪了？不要告诉我你把它喝完了", 0);
	end
end

function givepanax()
	if(GetItemCountEx(950) >= 1) then
		local i = random(1,5)
		if(i > 1) then
			DelItemEx(950);	
			AddItem(6,1,71,1,0,0);
			Say("好酒！好酒！仙草露送给你！谢谢你送我好酒！哈哈哈!",0);
			Msg2Player("获得一个仙草露");
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..", 人物"..GetName().."，于教师节活动得到1瓶仙草露。");			
		else
			DelItemEx(950);
			Say("这瓶酒好像还不够久，或许我需要带回去再放一年才能发挥它的药性",0);
		end	
	else
		Say("人参酒去哪了？人参酒去哪了？不要告诉我你把它喝完了", 0);
	end
end
