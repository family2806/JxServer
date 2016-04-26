
tbAwardList = {}

--you can defind award but you need to consider Bag space

-- click npc get NewYearGift	
tbAwardList["Gift_npc"] = {{szName="新年礼物",tbProp={6,1,3086,1,0,0},nExpiredTime=20120201,}} 

-- right click item named NewYearGift
--调整使用新年礼物奖励- Modified By DinhHQ - 20120104
tbAwardList["Gift_Item"] = {
	{szName="烟花",tbProp={6,1,3087,1,0,0},nExpiredTime=20120201,},
	{nExp = 500000},
	} 

-- right click item named NewYearFireworks
tbAwardList["Fireworks"] = {	
	{nExp = 1000000},
	}