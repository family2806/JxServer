IncludeLib("FILESYS")

tangburan = "\\settings\\maps\\西北北区\\莫高窟\\tangburanboss.txt"

wangzuo = "\\settings\\maps\\东北区\\漠北草原\\wangzuoboss.txt"
qingxiaoshitai = "\\settings\\maps\\东北区\\漠北草原\\qingxiaoshitaiboss.txt"
shansinan = "\\settings\\maps\\东北区\\漠北草原\\shansinanboss.txt"

yanxiaoqian = "\\settings\\maps\\中原北区\\风陵渡北岸\\yanxiaoqianboss.txt"
baiyingying = "\\settings\\maps\\中原北区\\风陵渡北岸\\baiyingyingboss.txt"
herenwo = "\\settings\\maps\\中原北区\\风陵渡南岸\\herenwoboss.txt"

xuanjizi = "\\settings\\maps\\东北区\\长白山麓\\xuanjiziboss.txt"
xuanjuedashi = "\\settings\\maps\\东北区\\长白山麓\\xuanjuedashiboss.txt"

hanmeng = "\\settings\\maps\\江南区\\西山屿\\hanmengboss.txt"

DAMAHUFILE = "\\settings\\maps\\damahuboss.txt"
DAMAHUMAP = {321, 321, 322, 340, 322, 340, 321}
DAMAHUID = {
			{751, 0},
			{752, 0},
			{753, 1},
			{754, 1},
			{755, 2},
			{756, 2},
			{757, 3},
			{758, 3},
			{759, 4},
			{760, 4}
			}


function main()
	--19:30 
	if (tonumber(date("%H")) == 19) then
		mb_mapindex = SubWorldID2Idx(341)
		if (mb_mapindex >= 0 ) then
			posx3, posy3 = getadata(qingxiaoshitai)--漠北草原	19：30
			AddNpcEx(743, 95, 2, mb_mapindex, posx3*32, posy3*32, 1, "清绝师太", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS3“清绝师太”于漠北草原x："..posx3..",y：".. posy3)
		end

		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx5, posy5 = getadata(yanxiaoqian)--风陵渡北岸336	--中原北区		19：30
			AddNpcEx(744, 95, 2, fl_mapindex, posx5*32, posy5*32, 1, "嫣晓倩", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS5“嫣晓倩”于风陵渡北岸x："..posx5..",y：".. posy5)
		end
	
		fl_mapindex = SubWorldID2Idx(336)
		if (fl_mapindex >= 0 ) then
			posx7, posy7 = getadata(herenwo)--风陵渡南岸336	--中原北区	19：30
			AddNpcEx(745, 95, 3, fl_mapindex, posx7*32, posy7*32, 1, "何人我", 1)			
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS7“何人我”于风陵渡南岸x："..posx7..",y：".. posy7)	
		end;
	
		cbn_mapindex = SubWorldID2Idx(321)--长白山南321		--东北区		19：30
		if (cbn_mapindex >= 0) then
			posx8, posy8 = getadata(xuanjizi)
			AddNpcEx(747, 95, 4, cbn_mapindex, posx8*32, posy8*32, 1, "璇玑子", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS8“璇玑子”于长白山南x："..posx8..",y：".. posy8)	
		end
	end
	
	--21:00
	if (tonumber(date("%H")) == 21) then
		mb_mapindex = SubWorldID2Idx(341)--漠北草原	21：00
		if (mb_mapindex >= 0 ) then
			posx4, posy4 = getadata(shansinan)
			AddNpcEx(746, 95, 4, mb_mapindex, posx4*32, posy4*32, 1, "单思南", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS4“单思南”于漠北草原x："..posx4..",y：".. posy4)
		end;
	
		fl_mapindex = SubWorldID2Idx(336)--风陵渡北岸	21：00
		if (fl_mapindex >= 0 ) then
			posx6, posy6 = getadata(baiyingying)
			AddNpcEx(742, 95, 1, fl_mapindex, posx6*32, posy6*32, 1, "白莹莹", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS6“白莹莹”于风陵渡北岸x："..posx6..",y：".. posy6)
		end

		xsy_mapindex = SubWorldID2Idx(342)		--西山屿342		江南区		21：00
		if (xsy_mapindex >= 0) then
			posx10, posy10 = getadata(hanmeng)
			AddNpc(748, 95, xsy_mapindex, posx10*32, posy10*32, 1, "韩蒙", 1)
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS9“韩蒙”于西山屿x："..posx10..",y：".. posy10)
		end
		
		damahu_boss()	--黄金boss大马虎，随机出现在莫高窟、长白山南、长白山北
	end
	
	--23:00
	if (tonumber(date("%H")) == 23) then
		mg_mapindex = SubWorldID2Idx(340)--莫高窟340	--西北北区	23：00
		if (mg_mapindex >= 0 ) then
			posx1, posy1 = getadata(tangburan)
			AddNpcEx(741, 95, 1, mg_mapindex, posx1*32, posy1*32, 1, "唐不染", 1)		
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS1“唐不染”于莫高窟x："..posx1..",y：".. posy1)
		end;

		mb_mapindex = SubWorldID2Idx(341)--漠北草原341	--东北	23：00
		if (mb_mapindex >= 0 ) then
			posx2, posy2 = getadata(wangzuo)
			AddNpcEx(739, 95, 0, mb_mapindex, posx2*32, posy2*32, 1, "王佐", 1)			
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS2“王佐”于漠北草原x："..posx2..",y：".. posy2)
		 end
	 
		cbb_mapindex = SubWorldID2Idx(322)--长白山北322		--东北区		23：00
		if (cbb_mapindex >= 0) then
			posx9, posy9 = getadata(xuanjuedashi)
			AddNpcEx(740, 95, 0, cbb_mapindex, posx9*32, posy9*32, 1, "玄觉大师", 1)	
			WriteLog("时间"..date("%H%M%S").."：产生黄金BOSS9“玄觉大师”于长白山北x："..posx9..",y：".. posy9)
		end
	end
end
	
		
		
function getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function damahu_boss()
	--随机从三个地图抽出一个
	local d = tonumber(date("%d"))
	local m = tonumber(date("%m"))
	local y = tonumber(date("%y"))
	local w = tonumber(date("%W"))
	local xx = tonumber(date("%w"))
	local ss = d + m + y + w + xx
	local zz = mod(xx, 7)
	if (zz == 0) then
		zz = 7
	end
	damahu_mapid = DAMAHUMAP[zz]
    damahu_mapindex = SubWorldID2Idx(damahu_mapid)
    if (damahu_mapid == 321) then
    	mapname = "长白山南"
    	file = "\\settings\\maps\\东北区\\长白山麓\\xuanjiziboss.txt"
   elseif (damahu_mapid == 322) then
    	mapname = "长白山北"
    	file = "\\settings\\maps\\东北区\\长白山麓\\xuanjuedashiboss.txt"
    elseif (damahu_mapid == 340) then
    	mapname = "莫高窟"
    	file = "\\settings\\maps\\西北北区\\莫高窟\\tangburanboss.txt"
    end
    
    if (damahu_mapindex >= 0) then
    --随机设置大马虎得五行属性、和模版id
	rannum = random(10)
    	posx,posy =getadata(file)
    	local npcidx = AddNpcEx(DAMAHUID[rannum][1], 95, DAMAHUID[rannum][2], damahu_mapindex, posx*32, posy*32, 1, "大马虎", 1)
    	SetNpcDeathScript(npcidx, "\\script\\missions\\boss\\bossdeath.lua");
	WriteLog("时间"..date("%H%M%S")..": 出现黄金BOSS'大马虎' mapid:"..damahu_mapid..", 坐标x:"..posx..", y:".. posy..". 大马虎ID 是"..DAMAHUID[rannum][1]..", 五行属性:"..DAMAHUID[rannum][2])
	AddGlobalNews("大马虎出现在"..mapname.." ("..floor(posx/8)..","..floor(posy/16)..")")
	end
end
