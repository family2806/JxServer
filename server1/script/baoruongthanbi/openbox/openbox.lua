Include("\\script\\baoruongthanbi\\head.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tbAWard=
{
	[1]=
	{
		{szName = "�i����ֵ", nExp_tl=1000000000},
	},
	[2]=
	{
		{szName = "�i����ֵ", nExp_tl=100000000},
	},
	[3]=
	{
		{szName = "�i����ֵ", nExp_tl=20000000},
	},
	[4]=
	{
		{szName = "�i����ֵ", nExp_tl=6000000},
	},
	
}
tbAwardItem = 
{
	{szName = "��Գ�ǻ�����", tbProp = {0, 1595}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ǻ�ɮñ", tbProp = {0, 1596}, nQuality = 1, nRate = 1.6},
{szName = "��Գ�ǻ��Ͻ�", tbProp = {0, 1597}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ǻۻ���", tbProp = {0, 1598}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ǻ�����", tbProp = {0, 1599}, nQuality = 1, nRate = 1.5},
{szName = "��Գ�ǻ�����", tbProp = {0, 1600}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ǻ۲���", tbProp = {0, 1601}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ǻ�ɮЬ", tbProp = {0, 1602}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ǻ���׹", tbProp = {0, 1603}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ǻ��½�", tbProp = {0, 1604}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ������", tbProp = {0, 1605}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ��ɮñ", tbProp = {0, 1606}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ���Ͻ�", tbProp = {0, 1607}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ������", tbProp = {0, 1608}, nQuality = 1, nRate = 1.6},
{szName = "��ԳԲ������", tbProp = {0, 1609}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ������", tbProp = {0, 1610}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ��ɮ��", tbProp = {0, 1611}, nQuality = 1, nRate = 1.5},
{szName = "��ԳԲ��ɮЬ", tbProp = {0, 1612}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ����׹", tbProp = {0, 1613}, nQuality = 1, nRate = 0.15},
{szName = "��ԳԲ���½�", tbProp = {0, 1614}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1615}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ɮñ", tbProp = {0, 1616}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1617}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���Ļ���", tbProp = {0, 1618}, nQuality = 1, nRate = 1.5},
{szName = "��Գ��������", tbProp = {0, 1619}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1620}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���Ľ䵶", tbProp = {0, 1621}, nQuality = 1, nRate = 1.6},
{szName = "��Գ����ɮЬ", tbProp = {0, 1622}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������׹", tbProp = {0, 1623}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1624}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1625}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����", tbProp = {0, 1626}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1627}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1628}, nQuality = 1, nRate = 1.5},
{szName = "��Գ��������", tbProp = {0, 1629}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1630}, nQuality = 1, nRate = 1.6},
{szName = "��Գ���촸", tbProp = {0, 1631}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ѥ", tbProp = {0, 1632}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1633}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1634}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1635}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ƿ�", tbProp = {0, 1636}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1637}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1638}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1639}, nQuality = 1, nRate = 1.5},
{szName = "��Գ������", tbProp = {0, 1640}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ǹ", tbProp = {0, 1641}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ѥ", tbProp = {0, 1642}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������׹", tbProp = {0, 1643}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ���½�", tbProp = {0, 1644}, nQuality = 1, nRate = 1.6},
{szName = "��ԳӢ������", tbProp = {0, 1645}, nQuality = 1, nRate = 1.6},
{szName = "��ԳӢ�¿�", tbProp = {0, 1646}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ���Ͻ�", tbProp = {0, 1647}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ������", tbProp = {0, 1648}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ������", tbProp = {0, 1649}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ����", tbProp = {0, 1650}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ�±���", tbProp = {0, 1651}, nQuality = 1, nRate = 1.5},
{szName = "��ԳӢ��ѥ", tbProp = {0, 1652}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ����׹", tbProp = {0, 1653}, nQuality = 1, nRate = 0.15},
{szName = "��ԳӢ���½�", tbProp = {0, 1654}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1655}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1656}, nQuality = 1, nRate = 1.6},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1657}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1658}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1659}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1660}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1661}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����Ь", tbProp = {0, 1662}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1663}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1664}, nQuality = 1, nRate = 1.5},
{szName = "��Գ��������", tbProp = {0, 1665}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1666}, nQuality = 1, nRate = 1.6},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1667}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1668}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1669}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1670}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1671}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����Ь", tbProp = {0, 1672}, nQuality = 1, nRate = 1.5},
{szName = "��Գ��������", tbProp = {0, 1673}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1674}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»�����", tbProp = {0, 1675}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»���", tbProp = {0, 1676}, nQuality = 1, nRate = 1.8},
{szName = "��Գ�»��Ͻ�", tbProp = {0, 1677}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»���", tbProp = {0, 1678}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»�����", tbProp = {0, 1679}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»���", tbProp = {0, 1680}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»���", tbProp = {0, 1681}, nQuality = 1, nRate = 1.9},
{szName = "��Գ�»�ѥ", tbProp = {0, 1682}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»�����", tbProp = {0, 1683}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�»��½�", tbProp = {0, 1684}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1685}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1686}, nQuality = 1, nRate = 1.8},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1687}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1688}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1689}, nQuality = 1, nRate = 1.8},
{szName = "��Գ������", tbProp = {0, 1690}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ԧ�쵶", tbProp = {0, 1691}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ѥ", tbProp = {0, 1692}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1693}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1694}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ�����", tbProp = {0, 1695}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ�����", tbProp = {0, 1696}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ��Ͻ�", tbProp = {0, 1697}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ�����", tbProp = {0, 1698}, nQuality = 1, nRate = 1.5},
{szName = "��Գ�ϳ�����", tbProp = {0, 1699}, nQuality = 1, nRate = 1.6},
{szName = "��Գ�ϳ���װ", tbProp = {0, 1700}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ�����", tbProp = {0, 1701}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ�ѥ", tbProp = {0, 1702}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ���׹", tbProp = {0, 1703}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�ϳ��½�", tbProp = {0, 1704}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷ����", tbProp = {0, 1705}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷ����", tbProp = {0, 1706}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷ�Ͻ�", tbProp = {0, 1707}, nQuality = 1, nRate = 1.6},
{szName = "��ԳѪɷ����", tbProp = {0, 1708}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷ����", tbProp = {0, 1709}, nQuality = 1, nRate = 1.5},
{szName = "��ԳѪɷ��װ", tbProp = {0, 1710}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷ��", tbProp = {0, 1711}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷѥ", tbProp = {0, 1712}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷ��׹", tbProp = {0, 1713}, nQuality = 1, nRate = 0.15},
{szName = "��ԳѪɷ�½�", tbProp = {0, 1714}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1715}, nQuality = 1, nRate = 1.5},
{szName = "��Գ���Ĺ�", tbProp = {0, 1716}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1717}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���Ļ���", tbProp = {0, 1718}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���Ĳ���", tbProp = {0, 1719}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ļ���", tbProp = {0, 1720}, nQuality = 1, nRate = 1.6},
{szName = "��Գ���ķɵ�", tbProp = {0, 1721}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1722}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����׹", tbProp = {0, 1723}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1724}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1725}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����", tbProp = {0, 1726}, nQuality = 1, nRate = 1.6},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1727}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���黤��", tbProp = {0, 1728}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1729}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����", tbProp = {0, 1730}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1731}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1732}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������׹", tbProp = {0, 1733}, nQuality = 1, nRate = 1.5},
{szName = "��Գ�����½�", tbProp = {0, 1734}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1735}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ⷢ��", tbProp = {0, 1736}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1737}, nQuality = 1, nRate = 1.6},
{szName = "��Գ���⻤��", tbProp = {0, 1738}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1739}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�������", tbProp = {0, 1740}, nQuality = 1, nRate = 1.5},
{szName = "��Գ������", tbProp = {0, 1741}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1742}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����׹", tbProp = {0, 1743}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1744}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1745}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ͷ��", tbProp = {0, 1746}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1747}, nQuality = 1, nRate = 1.5},
{szName = "��Գ���ջ���", tbProp = {0, 1748}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1749}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ؤ��", tbProp = {0, 1750}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ղ���", tbProp = {0, 1751}, nQuality = 1, nRate = 1.6},
{szName = "��Գ����ѥ", tbProp = {0, 1752}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������׹", tbProp = {0, 1753}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1754}, nQuality = 1, nRate = 0.15},
{szName = "��Գս������", tbProp = {0, 1755}, nQuality = 1, nRate = 0.15},
{szName = "��Գս��ͷ��", tbProp = {0, 1756}, nQuality = 1, nRate = 0.15},
{szName = "��Գս���Ͻ�", tbProp = {0, 1757}, nQuality = 1, nRate = 0.15},
{szName = "��Գս������", tbProp = {0, 1758}, nQuality = 1, nRate = 0.15},
{szName = "��Գս������", tbProp = {0, 1759}, nQuality = 1, nRate = 1.6},
{szName = "��Գս��ؤ��", tbProp = {0, 1760}, nQuality = 1, nRate = 0.15},
{szName = "��Գս����", tbProp = {0, 1761}, nQuality = 1, nRate = 0.15},
{szName = "��Գս��ѥ", tbProp = {0, 1762}, nQuality = 1, nRate = 0.15},
{szName = "��Գս����׹", tbProp = {0, 1763}, nQuality = 1, nRate = 0.15},
{szName = "��Գս���½�", tbProp = {0, 1764}, nQuality = 1, nRate = 1.5},
{szName = "��Գ�����Ȧ", tbProp = {0, 1765}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����", tbProp = {0, 1766}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����Ͻ�", tbProp = {0, 1767}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��껤��", tbProp = {0, 1768}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�������", tbProp = {0, 1769}, nQuality = 1, nRate = 1.5},
{szName = "��Գ������", tbProp = {0, 1770}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ǹ", tbProp = {0, 1771}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ѥ", tbProp = {0, 1772}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����", tbProp = {0, 1773}, nQuality = 1, nRate = 1.6},
{szName = "��Գ����½�", tbProp = {0, 1774}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1775}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�������", tbProp = {0, 1776}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1777}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���黤��", tbProp = {0, 1778}, nQuality = 1, nRate = 1.5},
{szName = "��Գ��������", tbProp = {0, 1779}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�������", tbProp = {0, 1780}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���鵶", tbProp = {0, 1781}, nQuality = 1, nRate = 1.6},
{szName = "��Գ����ѥ", tbProp = {0, 1782}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1783}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1784}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����", tbProp = {0, 1785}, nQuality = 1, nRate = 1.5},
{szName = "��Գ�����", tbProp = {0, 1786}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1787}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1788}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ᷢ��", tbProp = {0, 1789}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�������", tbProp = {0, 1790}, nQuality = 1, nRate = 1.6},
{szName = "��Գ���ὣ", tbProp = {0, 1791}, nQuality = 1, nRate = 0.15},
{szName = "��Գ������", tbProp = {0, 1792}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1793}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1794}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ķ�", tbProp = {0, 1795}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���Ĺ�", tbProp = {0, 1796}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1797}, nQuality = 1, nRate = 1.6},
{szName = "��Գ������", tbProp = {0, 1798}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ķ���", tbProp = {0, 1799}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ĵ���", tbProp = {0, 1800}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���Ľ�", tbProp = {0, 1801}, nQuality = 1, nRate = 1.5},
{szName = "��Գ������", tbProp = {0, 1802}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1803}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1804}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1805}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���Ƶ���", tbProp = {0, 1806}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����Ͻ�", tbProp = {0, 1807}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ƻ���", tbProp = {0, 1808}, nQuality = 1, nRate = 0.15},
{szName = "��Գ��������", tbProp = {0, 1809}, nQuality = 1, nRate = 1.5},
{szName = "��Գ���Ƶ���", tbProp = {0, 1810}, nQuality = 1, nRate = 0.15},
{szName = "��Գ���ƽ�", tbProp = {0, 1811}, nQuality = 1, nRate = 0.15},
{szName = "��Գ����ѥ", tbProp = {0, 1812}, nQuality = 1, nRate = 1.6},
{szName = "��Գ������", tbProp = {0, 1813}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�����½�", tbProp = {0, 1814}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ���", tbProp = {0, 1815}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ�����", tbProp = {0, 1816}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ��Ͻ�", tbProp = {0, 1817}, nQuality = 1, nRate = 1.5},
{szName = "��Գ�Ʊ���", tbProp = {0, 1818}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ�����", tbProp = {0, 1819}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ�����", tbProp = {0, 1820}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ�����", tbProp = {0, 1821}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ�ѥ", tbProp = {0, 1822}, nQuality = 1, nRate = 1.6},
{szName = "��Գ�Ʊ���", tbProp = {0, 1823}, nQuality = 1, nRate = 0.15},
{szName = "��Գ�Ʊ��½�", tbProp = {0, 1824}, nQuality = 1, nRate = 0.15},

}
function OpenBox_main()
	GiveItemUI("�򿪱���", "�򿪱�����Ҫ1�������һ������Կ��", "ConfirmOpenBox", "OnCancel");
end

function ConfirmOpenBox(nCount)
	local nBoxValue, nKeyValue = 0
	if (nCount ~= 2) then 
		Talk(1, "", "�򿪱���ֻ��Ҫһ�����ر����һ�������������Կ��!");
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
				Talk(1, "", "��������¼�����Ӻ�Կ���ϵ�����!");
				return
			end
		end
	else
		Talk(1, "", "�����������ȷ��Ʒ!");
		return
	end
	local result = ConpareValue(nBoxValue, nKeyValue, nKeyIndex)
	if (result==0) then
		Talk(1, "", "��򿪸����ر�����Ҫ�ҵ�һ������������ͷ�����غϵ�����Կ�� !");
		return 0
	end
	 if (result == 1) then
	--giai nhat
		--Say("<#> �����Ѿ��ҵ��˴򿪱��������в���������, �������������ڵ���Ʒ��",2,
				--"������/# GetBonusOpenBox(1,"..nBoxIndex..", "..nKeyIndex..")",
				--"����/OnCancel")
				GetBonusOpenBox(1,nBoxIndex, nKeyIndex)
	end
	if (result == 2) then
	--giai nhi
--		Say("<#> �����Ѿ��ҵ��˴򿪱��������������������, �������������ڵ���Ʒ��?", 2,
--				"������/# GetBonusOpenBox(2,"..nBoxIndex..", "..nKeyIndex..")",
--				"����/OnCancel")
				GetBonusOpenBox(2,nBoxIndex, nKeyIndex)
	end
	if (result == 3) then
	--giai 3
--		Say("<#> �����Ѿ��ҵ��˴򿪱�����ڶ�������������, �������������ڵ���Ʒ��?", 2,
--				"������/# GetBonusOpenBox(3,"..nBoxIndex..", "..nKeyIndex..")",
--				"����/OnCancel")
				GetBonusOpenBox(3,nBoxIndex, nKeyIndex)
	end
	if (result == 4) then
--		Say("<#> �����Ѿ��ҵ��˴򿪱������һ������������, �������������ڵ���Ʒ��?", 2,
--				"������/# GetBonusOpenBox(4,"..nBoxIndex..", "..nKeyIndex..")",
--				"����/OnCancel")
				GetBonusOpenBox(4,nBoxIndex, nKeyIndex)
	end
	
	
	
end

function GetBonusOpenBox(nValue, nBoxIndex, nKeyIndex)
	if (nValue==1) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox1,1,"ÿ��ֻ�ܴ�һ��5���ŵ����ر���","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","װ������10���ո�!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox1,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "�յ�һ�����ر��佱��");
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "�յ�һ�����ر��佱��");
		AddEnergy(1000)
		Msg2Player("��ϲ�����ո��յ���һ�������ر������Ʒ")
	end
	if (nValue==2) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox2,2,"ÿ��ֻ�ܴ�2���ĸ��ŵ����ر���","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","װ������10���ո�!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox2,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "�յ�2�����ر��佱��");
		AddEnergy(500)
		Msg2Player("��ϲ�����ո��յ��˴򿪱������Ʒ")
	end
	if (nValue==3) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox3,5,"ÿ��ֻ�ܴ�5����3���ŵ����ر���","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","װ������10���ո�!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox3,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "�յ�3�����ر��佱��");
		AddEnergy(100)
		Msg2Player("��ϲ�����ո��յ��˴򿪱������Ʒ")
	end
	if (nValue==4) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox4,20,"ÿ��ֻ�ܴ�20����2���ŵ����ر���","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","װ������10���ո�!")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox4,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "�յ�4�����ر��佱��");
		AddEnergy(20)
		Msg2Player("��ϲ�����ո��յ��˴򿪱������Ʒ")
	end
end

function OnCancel()
end