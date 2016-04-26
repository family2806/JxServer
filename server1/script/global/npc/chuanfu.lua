Include("\\script\\dailogsys\\dailogsay.lua")

local tbPos =
{
	{"<#15751>", 235, 1519, 3237},
	{"<#15752>", 236, 1519, 3237},
	{"<#15753>", 237, 1519, 3237},
	{"<#15754>", 238, 1519, 3237},
}

function main()
	local szTitle = "<npc><#16093>"
	local tbOpt = {}
	local nMapId = GetWorldPos()
	for i=1, getn(%tbPos) do
		if nMapId ~= %tbPos[i][2] then
			tinsert(tbOpt, {%tbPos[i][1], go, {i}})
		end
	end
	tinsert(tbOpt, {"<#16078>"}) 
	CreateNewSayEx(szTitle, tbOpt)
end

function go(nIndex)
	NewWorld(%tbPos[nIndex][2], %tbPos[nIndex][3], %tbPos[nIndex][4])
end