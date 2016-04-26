function brew()
	Say("本店调制药酒远近闻名，客官想调制哪种药酒？", 6, "仙灵酒/god", "虎骨酒/tiger", "鹿茸酒/antler", "人参酒/panax", "我想知道调制药酒的方法!/aboutbrewing", "我要去多找药料/no");
end

function god()
	Say("仙灵酒需要有3个灵芝草，客官已经够药料了吗?",2, "够了！师傅快快证明家传经验吧!/godyes", "我需要去多找药料/no");
end

function tiger()
	Say("虎骨需要一个灵芝草和3个鹿茸，客官已经够药料了吗?",2, "够了！师傅快快证明家传经验吧!/tigeryes", "我需要去多找药料/no");
end

function antler()
	Say("鹿茸酒需要一个灵芝草和3个鹿茸.客官已经够药料了吗?",2, "够了！师傅快快证明家传经验吧!/antleryes", "我需要去多找药料/no");
end

function panax()
	Say("人参酒需要一个灵芝草和3个鹿茸. 客官已经够药料了吗?",2, "够了！师傅快快证明家传经验吧!/panaxyes", "我需要去多找药料/no");
end

function godyes()
	if(GetItemCountEx(943) >= 3) then
		local i = random(1,4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(943);			
			end
			AddEventItem(947);
			Say("上等灵芝草加上我的家传经验，该仙灵酒没有谁能制出来!",0);
			Msg2Player("Nh薾 頲 1 b譶h Ti猲 Linh t鰑");
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..", 人物"..GetName().."，酿制出了1瓶仙灵酒。");
		else
			DelItemEx(943);
			Say("有一个灵芝未够年份，配药会质量差。客官请努力找其他的吧，我在这等",0);
		end
	else
		Say("客官依然未够药料，请原谅我不能帮忙!",0);
	end
end

function tigeryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(944) >= 3) then
		local i = random(1, 5);
		if(i > 2) then
			for j=1, 3 do 
				DelItemEx(944);			
			end
			DelItemEx(943);	
			AddEventItem(948);
			Say("Linh 灵芝草和上等虎骨加上我的家传经验，该虎骨酒没有谁能制出来!",0);
			Msg2Player("获得一瓶虎骨酒");
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..", 人物"..GetName().."，酿制出了1瓶虎骨酒。");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("有一个灵芝未够年份，配药会质量差。客官请努力找其他的吧，我在这等",0);		
			else
				DelItemEx(944);
				Say("该虎骨未够年份，配药会质量差。客官请努力找其他的吧，我在这等",0);
			end		
		end					
	else
		Say("客官依然未够药料，请原谅我不能帮忙!",0);
	end
end

function antleryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(945) >= 3) then
		local i = random(1, 2);
		if(i == 1) then
			for j=1, 3 do 
				DelItemEx(945);			
			end
			DelItemEx(943);	
			AddEventItem(949);
			Say("灵芝草和上等鹿茸加上我的家传经验，该鹿茸酒没有谁能制出来!",0);
			Msg2Player("获得一瓶鹿茸酒");	
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..", 人物"..GetName().."，酿制出了1瓶鹿茸酒。");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("有一个灵芝未够年份，配药会质量差。客官请努力找其他的吧，我在这等",0);		
			else
				DelItemEx(945);
				Say("有一个鹿茸未够年份，配药会质量差。客官请努力找其他的吧，我在这等",0);
			end		
		end			
	else
		Say("客官依然未够药料，请原谅我不能帮忙!",0);
	end
end

function panaxyes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(946) >= 3) then
		local i = random(1, 4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(946);			
			end
			DelItemEx(943);	
			AddEventItem(950);
			Say("灵芝草和上等人参加上我的家传经验，该鹿茸酒没有谁能制出来!",0);
			Msg2Player("获得一瓶人参酒");
			WriteLog(date("%H%M%S")..": 账号"..GetAccount()..", 人物"..GetName().."，酿制出了1瓶人参酒。");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("有一个灵芝未够年份，配药会质量差。客官请努力找其他的吧，我在这等",0);		
			else
				DelItemEx(946);
				Say("有一个人参未够年份，配药会质量差。客官请努力找其他的吧，我在这等",0);
			end			
		end
	else
		Say("客官依然未够药料，请原谅我不能帮忙!",0);
	end
end

function aboutbrewing()
	Say("本店只存放有足够上等药料的药酒. <enter>仙灵酒需要有3个灵芝草.<enter>虎骨酒需要有1个灵芝草和3个虎骨.<enter>鹿茸酒需要有一个灵芝草和3个鹿茸.<enter>人参酒需要有1个灵芝草和3个人参.",0);
end