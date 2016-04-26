--蓝伊伊(582)，生于每天21：31，在181,1636,3073
function main()
	mapindex = SubWorldID2Idx(181)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 582
	bosslvl = 95
	posx = 1636*32
	posy = 3073*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "蓝伊伊", 1)
	AddGlobalNews("听说五毒教主黑面郎君和蓝依依正在两水洞练功(204, 191). ")
end; 