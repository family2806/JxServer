Include("\\script\\lib\\awardtemplet.lua")

tbAwardLamBangTinh 		=  {szName = "经验值", nExp = 3e6}

tbAwardHoangBangTinh 	= {szName = "经验值", nExp = 2e6}

tbAwardTuBangTinh 	=
{
	[1] = 
	{
		{szName="经验值", nExp=5000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=67},	
		{szName="经验值", nExp=6000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=20},	
		{szName="经验值", nExp=8000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=10},	
		{szName="经验值", nExp=10000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=2},	
		{szName="经验值", nExp=20000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=1},	
	},
	[2] =
	{
		{szName="玄猿之智慧珠链", tbProp={0,1595}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧僧帽", tbProp={0,1596}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧上戒", tbProp={0,1597}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧护腕", tbProp={0,1598}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧腰带", tbProp={0,1599}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧袈裟", tbProp={0,1600}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧缠手", tbProp={0,1601}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧僧鞋", tbProp={0,1602}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧腰坠", tbProp={0,1603}, nRate=0.004, nQuality=1},	
		{szName="玄猿之智慧下戒", tbProp={0,1604}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满佛珠", tbProp={0,1605}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满僧帽", tbProp={0,1606}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满上戒", tbProp={0,1607}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满护腕", tbProp={0,1608}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满腰带", tbProp={0,1609}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满袈裟", tbProp={0,1610}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满僧棍", tbProp={0,1611}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满僧鞋", tbProp={0,1612}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满腰坠", tbProp={0,1613}, nRate=0.004, nQuality=1},	
		{szName="玄猿之圆满下戒", tbProp={0,1614}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心项链", tbProp={0,1615}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心僧帽", tbProp={0,1616}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心上戒", tbProp={0,1617}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心护腕", tbProp={0,1618}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心腰带", tbProp={0,1619}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心袈裟", tbProp={0,1620}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心戒刀", tbProp={0,1621}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心僧鞋", tbProp={0,1622}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心腰坠", tbProp={0,1623}, nRate=0.004, nQuality=1},	
		{szName="玄猿之佛心下戒", tbProp={0,1624}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天项链", tbProp={0,1625}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天盔", tbProp={0,1626}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天上戒", tbProp={0,1627}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天束腕", tbProp={0,1628}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天腰带", tbProp={0,1629}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天铠", tbProp={0,1630}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天锤", tbProp={0,1631}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天靴", tbProp={0,1632}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天佩", tbProp={0,1633}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冲天下戒", tbProp={0,1634}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云项链", tbProp={0,1635}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云盔", tbProp={0,1636}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云上戒", tbProp={0,1637}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云束腕", tbProp={0,1638}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云腰带", tbProp={0,1639}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云铠", tbProp={0,1640}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云衫", tbProp={0,1641}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云靴", tbProp={0,1642}, nRate=0.004, nQuality=1},	
		{szName="玄猿之飞云锤", tbProp={0,1643}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇下戒", tbProp={0,1644}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇项链", tbProp={0,1645}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇盔", tbProp={0,1646}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇上戒", tbProp={0,1647}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇束腕", tbProp={0,1648}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇腰带", tbProp={0,1649}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇铠", tbProp={0,1650}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇宝刀", tbProp={0,1651}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇靴", tbProp={0,1652}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇腰坠", tbProp={0,1653}, nRate=0.004, nQuality=1},	
		{szName="玄猿之英勇下戒", tbProp={0,1654}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音珠链", tbProp={0,1655}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音发带", tbProp={0,1656}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音上戒", tbProp={0,1657}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音护腕", tbProp={0,1658}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音束腰", tbProp={0,1659}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音纱衣", tbProp={0,1660}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音剑", tbProp={0,1661}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音鞋", tbProp={0,1662}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音香囊", tbProp={0,1663}, nRate=0.004, nQuality=1},	
		{szName="玄猿之静音下戒", tbProp={0,1664}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰珠链", tbProp={0,1665}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰发带", tbProp={0,1666}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰上戒", tbProp={0,1667}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰护腕", tbProp={0,1668}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰束腰", tbProp={0,1669}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰衫", tbProp={0,1670}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰缠手", tbProp={0,1671}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰鞋", tbProp={0,1672}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰香囊", tbProp={0,1673}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒冰下戒", tbProp={0,1674}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华珠链", tbProp={0,1675}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华簪", tbProp={0,1676}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华上戒", tbProp={0,1677}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华袖", tbProp={0,1678}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华束腰", tbProp={0,1679}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华衫", tbProp={0,1680}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华刀", tbProp={0,1681}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华靴", tbProp={0,1682}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华香囊", tbProp={0,1683}, nRate=0.004, nQuality=1},	
		{szName="玄猿之月华下戒", tbProp={0,1684}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花珠链", tbProp={0,1685}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花簪", tbProp={0,1686}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花上戒", tbProp={0,1687}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花袖", tbProp={0,1688}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花腰带", tbProp={0,1689}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花衫", tbProp={0,1690}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花刀", tbProp={0,1691}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花靴", tbProp={0,1692}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花香囊", tbProp={0,1693}, nRate=0.004, nQuality=1},	
		{szName="玄猿之繁花下戒", tbProp={0,1694}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠项链", tbProp={0,1695}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠发带", tbProp={0,1696}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠上戒", tbProp={0,1697}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠护腕", tbProp={0,1698}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠腰带", tbProp={0,1699}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠秘装", tbProp={0,1700}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠缠手", tbProp={0,1701}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠靴", tbProp={0,1702}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠腰坠", tbProp={0,1703}, nRate=0.004, nQuality=1},	
		{szName="玄猿之断肠下戒", tbProp={0,1704}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞项链", tbProp={0,1705}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞发带", tbProp={0,1706}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞上戒", tbProp={0,1707}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞护腕", tbProp={0,1708}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞腰带", tbProp={0,1709}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞秘装", tbProp={0,1710}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞刀", tbProp={0,1711}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞靴", tbProp={0,1712}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞腰坠", tbProp={0,1713}, nRate=0.004, nQuality=1},	
		{szName="玄猿之血煞下戒", tbProp={0,1714}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心项链", tbProp={0,1715}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心冠", tbProp={0,1716}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心上戒", tbProp={0,1717}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心护腕", tbProp={0,1718}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心缠腰", tbProp={0,1719}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心甲衣", tbProp={0,1720}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心飞刀", tbProp={0,1721}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心履", tbProp={0,1722}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心坠", tbProp={0,1723}, nRate=0.004, nQuality=1},	
		{szName="玄猿之冷心下戒", tbProp={0,1724}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情项链", tbProp={0,1725}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情冠", tbProp={0,1726}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情上戒", tbProp={0,1727}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情护腕", tbProp={0,1728}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情束腰", tbProp={0,1729}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情甲", tbProp={0,1730}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情袖箭", tbProp={0,1731}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情履", tbProp={0,1732}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情腰坠", tbProp={0,1733}, nRate=0.004, nQuality=1},	
		{szName="玄猿之无情下戒", tbProp={0,1734}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光链", tbProp={0,1735}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光发冠", tbProp={0,1736}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光上戒", tbProp={0,1737}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光护腕", tbProp={0,1738}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光束腰", tbProp={0,1739}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光甲衣", tbProp={0,1740}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光镖", tbProp={0,1741}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光履", tbProp={0,1742}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光坠", tbProp={0,1743}, nRate=0.004, nQuality=1},	
		{szName="玄猿之寒光下戒", tbProp={0,1744}, nRate=0.004, nQuality=1},	
		{szName="玄猿之阳刚项链", tbProp={0,1745}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚头环", tbProp={0,1746}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚上戒", tbProp={0,1747}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚护腕", tbProp={0,1748}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚束腰", tbProp={0,1749}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚丐衣", tbProp={0,1750}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚缠手", tbProp={0,1751}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚靴", tbProp={0,1752}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚腰坠", tbProp={0,1753}, nRate=0.005, nQuality=1},	
		{szName="玄猿之阳刚下戒", tbProp={0,1754}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙项链", tbProp={0,1755}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙头环", tbProp={0,1756}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙上戒", tbProp={0,1757}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙护腕", tbProp={0,1758}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙束腰", tbProp={0,1759}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙丐衣", tbProp={0,1760}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙杖", tbProp={0,1761}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙靴", tbProp={0,1762}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙腰坠", tbProp={0,1763}, nRate=0.005, nQuality=1},	
		{szName="玄猿之战龙下戒", tbProp={0,1764}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂项圈", tbProp={0,1765}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂盔", tbProp={0,1766}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂上戒", tbProp={0,1767}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂护腕", tbProp={0,1768}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂腰带", tbProp={0,1769}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂甲衣", tbProp={0,1770}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂枪", tbProp={0,1771}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂靴", tbProp={0,1772}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂佩", tbProp={0,1773}, nRate=0.005, nQuality=1},	
		{szName="玄猿之烙魂下戒", tbProp={0,1774}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情项链", tbProp={0,1775}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情冠冕", tbProp={0,1776}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情上戒", tbProp={0,1777}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情护腕", tbProp={0,1778}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情腰带", tbProp={0,1779}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情甲衣", tbProp={0,1780}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情刀", tbProp={0,1781}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情靴", tbProp={0,1782}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情佩", tbProp={0,1783}, nRate=0.005, nQuality=1},	
		{szName="玄猿之灼情下戒", tbProp={0,1784}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰符", tbProp={0,1785}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰冠", tbProp={0,1786}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰上戒", tbProp={0,1787}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰袖", tbProp={0,1788}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰发带", tbProp={0,1789}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰道袍", tbProp={0,1790}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰剑", tbProp={0,1791}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰履", tbProp={0,1792}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰玉佩", tbProp={0,1793}, nRate=0.005, nQuality=1},	
		{szName="玄猿之三丰下戒", tbProp={0,1794}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心符", tbProp={0,1795}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心冠", tbProp={0,1796}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心上戒", tbProp={0,1797}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心袖", tbProp={0,1798}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心发带", tbProp={0,1799}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心道袍", tbProp={0,1800}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心剑", tbProp={0,1801}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心履", tbProp={0,1802}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心玉佩", tbProp={0,1803}, nRate=0.005, nQuality=1},	
		{szName="玄猿之修心下戒", tbProp={0,1804}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云项链", tbProp={0,1805}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云道冠", tbProp={0,1806}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云上戒", tbProp={0,1807}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云护腕", tbProp={0,1808}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云腰带", tbProp={0,1809}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云道袍", tbProp={0,1810}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云刃", tbProp={0,1811}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云靴", tbProp={0,1812}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云佩", tbProp={0,1813}, nRate=0.005, nQuality=1},	
		{szName="玄猿之穿云下戒", tbProp={0,1814}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰符", tbProp={0,1815}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰道冠", tbProp={0,1816}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰上戒", tbProp={0,1817}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰手", tbProp={0,1818}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰腰带", tbProp={0,1819}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰道袍", tbProp={0,1820}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰长剑", tbProp={0,1821}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰靴", tbProp={0,1822}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰佩", tbProp={0,1823}, nRate=0.005, nQuality=1},	
		{szName="玄猿之破冰下戒", tbProp={0,1824}, nRate=0.005, nQuality=1},	
		{szName="苍狼令", tbProp={6,1,2352,1,0,0}, nRate=1},	
		{szName="云鹿令", tbProp={6,1,2353,1,0,0}, nRate=1},	
		{szName="玉罐", tbProp={6,1,2311,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="玄天锦囊", tbProp={6,1,2355,1,0,0}, nRate=2},	
		{szName="龙血丸", tbProp={6,1,2117,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="海龙珠",tbProp={6,1,2115,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="大力丸礼包", tbProp={6,1,2517,1,0,0}, nRate=3},	
		{szName="飞速丸礼包", tbProp={6,1,2520,1,0,0}, nRate=3},	
		{szName="百年珍露", tbProp={6,1,2266,1,0,0}, nRate=5},	
		{szName="千年珍露", tbProp={6,1,2267,1,0,0}, nRate=2},	
		{szName="万年珍露", tbProp={6,1,2268,1,0,0}, nRate=1},	
		{szName="爆速丸", tbProp={6,1,219,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="普攻丸", tbProp={6,1,229,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="毒攻丸", tbProp={6,1,230,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="冰攻丸", tbProp={6,1,231,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="火攻丸", tbProp={6,1,232,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="雷攻丸", tbProp={6,1,233,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="仙草露（特别）", tbProp={6,1,1765,1,0,0}, nRate=4},	
		{szName="安康红包", tbProp={6,1,2105,1,0,0}, nRate=0.2},	
		{szName="富贵锦盒", tbProp={6,1,2402,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="白骨令", tbProp={6,1,2255,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="山河社稷版图(1000张)", tbProp={6,1,2514,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="漠北传送令", tbProp={6,1,1448,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="五行奇石", tbProp={6,1,2125,1,0,0}, nRate=7.1},	
		{szName="成都灵药", tbProp={6,1,30062,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="大理灵药", tbProp={6,1,30063,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="凤翔灵药", tbProp={6,1,30064,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="襄阳灵药", tbProp={6,1,30065,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="汴京灵药", tbProp={6,1,30066,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="临安灵药", tbProp={6,1,30067,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="扬州灵药", tbProp={6,1,30068,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="银两", nRate =5, nJxb=1000000},	
		{szName="银两", nRate =2, nJxb=2000000},	
		{szName="银两", nRate =0.5, nJxb=5000000},	
		{szName="银两", nRate =0.2, nJxb=10000000},	
	},
}

TASK_LIMIT_USE_LAMBANGTINH 					= 2772
TASK_LIMIT_USE_HOANG_TU_BANGTINH		= 2773

function main(nItemIndex)

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("物品超过使用期限，自动丢弃.")
		return 0;
	end
	
	if (GetLevel() < 50) then
		Say("50级以上才可以使用此商品!",0)
		return 1
	end

	if CountFreeRoomByWH(2,3,1) < 1 then
		Talk(1, "", "您的背包至少需要2x3个格!.");
		return 1
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if (P == 30059) then -- lam bang tinh
		if (GetTask(TASK_LIMIT_USE_LAMBANGTINH) >= 1000) then
			Say("您使用蓝冰晶已达上限!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_LAMBANGTINH, GetTask(TASK_LIMIT_USE_LAMBANGTINH)+1)
		tbAwardTemplet:GiveAwardByList(tbAwardLamBangTinh, "使用蓝冰晶");
		return 0
	end
	
	if (P == 30060) then -- hoang bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("此物品已达使用上限!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH)+2)
		tbAwardTemplet:GiveAwardByList(tbAwardHoangBangTinh, "使用黄冰晶");
		return 0
	end
	
	if (P == 30061) then -- tu bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("此物品已达使用上限!",0)
			return 1
		end
		tbAwardTemplet:GiveAwardByList(tbAwardTuBangTinh, "使用紫冰晶");
		return 0
	end
	
	Say("物品不能确定!",0)
	return 1
end
