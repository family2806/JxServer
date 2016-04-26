
-- 任务系统邪教发奖处理函数
-- Edited by peres
-- 2005/01/13 PM 22:12

Include("\\script\\task\\newtask\\master\\clearskillpoint.lua");

-- 传入参数为：任务等级

function nt_givePlayerAward(myTaskLevel)

local i
local myAwardText1,myAwardText2 = "",""
local myGolden = {168,169,170,171,172,173,174,175,176}

	if (myTaskLevel==1) then -- 如果是 20 级任务
		

		
	elseif (myTaskLevel==2) then -- 如果是 30 级任务
		
		AddOwnExp(80000)
		AddGoldItem(0,177)  --增加蓝帽子

		myAwardText1 = "80000 点经验值"
		myAwardText2 = "一顶精制的帽子"
		
	elseif (myTaskLevel==3) then -- 如果是 40 级任务

		AddOwnExp(280000)	
		ClearMagicPoint()  --增加40级时洗点的功能
		
		myAwardText1 = "150000 点经验值"
		myAwardText2 = "一次免费洗技能点的机会"
				
	elseif (myTaskLevel==4) then -- 如果是 50 级任务
		
		local nRandom=random(1,2);
		
		AddOwnExp(350000)
		
		if nRandom==1 then
			AddItem(6,1,72,1,1,1,0)  -- 天山
		else
			AddItem(6,1,73,1,1,1,0)  -- 白果
		end;

		myAwardText1 = "350000 点经验值"
		myAwardText2 = "一个仙草露"
				
	elseif (myTaskLevel==5) then -- 如果是 60 级任务

		AddOwnExp(800000)		
		i = random(1,getn(myGolden))
		AddGoldItem(0,myGolden[i])
		
		myAwardText1 = "800000 点经验值"
		myAwardText2 = "一件绝世的宝器"
		
	end
	
	return myAwardText1,myAwardText2

end
