--Hµ Linh Phiªu(568)£¬ÉúÓÚÃ¿Ìì16£º05£¬ÔÚ19,3248,4278
function main()
	mapindex = SubWorldID2Idx(19)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 568
	bosslvl = 95
	posx = 3248*32
	posy = 4278*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "Hµ Linh Phiªu", 1)
	AddGlobalNews("ÓĞÈË¿´¼ûÊ§»êÂäÆÇHµ Linh Phiªu³öÏÖÔÚ½£¸óÎ÷ÄÏ(406, 267) . ")
end; 