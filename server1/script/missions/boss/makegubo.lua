--古柏(566)，生于每天17：05，在225,1546,3278
function main()
	mapindex = SubWorldID2Idx(225)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 566
	bosslvl = 95
	posx = 1546*32
	posy = 3278*32
	AddNpcEx(bossid,bosslvl,0,mapindex,posx,posy,1, "古柏", 1)
	AddGlobalNews("听说天王帮主左使古柏和天忍教的头目已出现在敦煌的沙漠迷宫(193, 204). ")
end; 