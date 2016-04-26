tbDEFENCE_SIGNMAP = { 518, 519 }
tbCITYDEFENCENPC = {
	{ 393, 1597, 3139, "����", 		"\\script\\missions\\newcitydefence\\npc\\chefu.lua" },
	{ 625, 1590, 3132, "������", 	"\\script\\missions\\newcitydefence\\npc\\cd_box.lua" },
	{ 48, 1565, 3124, "�سǽ���", 	"\\script\\missions\\newcitydefence\\npc\\cd_signnpc.lua" },
	{ 62, 1563,3130, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1565,3133, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1567,3136, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1569,3139, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1571,3142, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1569,3123, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1571,3126, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1573,3129, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1575,3132, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
	{ 62, 1577,3135, "ʿ��", 		"\\script\\missions\\newcitydefence\\npc\\cd_walkon.lua" },
}

tbDEFENCENPC_ID = {
	{ 393, 625, 48, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62 },
	{ 393, 625, 50, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61 }
}
function cd_addsignnpc()
local oldSubWorld = SubWorld
	for i = 1, getn( tbDEFENCE_SIGNMAP ) do
		sidx = SubWorldID2Idx( tbDEFENCE_SIGNMAP[i] )
		if ( sidx >= 0 ) then
			SubWorld = sidx
			for j = 1, getn(tbCITYDEFENCENPC) do
				local npcidx = AddNpc( tbDEFENCENPC_ID[i][j], 1, sidx, tbCITYDEFENCENPC[j][2]*32, tbCITYDEFENCENPC[j][3]*32, 1, tbCITYDEFENCENPC[j][4] )
				if (npcidx > 0) then
					SetNpcScript(npcidx, tbCITYDEFENCENPC[j][5]);
				end
			end
			SubWorld = oldSubWorld
		end
	end
end