--����ѩ��(564)������ÿ��21��05����227,1504,3144
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 564
	bosslvl = 95
	posx = 1504*32
	posy = 3144*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "����ѩ��", 1)
	AddGlobalNews("��˵����߹�������ѩ��׷�ٶ�ľ������Ĺ��Ķػ�ɳĮ�Թ�(188, 196) . ")
end; 