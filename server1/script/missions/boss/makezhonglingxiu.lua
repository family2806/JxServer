--������(567)������ÿ��00��05����224,1889,2973
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 567
	bosslvl = 95
	posx = 1889*32
	posy = 2973*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "������", 1)
	AddGlobalNews("���˿����������滨ʹ���������ڶػ�ɳĮ(236, 185)ɱ���̵̽���. ")
end; 