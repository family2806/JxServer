--��������(562)������ÿ��20��05����224,1596,2978
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 562
	bosslvl = 95
	posx = 1596*32
	posy = 2978*32
	AddNpcEx(bossid,bosslvl,4,mapindex,posx,posy,1, "��������", 1)
	AddGlobalNews("��˵�ػ�ɳĮ�ĵ�������(199, 186) �ͼ������� ")
end; 