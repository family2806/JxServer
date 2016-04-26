Include("\\script\\activitysys\\config\\22\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--�ſ��ƶһ�����
function pActivity:AddDukangjiuAward(TSK_EXP_A,TSK_DATE_A,nCount)
	--��鱳���Ƿ�������һ��1*1�Ŀ�λ
	if(CalcFreeItemCellCount() < 1) then
		Say("װ�������λ��������Ҫ1*1��λ", 0);
		return
	end
	--�ȴӱ����п۳��ſ���
	if (ConsumeItem(3, nCount, 6,1,2572,-1) ~= 1) then
		return
	end
	
	--����Ӧ�üӵľ���
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
	--������
	local tbAward = 
	{
		{
			[1] = {nExp = nBigRateExp},
			[2] = {szName="����������", tbProp={6,1,2573,1,0,0},nCount = 3,nExpiredTime=20101213},
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
			[2] = {szName="����������", tbProp={6,1,2573,1,0,0},nCount = 6,nExpiredTime=20101213},
			
			[3] = 
			{
				pFun = function (tbItem, nItemCount, szLogTitle)
					%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, %nSmallRateExp * nItemCount)
				end
			},
			nRate = 20,
		}
	}
	tbAwardTemplet:GiveAwardByRate(tbAward, "������ȡ�ſ���")
	Say("�þƣ��þƣ�������ô��������ôТ���ĵ��ӡ����ӣ�����һЩ����������������")
end

--��˿������õ�����
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
	tbAwardTemplet:GiveAwardByRate(tbAward, "������ȡ˿�����")
end

function pActivity:CheckFreeRoom(nWidth, nHeight, nCount, szMsg)
	if(CountFreeRoomByWH(nWidth,nHeight,1) >= nCount) then	
		return 1
	else
		szMsg = format("װ�����㣬������Ҫװ��ʣ��%d %d*%d ��λ", nCount, nWidth, nHeight)
		Say(szMsg, 0)
	end	
end

--���������õ�����
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
		{szName="��Գ�ǻ�����", tbProp={0,1595}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ�ɮñ", tbProp={0,1596}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ��Ͻ�", tbProp={0,1597}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻۻ���", tbProp={0,1598}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ�����", tbProp={0,1599}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ�����", tbProp={0,1600}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ۲���", tbProp={0,1601}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ�ɮЬ", tbProp={0,1602}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ���׹", tbProp={0,1603}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ǻ��½�", tbProp={0,1604}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ������", tbProp={0,1605}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ��ɮñ", tbProp={0,1606}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ���Ͻ�", tbProp={0,1607}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ������", tbProp={0,1608}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ������", tbProp={0,1609}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ������", tbProp={0,1610}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ��ɮ��", tbProp={0,1611}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ��ɮЬ", tbProp={0,1612}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ����׹", tbProp={0,1613}, nQuality=1, nRate=0.002},	
		{szName="��ԳԲ���½�", tbProp={0,1614}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1615}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ɮñ", tbProp={0,1616}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1617}, nQuality=1, nRate=0.002},	
		{szName="��Գ���Ļ���", tbProp={0,1618}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1619}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1620}, nQuality=1, nRate=0.002},	
		{szName="��Գ���Ľ䵶", tbProp={0,1621}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ɮЬ", tbProp={0,1622}, nQuality=1, nRate=0.002},	
		{szName="��Գ������׹", tbProp={0,1623}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1624}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1625}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����", tbProp={0,1626}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1627}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1628}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1629}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1630}, nQuality=1, nRate=0.002},	
		{szName="��Գ���촸", tbProp={0,1631}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ѥ", tbProp={0,1632}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1633}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1634}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1635}, nQuality=1, nRate=0.002},	
		{szName="��Գ���ƿ�", tbProp={0,1636}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1637}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1638}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1639}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1640}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ǹ", tbProp={0,1641}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ѥ", tbProp={0,1642}, nQuality=1, nRate=0.002},	
		{szName="��Գ������׹", tbProp={0,1643}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1644}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ������", tbProp={0,1645}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ�ۿ�", tbProp={0,1646}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ���Ͻ�", tbProp={0,1647}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ������", tbProp={0,1648}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ������", tbProp={0,1649}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ����", tbProp={0,1650}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ�۱���", tbProp={0,1651}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ��ѥ", tbProp={0,1652}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ����׹", tbProp={0,1653}, nQuality=1, nRate=0.002},	
		{szName="��ԳӢ���½�", tbProp={0,1654}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1655}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1656}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1657}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1658}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1659}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ɴ��", tbProp={0,1660}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1661}, nQuality=1, nRate=0.002},	
		{szName="��Գ����Ь", tbProp={0,1662}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1663}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1664}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1665}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1666}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1667}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1668}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1669}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1670}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1671}, nQuality=1, nRate=0.002},	
		{szName="��Գ����Ь", tbProp={0,1672}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1673}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1674}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»�����", tbProp={0,1675}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»���", tbProp={0,1676}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»��Ͻ�", tbProp={0,1677}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»���", tbProp={0,1678}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»�����", tbProp={0,1679}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»���", tbProp={0,1680}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»���", tbProp={0,1681}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»�ѥ", tbProp={0,1682}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»�����", tbProp={0,1683}, nQuality=1, nRate=0.002},	
		{szName="��Գ�»��½�", tbProp={0,1684}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1685}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1686}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1687}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1688}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1689}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1690}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ԧ�쵶", tbProp={0,1691}, nQuality=1, nRate=0.002},	
		{szName="��Գ����ѥ", tbProp={0,1692}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1693}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1694}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ�����", tbProp={0,1695}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ�����", tbProp={0,1696}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ��Ͻ�", tbProp={0,1697}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ�����", tbProp={0,1698}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ�����", tbProp={0,1699}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ���װ", tbProp={0,1700}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ�����", tbProp={0,1701}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ�ѥ", tbProp={0,1702}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ���׹", tbProp={0,1703}, nQuality=1, nRate=0.002},	
		{szName="��Գ�ϳ��½�", tbProp={0,1704}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ����", tbProp={0,1705}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ����", tbProp={0,1706}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ�Ͻ�", tbProp={0,1707}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ����", tbProp={0,1708}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ����", tbProp={0,1709}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ��װ", tbProp={0,1710}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ��", tbProp={0,1711}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷѥ", tbProp={0,1712}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ��׹", tbProp={0,1713}, nQuality=1, nRate=0.002},	
		{szName="��ԳѪɷ�½�", tbProp={0,1714}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1715}, nQuality=1, nRate=0.002},	
		{szName="��Գ���Ĺ�", tbProp={0,1716}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1717}, nQuality=1, nRate=0.002},	
		{szName="��Գ���Ļ���", tbProp={0,1718}, nQuality=1, nRate=0.002},	
		{szName="��Գ���Ĳ���", tbProp={0,1719}, nQuality=1, nRate=0.002},	
		{szName="��Գ���ļ���", tbProp={0,1720}, nQuality=1, nRate=0.002},	
		{szName="��Գ���ķɵ�", tbProp={0,1721}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1722}, nQuality=1, nRate=0.002},	
		{szName="��Գ���Ĵ�", tbProp={0,1723}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1724}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1725}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����", tbProp={0,1726}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1727}, nQuality=1, nRate=0.002},	
		{szName="��Գ���黤��", tbProp={0,1728}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1729}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����", tbProp={0,1730}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1731}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1732}, nQuality=1, nRate=0.002},	
		{szName="��Գ������׹", tbProp={0,1733}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1734}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1735}, nQuality=1, nRate=0.002},	
		{szName="��Գ���ⷢ��", tbProp={0,1736}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����Ͻ�", tbProp={0,1737}, nQuality=1, nRate=0.002},	
		{szName="��Գ���⻤��", tbProp={0,1738}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1739}, nQuality=1, nRate=0.002},	
		{szName="��Գ�������", tbProp={0,1740}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1741}, nQuality=1, nRate=0.002},	
		{szName="��Գ������", tbProp={0,1742}, nQuality=1, nRate=0.002},	
		{szName="��Գ���ⴸ", tbProp={0,1743}, nQuality=1, nRate=0.002},	
		{szName="��Գ�����½�", tbProp={0,1744}, nQuality=1, nRate=0.002},	
		{szName="��Գ��������", tbProp={0,1745}, nQuality=1, nRate=0.0025},	
		{szName="��Գ����ͷ��", tbProp={0,1746}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����Ͻ�", tbProp={0,1747}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ջ���", tbProp={0,1748}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��������", tbProp={0,1749}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ո���", tbProp={0,1750}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ղ���", tbProp={0,1751}, nQuality=1, nRate=0.0025},	
		{szName="��Գ����ѥ", tbProp={0,1752}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������׹", tbProp={0,1753}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����½�", tbProp={0,1754}, nQuality=1, nRate=0.0025},	
		{szName="��Գս������", tbProp={0,1755}, nQuality=1, nRate=0.0025},	
		{szName="��Գս��ͷ��", tbProp={0,1756}, nQuality=1, nRate=0.0025},	
		{szName="��Գս���Ͻ�", tbProp={0,1757}, nQuality=1, nRate=0.0025},	
		{szName="��Գս������", tbProp={0,1758}, nQuality=1, nRate=0.0025},	
		{szName="��Գս������", tbProp={0,1759}, nQuality=1, nRate=0.0025},	
		{szName="��Գս������", tbProp={0,1760}, nQuality=1, nRate=0.0025},	
		{szName="��Գս����", tbProp={0,1761}, nQuality=1, nRate=0.0025},	
		{szName="��Գս��ѥ", tbProp={0,1762}, nQuality=1, nRate=0.0025},	
		{szName="��Գս����׹", tbProp={0,1763}, nQuality=1, nRate=0.0025},	
		{szName="��Գս���½�", tbProp={0,1764}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���Ȧ", tbProp={0,1765}, nQuality=1, nRate=0.0025},	
		{szName="��Գ����", tbProp={0,1766}, nQuality=1, nRate=0.0025},	
		{szName="��Գ����Ͻ�", tbProp={0,1767}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��껤��", tbProp={0,1768}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�������", tbProp={0,1769}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������", tbProp={0,1770}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ǹ", tbProp={0,1771}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ѥ", tbProp={0,1772}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����", tbProp={0,1773}, nQuality=1, nRate=0.0025},	
		{szName="��Գ����½�", tbProp={0,1774}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��������", tbProp={0,1775}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�������", tbProp={0,1776}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����Ͻ�", tbProp={0,1777}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���黤��", tbProp={0,1778}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��������", tbProp={0,1779}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�������", tbProp={0,1780}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���鵶", tbProp={0,1781}, nQuality=1, nRate=0.0025},	
		{szName="��Գ����ѥ", tbProp={0,1782}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������", tbProp={0,1783}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����½�", tbProp={0,1784}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����", tbProp={0,1785}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����", tbProp={0,1786}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����Ͻ�", tbProp={0,1787}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������", tbProp={0,1788}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ᷢ��", tbProp={0,1789}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�������", tbProp={0,1790}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ὣ", tbProp={0,1791}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������", tbProp={0,1792}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��������", tbProp={0,1793}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����½�", tbProp={0,1794}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ķ�", tbProp={0,1795}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���Ĺ�", tbProp={0,1796}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����Ͻ�", tbProp={0,1797}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������", tbProp={0,1798}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ķ���", tbProp={0,1799}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ĵ���", tbProp={0,1800}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���Ľ�", tbProp={0,1801}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������", tbProp={0,1802}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��������", tbProp={0,1803}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����½�", tbProp={0,1804}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��������", tbProp={0,1805}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���Ƶ���", tbProp={0,1806}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����Ͻ�", tbProp={0,1807}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ƻ���", tbProp={0,1808}, nQuality=1, nRate=0.0025},	
		{szName="��Գ��������", tbProp={0,1809}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���Ƶ���", tbProp={0,1810}, nQuality=1, nRate=0.0025},	
		{szName="��Գ���ƽ�ָ", tbProp={0,1811}, nQuality=1, nRate=0.0025},	
		{szName="��Գ����ѥ��", tbProp={0,1812}, nQuality=1, nRate=0.0025},	
		{szName="��Գ������", tbProp={0,1813}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�����½�", tbProp={0,1814}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ���", tbProp={0,1815}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ�����", tbProp={0,1816}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ��Ͻ�", tbProp={0,1817}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ���", tbProp={0,1818}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ�����", tbProp={0,1819}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ�����", tbProp={0,1820}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ�����", tbProp={0,1821}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ�ѥ", tbProp={0,1822}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ���", tbProp={0,1823}, nQuality=1, nRate=0.0025},	
		{szName="��Գ�Ʊ��½�", tbProp={0,1824}, nQuality=1, nRate=0.0025},	
		{szName="��Ԫ��¶", tbProp={6,1,2312,1,0,0}, nCount=1, nRate=4},	
		{szName="�������", tbProp={6,1,2355,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="��Ѫ��", tbProp={6,1,2117,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="������", tbProp={6,1,2115,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="ɱ������", tbProp={6,1,2339,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="ɽ������ͼ (1000��)", tbProp={6,1,2514,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="Į��������", tbProp={6,1,1448,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="���", tbProp={6,1,2311,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="������¶", tbProp={6,1,2266,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="���ư׾���", tbProp={6,1,1157,1,0,0}, nCount=1, nRate=4},	
		{szName="�쾫�׾���", tbProp={6,1,2183,1,0,0}, nCount=1, nRate=2},	
		{szName="ǧ����¶", tbProp={6,1,2267,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="������¶", tbProp={6,1,2268,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="���������", tbProp={6,1,2517,1,0,0}, nCount=1, nRate=5},	
		{szName="���������", tbProp={6,1,2520,1,0,0}, nCount=1, nRate=5},	
		{szName="�׹���", tbProp={6,1,2255,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="�����ɲ�¶", tbProp={6,1,1181,1,0,0}, nCount=1, nRate=5},	
		{szName="�������", tbProp={6,1,2402,1,0,0}, nCount=1, nRate=14.6, nExpiredTime=20101220},	
		{szName="���丣������", tbProp={6,1,1817,1,0,0}, nCount=1, nRate=10},	
		{szName="����", nJxb =1000000, nRate=10},	
		{szName="����", nJxb =2000000, nRate=2},	
		{szName="����", nJxb =5000000, nRate=1},	
		{szName="����", nJxb =10000000, nRate=0.5},	
		{szName="һ��Ǭ����", tbProp={6,1,2126,1,0,0}, nCount=1, nRate=0.2, nExpiredTime=43200},	
		{szName="������", tbProp={6,1,2104,1,0,0}, nCount=1, nRate=0.2},	
		{szName="�����������", tbProp={6,1,1781,1,0,0}, nCount=1, nRate=3, tbParam={60}},	

	}
	tbAwardTemplet:GiveAwardByList(tbAward, "��ɫ�������")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "��ɫ���EXP����")
end

--����ҩ����õ�����
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
		{szName="��Գ��", tbProp={6,1,2351,1,0,0}, nRate=1, nCount=1},	
		{szName="��Ԫ��¶", tbProp={6,1,2312,1,0,0}, nRate=4, nCount=5},	
		{szName="������", tbProp={6,1,2256,1,0,0}, nRate=5, nCount=5, nExpiredTime=20101220},	
		{szName="�����ɲ�¶", tbProp={6,1,1181,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="�������", tbProp={6,1,2402,1,0,0}, nRate=17.7, nCount=5, nExpiredTime=20101220},	
		{szName="������¶", tbProp={6,1,2268,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="������ʻ�", tbProp={6,1,2265,1,0,0}, nRate=1, nCount=1},	
		{szName="ǧ�����ǲ�", tbProp={6,1,1675,1,0,0}, nRate=1, nCount=1},	
		{szName="���ư׾���", tbProp={6,1,1157,1,0,0}, nRate=14, nCount=1},	
		{szName="�쾫�׾���", tbProp={6,1,2183,1,0,0}, nRate=6, nCount=1},	
		{szName="����", nJxb =10000000, nRate=5},	
		{szName="����", nJxb =20000000, nRate=2},	
		{szName="����", nJxb =50000000, nRate=1},	
		{szName="����", nJxb =100000000, nRate=0.2},	
		{szName="һ��Ǭ����", tbProp={6,1,2126,1,0,0}, nRate=2, nCount=1, nExpiredTime=43200},	
		{szName="Ǭ��˫����", tbProp={6,1,2219,1,0,0}, nRate=0.1, nCount=1, nExpiredTime=86400},	
		{szName="���������", tbProp={6,1,2517,1,0,0}, nRate=5, nCount=5},	
		{szName="���������", tbProp={6,1,2520,1,0,0}, nRate=5, nCount=5},	
		{szName="������", tbProp={6,1,2104,1,0,0}, nRate=3, nCount=1},	
		{szName="�������", tbProp={6,1,2105,1,0,0}, nRate=1, nCount=1},	
		{szName="�����������", tbProp={6,1,1781,1,0,0}, nRate=6, nCount=5, tbParam={60}},	
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "��ҩ�������")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "��ҩ���EXP����")
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
	
	if (PlayerFunLib:CheckTaskDaily(TSK_Date_Give_NSHB,8,"ÿ��ֻ����8����ɫ���!","<") ~= 1) then
			return
	end
	if (ConsumeEquiproomItem(1, 6,1,2578,-1) ~= 1) then
		return
	end
	PlayerFunLib:AddTaskDaily(TSK_Date_Give_NSHB,1)
	AddOwnExp(nEXP_Give_NSHB)
	Msg2Player("���� 8000000 ����")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 20112010"..GetAccount().."\t"..GetName().."\t".."����ɫ���")
end
