--������(582)������ÿ��21��31����181,1636,3073
function main()
	mapindex = SubWorldID2Idx(181)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 582
	bosslvl = 95
	posx = 1636*32
	posy = 3073*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "������", 1)
	AddGlobalNews("��˵�嶾���������ɾ���������������ˮ������(204, 191). ")
end; 