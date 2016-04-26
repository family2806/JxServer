Include("\\script\\activitysys\\config\\22\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--杜康酒兑换奖励
function pActivity:AddDukangjiuAward(TSK_EXP_A,TSK_DATE_A,nCount)
	--检查背包是否至少有一个1*1的空位
	if(CalcFreeItemCellCount() < 1) then
		Say("装备不足空位，最少需要1*1空位", 0);
		return
	end
	--先从背包中扣除杜康酒
	if (ConsumeItem(3, nCount, 6,1,2572,-1) ~= 1) then
		return
	end
	
	--计算应该加的经验
	local nBigRateExp = 500000
	local nSmallRateExp = 1000000
	local nDailyUpExp = 20000000 
	local nTaskDailyCount = self:GetTaskA(TSK_EXP_A,TSK_DATE_A)
	local nTemp = nDailyUpExp - nTaskDailyCount
	if (nTemp < nBigRateExp) then
		nBigRateExp = nTemp
	end
	if (nTemp < nSmallRateExp) then
		nSmallRateExp = nTemp
	end
	--给奖励
	local tbAward = 
	{
		{
			[1] = {nExp = nBigRateExp},
			[2] = {szName="西湖龙井茶", tbProp={6,1,2573,1,0,0},nCount = 3,nExpiredTime=20101213},
			[3] = 
			{
				pFun = function (tbItem, nItemCount, szLogTitle)
					%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, %nBigRateExp * nItemCount)
				end
			},
			nRate = 80,
		},
		{
			[1] = {nExp = nSmallRateExp},
			[2] = {szName="西湖龙井茶", tbProp={6,1,2573,1,0,0},nCount = 6,nExpiredTime=20101213},
			
			[3] = 
			{
				pFun = function (tbItem, nItemCount, szLogTitle)
					%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, %nSmallRateExp * nItemCount)
				end
			},
			nRate = 20,
		}
	}
	tbAwardTemplet:GiveAwardByRate(tbAward, "奖励换取杜康酒")
	Say("好酒！好酒！不是那么容易有这么孝道的弟子。弟子，我有一些西湖龙井茶送与你")
end

--打开丝绸香包得到奖励
function pActivity:AddSichouxiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 2000000
	local nRateExp2 = 2500000
	local nRateExp3 = 3000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if(nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if(nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	local tbAward = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 70,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 20,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
	}
	tbAwardTemplet:GiveAwardByRate(tbAward, "奖励换取丝绸香包")
end

function pActivity:CheckFreeRoom(nWidth, nHeight, nCount, szMsg)
	if(CountFreeRoomByWH(nWidth,nHeight,1) >= nCount) then	
		return 1
	else
		szMsg = format("装备不足，最少需要装备剩余%d %d*%d 空位", nCount, nWidth, nHeight)
		Say(szMsg, 0)
	end	
end

--打开五彩香包得到奖励
function pActivity:AddWucaixiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 5000000
	local nRateExp2 = 6000000
	local nRateExp3 = 8000000
	local nRateExp4 = 10000000
	local nRateExp5 = 20000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if (nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if (nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	if (nTemp < nRateExp4) then
		nRateExp4 = nTemp
	end
	if (nTemp < nRateExp5) then
		nRateExp5 = nTemp
	end
	local tbAwardEXP = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 67,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 20,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
		{
			[1] = {nExp = nRateExp4},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp4 / 10000)
				end
			},
			nRate = 2,
		},
		{
			[1] = {nExp = nRateExp5},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp5 / 10000)
				end
			},
			nRate = 1,
		},
	}
	local tbAward = 
	{
		{szName="玄猿智慧珠链", tbProp={0,1595}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧僧帽", tbProp={0,1596}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧上戒", tbProp={0,1597}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧护腕", tbProp={0,1598}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧腰带", tbProp={0,1599}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧袈裟", tbProp={0,1600}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧缠手", tbProp={0,1601}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧僧鞋", tbProp={0,1602}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧腰坠", tbProp={0,1603}, nQuality=1, nRate=0.002},	
		{szName="玄猿智慧下戒", tbProp={0,1604}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满佛珠", tbProp={0,1605}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满僧帽", tbProp={0,1606}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满上戒", tbProp={0,1607}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满护腕", tbProp={0,1608}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满腰带", tbProp={0,1609}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满袈裟", tbProp={0,1610}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满僧棍", tbProp={0,1611}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满僧鞋", tbProp={0,1612}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满腰坠", tbProp={0,1613}, nQuality=1, nRate=0.002},	
		{szName="玄猿圆满下戒", tbProp={0,1614}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心项链", tbProp={0,1615}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心僧帽", tbProp={0,1616}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心上戒", tbProp={0,1617}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心护腕", tbProp={0,1618}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心腰带", tbProp={0,1619}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心袈裟", tbProp={0,1620}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心戒刀", tbProp={0,1621}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心僧鞋", tbProp={0,1622}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心腰坠", tbProp={0,1623}, nQuality=1, nRate=0.002},	
		{szName="玄猿佛心下戒", tbProp={0,1624}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天项链", tbProp={0,1625}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天盔", tbProp={0,1626}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天上戒", tbProp={0,1627}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天束腰", tbProp={0,1628}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天腰带", tbProp={0,1629}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天铠", tbProp={0,1630}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天锤", tbProp={0,1631}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天靴", tbProp={0,1632}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天佩", tbProp={0,1633}, nQuality=1, nRate=0.002},	
		{szName="玄猿冲天下戒", tbProp={0,1634}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云项链", tbProp={0,1635}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云盔", tbProp={0,1636}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云上戒", tbProp={0,1637}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云束腰", tbProp={0,1638}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云腰带", tbProp={0,1639}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云铠", tbProp={0,1640}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云枪", tbProp={0,1641}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云靴", tbProp={0,1642}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云腰坠", tbProp={0,1643}, nQuality=1, nRate=0.002},	
		{szName="玄猿飞云下戒", tbProp={0,1644}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄项链", tbProp={0,1645}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄盔", tbProp={0,1646}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄上戒", tbProp={0,1647}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄束腰", tbProp={0,1648}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄腰带", tbProp={0,1649}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄铠", tbProp={0,1650}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄宝刀", tbProp={0,1651}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄靴", tbProp={0,1652}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄腰坠", tbProp={0,1653}, nQuality=1, nRate=0.002},	
		{szName="玄猿英雄下戒", tbProp={0,1654}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音珠链", tbProp={0,1655}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音发带", tbProp={0,1656}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音上戒", tbProp={0,1657}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音护腕", tbProp={0,1658}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音束腰", tbProp={0,1659}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音纱衣", tbProp={0,1660}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音剑", tbProp={0,1661}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音鞋", tbProp={0,1662}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音香囊", tbProp={0,1663}, nQuality=1, nRate=0.002},	
		{szName="玄猿静音下戒", tbProp={0,1664}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰珠链", tbProp={0,1665}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰发带", tbProp={0,1666}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰上戒", tbProp={0,1667}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰护腕", tbProp={0,1668}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰束腰", tbProp={0,1669}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰衫", tbProp={0,1670}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰缠手", tbProp={0,1671}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰鞋", tbProp={0,1672}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰香囊", tbProp={0,1673}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒冰下戒", tbProp={0,1674}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花珠链", tbProp={0,1675}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花簪", tbProp={0,1676}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花上戒", tbProp={0,1677}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花袖", tbProp={0,1678}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花束腰", tbProp={0,1679}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花衫", tbProp={0,1680}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花刀", tbProp={0,1681}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花靴", tbProp={0,1682}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花香囊", tbProp={0,1683}, nQuality=1, nRate=0.002},	
		{szName="玄猿月花下戒", tbProp={0,1684}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华珠链", tbProp={0,1685}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华簪", tbProp={0,1686}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华上戒", tbProp={0,1687}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华袖", tbProp={0,1688}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华腰带", tbProp={0,1689}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华衫", tbProp={0,1690}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华鸳鸯刀", tbProp={0,1691}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华靴", tbProp={0,1692}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华香囊", tbProp={0,1693}, nQuality=1, nRate=0.002},	
		{szName="玄猿繁华下戒", tbProp={0,1694}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠项链", tbProp={0,1695}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠发带", tbProp={0,1696}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠上戒", tbProp={0,1697}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠护腕", tbProp={0,1698}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠腰带", tbProp={0,1699}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠秘装", tbProp={0,1700}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠缠手", tbProp={0,1701}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠靴", tbProp={0,1702}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠腰坠", tbProp={0,1703}, nQuality=1, nRate=0.002},	
		{szName="玄猿断肠下戒", tbProp={0,1704}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞项链", tbProp={0,1705}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞发带", tbProp={0,1706}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞上戒", tbProp={0,1707}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞护腕", tbProp={0,1708}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞腰带", tbProp={0,1709}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞秘装", tbProp={0,1710}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞刀", tbProp={0,1711}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞靴", tbProp={0,1712}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞腰坠", tbProp={0,1713}, nQuality=1, nRate=0.002},	
		{szName="玄猿血煞下戒", tbProp={0,1714}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心项链", tbProp={0,1715}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心冠", tbProp={0,1716}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心上戒", tbProp={0,1717}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心护腕", tbProp={0,1718}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心缠腰", tbProp={0,1719}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心甲衣", tbProp={0,1720}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心飞刀", tbProp={0,1721}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心履", tbProp={0,1722}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心锤", tbProp={0,1723}, nQuality=1, nRate=0.002},	
		{szName="玄猿冷心下戒", tbProp={0,1724}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情项链", tbProp={0,1725}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情冠", tbProp={0,1726}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情上戒", tbProp={0,1727}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情护腕", tbProp={0,1728}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情束腰", tbProp={0,1729}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情甲", tbProp={0,1730}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情袖", tbProp={0,1731}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情履", tbProp={0,1732}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情腰坠", tbProp={0,1733}, nQuality=1, nRate=0.002},	
		{szName="玄猿无情下戒", tbProp={0,1734}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光链", tbProp={0,1735}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光发冠", tbProp={0,1736}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光上戒", tbProp={0,1737}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光护腕", tbProp={0,1738}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光束腰", tbProp={0,1739}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光甲衣", tbProp={0,1740}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光萧", tbProp={0,1741}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光履", tbProp={0,1742}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光锤", tbProp={0,1743}, nQuality=1, nRate=0.002},	
		{szName="玄猿寒光下戒", tbProp={0,1744}, nQuality=1, nRate=0.002},	
		{szName="玄猿阳刚项链", tbProp={0,1745}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚头环", tbProp={0,1746}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚上戒", tbProp={0,1747}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚护腕", tbProp={0,1748}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚束腰", tbProp={0,1749}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚盖衣", tbProp={0,1750}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚缠手", tbProp={0,1751}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚靴", tbProp={0,1752}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚腰坠", tbProp={0,1753}, nQuality=1, nRate=0.0025},	
		{szName="玄猿阳刚下戒", tbProp={0,1754}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙项链", tbProp={0,1755}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙头环", tbProp={0,1756}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙上戒", tbProp={0,1757}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙护腕", tbProp={0,1758}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙束腰", tbProp={0,1759}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙盖衣", tbProp={0,1760}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙杖", tbProp={0,1761}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙靴", tbProp={0,1762}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙腰坠", tbProp={0,1763}, nQuality=1, nRate=0.0025},	
		{szName="玄猿战龙下戒", tbProp={0,1764}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂圈", tbProp={0,1765}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂盔", tbProp={0,1766}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂上戒", tbProp={0,1767}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂护腕", tbProp={0,1768}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂腰带", tbProp={0,1769}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂甲衣", tbProp={0,1770}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂枪", tbProp={0,1771}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂靴", tbProp={0,1772}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂佩", tbProp={0,1773}, nQuality=1, nRate=0.0025},	
		{szName="玄猿落魂下戒", tbProp={0,1774}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情项链", tbProp={0,1775}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情冠冕", tbProp={0,1776}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情上戒", tbProp={0,1777}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情护腕", tbProp={0,1778}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情腰带", tbProp={0,1779}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情甲衣", tbProp={0,1780}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情刀", tbProp={0,1781}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情靴", tbProp={0,1782}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情佩", tbProp={0,1783}, nQuality=1, nRate=0.0025},	
		{szName="玄猿酌情下戒", tbProp={0,1784}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰符", tbProp={0,1785}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰冠", tbProp={0,1786}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰上戒", tbProp={0,1787}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰袖", tbProp={0,1788}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰发带", tbProp={0,1789}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰道袍", tbProp={0,1790}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰剑", tbProp={0,1791}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰履", tbProp={0,1792}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰玉佩", tbProp={0,1793}, nQuality=1, nRate=0.0025},	
		{szName="玄猿三丰下戒", tbProp={0,1794}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心符", tbProp={0,1795}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心冠", tbProp={0,1796}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心上戒", tbProp={0,1797}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心袖", tbProp={0,1798}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心发带", tbProp={0,1799}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心道袍", tbProp={0,1800}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心剑", tbProp={0,1801}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心履", tbProp={0,1802}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心玉佩", tbProp={0,1803}, nQuality=1, nRate=0.0025},	
		{szName="玄猿修心下戒", tbProp={0,1804}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云项链", tbProp={0,1805}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云道冠", tbProp={0,1806}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云上戒", tbProp={0,1807}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云护腕", tbProp={0,1808}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云腰带", tbProp={0,1809}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云道袍", tbProp={0,1810}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云戒指", tbProp={0,1811}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云靴子", tbProp={0,1812}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云佩", tbProp={0,1813}, nQuality=1, nRate=0.0025},	
		{szName="玄猿穿云下戒", tbProp={0,1814}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰符", tbProp={0,1815}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰道冠", tbProp={0,1816}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰上戒", tbProp={0,1817}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰手", tbProp={0,1818}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰腰带", tbProp={0,1819}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰道袍", tbProp={0,1820}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰长剑", tbProp={0,1821}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰靴", tbProp={0,1822}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰佩", tbProp={0,1823}, nQuality=1, nRate=0.0025},	
		{szName="玄猿破冰下戒", tbProp={0,1824}, nQuality=1, nRate=0.0025},	
		{szName="混元灵露", tbProp={6,1,2312,1,0,0}, nCount=1, nRate=4},	
		{szName="玄天锦囊", tbProp={6,1,2355,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="龙血丸", tbProp={6,1,2117,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="海龙朱", tbProp={6,1,2115,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="杀手锏礼包", tbProp={6,1,2339,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="山河社稷地图 (1000块)", tbProp={6,1,2514,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="漠北传送令", tbProp={6,1,1448,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="玉罐", tbProp={6,1,2311,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="百年珍露", tbProp={6,1,2266,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="特制白驹丸", tbProp={6,1,1157,1,0,0}, nCount=1, nRate=4},	
		{szName="天精白驹丸", tbProp={6,1,2183,1,0,0}, nCount=1, nRate=2},	
		{szName="千年珍露", tbProp={6,1,2267,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="万年珍露", tbProp={6,1,2268,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="大力丸礼包", tbProp={6,1,2517,1,0,0}, nCount=1, nRate=5},	
		{szName="飞速丸礼包", tbProp={6,1,2520,1,0,0}, nCount=1, nRate=5},	
		{szName="白骨令", tbProp={6,1,2255,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="特制仙草露", tbProp={6,1,1181,1,0,0}, nCount=1, nRate=5},	
		{szName="富贵锦盒", tbProp={6,1,2402,1,0,0}, nCount=1, nRate=14.6, nExpiredTime=20101220},	
		{szName="八珍福月蜡烛", tbProp={6,1,1817,1,0,0}, nCount=1, nRate=10},	
		{szName="银两", nJxb =1000000, nRate=10},	
		{szName="银两", nJxb =2000000, nRate=2},	
		{szName="银两", nJxb =5000000, nRate=1},	
		{szName="银两", nJxb =10000000, nRate=0.5},	
		{szName="一纪乾坤符", tbProp={6,1,2126,1,0,0}, nCount=1, nRate=0.2, nExpiredTime=43200},	
		{szName="呈祥红包", tbProp={6,1,2104,1,0,0}, nCount=1, nRate=0.2},	
		{szName="回天再造锦囊", tbProp={6,1,1781,1,0,0}, nCount=1, nRate=3, tbParam={60}},	

	}
	tbAwardTemplet:GiveAwardByList(tbAward, "五色香包奖励")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "五色香包EXP奖励")
end

--打开中药香包得到奖励
function pActivity:AddZhongyaoxiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 25000000
	local nRateExp2 = 30000000
	local nRateExp3 = 40000000
	local nRateExp4 = 50000000
	local nRateExp5 = 100000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if (nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if (nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	if (nTemp < nRateExp4) then
		nRateExp4 = nTemp
	end
	if (nTemp < nRateExp5) then
		nRateExp5 = nTemp
	end
	local tbAwardEXP = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 60,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 27,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
		{
			[1] = {nExp = nRateExp4},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp4 / 10000)
				end
			},
			nRate = 2,
		},
		{
			[1] = {nExp = nRateExp5},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp5 / 10000)
				end
			},
			nRate = 1,
		},
	}
	local tbAward = 
	{
		{szName="玄猿令", tbProp={6,1,2351,1,0,0}, nRate=1, nCount=1},	
		{szName="混元灵露", tbProp={6,1,2312,1,0,0}, nRate=4, nCount=5},	
		{szName="天龙令", tbProp={6,1,2256,1,0,0}, nRate=5, nCount=5, nExpiredTime=20101220},	
		{szName="特制仙草露", tbProp={6,1,1181,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="富贵锦盒", tbProp={6,1,2402,1,0,0}, nRate=17.7, nCount=5, nExpiredTime=20101220},	
		{szName="万年珍露", tbProp={6,1,2268,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="万年五彩华", tbProp={6,1,2265,1,0,0}, nRate=1, nCount=1},	
		{szName="千年七星草", tbProp={6,1,1675,1,0,0}, nRate=1, nCount=1},	
		{szName="特制白驹丸", tbProp={6,1,1157,1,0,0}, nRate=14, nCount=1},	
		{szName="天精白驹丸", tbProp={6,1,2183,1,0,0}, nRate=6, nCount=1},	
		{szName="银两", nJxb =10000000, nRate=5},	
		{szName="银两", nJxb =20000000, nRate=2},	
		{szName="银两", nJxb =50000000, nRate=1},	
		{szName="银两", nJxb =100000000, nRate=0.2},	
		{szName="一纪乾坤符", tbProp={6,1,2126,1,0,0}, nRate=2, nCount=1, nExpiredTime=43200},	
		{szName="乾坤双绝佩", tbProp={6,1,2219,1,0,0}, nRate=0.1, nCount=1, nExpiredTime=86400},	
		{szName="大力丸礼包", tbProp={6,1,2517,1,0,0}, nRate=5, nCount=5},	
		{szName="飞速丸礼包", tbProp={6,1,2520,1,0,0}, nRate=5, nCount=5},	
		{szName="呈祥红包", tbProp={6,1,2104,1,0,0}, nRate=3, nCount=1},	
		{szName="安康红包", tbProp={6,1,2105,1,0,0}, nRate=1, nCount=1},	
		{szName="回天再造锦囊", tbProp={6,1,1781,1,0,0}, nRate=6, nCount=5, tbParam={60}},	
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "中药香包奖励")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "中药香包EXP奖励")
end

function pActivity:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = self:GetTask(TSK_DATE_A)
	
	if nCurDate ~= nRecordDate then
		self:SetTask(TSK_DATE_A, nCurDate)
		self:SetTask(TSK_EXP_A, 0)
	end
end

function pActivity:CheckTaskA(TSK_EXP_A, TSK_DATE_A, nTargetValue, szFailMsg, szOption)

	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:CheckTask(TSK_EXP_A, nTargetValue, szFailMsg, szOption)
end

function pActivity:AddTaskA(TSK_EXP_A, TSK_DATE_A, nAddValue)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:AddTask(TSK_EXP_A, nAddValue)
end

function pActivity:GetTaskA(TSK_EXP_A, TSK_DATE_A)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:GetTask(TSK_EXP_A)
end

function pActivity:AddExpB(TSK_EXP_B,nTskBExpLimit,nAddExp,nbStack,szLogTitle, szFailMsg)
	
	if self:GetTask(TSK_EXP_B) >= nTskBExpLimit then
		return Msg2Player(szFailMsg)
	end
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\playerfunlib.lua", "PlayerFunLib:AddExp", nAddExp, nbStack, szLogTitle)
	self:AddTask(TSK_EXP_B, nAddExp)
end

function pActivity:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)
	for i=1, getn(tbNpcPos) do
		local pPos = tbNpcPos[i]
		
		local nMapIndex = SubWorldID2Idx(pPos[1])
		if nMapIndex > 0 then
			local nNpcIndex = AddNpc(nNpcId, 1, nMapIndex, pPos[2] * 32, pPos[3] * 32, 0, szNpcName);
			SetNpcScript(nNpcIndex, "\\script\\activitysys\\npcdailog.lua");	
		end		
	end
end

function pActivity:Give5SHB(nEXP_Give_NSHB, TSK_Date_Give_NSHB)
	
	if (PlayerFunLib:CheckTaskDaily(TSK_Date_Give_NSHB,8,"每天只能送8个五色香包!","<") ~= 1) then
			return
	end
	if (ConsumeEquiproomItem(1, 6,1,2578,-1) ~= 1) then
		return
	end
	PlayerFunLib:AddTaskDaily(TSK_Date_Give_NSHB,1)
	AddOwnExp(nEXP_Give_NSHB)
	Msg2Player("你获得 8000000 积分")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 20112010"..GetAccount().."\t"..GetName().."\t".."送五色香包")
end
