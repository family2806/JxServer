--Cæ B¸ch(566)£¬ÉúÓÚÃ¿Ìì17£º05£¬ÔÚ225,1546,3278
function main()
	mapindex = SubWorldID2Idx(225)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 566
	bosslvl = 95
	posx = 1546*32
	posy = 3278*32
	AddNpcEx(bossid,bosslvl,0,mapindex,posx,posy,1, "Cæ B¸ch", 1)
	AddGlobalNews("ÌıËµÌìÍõ°ïÖ÷×óÊ¹Cæ B¸chºÍÌìÈÌ½ÌµÄÍ·Ä¿ÒÑ³öÏÖÔÚ¶Ø»ÍµÄÉ³Ä®ÃÔ¹¬(193, 204). ")
end; 