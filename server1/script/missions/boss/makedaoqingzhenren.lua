--道清真人(562)，生于每天20：05，在224,1596,2978
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 562
	bosslvl = 95
	posx = 1596*32
	posy = 2978*32
	AddNpcEx(bossid,bosslvl,4,mapindex,posx,posy,1, "道清真人", 1)
	AddGlobalNews("听说敦煌沙漠的道清真人(199, 186) 惩奸灭恶的人 ")
end; 