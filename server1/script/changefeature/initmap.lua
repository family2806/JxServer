
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\station.lua")
local tbNpcList = 
{
	{
		nNpcId = 950, 
		szName = "衣帽定制大师", 
		szScriptPath = "\\script\\changefeature\\feature_man.lua",
		nMapId = 934,
			
		nPosX = 50880,
		nPosY = 102752,
	},
	{
		nNpcId = 950, 
		szName = "衣帽定制助手", 
		szScriptPath = "\\script\\changefeature\\feature_man.lua",
		nMapId = 934,
		nPosX = 50080,
		nPosY = 103744,
	},
	{
		nNpcId = 625, 
		szName = "储物箱", 
		szScriptPath = "\\script\\changefeature\\npc\\box.lua",
		nMapId = 934,
		nPosX = 50112,
		nPosY = 106208,
	},
	{
		nNpcId = 393, 
		szName = "车夫", 
		szScriptPath = "\\script\\changefeature\\npc\\chefu.lua",
		nMapId = 934,
		
		nPosX = 49632,
		nPosY = 105696,
	},
}

function AddDailogNpc()
	for i=1, getn(%tbNpcList) do
		local tbNpc = %tbNpcList[i]
		basemission_CallNpc(tbNpc)
	end
end
