--钟灵秀(567)，生于每天00：05，在224,1889,2973
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 567
	bosslvl = 95
	posx = 1889*32
	posy = 2973*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "钟灵秀", 1)
	AddGlobalNews("有人看见翠烟门梨花使者钟玲秀在敦煌沙漠(236, 185)杀天忍教的人. ")
end; 