Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

GameFloor2 = Game:new()
GameFloor2.szMapType = "����ؾ���2��" --�ı��ͼ��ʾ
GameFloor2.tbForbitItemType = --���� Υ������
{
	"TRANSFER", "PK","MATE"
}
GameFloor2.Player = {
	szPath = "\\script\\missions\\tianchimijing\\floor2\\playerfloor2.lua",
	szClassName = "PlayerFloor2"
}

GameFloor2.tbNpcTypeList = --npc������
{
	["������"] = 
	{
		nNpcId = 625,
		szName = "������",
		nLevel = 95,		
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\pannier.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\chuwuxiang.lua"
	},
	["ҩ���ϰ�"] = 
	{
		nNpcId = 389,
		szName = "ҩ���ϰ�",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\drugstore.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\yaodian.lua"
	},	
	["����"] = 
	{
		nNpcId = 197,
		szName = "����",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\tianchimijing\\floor2\\smithy.txt",
		szScriptPath = "\\script\\missions\\tianchimijing\\floor2\\tiejiang.lua"
	},
	["�������ؾ�������"] = 
	{
		nNpcId = 108,
		szName = "�������ؾ�������",
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
