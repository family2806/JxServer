tbTONGWAR_MAP = { 608, 609, 610, 611, 612, 613 }
tbTONGWAR_NPC = {
	{ 393, 1597, 3139, "车夫",		"\\script\\missions\\tongwar\\npc\\chefu.lua" },
	{ 625, 1590, 3132, "储物箱",	"\\script\\missions\\tongwar\\npc\\openbox.lua" },
	{ 389, 1580, 3151, "药店老板",		"\\script\\missions\\tongwar\\npc\\doctor.lua" },
--	{389, 1589, 3148, "trap", "\\script\\missions\\tongwar\\trap\\tongwar_trap.lua"}
	
}
TONGWAR_TRAPTXT = "\\settings\\maps\\tongwar\\signup_trap.txt"
function tongwar_addsignnpc()
local oldSubWorld = SubWorld
	for i = 1, getn( tbTONGWAR_MAP ) do
		local sidx = SubWorldID2Idx( tbTONGWAR_MAP[i] )
		if ( sidx >= 0 ) then
			SubWorld = sidx
			for j = 1, getn(tbTONGWAR_NPC) do
				local npcidx = AddNpc( tbTONGWAR_NPC[j][1], 1, sidx, tbTONGWAR_NPC[j][2]*32, tbTONGWAR_NPC[j][3]*32, 1, tbTONGWAR_NPC[j][4] )
				if (npcidx > 0) then
					SetNpcScript(npcidx, tbTONGWAR_NPC[j][5]);
				end
			end
			maphigh = GetTabFileHeight(TONGWAR_TRAPTXT)
			for j = 1, maphigh - 1 do
				x = GetTabFileData(TONGWAR_TRAPTXT, j + 1, 1);
				y = GetTabFileData(TONGWAR_TRAPTXT, j + 1, 2);
				AddMapTrap(tbTONGWAR_MAP[i], x,y, "\\script\\missions\\tongwar\\trap\\tongwar_trap.lua");
			end;
			SubWorld = oldSubWorld
		end
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	--THDNB10 调整时间add npc 使者 - Modified by DinhHQ - 20111019
	if (nDate >= 20120528 and nDate <= 20120603) then
		local sidx = SubWorldID2Idx(2);
		if (sidx >= 0) then
			SubWorld = sidx;
			local npcidx = AddNpc(53, 1, sidx, 2608*32,3496*32, 1, "天下第一帮使者");
			if (npcidx > 0) then
				SetNpcScript(npcidx, "\\script\\event\\tongwar\\npc_shizhe.lua");
			end;
		end;
	end;
end