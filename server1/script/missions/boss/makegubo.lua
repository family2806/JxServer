--C� B�ch(566)������ÿ��17��05����225,1546,3278
function main()
	mapindex = SubWorldID2Idx(225)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 566
	bosslvl = 95
	posx = 1546*32
	posy = 3278*32
	AddNpcEx(bossid,bosslvl,0,mapindex,posx,posy,1, "C� B�ch", 1)
	AddGlobalNews("��˵����������ʹC� B�ch�����̵̽�ͷĿ�ѳ����ڶػ͵�ɳĮ�Թ�(193, 204). ")
end; 