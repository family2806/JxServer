Include("\\script\\lib\\baseclass.lua")
Include("\\script\\missions\\basemission\\lib.lua")

function AddEnterNpc()
	local szConfigPath = "\\settings\\maps\\tianchimijing\\common\\tianchientrance.txt"
	local nTmp = TabFile_Load(szConfigPath, szConfigPath)
	local nX = tonumber(TabFile_GetCell(szConfigPath, 2, "TRAPX"))
	local nY = tonumber(TabFile_GetCell(szConfigPath, 2, "TRAPY"))
	local tbNpc = {
		szName = "天池秘境接引人", 
		nLevel = 95,
		nMapId = 934,
		nPosX = nX,
		nPosY = nY,
		nNpcId = 312,
		nIsBoss = 0,
		szScriptPath = "\\script\\missions\\tianchimijing\\floor1\\floor1_enternpc.lua"
	}
	basemission_CallNpc(tbNpc)
end


