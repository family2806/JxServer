--�ϲ���(583)������ÿ��22��31����204,1626,3379
function main()
	mapindex = SubWorldID2Idx(204)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 583
	bosslvl = 95
	posx = 1626*32
	posy = 3379*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "�ϲ���", 1)
	AddGlobalNews("���˿���ؤ��ִ�������ϲ����ڷ��춴(202, 210)׷ɱ��ͽ��Զ��")
end; 