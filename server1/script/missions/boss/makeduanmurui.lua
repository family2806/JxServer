--端木睿(565)，生于每天22：05，在227,1630,3276
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 565
	bosslvl = 95
	posx = 1630*32
	posy = 3276*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "端木睿", 1)
	AddGlobalNews("有人看见端木睿秘密出现在敦煌沙漠迷宫(203, 204). ")
end; 