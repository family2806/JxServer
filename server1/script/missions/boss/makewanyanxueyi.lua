--完颜雪衣(564)，生于每天21：05，在227,1504,3144
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 564
	bosslvl = 95
	posx = 1504*32
	posy = 3144*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "完颜雪衣", 1)
	AddGlobalNews("听说金国七公主完颜雪衣追踪端木睿到了西夏国的敦煌沙漠迷宫(188, 196) . ")
end; 