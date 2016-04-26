IncludeLib("FILESYS")
tbaddJinShanDao_NpcAndTrap = {}

tbaddJinShanDao_NpcAndTrap.npcfile		= "\\settings\\maps\\江南区\\西山屿\\npc.txt"

tbaddJinShanDao_NpcAndTrap.trapfile_r	= "\\settings\\maps\\江南区\\西山屿\\trap_right.txt"
tbaddJinShanDao_NpcAndTrap.trapscript_r	= "\\script\\江南区\\金山岛\\trap\\changestate1.lua"

tbaddJinShanDao_NpcAndTrap.trapfile_l	= "\\settings\\maps\\江南区\\西山屿\\trap_left.txt"
tbaddJinShanDao_NpcAndTrap.trapscript_l	= "\\script\\江南区\\金山岛\\trap\\changestate2.lua"

tbaddJinShanDao_NpcAndTrap.nMapId		= 342

tbaddJinShanDao_NpcAndTrap.tbDialogNpc	= 
{
	--npcid mapid nx ny script name
	{199-2, tbaddJinShanDao_NpcAndTrap.nMapId, 44160/32, 89728/32, "\\script\\江南区\\金山岛\\npc\\npc_tiejiang.lua","铁匠"},
	{627-2, tbaddJinShanDao_NpcAndTrap.nMapId, 44864/32, 90496/32, "\\script\\江南区\\金山岛\\obj\\box.lua","储物箱"},
	{242-2, tbaddJinShanDao_NpcAndTrap.nMapId, 37216/32, 76576/32, "\\script\\江南区\\金山岛\\npc\\boatman.lua","船夫"},
	{205-2, tbaddJinShanDao_NpcAndTrap.nMapId, 45408/32, 89504/32, "\\script\\江南区\\金山岛\\npc\\npc_yaofan.lua","药商"},	
}

function tbaddJinShanDao_NpcAndTrap:AddMons()
	local npcfile = self.npcfile
	if TabFile_Load(npcfile, npcfile) == 0 then
		print ("Error! Lost Map "..npcfile)
		return 0;
	end
	local tbMon =
	{
		{713-2, "伏波"},
		{714-2, "破浪"},
		{715-2, "乘风"}
	}
	local nRowCount = TabFile_GetRowCount(npcfile)
	for i=2, nRowCount do
		local nX = TabFile_GetCell(npcfile, i, 1)
		local nY = TabFile_GetCell(npcfile, i, 2)
		local nMonId = random(1,3)
		local nNpcIndex = AddNpc(tbMon[nMonId][1], 95, SubWorldID2Idx(self.nMapId), nX, nY, 0, tbMon[nMonId][2], 2)
	end		
end

function tbaddJinShanDao_NpcAndTrap:AddTrap(nMapId, trapfile, scriptfile)
	if TabFile_Load(trapfile, trapfile) == 0 then
		print ("Error! Lost Map "..trapfile)
		return 0;
	end
	local i = 1;
	local nRowCount = TabFile_GetRowCount(trapfile)
	for i=2,nRowCount do
		local nX = TabFile_GetCell(trapfile, i, 1)
		local nY = TabFile_GetCell(trapfile, i, 2)
		AddMapTrap(nMapId, nX, nY, scriptfile)
	end
end

function tbaddJinShanDao_NpcAndTrap:AddTrapR()
	self:AddTrap(self.nMapId, self.trapfile_r, self.trapscript_r);
end

function tbaddJinShanDao_NpcAndTrap:AddTrapL()
	self:AddTrap(self.nMapId, self.trapfile_l, self.trapscript_l);
end