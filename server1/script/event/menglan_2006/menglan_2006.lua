if (not __MENGYU06_H__) then
	__MENGYU06_H__ = 1;
Include([[\script\lib\coordinate.lua]]);

greatseed_configtab = {
	{37, 2, 50, "\\settings\\maps\\menglan_2006\\�꾩��������.txt",}, --�꾩����;
	{162, 3, 50, "\\settings\\maps\\menglan_2006\\������������.txt"},	--��������
	{80, 3, 50, "\\settings\\maps\\menglan_2006\\���ݶ�������.txt"},	--���ݶ���;
	{1, 1, 50, "\\settings\\maps\\menglan_2006\\������������.txt"},	--��������;
	{176, 2, 50, "\\settings\\maps\\menglan_2006\\�ٰ����ű���.txt"},	--�ٰ�����;
	{11, 2, 50, "\\settings\\maps\\menglan_2006\\�ɶ���������.txt"},	--�ɶ�����;
	{78, 3, 50, "\\settings\\maps\\menglan_2006\\������������.txt"},	--��������;
};

tab_NPCIdx = {{1126, "������", 1770}, {1127, "ľ����", 1771}, {1128, "ˮ����", 1772}, {1129, "������", 1773}, {1130, "������", 1774}}
TK_LOTUS_ALL = 1775;

SIMGER_LIMIT = 24;
TOGETHER_LIMIT = 12;

function ShowFlower()
	for i = 1, getn(greatseed_configtab) do
		local nMapIndex = SubWorldID2Idx(greatseed_configtab[i][1]);
		if (nMapIndex >= 0) then
			for j = 1, 5 do
				adddiagnpc(greatseed_configtab[i][4], nMapIndex, tab_NPCIdx[j][1], j);
			end;
		end;
	end;
end;

function adddiagnpc(szfile, nMapIndex, nItemid, nBegin)
	local addcount = 0;
	local count = gettabfileheight(szfile);
	local nCount = 0;
	
	for i = nBegin, count - 1, 5 do
		x = gettabfiledata(szfile, i + 1, 2);
		y = gettabfiledata(szfile, i + 1, 3);
		nItemIdx = DropItem(nMapIndex, x * 32, y * 32, -1, 6, 1, nItemid, 1, 0, 0, 0);
		nCount = nCount + 1;
	end;
	return addcount
end;

end; --// end of __MENGYU06_H__