Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

YueGeDaoWorld = Game:new()
YueGeDaoWorld.szMapType = "月歌岛" --改变地图表示

YueGeDaoWorld.tbForbitItemType = --重载 违禁道具
{
	"TRANSFER","MATE"
}

YueGeDaoWorld.Player = {
	szPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaoplayer.lua",
	szClassName = "YueGeDaoPlayer",
}

YueGeDaoWorld.PlayerEnterTrapTime = {
}

YueGeDaoWorld.tbNpcTypeList = --npc的类型
{
	["月歌武卫 1"] = 
	{
		nNpcId = 1847,
		szName = "月歌武卫",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei1.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei1.lua",
	},
	["月歌武卫2"] = 
	{
		nNpcId = 1847,
		szName = "月歌武卫",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei2.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei2.lua",
	},
	["月歌岛主"] = 
	{
		nNpcId = 1849,
		szName = "月歌岛主",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegedaozhu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaozhu.lua",
	},
	["树木"] = 
	{
		nNpcId = 1861,
		szName = "树木",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shumu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shumu.lua",
	},
	["月歌剑侍"] = 
	{
		nNpcId = 1848,
		szName = "月歌剑侍",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegejianshi.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegejianshi.lua",
	},
	["石碑"] = 
	{
		nNpcId = 1865,
		szName = "石碑",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibei.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibei.lua",
	},
	["剑冢石碑"] = 
	{
		nNpcId = 1860,
		szName = "剑冢石碑",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibeiex.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibeiex.lua",
	},
	["剑痴"] = 
	{
		nNpcId = 1853,
		szName = "剑痴",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jianchi.txt",
	},
	["剑狂"] = 
	{
		nNpcId = 1854,
		szName = "剑狂",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jiankuang.txt",
	},
	["神志不清的武林人士"] = 
	{
		nNpcId = 1854,
		szName = "神志不清的武林人士",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shenzhibuqingdewulingrenshi.txt",
	},
	["月歌岛船夫"] = 
	{
		nNpcId = 240,
		szName = "月歌岛船夫",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\chuanfu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\chuanfu.lua",
	},
}
YueGeDaoWorld.tbTrapList = 
{
--	["A1"] =
--	{
--		szPosPath = "",--Trap点的坐标文件
--		szTrapFile = "",--Trap脚本的路径
--	},
}

function YueGeDaoWorld:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function YueGeDaoWorld:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end

YueGeDaoWorld:AssociateMap(968)
YueGeDaoWorld:SetForbitItem()
