--����Ʈ(568)������ÿ��16��05����19,3248,4278
function main()
	mapindex = SubWorldID2Idx(19)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 568
	bosslvl = 95
	posx = 3248*32
	posy = 4278*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "����Ʈ", 1)
	AddGlobalNews("���˿���ʧ�����Ǻ���Ʈ�����ڽ�������(406, 267) . ")
end; 