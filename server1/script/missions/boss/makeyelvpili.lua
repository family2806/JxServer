--Ү�ɱ���(563)������ÿ��23��05����226,1724,3227
function main()
	mapindex = SubWorldID2Idx(226)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 563
	bosslvl = 95
	posx = 1724*32
	posy = 3227*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "Ү�ɱ���", 1)
	AddGlobalNews("��˵���̵̽���ʹҮ�ɱ����Ѿ������ڶػ͵�ɳĮ�Թ�(215, 201). ")
end; 