--耶律辟离(563)，生于每天23：05，在226,1724,3227
function main()
	mapindex = SubWorldID2Idx(226)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 563
	bosslvl = 95
	posx = 1724*32
	posy = 3227*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "耶律辟离", 1)
	AddGlobalNews("听说天忍教的右使耶律辟离已经出现在敦煌的沙漠迷宫(215, 201). ")
end; 