Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

YueGeDaoWorld = Game:new()
YueGeDaoWorld.szMapType = "�¸赺" --�ı��ͼ��ʾ

YueGeDaoWorld.tbForbitItemType = --���� Υ������
{
	"TRANSFER","MATE"
}

YueGeDaoWorld.Player = {
	szPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaoplayer.lua",
	szClassName = "YueGeDaoPlayer",
}

YueGeDaoWorld.PlayerEnterTrapTime = {
}

YueGeDaoWorld.tbNpcTypeList = --npc������
{
	["�¸����� 1"] = 
	{
		nNpcId = 1847,
		szName = "�¸�����",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei1.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei1.lua",
	},
	["�¸�����2"] = 
	{
		nNpcId = 1847,
		szName = "�¸�����",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegewuwei2.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegewuwei2.lua",
	},
	["�¸赺��"] = 
	{
		nNpcId = 1849,
		szName = "�¸赺��",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegedaozhu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegedaozhu.lua",
	},
	["��ľ"] = 
	{
		nNpcId = 1861,
		szName = "��ľ",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shumu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shumu.lua",
	},
	["�¸轣��"] = 
	{
		nNpcId = 1848,
		szName = "�¸轣��",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\yuegejianshi.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\yuegejianshi.lua",
	},
	["ʯ��"] = 
	{
		nNpcId = 1865,
		szName = "ʯ��",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibei.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibei.lua",
	},
	["��ڣʯ��"] = 
	{
		nNpcId = 1860,
		szName = "��ڣʯ��",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shibeiex.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibeiex.lua",
	},
	["����"] = 
	{
		nNpcId = 1853,
		szName = "����",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jianchi.txt",
	},
	["����"] = 
	{
		nNpcId = 1854,
		szName = "����",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\jiankuang.txt",
	},
	["��־�����������ʿ"] = 
	{
		nNpcId = 1854,
		szName = "��־�����������ʿ",
		nLevel = 95,
		bNoRevive = 0,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\shenzhibuqingdewulingrenshi.txt",
	},
	["�¸赺����"] = 
	{
		nNpcId = 240,
		szName = "�¸赺����",
		nLevel = 95,
		szPosPath = "\\settings\\maps\\yuegedao\\yuegedao\\chuanfu.txt",
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\chuanfu.lua",
	},
}
YueGeDaoWorld.tbTrapList = 
{
--	["A1"] =
--	{
--		szPosPath = "",--Trap��������ļ�
--		szTrapFile = "",--Trap�ű���·��
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
