--孟苍浪(583)，生于每天22：31，在204,1626,3379
function main()
	mapindex = SubWorldID2Idx(204)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 583
	bosslvl = 95
	posx = 1626*32
	posy = 3379*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "孟苍浪", 1)
	AddGlobalNews("有人看见丐帮执法长老孟苍浪在飞天洞(202, 210)追杀叛徒孟远才")
end; 