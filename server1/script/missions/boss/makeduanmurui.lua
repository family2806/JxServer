--��ľ�(565)������ÿ��22��05����227,1630,3276
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 565
	bosslvl = 95
	posx = 1630*32
	posy = 3276*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "��ľ�", 1)
	AddGlobalNews("���˿�����ľ����ܳ����ڶػ�ɳĮ�Թ�(203, 204). ")
end; 