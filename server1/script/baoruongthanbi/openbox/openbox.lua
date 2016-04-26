Include("\\script\\baoruongthanbi\\head.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tbAWard=
{
	[1]=
	{
		{szName = "经验值", nExp_tl=1000000000},
	},
	[2]=
	{
		{szName = "经验值", nExp_tl=100000000},
	},
	[3]=
	{
		{szName = "经验值", nExp_tl=20000000},
	},
	[4]=
	{
		{szName = "经验值", nExp_tl=6000000},
	},
	
}
tbAwardItem = 
{
	{szName = "玄猿智慧珠链", tbProp = {0, 1595}, nQuality = 1, nRate = 0.15},
{szName = "玄猿智慧僧帽", tbProp = {0, 1596}, nQuality = 1, nRate = 1.6},
{szName = "玄猿智慧上戒", tbProp = {0, 1597}, nQuality = 1, nRate = 0.15},
{szName = "玄猿智慧护腕", tbProp = {0, 1598}, nQuality = 1, nRate = 0.15},
{szName = "玄猿智慧腰带", tbProp = {0, 1599}, nQuality = 1, nRate = 1.5},
{szName = "玄猿智慧袈裟", tbProp = {0, 1600}, nQuality = 1, nRate = 0.15},
{szName = "玄猿智慧缠手", tbProp = {0, 1601}, nQuality = 1, nRate = 0.15},
{szName = "玄猿智慧僧鞋", tbProp = {0, 1602}, nQuality = 1, nRate = 0.15},
{szName = "玄猿智慧腰坠", tbProp = {0, 1603}, nQuality = 1, nRate = 0.15},
{szName = "玄猿智慧下戒", tbProp = {0, 1604}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满佛珠", tbProp = {0, 1605}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满僧帽", tbProp = {0, 1606}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满上戒", tbProp = {0, 1607}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满护腕", tbProp = {0, 1608}, nQuality = 1, nRate = 1.6},
{szName = "玄猿圆满腰带", tbProp = {0, 1609}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满袈裟", tbProp = {0, 1610}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满僧棍", tbProp = {0, 1611}, nQuality = 1, nRate = 1.5},
{szName = "玄猿圆满僧鞋", tbProp = {0, 1612}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满腰坠", tbProp = {0, 1613}, nQuality = 1, nRate = 0.15},
{szName = "玄猿圆满下戒", tbProp = {0, 1614}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心项链", tbProp = {0, 1615}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心僧帽", tbProp = {0, 1616}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心上戒", tbProp = {0, 1617}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心护腕", tbProp = {0, 1618}, nQuality = 1, nRate = 1.5},
{szName = "玄猿佛心腰带", tbProp = {0, 1619}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心袈裟", tbProp = {0, 1620}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心戒刀", tbProp = {0, 1621}, nQuality = 1, nRate = 1.6},
{szName = "玄猿佛心僧鞋", tbProp = {0, 1622}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心腰坠", tbProp = {0, 1623}, nQuality = 1, nRate = 0.15},
{szName = "玄猿佛心下戒", tbProp = {0, 1624}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天项链", tbProp = {0, 1625}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天盔", tbProp = {0, 1626}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天上戒", tbProp = {0, 1627}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天束腕", tbProp = {0, 1628}, nQuality = 1, nRate = 1.5},
{szName = "玄猿冲天腰带", tbProp = {0, 1629}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天铠", tbProp = {0, 1630}, nQuality = 1, nRate = 1.6},
{szName = "玄猿冲天锤", tbProp = {0, 1631}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天靴", tbProp = {0, 1632}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天佩", tbProp = {0, 1633}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冲天下戒", tbProp = {0, 1634}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云项链", tbProp = {0, 1635}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云盔", tbProp = {0, 1636}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云上戒", tbProp = {0, 1637}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云束腕", tbProp = {0, 1638}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云腰带", tbProp = {0, 1639}, nQuality = 1, nRate = 1.5},
{szName = "玄猿飞云铠", tbProp = {0, 1640}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云枪", tbProp = {0, 1641}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云靴", tbProp = {0, 1642}, nQuality = 1, nRate = 0.15},
{szName = "玄猿飞云腰坠", tbProp = {0, 1643}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇下戒", tbProp = {0, 1644}, nQuality = 1, nRate = 1.6},
{szName = "玄猿英勇项链", tbProp = {0, 1645}, nQuality = 1, nRate = 1.6},
{szName = "玄猿英勇盔", tbProp = {0, 1646}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇上戒", tbProp = {0, 1647}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇束腕", tbProp = {0, 1648}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇腰带", tbProp = {0, 1649}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇铠", tbProp = {0, 1650}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇宝刀", tbProp = {0, 1651}, nQuality = 1, nRate = 1.5},
{szName = "玄猿英勇靴", tbProp = {0, 1652}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇腰坠", tbProp = {0, 1653}, nQuality = 1, nRate = 0.15},
{szName = "玄猿英勇下戒", tbProp = {0, 1654}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音珠链", tbProp = {0, 1655}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音发带", tbProp = {0, 1656}, nQuality = 1, nRate = 1.6},
{szName = "玄猿静音上戒", tbProp = {0, 1657}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音护腕", tbProp = {0, 1658}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音束腰", tbProp = {0, 1659}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音裟衣", tbProp = {0, 1660}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音剑", tbProp = {0, 1661}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音鞋", tbProp = {0, 1662}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音香囊", tbProp = {0, 1663}, nQuality = 1, nRate = 0.15},
{szName = "玄猿静音下戒", tbProp = {0, 1664}, nQuality = 1, nRate = 1.5},
{szName = "玄猿寒冰珠链", tbProp = {0, 1665}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒冰发带", tbProp = {0, 1666}, nQuality = 1, nRate = 1.6},
{szName = "玄猿寒冰上戒", tbProp = {0, 1667}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒冰护腕", tbProp = {0, 1668}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒冰束腰", tbProp = {0, 1669}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒冰衫", tbProp = {0, 1670}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒冰缠手", tbProp = {0, 1671}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒冰鞋", tbProp = {0, 1672}, nQuality = 1, nRate = 1.5},
{szName = "玄猿寒冰香囊", tbProp = {0, 1673}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒冰下戒", tbProp = {0, 1674}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花珠链", tbProp = {0, 1675}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花簪", tbProp = {0, 1676}, nQuality = 1, nRate = 1.8},
{szName = "玄猿月花上戒", tbProp = {0, 1677}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花袖", tbProp = {0, 1678}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花束腰", tbProp = {0, 1679}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花衫", tbProp = {0, 1680}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花刀", tbProp = {0, 1681}, nQuality = 1, nRate = 1.9},
{szName = "玄猿月花靴", tbProp = {0, 1682}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花香囊", tbProp = {0, 1683}, nQuality = 1, nRate = 0.15},
{szName = "玄猿月花下戒", tbProp = {0, 1684}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华珠链", tbProp = {0, 1685}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华簪", tbProp = {0, 1686}, nQuality = 1, nRate = 1.8},
{szName = "玄猿繁华上戒", tbProp = {0, 1687}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华袖", tbProp = {0, 1688}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华腰带", tbProp = {0, 1689}, nQuality = 1, nRate = 1.8},
{szName = "玄猿繁华衫", tbProp = {0, 1690}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华鸳鸯刀", tbProp = {0, 1691}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华靴", tbProp = {0, 1692}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华香囊", tbProp = {0, 1693}, nQuality = 1, nRate = 0.15},
{szName = "玄猿繁华下戒", tbProp = {0, 1694}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠项链", tbProp = {0, 1695}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠发带", tbProp = {0, 1696}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠上戒", tbProp = {0, 1697}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠护腕", tbProp = {0, 1698}, nQuality = 1, nRate = 1.5},
{szName = "玄猿断肠腰带", tbProp = {0, 1699}, nQuality = 1, nRate = 1.6},
{szName = "玄猿断肠秘装", tbProp = {0, 1700}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠缠手", tbProp = {0, 1701}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠靴", tbProp = {0, 1702}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠腰坠", tbProp = {0, 1703}, nQuality = 1, nRate = 0.15},
{szName = "玄猿断肠下戒", tbProp = {0, 1704}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞项链", tbProp = {0, 1705}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞发带", tbProp = {0, 1706}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞上戒", tbProp = {0, 1707}, nQuality = 1, nRate = 1.6},
{szName = "玄猿血煞护腕", tbProp = {0, 1708}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞腰带", tbProp = {0, 1709}, nQuality = 1, nRate = 1.5},
{szName = "玄猿血煞秘装", tbProp = {0, 1710}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞刀", tbProp = {0, 1711}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞靴", tbProp = {0, 1712}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞腰坠", tbProp = {0, 1713}, nQuality = 1, nRate = 0.15},
{szName = "玄猿血煞下戒", tbProp = {0, 1714}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心项链", tbProp = {0, 1715}, nQuality = 1, nRate = 1.5},
{szName = "玄猿冷心冠", tbProp = {0, 1716}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心上戒", tbProp = {0, 1717}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心护腕", tbProp = {0, 1718}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心缠腰", tbProp = {0, 1719}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心甲衣", tbProp = {0, 1720}, nQuality = 1, nRate = 1.6},
{szName = "玄猿冷心飞刀", tbProp = {0, 1721}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心履", tbProp = {0, 1722}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心坠", tbProp = {0, 1723}, nQuality = 1, nRate = 0.15},
{szName = "玄猿冷心下戒", tbProp = {0, 1724}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情项链", tbProp = {0, 1725}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情冠", tbProp = {0, 1726}, nQuality = 1, nRate = 1.6},
{szName = "玄猿无情上戒", tbProp = {0, 1727}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情护腕", tbProp = {0, 1728}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情束腰", tbProp = {0, 1729}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情甲", tbProp = {0, 1730}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情袖", tbProp = {0, 1731}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情履", tbProp = {0, 1732}, nQuality = 1, nRate = 0.15},
{szName = "玄猿无情腰坠", tbProp = {0, 1733}, nQuality = 1, nRate = 1.5},
{szName = "玄猿无情下戒", tbProp = {0, 1734}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光链", tbProp = {0, 1735}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光发冠", tbProp = {0, 1736}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光上戒", tbProp = {0, 1737}, nQuality = 1, nRate = 1.6},
{szName = "玄猿寒光护腕", tbProp = {0, 1738}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光束腰", tbProp = {0, 1739}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光甲衣", tbProp = {0, 1740}, nQuality = 1, nRate = 1.5},
{szName = "玄猿寒光箫", tbProp = {0, 1741}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光履", tbProp = {0, 1742}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光坠", tbProp = {0, 1743}, nQuality = 1, nRate = 0.15},
{szName = "玄猿寒光下戒", tbProp = {0, 1744}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚项链", tbProp = {0, 1745}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚头环", tbProp = {0, 1746}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚上戒", tbProp = {0, 1747}, nQuality = 1, nRate = 1.5},
{szName = "玄猿阳刚护腕", tbProp = {0, 1748}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚束腰", tbProp = {0, 1749}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚丐衣", tbProp = {0, 1750}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚缠手", tbProp = {0, 1751}, nQuality = 1, nRate = 1.6},
{szName = "玄猿阳刚靴", tbProp = {0, 1752}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚腰坠", tbProp = {0, 1753}, nQuality = 1, nRate = 0.15},
{szName = "玄猿阳刚下戒", tbProp = {0, 1754}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙项链", tbProp = {0, 1755}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙头环", tbProp = {0, 1756}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙上戒", tbProp = {0, 1757}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙护腕", tbProp = {0, 1758}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙束腰", tbProp = {0, 1759}, nQuality = 1, nRate = 1.6},
{szName = "玄猿战龙丐衣", tbProp = {0, 1760}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙杖", tbProp = {0, 1761}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙靴", tbProp = {0, 1762}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙腰坠", tbProp = {0, 1763}, nQuality = 1, nRate = 0.15},
{szName = "玄猿战龙下戒", tbProp = {0, 1764}, nQuality = 1, nRate = 1.5},
{szName = "玄猿落魂项圈", tbProp = {0, 1765}, nQuality = 1, nRate = 0.15},
{szName = "玄猿落魂盔", tbProp = {0, 1766}, nQuality = 1, nRate = 0.15},
{szName = "玄猿落魂上戒", tbProp = {0, 1767}, nQuality = 1, nRate = 0.15},
{szName = "玄猿落魂护腕", tbProp = {0, 1768}, nQuality = 1, nRate = 0.15},
{szName = "玄猿落魂腰带", tbProp = {0, 1769}, nQuality = 1, nRate = 1.5},
{szName = "玄猿落魂甲衣", tbProp = {0, 1770}, nQuality = 1, nRate = 0.15},
{szName = "玄猿落魂枪", tbProp = {0, 1771}, nQuality = 1, nRate = 0.15},
{szName = "玄猿落魂靴", tbProp = {0, 1772}, nQuality = 1, nRate = 0.15},
{szName = "玄猿落魂佩", tbProp = {0, 1773}, nQuality = 1, nRate = 1.6},
{szName = "玄猿落魂下戒", tbProp = {0, 1774}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情项链", tbProp = {0, 1775}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情冠冕", tbProp = {0, 1776}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情上戒", tbProp = {0, 1777}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情护腕", tbProp = {0, 1778}, nQuality = 1, nRate = 1.5},
{szName = "玄猿酌情腰带", tbProp = {0, 1779}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情甲衣", tbProp = {0, 1780}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情刀", tbProp = {0, 1781}, nQuality = 1, nRate = 1.6},
{szName = "玄猿酌情靴", tbProp = {0, 1782}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情佩", tbProp = {0, 1783}, nQuality = 1, nRate = 0.15},
{szName = "玄猿酌情下戒", tbProp = {0, 1784}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰符", tbProp = {0, 1785}, nQuality = 1, nRate = 1.5},
{szName = "玄猿三丰冠", tbProp = {0, 1786}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰上戒", tbProp = {0, 1787}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰袖", tbProp = {0, 1788}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰发带", tbProp = {0, 1789}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰道袍", tbProp = {0, 1790}, nQuality = 1, nRate = 1.6},
{szName = "玄猿三丰剑", tbProp = {0, 1791}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰履", tbProp = {0, 1792}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰玉佩", tbProp = {0, 1793}, nQuality = 1, nRate = 0.15},
{szName = "玄猿三丰下戒", tbProp = {0, 1794}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心符", tbProp = {0, 1795}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心冠", tbProp = {0, 1796}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心上戒", tbProp = {0, 1797}, nQuality = 1, nRate = 1.6},
{szName = "玄猿修心袖", tbProp = {0, 1798}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心发带", tbProp = {0, 1799}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心道袍", tbProp = {0, 1800}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心剑", tbProp = {0, 1801}, nQuality = 1, nRate = 1.5},
{szName = "玄猿修心履", tbProp = {0, 1802}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心玉佩", tbProp = {0, 1803}, nQuality = 1, nRate = 0.15},
{szName = "玄猿修心下戒", tbProp = {0, 1804}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云项链", tbProp = {0, 1805}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云道冠", tbProp = {0, 1806}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云上戒", tbProp = {0, 1807}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云护腕", tbProp = {0, 1808}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云腰带", tbProp = {0, 1809}, nQuality = 1, nRate = 1.5},
{szName = "玄猿穿云道袍", tbProp = {0, 1810}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云戒", tbProp = {0, 1811}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云靴", tbProp = {0, 1812}, nQuality = 1, nRate = 1.6},
{szName = "玄猿穿云佩", tbProp = {0, 1813}, nQuality = 1, nRate = 0.15},
{szName = "玄猿穿云下戒", tbProp = {0, 1814}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰符", tbProp = {0, 1815}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰道冠", tbProp = {0, 1816}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰上戒", tbProp = {0, 1817}, nQuality = 1, nRate = 1.5},
{szName = "玄猿破冰手", tbProp = {0, 1818}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰腰带", tbProp = {0, 1819}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰道袍", tbProp = {0, 1820}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰长剑", tbProp = {0, 1821}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰靴", tbProp = {0, 1822}, nQuality = 1, nRate = 1.6},
{szName = "玄猿破冰佩", tbProp = {0, 1823}, nQuality = 1, nRate = 0.15},
{szName = "玄猿破冰下戒", tbProp = {0, 1824}, nQuality = 1, nRate = 0.15},

}
function OpenBox_main()
	GiveItemUI("打开宝箱", "打开宝箱需要1个宝箱和一个万能钥匙", "ConfirmOpenBox", "OnCancel");
end

function ConfirmOpenBox(nCount)
	local nBoxValue, nKeyValue = 0
	if (nCount ~= 2) then 
		Talk(1, "", "打开宝箱只需要一个神秘宝箱和一个有密码的万能钥匙!");
		return
	end
	local lag1, lag2, nBoxIndex,nKeyIndex = 0
	
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
		if (parttype == 30036) then--box
			lag1 = 1
			nBoxIndex = nItemIndex
		end
		if (parttype == 30037) then--key
			lag2 = 1
			nKeyIndex = nItemIndex
		end
	end--for
	if (lag1 == 1 and lag2 ==1) then
		nBoxValue = GetBoxValue(nBoxIndex)
		nKeyValue = GetKeyValue(nKeyIndex)
		if (nKeyValue >= 10000) then--if user in put key 5 so thi bat buoc phai trung giai nhat
			if ( ConpareValue(nBoxValue, nKeyValue, nKeyIndex) ~= 1) then
				Talk(1, "", "请大侠重新检查箱子和钥匙上的密码!");
				return
			end
		end
	else
		Talk(1, "", "请大侠放入正确物品!");
		return
	end
	local result = ConpareValue(nBoxValue, nKeyValue, nKeyIndex)
	if (result==0) then
		Talk(1, "", "想打开该神秘宝箱需要找到一个至少有两个头数字重合的万能钥匙 !");
		return 0
	end
	 if (result == 1) then
	--giai nhat
		--Say("<#> 大侠已经找到了打开宝箱里所有插销的密码, 大侠想获得箱子内的物品吗？",2,
				--"我想获得/# GetBonusOpenBox(1,"..nBoxIndex..", "..nKeyIndex..")",
				--"放弃/OnCancel")
				GetBonusOpenBox(1,nBoxIndex, nKeyIndex)
	end
	if (result == 2) then
	--giai nhi
--		Say("<#> 大侠已经找到了打开宝箱里第三个插销的密码, 大侠想获得箱子内的物品吗?", 2,
--				"我想获得/# GetBonusOpenBox(2,"..nBoxIndex..", "..nKeyIndex..")",
--				"放弃/OnCancel")
				GetBonusOpenBox(2,nBoxIndex, nKeyIndex)
	end
	if (result == 3) then
	--giai 3
--		Say("<#> 大侠已经找到了打开宝箱里第二个插销的密码, 大侠想获得箱子内的物品吗?", 2,
--				"我想获得/# GetBonusOpenBox(3,"..nBoxIndex..", "..nKeyIndex..")",
--				"放弃/OnCancel")
				GetBonusOpenBox(3,nBoxIndex, nKeyIndex)
	end
	if (result == 4) then
--		Say("<#> 大侠已经找到了打开宝箱里第一个插销的密码, 大侠想获得箱子内的物品吗?", 2,
--				"我想获得/# GetBonusOpenBox(4,"..nBoxIndex..", "..nKeyIndex..")",
--				"放弃/OnCancel")
				GetBonusOpenBox(4,nBoxIndex, nKeyIndex)
	end
	
	
	
end

function GetBonusOpenBox(nValue, nBoxIndex, nKeyIndex)
	if (nValue==1) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox1,1,"每天只能打开一个5个号的神秘宝箱","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","装备不足10个空格!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox1,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "收第一等神秘宝箱奖励");
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "收第一等神秘宝箱奖励");
		AddEnergy(1000)
		Msg2Player("恭喜大侠刚刚收到了一个打开神秘宝箱的物品")
	end
	if (nValue==2) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox2,2,"每天只能打开2个四个号的神秘宝箱","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","装备不足10个空格!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox2,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "收第2等神秘宝箱奖励");
		AddEnergy(500)
		Msg2Player("恭喜大侠刚刚收到了打开宝箱的物品")
	end
	if (nValue==3) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox3,5,"每天只能打开5个带3个号的神秘宝箱","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","装备不足10个空格!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox3,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "收第3等神秘宝箱奖励");
		AddEnergy(100)
		Msg2Player("恭喜大侠刚刚收到了打开宝箱的物品")
	end
	if (nValue==4) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox4,20,"每日只能打开20个带2个号的神秘宝箱","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","装备不足10个空格!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox4,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "收第4等神秘宝箱奖励");
		AddEnergy(20)
		Msg2Player("恭喜大侠刚刚收到了打开宝箱的物品")
	end
end

function OnCancel()
end