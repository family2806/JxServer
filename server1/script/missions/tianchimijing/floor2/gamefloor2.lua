Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor2 = Game:new()
GameFloor2.szMapType = "天池秘境第2层" --改变地图表示
GameFloor2.tbForbitItemType = --重载 违禁道具
{
	"TRANSFER", "PK","MATE"
}
GameFloor2.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor2\\playerfloor2.lua",
	szClassName = "PlayerFloor2"
}

GameFloor2.tbNpcTypeList = --npc的类型
{
	["储物箱"] = 
	{
		nNpcId = 625,
		szName = "储物箱",
		nLevel = 95,		
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\pannier.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\chuwuxiang.lua"
	},
	["药店老板"] = 
	{
		nNpcId = 389,
		szName = "药店老板",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\drugstore.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\yaodian.lua"
	},	
	["工匠"] = 
	{
		nNpcId = 197,
		szName = "工匠",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\smithy.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\tiejiang.lua"
	},
	["第三层秘境接引人"] = 
	{
		nNpcId = 108,
		szName = "第三层秘境接引人",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\tofloor3npc.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\tofloor3npc.lua",
	} 
}
GameFloor2.tbTrapList = 
{

}

function GameFloor2:AddAllNpc()
	for key, value in self.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function GameFloor2:Start()
	self:RegAll()
	self:AddAllTrap()
	self:AddAllNpc()
end

GameFloor2:AssociateMap(936)
GameFloor2:SetForbitItem()
