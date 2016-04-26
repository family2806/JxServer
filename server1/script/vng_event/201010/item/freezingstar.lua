Include("\\script\\lib\\awardtemplet.lua")

tbAwardLamBangTinh 		=  {szName = "����ֵ", nExp = 3e6}

tbAwardHoangBangTinh 	= {szName = "����ֵ", nExp = 2e6}

tbAwardTuBangTinh 	=
{
	[1] = 
	{
		{szName="����ֵ", nExp=5000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=67},	
		{szName="����ֵ", nExp=6000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=20},	
		{szName="����ֵ", nExp=8000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=10},	
		{szName="����ֵ", nExp=10000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=2},	
		{szName="����ֵ", nExp=20000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=1},	
	},
	[2] =
	{
		{szName="��Գ֮�ǻ�����", tbProp={0,1595}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ�ɮñ", tbProp={0,1596}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ��Ͻ�", tbProp={0,1597}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻۻ���", tbProp={0,1598}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ�����", tbProp={0,1599}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ�����", tbProp={0,1600}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ۲���", tbProp={0,1601}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ�ɮЬ", tbProp={0,1602}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ���׹", tbProp={0,1603}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ǻ��½�", tbProp={0,1604}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ������", tbProp={0,1605}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ��ɮñ", tbProp={0,1606}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ���Ͻ�", tbProp={0,1607}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ������", tbProp={0,1608}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ������", tbProp={0,1609}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ������", tbProp={0,1610}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ��ɮ��", tbProp={0,1611}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ��ɮЬ", tbProp={0,1612}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ����׹", tbProp={0,1613}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Բ���½�", tbProp={0,1614}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1615}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����ɮñ", tbProp={0,1616}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1617}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���Ļ���", tbProp={0,1618}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1619}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1620}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���Ľ䵶", tbProp={0,1621}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����ɮЬ", tbProp={0,1622}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������׹", tbProp={0,1623}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1624}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1625}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����", tbProp={0,1626}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1627}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1628}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1629}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1630}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���촸", tbProp={0,1631}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����ѥ", tbProp={0,1632}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1633}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1634}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1635}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���ƿ�", tbProp={0,1636}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1637}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1638}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1639}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1640}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1641}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����ѥ", tbProp={0,1642}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���ƴ�", tbProp={0,1643}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ���½�", tbProp={0,1644}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ������", tbProp={0,1645}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ�¿�", tbProp={0,1646}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ���Ͻ�", tbProp={0,1647}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ������", tbProp={0,1648}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ������", tbProp={0,1649}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ����", tbProp={0,1650}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ�±���", tbProp={0,1651}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ��ѥ", tbProp={0,1652}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ����׹", tbProp={0,1653}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ӣ���½�", tbProp={0,1654}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1655}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1656}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1657}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1658}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1659}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����ɴ��", tbProp={0,1660}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1661}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����Ь", tbProp={0,1662}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1663}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1664}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1665}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1666}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1667}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1668}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1669}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1670}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1671}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����Ь", tbProp={0,1672}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1673}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1674}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»�����", tbProp={0,1675}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»���", tbProp={0,1676}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»��Ͻ�", tbProp={0,1677}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»���", tbProp={0,1678}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»�����", tbProp={0,1679}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»���", tbProp={0,1680}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»���", tbProp={0,1681}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»�ѥ", tbProp={0,1682}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»�����", tbProp={0,1683}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�»��½�", tbProp={0,1684}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1685}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1686}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1687}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1688}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1689}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1690}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1691}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����ѥ", tbProp={0,1692}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1693}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1694}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ�����", tbProp={0,1695}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ�����", tbProp={0,1696}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ��Ͻ�", tbProp={0,1697}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ�����", tbProp={0,1698}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ�����", tbProp={0,1699}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ���װ", tbProp={0,1700}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ�����", tbProp={0,1701}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ�ѥ", tbProp={0,1702}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ���׹", tbProp={0,1703}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�ϳ��½�", tbProp={0,1704}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ����", tbProp={0,1705}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ����", tbProp={0,1706}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ�Ͻ�", tbProp={0,1707}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ����", tbProp={0,1708}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ����", tbProp={0,1709}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ��װ", tbProp={0,1710}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ��", tbProp={0,1711}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷѥ", tbProp={0,1712}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ��׹", tbProp={0,1713}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮Ѫɷ�½�", tbProp={0,1714}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1715}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���Ĺ�", tbProp={0,1716}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1717}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���Ļ���", tbProp={0,1718}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���Ĳ���", tbProp={0,1719}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���ļ���", tbProp={0,1720}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���ķɵ�", tbProp={0,1721}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1722}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����׹", tbProp={0,1723}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1724}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1725}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����", tbProp={0,1726}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1727}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���黤��", tbProp={0,1728}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1729}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����", tbProp={0,1730}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�������", tbProp={0,1731}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1732}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������׹", tbProp={0,1733}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1734}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1735}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���ⷢ��", tbProp={0,1736}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1737}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮���⻤��", tbProp={0,1738}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1739}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�������", tbProp={0,1740}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1741}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1742}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮����׹", tbProp={0,1743}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1744}, nRate=0.004, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1745}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮����ͷ��", tbProp={0,1746}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1747}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ջ���", tbProp={0,1748}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1749}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮����ؤ��", tbProp={0,1750}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ղ���", tbProp={0,1751}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮����ѥ", tbProp={0,1752}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������׹", tbProp={0,1753}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1754}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս������", tbProp={0,1755}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս��ͷ��", tbProp={0,1756}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս���Ͻ�", tbProp={0,1757}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս������", tbProp={0,1758}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս������", tbProp={0,1759}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս��ؤ��", tbProp={0,1760}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս����", tbProp={0,1761}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս��ѥ", tbProp={0,1762}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս����׹", tbProp={0,1763}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮ս���½�", tbProp={0,1764}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ���Ȧ", tbProp={0,1765}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ��", tbProp={0,1766}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ��Ͻ�", tbProp={0,1767}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ껤��", tbProp={0,1768}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ�����", tbProp={0,1769}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ����", tbProp={0,1770}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ�ǹ", tbProp={0,1771}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ�ѥ", tbProp={0,1772}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ���", tbProp={0,1773}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�ӻ��½�", tbProp={0,1774}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1775}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�������", tbProp={0,1776}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1777}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���黤��", tbProp={0,1778}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1779}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�������", tbProp={0,1780}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���鵶", tbProp={0,1781}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮����ѥ", tbProp={0,1782}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1783}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1784}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����", tbProp={0,1785}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����", tbProp={0,1786}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1787}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1788}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ᷢ��", tbProp={0,1789}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�������", tbProp={0,1790}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ὣ", tbProp={0,1791}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1792}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1793}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1794}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ķ�", tbProp={0,1795}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���Ĺ�", tbProp={0,1796}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1797}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1798}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ķ���", tbProp={0,1799}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ĵ���", tbProp={0,1800}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���Ľ�", tbProp={0,1801}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1802}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1803}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1804}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1805}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���Ƶ���", tbProp={0,1806}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����Ͻ�", tbProp={0,1807}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���ƻ���", tbProp={0,1808}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮��������", tbProp={0,1809}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮���Ƶ���", tbProp={0,1810}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1811}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮����ѥ", tbProp={0,1812}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮������", tbProp={0,1813}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�����½�", tbProp={0,1814}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ���", tbProp={0,1815}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ�����", tbProp={0,1816}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ��Ͻ�", tbProp={0,1817}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ���", tbProp={0,1818}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ�����", tbProp={0,1819}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ�����", tbProp={0,1820}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ�����", tbProp={0,1821}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ�ѥ", tbProp={0,1822}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ���", tbProp={0,1823}, nRate=0.005, nQuality=1},	
		{szName="��Գ֮�Ʊ��½�", tbProp={0,1824}, nRate=0.005, nQuality=1},	
		{szName="������", tbProp={6,1,2352,1,0,0}, nRate=1},	
		{szName="��¹��", tbProp={6,1,2353,1,0,0}, nRate=1},	
		{szName="���", tbProp={6,1,2311,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="�������", tbProp={6,1,2355,1,0,0}, nRate=2},	
		{szName="��Ѫ��", tbProp={6,1,2117,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="������",tbProp={6,1,2115,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="���������", tbProp={6,1,2517,1,0,0}, nRate=3},	
		{szName="���������", tbProp={6,1,2520,1,0,0}, nRate=3},	
		{szName="������¶", tbProp={6,1,2266,1,0,0}, nRate=5},	
		{szName="ǧ����¶", tbProp={6,1,2267,1,0,0}, nRate=2},	
		{szName="������¶", tbProp={6,1,2268,1,0,0}, nRate=1},	
		{szName="������", tbProp={6,1,219,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="�չ���", tbProp={6,1,229,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="������", tbProp={6,1,230,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="������", tbProp={6,1,231,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="����", tbProp={6,1,232,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="�׹���", tbProp={6,1,233,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="�ɲ�¶���ر�", tbProp={6,1,1765,1,0,0}, nRate=4},	
		{szName="�������", tbProp={6,1,2105,1,0,0}, nRate=0.2},	
		{szName="�������", tbProp={6,1,2402,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="�׹���", tbProp={6,1,2255,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="ɽ������ͼ(1000��)", tbProp={6,1,2514,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="Į��������", tbProp={6,1,1448,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="������ʯ", tbProp={6,1,2125,1,0,0}, nRate=7.1},	
		{szName="�ɶ���ҩ", tbProp={6,1,30062,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="������ҩ", tbProp={6,1,30063,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="������ҩ", tbProp={6,1,30064,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="������ҩ", tbProp={6,1,30065,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="�꾩��ҩ", tbProp={6,1,30066,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="�ٰ���ҩ", tbProp={6,1,30067,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="������ҩ", tbProp={6,1,30068,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="����", nRate =5, nJxb=1000000},	
		{szName="����", nRate =2, nJxb=2000000},	
		{szName="����", nRate =0.5, nJxb=5000000},	
		{szName="����", nRate =0.2, nJxb=10000000},	
	},
}

TASK_LIMIT_USE_LAMBANGTINH 					= 2772
TASK_LIMIT_USE_HOANG_TU_BANGTINH		= 2773

function main(nItemIndex)

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("��Ʒ����ʹ�����ޣ��Զ�����.")
		return 0;
	end
	
	if (GetLevel() < 50) then
		Say("50�����ϲſ���ʹ�ô���Ʒ!",0)
		return 1
	end

	if CountFreeRoomByWH(2,3,1) < 1 then
		Talk(1, "", "���ı���������Ҫ2x3����!.");
		return 1
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if (P == 30059) then -- lam bang tinh
		if (GetTask(TASK_LIMIT_USE_LAMBANGTINH) >= 1000) then
			Say("��ʹ���������Ѵ�����!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_LAMBANGTINH, GetTask(TASK_LIMIT_USE_LAMBANGTINH)+1)
		tbAwardTemplet:GiveAwardByList(tbAwardLamBangTinh, "ʹ��������");
		return 0
	end
	
	if (P == 30060) then -- hoang bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("����Ʒ�Ѵ�ʹ������!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH)+2)
		tbAwardTemplet:GiveAwardByList(tbAwardHoangBangTinh, "ʹ�ûƱ���");
		return 0
	end
	
	if (P == 30061) then -- tu bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("����Ʒ�Ѵ�ʹ������!",0)
			return 1
		end
		tbAwardTemplet:GiveAwardByList(tbAwardTuBangTinh, "ʹ���ϱ���");
		return 0
	end
	
	Say("��Ʒ����ȷ��!",0)
	return 1
end
