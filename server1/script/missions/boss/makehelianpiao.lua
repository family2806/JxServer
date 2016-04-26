--何怜飘(568)，生于每天16：05，在19,3248,4278
function main()
	mapindex = SubWorldID2Idx(19)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 568
	bosslvl = 95
	posx = 3248*32
	posy = 4278*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "何怜飘", 1)
	AddGlobalNews("有人看见失魂落魄何怜飘出现在剑阁西南(406, 267) . ")
end; 